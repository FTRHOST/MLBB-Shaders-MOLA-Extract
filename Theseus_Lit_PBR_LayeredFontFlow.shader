//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_LayeredFontFlow" {
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

[Tex] _FontFlowTex ("字体贴图(不超过四列)", 2D) = "white" { }

_FontColor ("字体颜色", Color) = (0,0,0,1)

_FontFlowUVRemap ("每列字体最右u值", Vector) = (0.25,0.5,0.75,0)

_FontFlowSpeed ("每列字体流速", Vector) = (0,0,0,0)

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("切换火焰溶解方向", Float) = 0.0

_DissolveDirSpeed ("溶解方向速度", Vector) = (1,0,0,0)

_DissolveTex ("火焰溶解纹理", 2D) = "white" { }

_UseMask2U ("溶解遮罩使用2U", Float) = 0.0

_DissolveMask ("火焰溶解遮罩", 2D) = "white" { }

_DissolveEdgeColor ("火焰边缘颜色", Color) = (1,1,1,1)

_DissolveShrink ("火焰边缘压缩", Float) = 8.0

_DissolveRange ("火焰边缘范围", Range(0.2, 10)) = 1.0

_WarpTex ("火焰扭曲纹理", 2D) = "white" { }

_DissolveWarp ("火焰扭曲强度", Range(0, 1)) = 0.0

_ScorchShrink ("焦烟边缘压缩", Float) = 3.0

_ScorchAtten ("焦烟强度衰减", Range(0, 1)) = 1.0

_Cutoff ("溶解进度", Range(0, 1)) = 0.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 54198
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(10) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
bvec3 u_xlatb18;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
float u_xlat67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19 = (-u_xlat16_19) * u_xlat16_19 + 1.0;
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_2.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_56 = u_xlat16_19 * u_xlat16_37;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_3.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.yyy + u_xlat16_3.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_21.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_21.x, u_xlat16_3.x);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_56) + u_xlat16_2.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_57 = dot(u_xlat16_2.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat54 * u_xlat54;
    u_xlat16_57 = u_xlat54 * u_xlat16_57;
    u_xlat16_57 = u_xlat54 * u_xlat16_57;
    u_xlat16_5.x = u_xlat54 * u_xlat16_57;
    u_xlat54 = (-u_xlat16_57) * u_xlat54 + 1.0;
    u_xlat16_6.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_6.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.zxy;
    u_xlat16_7.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_57 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_57) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat63 = dot(u_xlat11.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat64 = (-u_xlat63) * u_xlat16_2.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_2.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * vec3(u_xlat16_56);
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat12.x) * u_xlat16_2.x + u_xlat12.x;
    u_xlat65 = u_xlat12.x * u_xlat65 + u_xlat16_2.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat12.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat65;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_2.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_2.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat64 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_3.xyz * u_xlat9.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * vec3(u_xlat16_56) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_20.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat22.x + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_2.x / u_xlat64;
    u_xlat48 = u_xlat64 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat66 = (-u_xlat16_20.x) + 1.0;
    u_xlat16_20.x = u_xlat66 * u_xlat66;
    u_xlat16_20.x = u_xlat66 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat66 * u_xlat16_20.x;
    u_xlat16_38 = u_xlat66 * u_xlat16_20.x;
    u_xlat66 = (-u_xlat16_20.x) * u_xlat66 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat66);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_38) + u_xlat13.xyz;
    u_xlat66 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat66) * u_xlat16_2.x + u_xlat66;
    u_xlat67 = u_xlat66 * u_xlat67 + u_xlat16_2.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat66 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat65 * u_xlat67;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat48 = u_xlat48 * u_xlat67;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat66) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_20.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_20.x = max(u_xlat16_20.x, 6.10351563e-05);
    u_xlat16_38 = inversesqrt(u_xlat16_20.x);
    u_xlat16_15.xyz = vec3(u_xlat16_38) * u_xlat9.xyz;
    u_xlat16_38 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_38));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_38);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_56) + u_xlat16_15.xyz;
    u_xlat9.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat16_38 = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat18.x * u_xlat18.x;
    u_xlat16_38 = u_xlat18.x * u_xlat16_38;
    u_xlat16_38 = u_xlat18.x * u_xlat16_38;
    u_xlat16_56 = u_xlat18.x * u_xlat16_38;
    u_xlat18.x = (-u_xlat16_38) * u_xlat18.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat18.xxx;
    u_xlat18.xyz = vec3(u_xlat54) * vec3(u_xlat16_56) + u_xlat9.xyz;
    u_xlat22.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_38 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_38 = u_xlat16_38 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat9.x = (-u_xlat22.x) * u_xlat16_2.x + u_xlat22.x;
    u_xlat9.x = u_xlat22.x * u_xlat9.x + u_xlat16_2.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat22.x + u_xlat9.x;
    u_xlat9.x = u_xlat9.x + 6.10351563e-05;
    u_xlat9.x = u_xlat9.x * u_xlat65;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = u_xlat22.xxx * u_xlat0.xyz;
    u_xlat16_56 = u_xlat16_20.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_20.x = float(1.0) / float(u_xlat16_20.x);
    u_xlat16_56 = (-u_xlat16_56) * u_xlat16_56 + 1.0;
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_20.x = u_xlat16_56 * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_16.x, u_xlat16_20.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_38 = max(u_xlat16_56, u_xlat16_38);
    u_xlat16_20.x = u_xlat16_38 * u_xlat16_20.x;
    u_xlat16_20.xyz = u_xlat16_20.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_57 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat4.zzz * u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat4.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat63) * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat16_15.xyz * vec3(u_xlat66) + u_xlat16_3.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat22.xxx + u_xlat16_3.xyz;
    u_xlat16_20.xyz = u_xlat16_14.xyz + u_xlat16_20.xyz;
    u_xlat16_3.xyz = (-u_xlat10.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_3.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_3.xyz = vec3(u_xlat16_57) * u_xlat16_3.xyz;
    u_xlat16_57 = dot(u_xlat16_3.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_57) + u_xlat16_59;
    u_xlat16_61 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_61 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_59 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_59 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 + -1.0;
    u_xlat16_59 = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_59;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_14.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_3.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_3.xz);
    u_xlat16_15.y = u_xlat16_3.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat16_5.xyz * u_xlat16_14.xyz + u_xlat16_20.xyz;
    u_xlat16_5.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_5.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_3.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat10.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat18.xyz = u_xlat16_2.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_5.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat5.y = u_xlat18.y;
    u_xlat16_5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat16_2.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_18.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_18.xxx + u_xlat16_18.yyy;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_2.x);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_6.zxy;
    u_xlat18.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat18.xyz * u_xlat18.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb18.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (u_xlatb18.x) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_6.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_6.w);
    u_xlat16_3.x = u_xlat16_2.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_6.x = u_xlat16_3.x * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_3.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_3.x = (-u_xlat16_36) + u_xlat16_18.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x + u_xlat16_36;
    u_xlat16_2.x = u_xlat16_59 * u_xlat16_2.x;
    u_xlat18.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_3.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat18.x * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_21.x = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_1.z, u_xlat16_2.x);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_20.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb4.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat18.xy = u_xlat0.yz * u_xlat4.xy;
    u_xlat18.x = u_xlat18.x * _FontFlowSpeed.y;
    u_xlat0.x = u_xlat0.x * _FontFlowSpeed.x + u_xlat18.x;
    u_xlat0.x = u_xlat18.y * _FontFlowSpeed.z + u_xlat0.x;
    u_xlat18.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat18.x>=0.0);
#else
    u_xlatb18.x = u_xlat18.x>=0.0;
#endif
    u_xlat18.x = u_xlatb18.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat4.z * u_xlat18.x;
    u_xlat0.x = u_xlat18.x * _FontFlowSpeed.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.y = u_xlat0.x + vs_TEXCOORD3.w;
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat16_0.xyz = texture(_FontFlowTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _FontColor.zxy;
    u_xlat16_0.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat36.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat36.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat36.xy;
    u_xlat16_4.x = texture(_WarpTex, u_xlat36.xy).y;
    u_xlat16_56 = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16_3.xy = vec2(u_xlat16_56) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat36.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_3.x = (u_xlatb18.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.y = (u_xlatb18.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_3.z = (u_xlatb18.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.w = (u_xlatb18.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_56 = (u_xlatb18.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_3.x = (u_xlatb18.z) ? u_xlat16_1.w : 0.0;
    u_xlat16_18.x = texture(_DissolveMask, u_xlat16_1.xy).x;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_3.x;
    u_xlat16_3.x = _Cutoff + -1.0;
    u_xlat16_56 = u_xlat16_3.x * -1.5 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 + -1.20000005;
    u_xlat16_3.x = u_xlat16_56 * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_56 = u_xlat16_56 * _ScorchShrink + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_21.x = dot(u_xlat16_3.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_21.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_21.xyz = u_xlat16_21.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_7.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_7.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_3.x = (-u_xlat16_18.x) + u_xlat16_3.x;
    u_xlat16_21.xyz = u_xlat16_18.xxx * u_xlat16_21.xyz;
    SV_Target0.w = u_xlat16_3.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = _ScorchAtten * u_xlat16_3.x + u_xlat16_56;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_56) + u_xlat16_21.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(10) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
bvec3 u_xlatb18;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
float u_xlat67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19 = (-u_xlat16_19) * u_xlat16_19 + 1.0;
    u_xlat16_19 = max(u_xlat16_19, 0.0);
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_2.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_56 = u_xlat16_19 * u_xlat16_37;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_3.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.yyy + u_xlat16_3.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_21.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_21.x, u_xlat16_3.x);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_56) + u_xlat16_2.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_57 = dot(u_xlat16_2.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat54 * u_xlat54;
    u_xlat16_57 = u_xlat54 * u_xlat16_57;
    u_xlat16_57 = u_xlat54 * u_xlat16_57;
    u_xlat16_5.x = u_xlat54 * u_xlat16_57;
    u_xlat54 = (-u_xlat16_57) * u_xlat54 + 1.0;
    u_xlat16_6.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_23.xyz = u_xlat16_6.zxy * u_xlat16_23.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.zxy;
    u_xlat16_7.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_57 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_57) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat63 = dot(u_xlat11.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat64 = (-u_xlat63) * u_xlat16_2.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_2.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * vec3(u_xlat16_56);
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat12.x) * u_xlat16_2.x + u_xlat12.x;
    u_xlat65 = u_xlat12.x * u_xlat65 + u_xlat16_2.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat12.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat65;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22.x = u_xlat16_2.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_2.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat64 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_3.xyz * u_xlat9.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * vec3(u_xlat16_56) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_20.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat22.x + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_2.x / u_xlat64;
    u_xlat48 = u_xlat64 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat66 = (-u_xlat16_20.x) + 1.0;
    u_xlat16_20.x = u_xlat66 * u_xlat66;
    u_xlat16_20.x = u_xlat66 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat66 * u_xlat16_20.x;
    u_xlat16_38 = u_xlat66 * u_xlat16_20.x;
    u_xlat66 = (-u_xlat16_20.x) * u_xlat66 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat66);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_38) + u_xlat13.xyz;
    u_xlat66 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat66) * u_xlat16_2.x + u_xlat66;
    u_xlat67 = u_xlat66 * u_xlat67 + u_xlat16_2.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat66 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat65 * u_xlat67;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat48 = u_xlat48 * u_xlat67;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat66) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_20.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_20.x = max(u_xlat16_20.x, 6.10351563e-05);
    u_xlat16_38 = inversesqrt(u_xlat16_20.x);
    u_xlat16_15.xyz = vec3(u_xlat16_38) * u_xlat9.xyz;
    u_xlat16_38 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_38));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_38);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_56) + u_xlat16_15.xyz;
    u_xlat9.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat16_38 = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat18.x * u_xlat18.x;
    u_xlat16_38 = u_xlat18.x * u_xlat16_38;
    u_xlat16_38 = u_xlat18.x * u_xlat16_38;
    u_xlat16_56 = u_xlat18.x * u_xlat16_38;
    u_xlat18.x = (-u_xlat16_38) * u_xlat18.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat18.xxx;
    u_xlat18.xyz = vec3(u_xlat54) * vec3(u_xlat16_56) + u_xlat9.xyz;
    u_xlat22.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_38 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_38 = u_xlat16_38 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat9.x = (-u_xlat22.x) * u_xlat16_2.x + u_xlat22.x;
    u_xlat9.x = u_xlat22.x * u_xlat9.x + u_xlat16_2.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat22.x + u_xlat9.x;
    u_xlat9.x = u_xlat9.x + 6.10351563e-05;
    u_xlat9.x = u_xlat9.x * u_xlat65;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = u_xlat22.xxx * u_xlat0.xyz;
    u_xlat16_56 = u_xlat16_20.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_20.x = float(1.0) / float(u_xlat16_20.x);
    u_xlat16_56 = (-u_xlat16_56) * u_xlat16_56 + 1.0;
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_20.x = u_xlat16_56 * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_16.x, u_xlat16_20.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_38 = max(u_xlat16_56, u_xlat16_38);
    u_xlat16_20.x = u_xlat16_38 * u_xlat16_20.x;
    u_xlat16_20.xyz = u_xlat16_20.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_57 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_57) * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat4.zzz * u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat4.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat63) * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat16_15.xyz * vec3(u_xlat66) + u_xlat16_3.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat22.xxx + u_xlat16_3.xyz;
    u_xlat16_20.xyz = u_xlat16_14.xyz + u_xlat16_20.xyz;
    u_xlat16_3.xyz = (-u_xlat10.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_3.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_3.xyz = vec3(u_xlat16_57) * u_xlat16_3.xyz;
    u_xlat16_57 = dot(u_xlat16_3.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_57) + u_xlat16_59;
    u_xlat16_61 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_61 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_59 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_59 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 + -1.0;
    u_xlat16_59 = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_59;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_14.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_3.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_3.xz);
    u_xlat16_15.y = u_xlat16_3.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_20.xyz = u_xlat16_5.xyz * u_xlat16_14.xyz + u_xlat16_20.xyz;
    u_xlat16_5.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_5.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_3.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat10.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat18.xyz = u_xlat16_2.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_5.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat5.y = u_xlat18.y;
    u_xlat16_5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat16_2.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_18.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_18.xxx + u_xlat16_18.yyy;
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_2.x);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_6.zxy;
    u_xlat18.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat18.xyz * u_xlat18.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb18.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (u_xlatb18.x) ? u_xlat16_14.xyz : u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_6.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_6.w);
    u_xlat16_3.x = u_xlat16_2.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_6.x = u_xlat16_3.x * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_6.x = u_xlat16_2.x * 16.0 + u_xlat16_6.z;
    u_xlat16_3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_3.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_3.x = (-u_xlat16_36) + u_xlat16_18.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x + u_xlat16_36;
    u_xlat16_2.x = u_xlat16_59 * u_xlat16_2.x;
    u_xlat18.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_3.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat18.x * u_xlat16_3.x + u_xlat16_2.x;
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_21.x = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_1.z, u_xlat16_2.x);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_20.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb4.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat18.xy = u_xlat0.yz * u_xlat4.xy;
    u_xlat18.x = u_xlat18.x * _FontFlowSpeed.y;
    u_xlat0.x = u_xlat0.x * _FontFlowSpeed.x + u_xlat18.x;
    u_xlat0.x = u_xlat18.y * _FontFlowSpeed.z + u_xlat0.x;
    u_xlat18.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat18.x>=0.0);
#else
    u_xlatb18.x = u_xlat18.x>=0.0;
#endif
    u_xlat18.x = u_xlatb18.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat4.z * u_xlat18.x;
    u_xlat0.x = u_xlat18.x * _FontFlowSpeed.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.y = u_xlat0.x + vs_TEXCOORD3.w;
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat16_0.xyz = texture(_FontFlowTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _FontColor.zxy;
    u_xlat16_0.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat36.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat36.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat36.xy;
    u_xlat16_4.x = texture(_WarpTex, u_xlat36.xy).y;
    u_xlat16_56 = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16_3.xy = vec2(u_xlat16_56) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat36.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_3.x = (u_xlatb18.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.y = (u_xlatb18.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_3.z = (u_xlatb18.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.w = (u_xlatb18.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_56 = (u_xlatb18.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_3.x = (u_xlatb18.z) ? u_xlat16_1.w : 0.0;
    u_xlat16_18.x = texture(_DissolveMask, u_xlat16_1.xy).x;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_3.x;
    u_xlat16_3.x = _Cutoff + -1.0;
    u_xlat16_56 = u_xlat16_3.x * -1.5 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 + -1.20000005;
    u_xlat16_3.x = u_xlat16_56 * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_56 = u_xlat16_56 * _ScorchShrink + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_21.x = dot(u_xlat16_3.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_21.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_21.xyz = u_xlat16_21.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_7.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_7.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_3.x = (-u_xlat16_18.x) + u_xlat16_3.x;
    u_xlat16_21.xyz = u_xlat16_18.xxx * u_xlat16_21.xyz;
    SV_Target0.w = u_xlat16_3.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = _ScorchAtten * u_xlat16_3.x + u_xlat16_56;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_56) + u_xlat16_21.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(12) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat22;
mediump vec3 u_xlat16_28;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat44;
float u_xlat54;
float u_xlat55;
float u_xlat56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
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
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28.x = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1.x = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (u_xlatb1.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat55 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat20.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_28.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat20.x = (-u_xlat16_10.x) * u_xlat20.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat3.xxx * u_xlat16_28.xxx + u_xlat20.xyz;
    u_xlat16_28.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat57 = (-u_xlat55) * u_xlat16_28.x + u_xlat55;
    u_xlat57 = u_xlat55 * u_xlat57 + u_xlat16_28.x;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat55 + u_xlat57;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat8.x) * u_xlat16_28.x + u_xlat8.x;
    u_xlat61 = u_xlat8.x * u_xlat61 + u_xlat16_28.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat8.x;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat61;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat44 = u_xlat16_28.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat44 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat57 * u_xlat2.x;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat44 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat57 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat57 * u_xlat57;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_66 = u_xlat57 * u_xlat16_65;
    u_xlat57 = (-u_xlat16_65) * u_xlat57 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat57);
    u_xlat9.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat57 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat57) * u_xlat16_28.x + u_xlat57;
    u_xlat62 = u_xlat57 * u_xlat62 + u_xlat16_28.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat57 + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat61 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat56 = u_xlat56 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat44 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_28.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat19.x;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_66 = u_xlat19.x * u_xlat16_60;
    u_xlat19.x = (-u_xlat16_60) * u_xlat19.x + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat19.xxx;
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat2.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat37 = (-u_xlat19.x) * u_xlat16_28.x + u_xlat19.x;
    u_xlat37 = u_xlat19.x * u_xlat37 + u_xlat16_28.x;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat19.x;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat37 = u_xlat37 * u_xlat61;
    u_xlat1.z = float(1.0) / u_xlat37;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_16.x, u_xlat16_65);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_66);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat18.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat55) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat57) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat19.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_28.xxx * u_xlat19.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_28.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_28.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (u_xlatb0.x) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_60 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.w * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_36;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28.x = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28.x + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_3.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb1.xyz = greaterThanEqual(u_xlat1.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat18.xy = u_xlat0.yz * u_xlat1.xy;
    u_xlat18.x = u_xlat18.x * _FontFlowSpeed.y;
    u_xlat0.x = u_xlat0.x * _FontFlowSpeed.x + u_xlat18.x;
    u_xlat0.x = u_xlat18.y * _FontFlowSpeed.z + u_xlat0.x;
    u_xlat18.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat18.x>=0.0);
#else
    u_xlatb18.x = u_xlat18.x>=0.0;
#endif
    u_xlat18.x = u_xlatb18.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat1.z * u_xlat18.x;
    u_xlat0.x = u_xlat18.x * _FontFlowSpeed.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.y = u_xlat0.x + vs_TEXCOORD3.w;
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat16_0.xyz = texture(_FontFlowTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _FontColor.zxy;
    u_xlat16_0.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_6.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat36.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat36.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat36.xy;
    u_xlat16_1.x = texture(_WarpTex, u_xlat36.xy).y;
    u_xlat16_60 = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_60) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat36.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb18.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb18.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb18.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb18.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_60 = (u_xlatb18.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_10.x = (u_xlatb18.z) ? u_xlat16_1.w : 0.0;
    u_xlat16_18.x = texture(_DissolveMask, u_xlat16_1.xy).x;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_60 = u_xlat16_10.x * -1.5 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 + -1.20000005;
    u_xlat16_10.x = u_xlat16_60 * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * _ScorchShrink + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_28.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = u_xlat16_28.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.xyz = u_xlat16_28.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_28.xyz = u_xlat16_10.xxx * u_xlat16_28.xyz;
    u_xlat16_10.x = (-u_xlat16_18.x) + u_xlat16_10.x;
    u_xlat16_28.xyz = u_xlat16_18.xxx * u_xlat16_28.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = _ScorchAtten * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_60) + u_xlat16_28.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(12) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat22;
mediump vec3 u_xlat16_28;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
float u_xlat37;
float u_xlat44;
float u_xlat54;
float u_xlat55;
float u_xlat56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
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
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28.x = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1.x = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (u_xlatb1.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat55 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat20.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_28.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat20.x = (-u_xlat16_10.x) * u_xlat20.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat3.xxx * u_xlat16_28.xxx + u_xlat20.xyz;
    u_xlat16_28.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat57 = (-u_xlat55) * u_xlat16_28.x + u_xlat55;
    u_xlat57 = u_xlat55 * u_xlat57 + u_xlat16_28.x;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat55 + u_xlat57;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat8.x) * u_xlat16_28.x + u_xlat8.x;
    u_xlat61 = u_xlat8.x * u_xlat61 + u_xlat16_28.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat8.x;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat61;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat44 = u_xlat16_28.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat44 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat57 * u_xlat2.x;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat44 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat57 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat57 * u_xlat57;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_66 = u_xlat57 * u_xlat16_65;
    u_xlat57 = (-u_xlat16_65) * u_xlat57 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat57);
    u_xlat9.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat57 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat57) * u_xlat16_28.x + u_xlat57;
    u_xlat62 = u_xlat57 * u_xlat62 + u_xlat16_28.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat57 + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat61 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat56 = u_xlat56 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat44 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_28.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat19.x;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_66 = u_xlat19.x * u_xlat16_60;
    u_xlat19.x = (-u_xlat16_60) * u_xlat19.x + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat19.xxx;
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat2.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat37 = (-u_xlat19.x) * u_xlat16_28.x + u_xlat19.x;
    u_xlat37 = u_xlat19.x * u_xlat37 + u_xlat16_28.x;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat19.x;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat37 = u_xlat37 * u_xlat61;
    u_xlat1.z = float(1.0) / u_xlat37;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_16.x, u_xlat16_65);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_66);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat18.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat55) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat57) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat19.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_28.xxx * u_xlat19.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_28.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_28.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (u_xlatb0.x) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_60 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.w * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_36;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28.x = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28.x + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_3.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb1.xyz = greaterThanEqual(u_xlat1.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat18.xy = u_xlat0.yz * u_xlat1.xy;
    u_xlat18.x = u_xlat18.x * _FontFlowSpeed.y;
    u_xlat0.x = u_xlat0.x * _FontFlowSpeed.x + u_xlat18.x;
    u_xlat0.x = u_xlat18.y * _FontFlowSpeed.z + u_xlat0.x;
    u_xlat18.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat18.x>=0.0);
#else
    u_xlatb18.x = u_xlat18.x>=0.0;
#endif
    u_xlat18.x = u_xlatb18.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat1.z * u_xlat18.x;
    u_xlat0.x = u_xlat18.x * _FontFlowSpeed.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.y = u_xlat0.x + vs_TEXCOORD3.w;
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat16_0.xyz = texture(_FontFlowTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _FontColor.zxy;
    u_xlat16_0.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_6.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat36.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat36.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat36.xy;
    u_xlat16_1.x = texture(_WarpTex, u_xlat36.xy).y;
    u_xlat16_60 = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_60) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat36.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb18.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb18.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb18.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb18.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_60 = (u_xlatb18.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_10.x = (u_xlatb18.z) ? u_xlat16_1.w : 0.0;
    u_xlat16_18.x = texture(_DissolveMask, u_xlat16_1.xy).x;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_60 = u_xlat16_10.x * -1.5 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 + -1.20000005;
    u_xlat16_10.x = u_xlat16_60 * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_60 = u_xlat16_60 * _ScorchShrink + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_28.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = u_xlat16_28.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.xyz = u_xlat16_28.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_28.xyz = u_xlat16_10.xxx * u_xlat16_28.xyz;
    u_xlat16_10.x = (-u_xlat16_18.x) + u_xlat16_10.x;
    u_xlat16_28.xyz = u_xlat16_18.xxx * u_xlat16_28.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = _ScorchAtten * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_60) + u_xlat16_28.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(10) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec3 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec2 u_xlat16_18;
ivec3 u_xlati18;
bvec3 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_24;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
bool u_xlatb59;
float u_xlat62;
float u_xlat63;
float u_xlat65;
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
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20.x, u_xlat16_2.x);
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
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_5.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat8.xyz;
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
    u_xlat5 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat59 = (-u_xlat5) * u_xlat16_19.x + u_xlat5;
    u_xlat59 = u_xlat5 * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat5;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat62 = u_xlat12.x * u_xlat62 + u_xlat16_19.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat12.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat62;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat59 * u_xlat4.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat5) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat59 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat13.xyz = vec3(u_xlat59) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat22.x + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_19.x / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat63 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat63 * u_xlat63;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_55 = u_xlat63 * u_xlat16_37;
    u_xlat63 = (-u_xlat16_37) * u_xlat63 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat63);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat63 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat63) * u_xlat16_19.x + u_xlat63;
    u_xlat65 = u_xlat63 * u_xlat65 + u_xlat16_19.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat63 + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat62 * u_xlat65;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat59 = u_xlat59 * u_xlat65;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat63) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_55) * u_xlat8.xyz;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat59 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat59);
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
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_55 = u_xlat18.x * u_xlat16_1.x;
    u_xlat18.x = (-u_xlat16_1.x) * u_xlat18.x + 1.0;
    u_xlat8.xyz = u_xlat16_7.xyz * u_xlat18.xxx;
    u_xlat18.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat8.xyz;
    u_xlat22.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat59 = (-u_xlat22.x) * u_xlat16_19.x + u_xlat22.x;
    u_xlat59 = u_xlat22.x * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat22.x + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat62;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat59;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = u_xlat22.xxx * u_xlat0.xyz;
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37 = float(1.0) / float(u_xlat16_37);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_37 = max(u_xlat16_16.x, u_xlat16_37);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_55 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_55, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat5) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat22.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_24 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
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
    u_xlat18.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_15.y = u_xlat16_2.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_2.xyz, u_xlat18.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat18.xyz = u_xlat16_19.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat3.y = u_xlat18.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_18.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_18.xxx + u_xlat16_18.yyy;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_10.xyz = u_xlat16_7.www * u_xlat16_7.xyz;
    u_xlat18.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat18.xyz * u_xlat18.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_56) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb18.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (u_xlatb18.x) ? u_xlat16_14.xyz : u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_7.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_7.w);
    u_xlat16_2.x = u_xlat16_19.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_7.x = u_xlat16_2.x * 16.0 + u_xlat16_7.z;
    u_xlat16_2.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_7.x = u_xlat16_19.x * 16.0 + u_xlat16_7.z;
    u_xlat16_2.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_19.x = u_xlat16_2.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_2.x = (-u_xlat16_36) + u_xlat16_18.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_2.x + u_xlat16_36;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat18.x = u_xlat4.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat18.x * u_xlat16_2.x + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_20.x = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_20.x + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb4.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat18.xy = u_xlat0.yz * u_xlat4.xy;
    u_xlat18.x = u_xlat18.x * _FontFlowSpeed.y;
    u_xlat0.x = u_xlat0.x * _FontFlowSpeed.x + u_xlat18.x;
    u_xlat0.x = u_xlat18.y * _FontFlowSpeed.z + u_xlat0.x;
    u_xlat18.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat18.x>=0.0);
#else
    u_xlatb18.x = u_xlat18.x>=0.0;
#endif
    u_xlat18.x = u_xlatb18.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat4.z * u_xlat18.x;
    u_xlat0.x = u_xlat18.x * _FontFlowSpeed.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.y = u_xlat0.x + vs_TEXCOORD3.w;
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat16_0.xyz = texture(_FontFlowTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _FontColor.xyz;
    u_xlat16_0.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_1.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat36.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat36.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat36.xy;
    u_xlat16_4.x = texture(_WarpTex, u_xlat36.xy).y;
    u_xlat16_55 = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16_2.xy = vec2(u_xlat16_55) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat36.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_2.x = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_2.y = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.z = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_2.w = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_3.x = (u_xlatb18.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.y = (u_xlatb18.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_3.z = (u_xlatb18.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.w = (u_xlatb18.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_55 = (u_xlatb18.z) ? 0.0 : u_xlat16_2.z;
    u_xlat16_38 = (u_xlatb18.z) ? u_xlat16_2.w : 0.0;
    u_xlat16_18.x = texture(_DissolveMask, u_xlat16_2.xy).x;
    u_xlat16_55 = u_xlat16_55 + u_xlat16_38;
    u_xlat16_2.x = _Cutoff + -1.0;
    u_xlat16_55 = u_xlat16_2.x * -1.5 + u_xlat16_55;
    u_xlat16_55 = u_xlat16_55 + -1.20000005;
    u_xlat16_2.x = u_xlat16_55 * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_55 = u_xlat16_55 * _ScorchShrink + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_20.x = dot(u_xlat16_2.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_2.x = u_xlat16_2.x + -0.100000001;
    u_xlat16_2.x = u_xlat16_2.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_20.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = (-u_xlat16_20.x) + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_6.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_6.x;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_20.xyz = u_xlat16_2.xxx * u_xlat16_20.xyz;
    u_xlat16_2.x = (-u_xlat16_18.x) + u_xlat16_2.x;
    u_xlat16_20.xyz = u_xlat16_18.xxx * u_xlat16_20.xyz;
    SV_Target0.w = u_xlat16_2.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_55) + 1.0;
    u_xlat16_55 = _ScorchAtten * u_xlat16_2.x + u_xlat16_55;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_55) + u_xlat16_20.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(7) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(8) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(10) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec3 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec2 u_xlat16_18;
ivec3 u_xlati18;
bvec3 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_24;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
bool u_xlatb59;
float u_xlat62;
float u_xlat63;
float u_xlat65;
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
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20.x, u_xlat16_2.x);
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
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_5.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat8.xyz;
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
    u_xlat5 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat59 = (-u_xlat5) * u_xlat16_19.x + u_xlat5;
    u_xlat59 = u_xlat5 * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat5;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat62 = u_xlat12.x * u_xlat62 + u_xlat16_19.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat12.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat62;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat59 * u_xlat4.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat5) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat59 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat13.xyz = vec3(u_xlat59) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat22.x + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_19.x / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat63 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat63 * u_xlat63;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_37 = u_xlat63 * u_xlat16_37;
    u_xlat16_55 = u_xlat63 * u_xlat16_37;
    u_xlat63 = (-u_xlat16_37) * u_xlat63 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat63);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat63 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat63) * u_xlat16_19.x + u_xlat63;
    u_xlat65 = u_xlat63 * u_xlat65 + u_xlat16_19.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat63 + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat62 * u_xlat65;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat59 = u_xlat59 * u_xlat65;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat63) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_55) * u_xlat8.xyz;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat59 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat59);
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
    u_xlat0.x = u_xlat0.x * u_xlat22.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_55 = u_xlat18.x * u_xlat16_1.x;
    u_xlat18.x = (-u_xlat16_1.x) * u_xlat18.x + 1.0;
    u_xlat8.xyz = u_xlat16_7.xyz * u_xlat18.xxx;
    u_xlat18.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat8.xyz;
    u_xlat22.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat59 = (-u_xlat22.x) * u_xlat16_19.x + u_xlat22.x;
    u_xlat59 = u_xlat22.x * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat22.x + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat62;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat59;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = u_xlat22.xxx * u_xlat0.xyz;
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37 = float(1.0) / float(u_xlat16_37);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_37 = max(u_xlat16_16.x, u_xlat16_37);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_55 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_55, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat5) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat22.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_56 = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_24 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
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
    u_xlat18.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_15.y = u_xlat16_2.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_2.xyz, u_xlat18.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat18.xyz = u_xlat16_19.xxx * u_xlat22.xyz + u_xlat18.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat18.xz);
    u_xlat3.y = u_xlat18.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat18.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_18.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_18.xxx + u_xlat16_18.yyy;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_10.xyz = u_xlat16_7.www * u_xlat16_7.xyz;
    u_xlat18.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat18.xyz * u_xlat18.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_56) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb18.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (u_xlatb18.x) ? u_xlat16_14.xyz : u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_7.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_7.w);
    u_xlat16_2.x = u_xlat16_19.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_7.x = u_xlat16_2.x * 16.0 + u_xlat16_7.z;
    u_xlat16_2.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_7.x = u_xlat16_19.x * 16.0 + u_xlat16_7.z;
    u_xlat16_2.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_19.x = u_xlat16_2.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_2.x = (-u_xlat16_36) + u_xlat16_18.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_2.x + u_xlat16_36;
    u_xlat16_19.x = u_xlat16_57 * u_xlat16_19.x;
    u_xlat18.x = u_xlat4.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_19.x = u_xlat18.x * u_xlat16_2.x + u_xlat16_19.x;
    u_xlat16_2.x = u_xlat16_19.x + u_xlat16_19.x;
    u_xlat16_20.x = (-u_xlat16_19.x) * 2.0 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_20.x + u_xlat16_2.x;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat16_19.x = min(u_xlat16_19.x, u_xlat16_5.z);
    u_xlat16_2.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat4.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb4.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat18.xy = u_xlat0.yz * u_xlat4.xy;
    u_xlat18.x = u_xlat18.x * _FontFlowSpeed.y;
    u_xlat0.x = u_xlat0.x * _FontFlowSpeed.x + u_xlat18.x;
    u_xlat0.x = u_xlat18.y * _FontFlowSpeed.z + u_xlat0.x;
    u_xlat18.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat18.x>=0.0);
#else
    u_xlatb18.x = u_xlat18.x>=0.0;
#endif
    u_xlat18.x = u_xlatb18.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat4.z * u_xlat18.x;
    u_xlat0.x = u_xlat18.x * _FontFlowSpeed.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.y = u_xlat0.x + vs_TEXCOORD3.w;
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat16_0.xyz = texture(_FontFlowTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _FontColor.xyz;
    u_xlat16_0.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_1.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat36.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat36.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat36.xy;
    u_xlat16_4.x = texture(_WarpTex, u_xlat36.xy).y;
    u_xlat16_55 = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16_2.xy = vec2(u_xlat16_55) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat36.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_2.x = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_2.y = (u_xlatb18.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.z = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_2.w = (u_xlatb18.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_3.x = (u_xlatb18.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.y = (u_xlatb18.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_3.z = (u_xlatb18.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.w = (u_xlatb18.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_55 = (u_xlatb18.z) ? 0.0 : u_xlat16_2.z;
    u_xlat16_38 = (u_xlatb18.z) ? u_xlat16_2.w : 0.0;
    u_xlat16_18.x = texture(_DissolveMask, u_xlat16_2.xy).x;
    u_xlat16_55 = u_xlat16_55 + u_xlat16_38;
    u_xlat16_2.x = _Cutoff + -1.0;
    u_xlat16_55 = u_xlat16_2.x * -1.5 + u_xlat16_55;
    u_xlat16_55 = u_xlat16_55 + -1.20000005;
    u_xlat16_2.x = u_xlat16_55 * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_55 = u_xlat16_55 * _ScorchShrink + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_20.x = dot(u_xlat16_2.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_2.x = u_xlat16_2.x + -0.100000001;
    u_xlat16_2.x = u_xlat16_2.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_20.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = (-u_xlat16_20.x) + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_6.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_6.x;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_20.xyz = u_xlat16_2.xxx * u_xlat16_20.xyz;
    u_xlat16_2.x = (-u_xlat16_18.x) + u_xlat16_2.x;
    u_xlat16_20.xyz = u_xlat16_18.xxx * u_xlat16_20.xyz;
    SV_Target0.w = u_xlat16_2.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_55) + 1.0;
    u_xlat16_55 = _ScorchAtten * u_xlat16_2.x + u_xlat16_55;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_55) + u_xlat16_20.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(12) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump float u_xlat16_19;
bvec3 u_xlatb19;
vec3 u_xlat20;
vec3 u_xlat22;
mediump vec3 u_xlat16_28;
int u_xlati36;
vec2 u_xlat37;
mediump float u_xlat16_37;
float u_xlat44;
float u_xlat55;
float u_xlat56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
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
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28.x = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1.x = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (u_xlatb1.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat55 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat20.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_28.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat20.x = (-u_xlat16_10.x) * u_xlat20.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat3.xxx * u_xlat16_28.xxx + u_xlat20.xyz;
    u_xlat16_28.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat57 = (-u_xlat55) * u_xlat16_28.x + u_xlat55;
    u_xlat57 = u_xlat55 * u_xlat57 + u_xlat16_28.x;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat55 + u_xlat57;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat8.x) * u_xlat16_28.x + u_xlat8.x;
    u_xlat61 = u_xlat8.x * u_xlat61 + u_xlat16_28.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat8.x;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat61;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat44 = u_xlat16_28.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat44 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat57 * u_xlat2.x;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat44 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat57 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat57 * u_xlat57;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_66 = u_xlat57 * u_xlat16_65;
    u_xlat57 = (-u_xlat16_65) * u_xlat57 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat57);
    u_xlat9.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat57 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat57) * u_xlat16_28.x + u_xlat57;
    u_xlat62 = u_xlat57 * u_xlat62 + u_xlat16_28.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat57 + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat61 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat56 = u_xlat56 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat44 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_28.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat19.x;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_66 = u_xlat19.x * u_xlat16_60;
    u_xlat19.x = (-u_xlat16_60) * u_xlat19.x + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat19.xxx;
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat2.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat37.x = (-u_xlat19.x) * u_xlat16_28.x + u_xlat19.x;
    u_xlat37.x = u_xlat19.x * u_xlat37.x + u_xlat16_28.x;
    u_xlat37.x = sqrt(u_xlat37.x);
    u_xlat37.x = u_xlat37.x + u_xlat19.x;
    u_xlat37.x = u_xlat37.x + 6.10351563e-05;
    u_xlat37.x = u_xlat37.x * u_xlat61;
    u_xlat1.z = float(1.0) / u_xlat37.x;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_16.x, u_xlat16_65);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_66);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat18.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat55) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat57) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat19.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_28.xxx * u_xlat19.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_28.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_28.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_60 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_37 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.w * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_37) + u_xlat16_19;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_37;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat1.x = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat1.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28.x = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28.x + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_3.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb1.xyz = greaterThanEqual(u_xlat1.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb3.xyz = greaterThanEqual(u_xlat3.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb3.z ? float(1.0) : 0.0;
;
    u_xlat19.xy = u_xlat1.yz * u_xlat3.xy;
    u_xlat19.x = u_xlat19.x * _FontFlowSpeed.y;
    u_xlat1.x = u_xlat1.x * _FontFlowSpeed.x + u_xlat19.x;
    u_xlat1.x = u_xlat19.y * _FontFlowSpeed.z + u_xlat1.x;
    u_xlat19.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19.x = !!(u_xlat19.x>=0.0);
#else
    u_xlatb19.x = u_xlat19.x>=0.0;
#endif
    u_xlat19.x = u_xlatb19.x ? 1.0 : float(0.0);
    u_xlat19.x = u_xlat3.z * u_xlat19.x;
    u_xlat1.x = u_xlat19.x * _FontFlowSpeed.w + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Time.y;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.y = u_xlat1.x + vs_TEXCOORD3.w;
    u_xlat1.x = vs_TEXCOORD3.z;
    u_xlat16_1.xyz = texture(_FontFlowTex, u_xlat1.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * _FontColor.xyz;
    u_xlat16_1.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat1.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat37.xy = u_xlat1.xy + _WarpTex_ST.zw;
    u_xlat37.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat37.xy;
    u_xlat16_3.x = texture(_WarpTex, u_xlat37.xy).y;
    u_xlat16_60 = u_xlat16_3.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_60) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat37.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_10.xy;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_0.x = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_0.y = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_0.z = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_0.w = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb19.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb19.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb19.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb19.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_60 = (u_xlatb19.z) ? 0.0 : u_xlat16_0.z;
    u_xlat16_10.x = (u_xlatb19.z) ? u_xlat16_0.w : 0.0;
    u_xlat16_19 = texture(_DissolveMask, u_xlat16_0.xy).x;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_60 = u_xlat16_10.x * -1.5 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 + -1.20000005;
    u_xlat16_10.x = u_xlat16_60 * _DissolveShrink + u_xlat16_1.x;
    u_xlat16_60 = u_xlat16_60 * _ScorchShrink + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_28.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = u_xlat16_28.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.xyz = u_xlat16_28.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_28.xyz = u_xlat16_10.xxx * u_xlat16_28.xyz;
    u_xlat16_10.x = (-u_xlat16_19) + u_xlat16_10.x;
    u_xlat16_28.xyz = vec3(u_xlat16_19) * u_xlat16_28.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = _ScorchAtten * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_60) + u_xlat16_28.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
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
    vs_TEXCOORD7.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD9.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _FontColor;
uniform 	mediump vec4 _FontFlowUVRemap;
uniform 	mediump vec4 _FontFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseMask2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _DissolveWarp;
uniform 	mediump float _ScorchAtten;
uniform 	mediump float _ScorchShrink;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FontFlowTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(12) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump float u_xlat16_19;
bvec3 u_xlatb19;
vec3 u_xlat20;
vec3 u_xlat22;
mediump vec3 u_xlat16_28;
int u_xlati36;
vec2 u_xlat37;
mediump float u_xlat16_37;
float u_xlat44;
float u_xlat55;
float u_xlat56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
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
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28.x = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1.x = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (u_xlatb1.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat55 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat20.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat16_28.x = u_xlat20.x * u_xlat16_10.x;
    u_xlat20.x = (-u_xlat16_10.x) * u_xlat20.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat20.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat3.xxx * u_xlat16_28.xxx + u_xlat20.xyz;
    u_xlat16_28.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat57 = (-u_xlat55) * u_xlat16_28.x + u_xlat55;
    u_xlat57 = u_xlat55 * u_xlat57 + u_xlat16_28.x;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat55 + u_xlat57;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat8.x) * u_xlat16_28.x + u_xlat8.x;
    u_xlat61 = u_xlat8.x * u_xlat61 + u_xlat16_28.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat8.x;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat61;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat44 = u_xlat16_28.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat44 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_28.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat57 * u_xlat2.x;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat55) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat44 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat57 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat57 * u_xlat57;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_65 = u_xlat57 * u_xlat16_65;
    u_xlat16_66 = u_xlat57 * u_xlat16_65;
    u_xlat57 = (-u_xlat16_65) * u_xlat57 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat57);
    u_xlat9.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat57 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat57) * u_xlat16_28.x + u_xlat57;
    u_xlat62 = u_xlat57 * u_xlat62 + u_xlat16_28.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat57 + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat61 * u_xlat62;
    u_xlat62 = float(1.0) / u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat56 = u_xlat56 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat44 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_28.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat19.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat19.x;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_66 = u_xlat19.x * u_xlat16_60;
    u_xlat19.x = (-u_xlat16_60) * u_xlat19.x + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat19.xxx;
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_66) + u_xlat2.xyz;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat37.x = (-u_xlat19.x) * u_xlat16_28.x + u_xlat19.x;
    u_xlat37.x = u_xlat19.x * u_xlat37.x + u_xlat16_28.x;
    u_xlat37.x = sqrt(u_xlat37.x);
    u_xlat37.x = u_xlat37.x + u_xlat19.x;
    u_xlat37.x = u_xlat37.x + 6.10351563e-05;
    u_xlat37.x = u_xlat37.x * u_xlat61;
    u_xlat1.z = float(1.0) / u_xlat37.x;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_16.x, u_xlat16_65);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1.x = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb1.x) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_66);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat18.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat55) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat57) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat19.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_28.xxx * u_xlat19.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_28.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_28.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_60 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_37 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.w * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_37) + u_xlat16_19;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_37;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat1.x = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat1.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28.x = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28.x + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_3.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.zzz) + _FontFlowUVRemap.xyz;
    u_xlatb1.xyz = greaterThanEqual(u_xlat1.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = vs_TEXCOORD3.zzz + (-_FontFlowUVRemap.xyz);
    u_xlatb3.xyz = greaterThanEqual(u_xlat3.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb3.z ? float(1.0) : 0.0;
;
    u_xlat19.xy = u_xlat1.yz * u_xlat3.xy;
    u_xlat19.x = u_xlat19.x * _FontFlowSpeed.y;
    u_xlat1.x = u_xlat1.x * _FontFlowSpeed.x + u_xlat19.x;
    u_xlat1.x = u_xlat19.y * _FontFlowSpeed.z + u_xlat1.x;
    u_xlat19.x = (-vs_TEXCOORD3.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19.x = !!(u_xlat19.x>=0.0);
#else
    u_xlatb19.x = u_xlat19.x>=0.0;
#endif
    u_xlat19.x = u_xlatb19.x ? 1.0 : float(0.0);
    u_xlat19.x = u_xlat3.z * u_xlat19.x;
    u_xlat1.x = u_xlat19.x * _FontFlowSpeed.w + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Time.y;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.y = u_xlat1.x + vs_TEXCOORD3.w;
    u_xlat1.x = vs_TEXCOORD3.z;
    u_xlat16_1.xyz = texture(_FontFlowTex, u_xlat1.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * _FontColor.xyz;
    u_xlat16_1.x = texture(_FontFlowTex, vs_TEXCOORD3.xy).w;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat1.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat37.xy = u_xlat1.xy + _WarpTex_ST.zw;
    u_xlat37.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat37.xy;
    u_xlat16_3.x = texture(_WarpTex, u_xlat37.xy).y;
    u_xlat16_60 = u_xlat16_3.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_60) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat37.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_10.xy;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_0.x = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_0.y = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_0.z = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_0.w = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb19.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb19.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb19.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb19.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_60 = (u_xlatb19.z) ? 0.0 : u_xlat16_0.z;
    u_xlat16_10.x = (u_xlatb19.z) ? u_xlat16_0.w : 0.0;
    u_xlat16_19 = texture(_DissolveMask, u_xlat16_0.xy).x;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_60 = u_xlat16_10.x * -1.5 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 + -1.20000005;
    u_xlat16_10.x = u_xlat16_60 * _DissolveShrink + u_xlat16_1.x;
    u_xlat16_60 = u_xlat16_60 * _ScorchShrink + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_28.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = u_xlat16_28.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.xyz = u_xlat16_28.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_28.xyz = u_xlat16_10.xxx * u_xlat16_28.xyz;
    u_xlat16_10.x = (-u_xlat16_19) + u_xlat16_10.x;
    u_xlat16_28.xyz = vec3(u_xlat16_19) * u_xlat16_28.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = _ScorchAtten * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_60) + u_xlat16_28.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" }
  GpuProgramID 101221
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_LG_LayeredFontFlowGUI"
}