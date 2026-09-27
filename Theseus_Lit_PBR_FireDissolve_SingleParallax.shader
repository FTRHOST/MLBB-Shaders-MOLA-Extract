//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_FireDissolve_SingleParallax" {
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

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_emissiveBreathe ("自发光呼吸参数", Vector) = (0,0,0,0)

_UseMask2U ("溶解遮罩使用2U", Float) = 0.0

_MaskTex ("遮罩贴图", 2D) = "white" { }

_WarpTex ("扭曲贴图", 2D) = "white" { }

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("切换火焰溶解方向", Float) = 0.0

_DissolveDirSpeed ("溶解方向速度", Vector) = (1,0,0,0)

_DissolveTex ("火焰溶解纹理", 2D) = "white" { }

_DissolveEdgeColor ("火焰边缘颜色", Color) = (1,1,1,1)

_DissolveShrink ("火焰边缘压缩", Float) = 8.0

_DissolveRange ("火焰边缘范围", Range(0.2, 10)) = 1.0

_DissolveWarp ("火焰扭曲强度", Range(0, 1)) = 0.0

_ScorchShrink ("焦烟边缘压缩", Float) = 3.0

_ScorchAtten ("焦烟强度衰减", Range(0, 1)) = 1.0

_Cutoff ("溶解进度", Range(0, 1)) = 0.0

_SingleParallaxTex ("视差贴图", 2D) = "white" { }

_SingleParallaxColor ("视差颜色", Color) = (0,0,0,1)

_SingleParallaxFactory ("视差参数", Vector) = (1,0,0,0)

_SingleParallaxWarp ("视差扭曲强度", Range(0, 1)) = 1.0

_SingleParallaxWarpSpeed ("视差扭曲速度", Range(-1, 1)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_LaserRamp ("镭射贴图", 2D) = "black" { }

_LaserColor ("镭射颜色", Color) = (0,0,0,0)

_LaserRampIntensity ("镭射强度", Float) = 1.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 12608
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(11) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat10_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat10_20;
ivec3 u_xlati20;
bvec3 u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
vec2 u_xlat40;
int u_xlati40;
mediump float u_xlat16_41;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat46;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_65;
float u_xlat66;
float u_xlat67;
float u_xlat68;
bool u_xlatb68;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_21 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_41 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21 * u_xlat16_41;
    u_xlat16_21 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_21));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_21);
#endif
    u_xlat16_3.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_1.x, u_xlat16_3.x);
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
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_23, u_xlat16_3.x);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_63 = dot(u_xlat16_2.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat60 * u_xlat60;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_5.x = u_xlat60 * u_xlat16_63;
    u_xlat60 = (-u_xlat16_63) * u_xlat60 + 1.0;
    u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat6.xyz = vec3(u_xlat64) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_25.xyz, u_xlat16_25.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat8.xyz = vec3(u_xlat64) * u_xlat16_25.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat9.x;
    u_xlat7.x = u_xlat8.z;
    u_xlat10_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_25.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_25.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_25.xyz, u_xlat9.xyz);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat8.xyz = vec3(u_xlat64) * u_xlat7.xyz;
    u_xlat66 = dot(u_xlat8.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat16_63) + 1.0;
    u_xlat16_25.xy = vec2(u_xlat66) * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat26 = u_xlat66 * u_xlat66;
    u_xlat10_9.xyz = texture(_LaserRamp, u_xlat16_25.xy).xyz;
    u_xlat16_25.xyz = u_xlat10_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat10_9.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat10_9.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _LaserColor.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat16_25.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_9.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_63 = u_xlat16_63 * u_xlat10_9.z;
    u_xlat16_63 = u_xlat16_63 * _LaserColor.w;
    u_xlat10_10.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat10_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat10_10.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat10_10.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat10_1.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = (-u_xlat16_11.xyz) * u_xlat16_12.xyz + u_xlat16_25.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_63) * u_xlat16_25.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_25.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xy = u_xlat10_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat16_11.xyz;
    u_xlat60 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat16_5.xxx + u_xlat13.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_63 = max(u_xlat16_2.x, 0.0078125);
    u_xlat66 = (-u_xlat46) * u_xlat16_63 + u_xlat46;
    u_xlat66 = u_xlat46 * u_xlat66 + u_xlat16_63;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat46;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat0.xyz * vec3(u_xlat16_62);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat14.x) * u_xlat16_63 + u_xlat14.x;
    u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat16_63;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat14.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat67;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_63 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_63 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat46) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_3.xyz * u_xlat13.xyz;
    u_xlat10_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat10_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat16_5.x = u_xlat6.x * u_xlat6.x;
    u_xlat16_5.x = u_xlat6.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat6.x * u_xlat16_5.x;
    u_xlat16_71 = u_xlat6.x * u_xlat16_5.x;
    u_xlat6.x = (-u_xlat16_5.x) * u_xlat6.x + 1.0;
    u_xlat15.xyz = u_xlat16_11.xyz * u_xlat6.xxx;
    u_xlat15.xyz = vec3(u_xlat60) * vec3(u_xlat16_71) + u_xlat15.xyz;
    u_xlat6.x = u_xlat26 * u_xlat24 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_63 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat26 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat26) * u_xlat16_63 + u_xlat26;
    u_xlat66 = u_xlat26 * u_xlat66 + u_xlat16_63;
    u_xlat68 = sqrt(u_xlat66);
    u_xlat68 = u_xlat26 + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat67 * u_xlat68;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat68 = u_xlat6.x * u_xlat68;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat68);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat26) * u_xlat15.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_5.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 6.10351563e-05);
    u_xlat16_71 = u_xlat16_5.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_72 = float(1.0) / float(u_xlat16_5.x);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_17.xyz = u_xlat16_5.xxx * u_xlat13.xyz;
    u_xlat16_5.x = u_xlat16_71 * u_xlat16_72;
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_18.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_71;
    u_xlat16_18.xyz = u_xlat16_5.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_17.xyz;
    u_xlat68 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat68);
    u_xlat68 = dot(u_xlat8.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20.x = (-u_xlat16_5.x) + 1.0;
    u_xlat40.x = u_xlat68 * u_xlat68;
    u_xlat40.x = u_xlat40.x * u_xlat24 + 1.0;
    u_xlat40.x = u_xlat40.x * u_xlat40.x;
    u_xlat40.x = u_xlat16_63 / u_xlat40.x;
    u_xlat40.x = u_xlat40.x * 0.318309873;
    u_xlat40.x = min(u_xlat40.x, 16.0);
    u_xlat24 = (-u_xlat0.x) * u_xlat16_63 + u_xlat0.x;
    u_xlat24 = u_xlat0.x * u_xlat24 + u_xlat16_63;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat0.x + u_xlat24;
    u_xlat24 = u_xlat24 + 6.10351563e-05;
    u_xlat24 = u_xlat24 * u_xlat67;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat40.x = u_xlat40.x * u_xlat24;
    u_xlat16_5.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_5.x = u_xlat20.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat20.x * u_xlat16_5.x;
    u_xlat16_71 = u_xlat20.x * u_xlat16_5.x;
    u_xlat20.x = (-u_xlat16_5.x) * u_xlat20.x + 1.0;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat20.xxx;
    u_xlat13.xyz = vec3(u_xlat60) * vec3(u_xlat16_71) + u_xlat13.xyz;
    u_xlat20.xyz = u_xlat40.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.zxy;
    u_xlat20.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_18.xyz * u_xlat20.xyz;
    u_xlat16_16.xyz = u_xlat20.xyz * u_xlat4.zzz + u_xlat16_16.xyz;
    u_xlat16_5.x = (-u_xlat10_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat4.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat46) * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(u_xlat26) + u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_5.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat4.zzz * u_xlat16_17.xyz;
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz + u_xlat16_3.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat7.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat8.xyz;
    u_xlat16_65 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_17.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlat16_65 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_65) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_10.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_65 = u_xlat16_10.w * u_xlat16_71 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_10.w * u_xlat16_65;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _occlusionScale * u_xlat16_71 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_71;
    u_xlat0.x = min(u_xlat16_65, 1.0);
    u_xlat20.x = min(u_xlat0.x, u_xlat10_1.z);
    u_xlat16_16.xyz = u_xlat20.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat20.xxx * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat20.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati20.x = int(uint(uint(u_xlati20.x) & 1u));
    u_xlati40 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati20.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz + u_xlat16_3.xyz;
    u_xlat16_5.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat20.xyz = (-u_xlat8.xyz) * u_xlat16_5.xxx + (-u_xlat16_12.xyz);
    u_xlat4.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_10.z = dot(u_xlat16_17.xyz, u_xlat20.xyz);
    u_xlat16_5.xyz = u_xlat16_10.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_5.x = floor(u_xlat16_2.w);
    u_xlat16_25.x = u_xlat16_5.x + 1.0;
    u_xlat16_25.x = min(u_xlat16_25.x, 15.0);
    u_xlat16_2.x = u_xlat16_25.x * 16.0 + u_xlat16_2.z;
    u_xlat16_16.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_2.x = u_xlat16_5.x * 16.0 + u_xlat16_2.z;
    u_xlat16_16.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_5.x);
    u_xlat16_25.x = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_25.x + u_xlat16_44;
    u_xlat16_5.x = u_xlat16_71 * u_xlat16_5.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat0.x * 0.5;
    u_xlat16_25.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_5.x = u_xlat4.x * u_xlat16_25.x + u_xlat16_5.x;
    u_xlat16_25.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_45 = (-u_xlat16_5.x) * 2.0 + 1.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat10_1.z, u_xlat16_5.x);
    u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat64) + (-u_xlat20.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat4.xyz + u_xlat20.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat16.y = u_xlat0.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_63 = u_xlat16_10.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_10.x);
    u_xlat14.y = u_xlat16_10.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_63);
    u_xlat16_17.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb0)) ? u_xlat16_25.xyz : u_xlat16_17.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_11.xyz + u_xlat16_3.xyz;
    u_xlat16_63 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_63 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_20.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_20.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat40.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat40.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat40.xy;
    u_xlat10_4.x = texture(_WarpTex, u_xlat40.xy).y;
    u_xlat16_63 = u_xlat10_4.x * 2.0 + -1.0;
    u_xlat16_5.xy = vec2(u_xlat16_63) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat40.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_5.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb20.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb20.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb20.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb20.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb20.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb20.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb20.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb20.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb20.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_63 = (u_xlatb20.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_5.x = (u_xlatb20.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_20.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_63 = u_xlat16_63 + u_xlat16_5.x;
    u_xlat16_5.x = _Cutoff + -1.0;
    u_xlat16_63 = u_xlat16_5.x * -1.5 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 + -1.20000005;
    u_xlat16_5.x = u_xlat16_63 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_63 = u_xlat16_63 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_5.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_5.x = u_xlat16_5.x + -0.100000001;
    u_xlat16_5.x = u_xlat16_5.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = (-u_xlat16_25.x) + 1.0;
    u_xlat16_25.xyz = u_xlat16_25.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_11.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_11.x;
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_25.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_5.x = (-u_xlat10_20.x) + u_xlat16_5.x;
    u_xlat16_25.xyz = u_xlat10_20.xxx * u_xlat16_25.xyz;
    SV_Target0.w = u_xlat16_5.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = _ScorchAtten * u_xlat16_5.x + u_xlat16_63;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_63) + u_xlat16_25.xyz;
    u_xlat0.xy = u_xlat16_12.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_12.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_12.zz + u_xlat0.xy;
    u_xlat40.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat40.xy = fract(u_xlat40.xy);
    u_xlat40.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat40.xy;
    u_xlat16_63 = _SingleParallaxFactory.x * -2.0;
    u_xlat40.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat40.xy;
    u_xlat4.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_63 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_5.xy = vec2(u_xlat16_63) * vec2(_SingleParallaxWarp) + u_xlat40.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.zxy * _SingleParallaxColor.zxy;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat10_9.xxx + u_xlat16_3.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_9.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(11) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat10_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat10_20;
ivec3 u_xlati20;
bvec3 u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
vec2 u_xlat40;
int u_xlati40;
mediump float u_xlat16_41;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat46;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_65;
float u_xlat66;
float u_xlat67;
float u_xlat68;
bool u_xlatb68;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_21 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_41 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21 * u_xlat16_41;
    u_xlat16_21 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_21));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_21);
#endif
    u_xlat16_3.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_1.x, u_xlat16_3.x);
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
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_23, u_xlat16_3.x);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_63 = dot(u_xlat16_2.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat60 * u_xlat60;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_5.x = u_xlat60 * u_xlat16_63;
    u_xlat60 = (-u_xlat16_63) * u_xlat60 + 1.0;
    u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat6.xyz = vec3(u_xlat64) * u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_25.xyz, u_xlat16_25.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat8.xyz = vec3(u_xlat64) * u_xlat16_25.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat9.x;
    u_xlat7.x = u_xlat8.z;
    u_xlat10_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_25.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_25.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_25.xyz, u_xlat9.xyz);
    u_xlat64 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat8.xyz = vec3(u_xlat64) * u_xlat7.xyz;
    u_xlat66 = dot(u_xlat8.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat16_63) + 1.0;
    u_xlat16_25.xy = vec2(u_xlat66) * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat26 = u_xlat66 * u_xlat66;
    u_xlat10_9.xyz = texture(_LaserRamp, u_xlat16_25.xy).xyz;
    u_xlat16_25.xyz = u_xlat10_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat10_9.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat10_9.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _LaserColor.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.xyz = min(max(u_xlat16_25.xyz, 0.0), 1.0);
#else
    u_xlat16_25.xyz = clamp(u_xlat16_25.xyz, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat16_25.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_9.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_63 = u_xlat16_63 * u_xlat10_9.z;
    u_xlat16_63 = u_xlat16_63 * _LaserColor.w;
    u_xlat10_10.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat10_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat10_10.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat10_10.zxy * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat10_1.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = (-u_xlat16_11.xyz) * u_xlat16_12.xyz + u_xlat16_25.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_63) * u_xlat16_25.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_25.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xy = u_xlat10_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat16_11.xyz;
    u_xlat60 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat60) * u_xlat16_5.xxx + u_xlat13.xyz;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_63 = max(u_xlat16_2.x, 0.0078125);
    u_xlat66 = (-u_xlat46) * u_xlat16_63 + u_xlat46;
    u_xlat66 = u_xlat46 * u_xlat66 + u_xlat16_63;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat46;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat0.xyz * vec3(u_xlat16_62);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat14.x) * u_xlat16_63 + u_xlat14.x;
    u_xlat67 = u_xlat14.x * u_xlat67 + u_xlat16_63;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat14.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat67;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_63 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_63 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat46) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_3.xyz * u_xlat13.xyz;
    u_xlat10_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat10_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat4.xxx * u_xlat13.xyz;
    u_xlat16_5.x = u_xlat6.x * u_xlat6.x;
    u_xlat16_5.x = u_xlat6.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat6.x * u_xlat16_5.x;
    u_xlat16_71 = u_xlat6.x * u_xlat16_5.x;
    u_xlat6.x = (-u_xlat16_5.x) * u_xlat6.x + 1.0;
    u_xlat15.xyz = u_xlat16_11.xyz * u_xlat6.xxx;
    u_xlat15.xyz = vec3(u_xlat60) * vec3(u_xlat16_71) + u_xlat15.xyz;
    u_xlat6.x = u_xlat26 * u_xlat24 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_63 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat26 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat26) * u_xlat16_63 + u_xlat26;
    u_xlat66 = u_xlat26 * u_xlat66 + u_xlat16_63;
    u_xlat68 = sqrt(u_xlat66);
    u_xlat68 = u_xlat26 + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat67 * u_xlat68;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat68 = u_xlat6.x * u_xlat68;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat68);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat26) * u_xlat15.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_5.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 6.10351563e-05);
    u_xlat16_71 = u_xlat16_5.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_72 = float(1.0) / float(u_xlat16_5.x);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_17.xyz = u_xlat16_5.xxx * u_xlat13.xyz;
    u_xlat16_5.x = u_xlat16_71 * u_xlat16_72;
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_18.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_71;
    u_xlat16_18.xyz = u_xlat16_5.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_17.xyz;
    u_xlat68 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat68);
    u_xlat68 = dot(u_xlat8.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20.x = (-u_xlat16_5.x) + 1.0;
    u_xlat40.x = u_xlat68 * u_xlat68;
    u_xlat40.x = u_xlat40.x * u_xlat24 + 1.0;
    u_xlat40.x = u_xlat40.x * u_xlat40.x;
    u_xlat40.x = u_xlat16_63 / u_xlat40.x;
    u_xlat40.x = u_xlat40.x * 0.318309873;
    u_xlat40.x = min(u_xlat40.x, 16.0);
    u_xlat24 = (-u_xlat0.x) * u_xlat16_63 + u_xlat0.x;
    u_xlat24 = u_xlat0.x * u_xlat24 + u_xlat16_63;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat0.x + u_xlat24;
    u_xlat24 = u_xlat24 + 6.10351563e-05;
    u_xlat24 = u_xlat24 * u_xlat67;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat24 = min(u_xlat24, 16.0);
    u_xlat40.x = u_xlat40.x * u_xlat24;
    u_xlat16_5.x = u_xlat20.x * u_xlat20.x;
    u_xlat16_5.x = u_xlat20.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat20.x * u_xlat16_5.x;
    u_xlat16_71 = u_xlat20.x * u_xlat16_5.x;
    u_xlat20.x = (-u_xlat16_5.x) * u_xlat20.x + 1.0;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat20.xxx;
    u_xlat13.xyz = vec3(u_xlat60) * vec3(u_xlat16_71) + u_xlat13.xyz;
    u_xlat20.xyz = u_xlat40.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.zxy;
    u_xlat20.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_18.xyz * u_xlat20.xyz;
    u_xlat16_16.xyz = u_xlat20.xyz * u_xlat4.zzz + u_xlat16_16.xyz;
    u_xlat16_5.x = (-u_xlat10_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat4.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat46) * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(u_xlat26) + u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_5.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat4.zzz * u_xlat16_17.xyz;
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz + u_xlat16_3.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat7.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat8.xyz;
    u_xlat16_65 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_17.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlat16_65 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_65) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_10.w = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_65 = u_xlat16_10.w * u_xlat16_71 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_10.w * u_xlat16_65;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _occlusionScale * u_xlat16_71 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_71;
    u_xlat0.x = min(u_xlat16_65, 1.0);
    u_xlat20.x = min(u_xlat0.x, u_xlat10_1.z);
    u_xlat16_16.xyz = u_xlat20.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat20.xxx * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat20.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati20.x = int(uint(uint(u_xlati20.x) & 1u));
    u_xlati40 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati20.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz + u_xlat16_3.xyz;
    u_xlat16_5.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat20.xyz = (-u_xlat8.xyz) * u_xlat16_5.xxx + (-u_xlat16_12.xyz);
    u_xlat4.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_10.z = dot(u_xlat16_17.xyz, u_xlat20.xyz);
    u_xlat16_5.xyz = u_xlat16_10.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_5.x = floor(u_xlat16_2.w);
    u_xlat16_25.x = u_xlat16_5.x + 1.0;
    u_xlat16_25.x = min(u_xlat16_25.x, 15.0);
    u_xlat16_2.x = u_xlat16_25.x * 16.0 + u_xlat16_2.z;
    u_xlat16_16.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_2.x = u_xlat16_5.x * 16.0 + u_xlat16_2.z;
    u_xlat16_16.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_5.x);
    u_xlat16_25.x = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_25.x + u_xlat16_44;
    u_xlat16_5.x = u_xlat16_71 * u_xlat16_5.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat0.x * 0.5;
    u_xlat16_25.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_5.x = u_xlat4.x * u_xlat16_25.x + u_xlat16_5.x;
    u_xlat16_25.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_45 = (-u_xlat16_5.x) * 2.0 + 1.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat10_1.z, u_xlat16_5.x);
    u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat64) + (-u_xlat20.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat4.xyz + u_xlat20.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat16.y = u_xlat0.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_63 = u_xlat16_10.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_10.x);
    u_xlat14.y = u_xlat16_10.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_63);
    u_xlat16_17.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb0)) ? u_xlat16_25.xyz : u_xlat16_17.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_11.xyz + u_xlat16_3.xyz;
    u_xlat16_63 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_63 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_20.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_20.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat40.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat40.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat40.xy;
    u_xlat10_4.x = texture(_WarpTex, u_xlat40.xy).y;
    u_xlat16_63 = u_xlat10_4.x * 2.0 + -1.0;
    u_xlat16_5.xy = vec2(u_xlat16_63) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat40.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_5.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb20.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb20.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb20.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb20.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb20.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb20.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb20.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb20.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb20.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_63 = (u_xlatb20.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_5.x = (u_xlatb20.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_20.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_63 = u_xlat16_63 + u_xlat16_5.x;
    u_xlat16_5.x = _Cutoff + -1.0;
    u_xlat16_63 = u_xlat16_5.x * -1.5 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 + -1.20000005;
    u_xlat16_5.x = u_xlat16_63 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_63 = u_xlat16_63 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_5.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_5.x = u_xlat16_5.x + -0.100000001;
    u_xlat16_5.x = u_xlat16_5.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_25.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = (-u_xlat16_25.x) + 1.0;
    u_xlat16_25.xyz = u_xlat16_25.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_11.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_11.x;
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_25.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_5.x = (-u_xlat10_20.x) + u_xlat16_5.x;
    u_xlat16_25.xyz = u_xlat10_20.xxx * u_xlat16_25.xyz;
    SV_Target0.w = u_xlat16_5.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = _ScorchAtten * u_xlat16_5.x + u_xlat16_63;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_63) + u_xlat16_25.xyz;
    u_xlat0.xy = u_xlat16_12.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_12.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_12.zz + u_xlat0.xy;
    u_xlat40.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat40.xy = fract(u_xlat40.xy);
    u_xlat40.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat40.xy;
    u_xlat16_63 = _SingleParallaxFactory.x * -2.0;
    u_xlat40.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat40.xy;
    u_xlat4.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_63 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_5.xy = vec2(u_xlat16_63) * vec2(_SingleParallaxWarp) + u_xlat40.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.zxy * _SingleParallaxColor.zxy;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat10_9.xxx + u_xlat16_3.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_9.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(13) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(15) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(16) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat10_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat10_19;
bvec3 u_xlatb19;
float u_xlat20;
mediump float u_xlat16_20;
float u_xlat21;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
vec2 u_xlat38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat40;
vec2 u_xlat41;
mediump float u_xlat16_48;
float u_xlat57;
float u_xlat58;
float u_xlat59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat10_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat10_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat10_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat10_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
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
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat21 * u_xlat21;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat21 * u_xlat16_10.x;
    u_xlat21 = (-u_xlat16_10.x) * u_xlat21 + 1.0;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat2.z = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.z = min(max(u_xlat2.z, 0.0), 1.0);
#else
    u_xlat2.z = clamp(u_xlat2.z, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xz = u_xlat2.zz * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat2.xz = u_xlat2.xz * u_xlat2.xz;
    u_xlat10_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat10_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat10_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat10_3.zxy * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _LaserColor.zxy;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.zwx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_3.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_68 = u_xlat16_68 * u_xlat10_3.z;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat10_4.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat10_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat10_4.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat10_4.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat10_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat10_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_12.xyz;
    u_xlat21 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_29.xxx + u_xlat9.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat41.x = (-u_xlat58) * u_xlat16_29.x + u_xlat58;
    u_xlat41.x = u_xlat58 * u_xlat41.x + u_xlat16_29.x;
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat58 + u_xlat41.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat14.x) * u_xlat16_29.x + u_xlat14.x;
    u_xlat60 = u_xlat14.x * u_xlat60 + u_xlat16_29.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat41.y = u_xlat60 + u_xlat14.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat41.x = min(u_xlat41.x, 16.0);
    u_xlat4.x = u_xlat16_29.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat41.x * u_xlat2.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16_68 = u_xlat59 * u_xlat59;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_69 = u_xlat59 * u_xlat16_68;
    u_xlat2.x = (-u_xlat16_68) * u_xlat59 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat2.xxx;
    u_xlat15.xyz = vec3(u_xlat21) * vec3(u_xlat16_69) + u_xlat15.xyz;
    u_xlat2.x = u_xlat2.z * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat40) * u_xlat16_29.x + u_xlat40;
    u_xlat59 = u_xlat40 * u_xlat59 + u_xlat16_29.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat40;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat41.y;
    u_xlat2.w = float(1.0) / u_xlat59;
    u_xlat2.xw = min(u_xlat2.xw, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat40) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_18.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat16_63) + 1.0;
    u_xlat39 = u_xlat2.x * u_xlat2.x;
    u_xlat39 = u_xlat39 * u_xlat4.x + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_29.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat2.x = (-u_xlat1.x) * u_xlat16_29.x + u_xlat1.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x + u_xlat16_29.x;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat1.x + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat41.y;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat2.x;
    u_xlat16_63 = u_xlat20 * u_xlat20;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_68 = u_xlat20 * u_xlat16_63;
    u_xlat20 = (-u_xlat16_63) * u_xlat20 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat20);
    u_xlat2.xyw = vec3(u_xlat21) * vec3(u_xlat16_68) + u_xlat9.xyz;
    u_xlat2.xyw = vec3(u_xlat39) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.zxy;
    u_xlat2.xyw = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat16_18.xyz * u_xlat2.xyw;
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat19.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat40) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
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
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_39;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat1.x * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_4.z, u_xlat16_10.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_63 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_63 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_19.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat38.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat38.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat38.xy;
    u_xlat10_1 = texture(_WarpTex, u_xlat38.xy).y;
    u_xlat16_63 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat38.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb19.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb19.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb19.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb19.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_63 = (u_xlatb19.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_10.x = (u_xlatb19.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_19.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_63 = u_xlat16_63 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_63 = u_xlat16_10.x * -1.5 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 + -1.20000005;
    u_xlat16_10.x = u_xlat16_63 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_63 = u_xlat16_63 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_29.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.xyz = u_xlat16_29.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_29.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_10.x = (-u_xlat10_19.x) + u_xlat16_10.x;
    u_xlat16_29.xyz = u_xlat10_19.xxx * u_xlat16_29.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = _ScorchAtten * u_xlat16_10.x + u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_63) + u_xlat16_29.xyz;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat38.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat38.xy = fract(u_xlat38.xy);
    u_xlat38.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat38.xy;
    u_xlat16_63 = _SingleParallaxFactory.x * -2.0;
    u_xlat38.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat38.xy;
    u_xlat41.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat41.x = fract(u_xlat41.x);
    u_xlat41.xy = u_xlat41.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat41.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_63 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(_SingleParallaxWarp) + u_xlat38.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_0.zxy * _SingleParallaxColor.zxy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat10_3.xxx + u_xlat16_6.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_19.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_19.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(13) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(15) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(16) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat10_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat10_19;
bvec3 u_xlatb19;
float u_xlat20;
mediump float u_xlat16_20;
float u_xlat21;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
vec2 u_xlat38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat40;
vec2 u_xlat41;
mediump float u_xlat16_48;
float u_xlat57;
float u_xlat58;
float u_xlat59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat10_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat10_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat10_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat10_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
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
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat21 * u_xlat21;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat21 * u_xlat16_10.x;
    u_xlat21 = (-u_xlat16_10.x) * u_xlat21 + 1.0;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat2.z = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.z = min(max(u_xlat2.z, 0.0), 1.0);
#else
    u_xlat2.z = clamp(u_xlat2.z, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xz = u_xlat2.zz * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat2.xz = u_xlat2.xz * u_xlat2.xz;
    u_xlat10_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat10_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat10_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat10_3.zxy * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _LaserColor.zxy;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.zwx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_3.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_68 = u_xlat16_68 * u_xlat10_3.z;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat10_4.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat10_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat10_4.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat10_4.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat10_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat10_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_12.xyz;
    u_xlat21 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_29.xxx + u_xlat9.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat41.x = (-u_xlat58) * u_xlat16_29.x + u_xlat58;
    u_xlat41.x = u_xlat58 * u_xlat41.x + u_xlat16_29.x;
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat58 + u_xlat41.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat14.x) * u_xlat16_29.x + u_xlat14.x;
    u_xlat60 = u_xlat14.x * u_xlat60 + u_xlat16_29.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat41.y = u_xlat60 + u_xlat14.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat41.x = min(u_xlat41.x, 16.0);
    u_xlat4.x = u_xlat16_29.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat41.x * u_xlat2.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16_68 = u_xlat59 * u_xlat59;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_69 = u_xlat59 * u_xlat16_68;
    u_xlat2.x = (-u_xlat16_68) * u_xlat59 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat2.xxx;
    u_xlat15.xyz = vec3(u_xlat21) * vec3(u_xlat16_69) + u_xlat15.xyz;
    u_xlat2.x = u_xlat2.z * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat40) * u_xlat16_29.x + u_xlat40;
    u_xlat59 = u_xlat40 * u_xlat59 + u_xlat16_29.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat40;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat41.y;
    u_xlat2.w = float(1.0) / u_xlat59;
    u_xlat2.xw = min(u_xlat2.xw, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat40) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_18.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat16_63) + 1.0;
    u_xlat39 = u_xlat2.x * u_xlat2.x;
    u_xlat39 = u_xlat39 * u_xlat4.x + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_29.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat2.x = (-u_xlat1.x) * u_xlat16_29.x + u_xlat1.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x + u_xlat16_29.x;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat1.x + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat41.y;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat2.x;
    u_xlat16_63 = u_xlat20 * u_xlat20;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_68 = u_xlat20 * u_xlat16_63;
    u_xlat20 = (-u_xlat16_63) * u_xlat20 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat20);
    u_xlat2.xyw = vec3(u_xlat21) * vec3(u_xlat16_68) + u_xlat9.xyz;
    u_xlat2.xyw = vec3(u_xlat39) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.zxy;
    u_xlat2.xyw = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat16_18.xyz * u_xlat2.xyw;
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat19.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat40) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
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
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_39;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat1.x * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_4.z, u_xlat16_10.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_63 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_63 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_19.zxy * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat38.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat38.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat38.xy;
    u_xlat10_1 = texture(_WarpTex, u_xlat38.xy).y;
    u_xlat16_63 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat38.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb19.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb19.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb19.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb19.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_63 = (u_xlatb19.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_10.x = (u_xlatb19.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_19.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_63 = u_xlat16_63 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_63 = u_xlat16_10.x * -1.5 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 + -1.20000005;
    u_xlat16_10.x = u_xlat16_63 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_63 = u_xlat16_63 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_29.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.xyz = u_xlat16_29.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_29.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_10.x = (-u_xlat10_19.x) + u_xlat16_10.x;
    u_xlat16_29.xyz = u_xlat10_19.xxx * u_xlat16_29.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = _ScorchAtten * u_xlat16_10.x + u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_63) + u_xlat16_29.xyz;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat38.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat38.xy = fract(u_xlat38.xy);
    u_xlat38.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat38.xy;
    u_xlat16_63 = _SingleParallaxFactory.x * -2.0;
    u_xlat38.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat38.xy;
    u_xlat41.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat41.x = fract(u_xlat41.x);
    u_xlat41.xy = u_xlat41.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat41.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_63 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(_SingleParallaxWarp) + u_xlat38.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_0.zxy * _SingleParallaxColor.zxy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat10_3.xxx + u_xlat16_6.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_19.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_19.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(11) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
vec4 u_xlat5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat10_8;
mediump vec4 u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat10_21;
ivec3 u_xlati21;
bvec3 u_xlatb21;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump float u_xlat16_25;
float u_xlat26;
mediump vec2 u_xlat16_32;
vec2 u_xlat42;
int u_xlati42;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
float u_xlat47;
float u_xlat63;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat68;
float u_xlat69;
float u_xlat70;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_22.x * u_xlat16_43;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_22.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
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
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_23, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_22.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_65 = dot(u_xlat16_22.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat63 * u_xlat63;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_3.x = u_xlat63 * u_xlat16_65;
    u_xlat63 = (-u_xlat16_65) * u_xlat63 + 1.0;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_24.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_24.xyz, u_xlat16_24.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat7.xyz = u_xlat16_24.xyz * vec3(u_xlat67);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat10_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_24.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_24.xyz, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_24.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_24.xyz, u_xlat8.xyz);
    u_xlat67 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat7.xyz = vec3(u_xlat67) * u_xlat6.xyz;
    u_xlat68 = dot(u_xlat7.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_65) + 1.0;
    u_xlat16_24.xy = vec2(u_xlat68) * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat26 = u_xlat68 * u_xlat68;
    u_xlat10_8.xyz = texture(_LaserRamp, u_xlat16_24.xy).xyz;
    u_xlat16_24.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat10_8.xyz * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat10_8.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _LaserColor.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.xyz = min(max(u_xlat16_24.xyz, 0.0), 1.0);
#else
    u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat16_24.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_8.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_65 = u_xlat16_65 * u_xlat10_8.z;
    u_xlat16_65 = u_xlat16_65 * _LaserColor.w;
    u_xlat10_9.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat10_9.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_9.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat10_9.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_10.xyz) * u_xlat16_11.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_65) * u_xlat16_24.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_24.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xy = u_xlat10_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_11.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat63) * u_xlat16_10.xyz;
    u_xlat63 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat63) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat47 = dot(u_xlat7.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_65 = max(u_xlat16_22.x, 0.0078125);
    u_xlat68 = (-u_xlat47) * u_xlat16_65 + u_xlat47;
    u_xlat68 = u_xlat47 * u_xlat68 + u_xlat16_65;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat47;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat14.x) * u_xlat16_65 + u_xlat14.x;
    u_xlat69 = u_xlat14.x * u_xlat69 + u_xlat16_65;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat14.x;
    u_xlat70 = u_xlat69 + 6.10351563e-05;
    u_xlat68 = u_xlat68 * u_xlat70;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat25 = u_xlat16_65 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat25 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_65 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat68 * u_xlat4.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat47) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat10_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat10_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat4.xxx * u_xlat12.xyz;
    u_xlat16_3.x = u_xlat5.x * u_xlat5.x;
    u_xlat16_3.x = u_xlat5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat5.x * u_xlat16_3.x;
    u_xlat16_73 = u_xlat5.x * u_xlat16_3.x;
    u_xlat5.x = (-u_xlat16_3.x) * u_xlat5.x + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * u_xlat5.xxx;
    u_xlat15.xyz = vec3(u_xlat63) * vec3(u_xlat16_73) + u_xlat15.xyz;
    u_xlat5.x = u_xlat26 * u_xlat25 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_65 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat26 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat26) * u_xlat16_65 + u_xlat26;
    u_xlat68 = u_xlat26 * u_xlat68 + u_xlat16_65;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat26;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat68 * u_xlat70;
    u_xlat5.w = float(1.0) / u_xlat68;
    u_xlat5.xw = min(u_xlat5.xw, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.w * u_xlat5.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat26) * u_xlat15.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat12.xyz;
    u_xlat16_3.x = u_xlat16_73 * u_xlat16_32.x;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_18.x);
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
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_32.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_32.x);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_73;
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.x = (-u_xlat16_3.x) + 1.0;
    u_xlat42.x = u_xlat5.x * u_xlat5.x;
    u_xlat42.x = u_xlat42.x * u_xlat25 + 1.0;
    u_xlat42.x = u_xlat42.x * u_xlat42.x;
    u_xlat42.x = u_xlat16_65 / u_xlat42.x;
    u_xlat42.x = u_xlat42.x * 0.318309873;
    u_xlat42.x = min(u_xlat42.x, 16.0);
    u_xlat25 = (-u_xlat0.x) * u_xlat16_65 + u_xlat0.x;
    u_xlat25 = u_xlat0.x * u_xlat25 + u_xlat16_65;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat0.x + u_xlat25;
    u_xlat25 = u_xlat25 + 6.10351563e-05;
    u_xlat25 = u_xlat25 * u_xlat70;
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat42.x = u_xlat42.x * u_xlat25;
    u_xlat16_3.x = u_xlat21.x * u_xlat21.x;
    u_xlat16_3.x = u_xlat21.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat21.x * u_xlat16_3.x;
    u_xlat16_73 = u_xlat21.x * u_xlat16_3.x;
    u_xlat21.x = (-u_xlat16_3.x) * u_xlat21.x + 1.0;
    u_xlat12.xyz = u_xlat16_10.xyz * u_xlat21.xxx;
    u_xlat12.xyz = vec3(u_xlat63) * vec3(u_xlat16_73) + u_xlat12.xyz;
    u_xlat21.xyz = u_xlat42.xxx * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat0.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_18.xyz * u_xlat21.xyz;
    u_xlat16_16.xyz = u_xlat21.xyz * u_xlat4.zzz + u_xlat16_16.xyz;
    u_xlat16_3.x = (-u_xlat10_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat47) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat26) + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat4.zzz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat6.xyz) * vec3(u_xlat67) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_occlusionScale) * u_xlat16_18.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_18.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_66) + u_xlat16_73;
    u_xlat16_32.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_11.w = _occlusionScale * u_xlat16_32.x + 1.0;
    u_xlat16_66 = u_xlat16_11.w * u_xlat16_73 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_11.w * u_xlat16_66;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_73;
    u_xlat0.x = min(u_xlat16_66, 1.0);
    u_xlat21.x = min(u_xlat0.x, u_xlat10_9.z);
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat21.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat21.xxx * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat21.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat21.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati21.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_73) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati21.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati21.x = int(uint(uint(u_xlati21.x) & 1u));
    u_xlati42 = (u_xlati21.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati21.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat4.x = dot(u_xlat16_18.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.z = dot(u_xlat16_18.xyz, u_xlat21.xyz);
    u_xlat16_3.xyz = u_xlat16_11.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_1.w);
    u_xlat16_24.x = u_xlat16_3.x + 1.0;
    u_xlat16_24.x = min(u_xlat16_24.x, 15.0);
    u_xlat16_1.x = u_xlat16_24.x * 16.0 + u_xlat16_1.z;
    u_xlat16_32.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_1.x = u_xlat16_3.x * 16.0 + u_xlat16_1.z;
    u_xlat16_32.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_24.x = (-u_xlat16_46) + u_xlat16_25;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_24.x + u_xlat16_46;
    u_xlat16_3.x = u_xlat16_73 * u_xlat16_3.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_24.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_24.x + u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_45 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat10_9.z);
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat67) + (-u_xlat21.xyz);
    u_xlat0.xyz = vec3(u_xlat16_65) * u_xlat4.xyz + u_xlat21.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat16.y = u_xlat0.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_65 = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat14.y = u_xlat16_11.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_65);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_24.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_24.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat16_11.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_10.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_10.xyz + u_xlat16_2.xyz;
    u_xlat16_65 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_65 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_21.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_21.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat42.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat42.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat42.xy;
    u_xlat10_4.x = texture(_WarpTex, u_xlat42.xy).y;
    u_xlat16_65 = u_xlat10_4.x * 2.0 + -1.0;
    u_xlat16_3.xy = vec2(u_xlat16_65) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat42.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb21.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb21.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb21.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb21.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb21.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_3.x = (u_xlatb21.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.y = (u_xlatb21.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_3.z = (u_xlatb21.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.w = (u_xlatb21.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_65 = (u_xlatb21.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_3.x = (u_xlatb21.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_21.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_65 = u_xlat16_65 + u_xlat16_3.x;
    u_xlat16_3.x = _Cutoff + -1.0;
    u_xlat16_65 = u_xlat16_3.x * -1.5 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_65 + -1.20000005;
    u_xlat16_3.x = u_xlat16_65 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_65 = u_xlat16_65 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat16_3.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = (-u_xlat16_24.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_10.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_10.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_3.x = (-u_xlat10_21.x) + u_xlat16_3.x;
    u_xlat16_24.xyz = u_xlat10_21.xxx * u_xlat16_24.xyz;
    SV_Target0.w = u_xlat16_3.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = _ScorchAtten * u_xlat16_3.x + u_xlat16_65;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_65) + u_xlat16_24.xyz;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat42.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat42.xy = fract(u_xlat42.xy);
    u_xlat42.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat42.xy;
    u_xlat16_65 = _SingleParallaxFactory.x * -2.0;
    u_xlat42.xy = vec2(u_xlat16_65) * u_xlat0.xy + u_xlat42.xy;
    u_xlat4.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_65) * u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_65 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_3.xy = vec2(u_xlat16_65) * vec2(_SingleParallaxWarp) + u_xlat42.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _SingleParallaxColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat10_8.xxx + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_8.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(7) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(10) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(11) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
vec4 u_xlat5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat10_8;
mediump vec4 u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat10_21;
ivec3 u_xlati21;
bvec3 u_xlatb21;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump float u_xlat16_25;
float u_xlat26;
mediump vec2 u_xlat16_32;
vec2 u_xlat42;
int u_xlati42;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
float u_xlat47;
float u_xlat63;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat68;
float u_xlat69;
float u_xlat70;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_22.x * u_xlat16_43;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_22.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
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
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_23, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_22.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_65 = dot(u_xlat16_22.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat63 * u_xlat63;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_65 = u_xlat63 * u_xlat16_65;
    u_xlat16_3.x = u_xlat63 * u_xlat16_65;
    u_xlat63 = (-u_xlat16_65) * u_xlat63 + 1.0;
    u_xlat5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_24.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_24.xyz, u_xlat16_24.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat7.xyz = u_xlat16_24.xyz * vec3(u_xlat67);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat10_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_24.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_24.xyz, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_24.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_24.xyz, u_xlat8.xyz);
    u_xlat67 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat7.xyz = vec3(u_xlat67) * u_xlat6.xyz;
    u_xlat68 = dot(u_xlat7.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_65) + 1.0;
    u_xlat16_24.xy = vec2(u_xlat68) * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat26 = u_xlat68 * u_xlat68;
    u_xlat10_8.xyz = texture(_LaserRamp, u_xlat16_24.xy).xyz;
    u_xlat16_24.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat10_8.xyz * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat10_8.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _LaserColor.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.xyz = min(max(u_xlat16_24.xyz, 0.0), 1.0);
#else
    u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat16_24.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_8.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_65 = u_xlat16_65 * u_xlat10_8.z;
    u_xlat16_65 = u_xlat16_65 * _LaserColor.w;
    u_xlat10_9.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat10_9.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_9.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat10_9.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_10.xyz) * u_xlat16_11.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_65) * u_xlat16_24.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_24.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xy = u_xlat10_9.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_11.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat63) * u_xlat16_10.xyz;
    u_xlat63 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat63) * u_xlat16_3.xxx + u_xlat12.xyz;
    u_xlat47 = dot(u_xlat7.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_65 = max(u_xlat16_22.x, 0.0078125);
    u_xlat68 = (-u_xlat47) * u_xlat16_65 + u_xlat47;
    u_xlat68 = u_xlat47 * u_xlat68 + u_xlat16_65;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat47;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat14.x) * u_xlat16_65 + u_xlat14.x;
    u_xlat69 = u_xlat14.x * u_xlat69 + u_xlat16_65;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat14.x;
    u_xlat70 = u_xlat69 + 6.10351563e-05;
    u_xlat68 = u_xlat68 * u_xlat70;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat25 = u_xlat16_65 + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat25 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_65 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat68 * u_xlat4.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat47) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlat10_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat10_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat4.xxx * u_xlat12.xyz;
    u_xlat16_3.x = u_xlat5.x * u_xlat5.x;
    u_xlat16_3.x = u_xlat5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat5.x * u_xlat16_3.x;
    u_xlat16_73 = u_xlat5.x * u_xlat16_3.x;
    u_xlat5.x = (-u_xlat16_3.x) * u_xlat5.x + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * u_xlat5.xxx;
    u_xlat15.xyz = vec3(u_xlat63) * vec3(u_xlat16_73) + u_xlat15.xyz;
    u_xlat5.x = u_xlat26 * u_xlat25 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_65 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat26 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat68 = (-u_xlat26) * u_xlat16_65 + u_xlat26;
    u_xlat68 = u_xlat26 * u_xlat68 + u_xlat16_65;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat26;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat68 * u_xlat70;
    u_xlat5.w = float(1.0) / u_xlat68;
    u_xlat5.xw = min(u_xlat5.xw, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.w * u_xlat5.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat26) * u_xlat15.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat12.xyz;
    u_xlat16_3.x = u_xlat16_73 * u_xlat16_32.x;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_18.x);
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
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_32.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_32.x);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_73;
    u_xlat16_18.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_17.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.x = (-u_xlat16_3.x) + 1.0;
    u_xlat42.x = u_xlat5.x * u_xlat5.x;
    u_xlat42.x = u_xlat42.x * u_xlat25 + 1.0;
    u_xlat42.x = u_xlat42.x * u_xlat42.x;
    u_xlat42.x = u_xlat16_65 / u_xlat42.x;
    u_xlat42.x = u_xlat42.x * 0.318309873;
    u_xlat42.x = min(u_xlat42.x, 16.0);
    u_xlat25 = (-u_xlat0.x) * u_xlat16_65 + u_xlat0.x;
    u_xlat25 = u_xlat0.x * u_xlat25 + u_xlat16_65;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat0.x + u_xlat25;
    u_xlat25 = u_xlat25 + 6.10351563e-05;
    u_xlat25 = u_xlat25 * u_xlat70;
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat42.x = u_xlat42.x * u_xlat25;
    u_xlat16_3.x = u_xlat21.x * u_xlat21.x;
    u_xlat16_3.x = u_xlat21.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat21.x * u_xlat16_3.x;
    u_xlat16_73 = u_xlat21.x * u_xlat16_3.x;
    u_xlat21.x = (-u_xlat16_3.x) * u_xlat21.x + 1.0;
    u_xlat12.xyz = u_xlat16_10.xyz * u_xlat21.xxx;
    u_xlat12.xyz = vec3(u_xlat63) * vec3(u_xlat16_73) + u_xlat12.xyz;
    u_xlat21.xyz = u_xlat42.xxx * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat0.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_18.xyz * u_xlat21.xyz;
    u_xlat16_16.xyz = u_xlat21.xyz * u_xlat4.zzz + u_xlat16_16.xyz;
    u_xlat16_3.x = (-u_xlat10_9.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat47) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat26) + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_3.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat4.zzz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat6.xyz) * vec3(u_xlat67) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_occlusionScale) * u_xlat16_18.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_18.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlat16_66 = dot(u_xlat16_18.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_66) + u_xlat16_73;
    u_xlat16_32.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_11.w = _occlusionScale * u_xlat16_32.x + 1.0;
    u_xlat16_66 = u_xlat16_11.w * u_xlat16_73 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_11.w * u_xlat16_66;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_73;
    u_xlat0.x = min(u_xlat16_66, 1.0);
    u_xlat21.x = min(u_xlat0.x, u_xlat10_9.z);
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat21.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat21.xxx * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat21.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat21.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati21.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_73) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati21.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati21.x = int(uint(uint(u_xlati21.x) & 1u));
    u_xlati42 = (u_xlati21.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati21.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat16_3.xxx + (-u_xlat16_13.xyz);
    u_xlat4.x = dot(u_xlat16_18.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.z = dot(u_xlat16_18.xyz, u_xlat21.xyz);
    u_xlat16_3.xyz = u_xlat16_11.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_1.w);
    u_xlat16_24.x = u_xlat16_3.x + 1.0;
    u_xlat16_24.x = min(u_xlat16_24.x, 15.0);
    u_xlat16_1.x = u_xlat16_24.x * 16.0 + u_xlat16_1.z;
    u_xlat16_32.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_1.x = u_xlat16_3.x * 16.0 + u_xlat16_1.z;
    u_xlat16_32.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_24.x = (-u_xlat16_46) + u_xlat16_25;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_24.x + u_xlat16_46;
    u_xlat16_3.x = u_xlat16_73 * u_xlat16_3.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_24.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_24.x + u_xlat16_3.x;
    u_xlat16_24.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_45 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_45 + u_xlat16_24.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat10_9.z);
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat67) + (-u_xlat21.xyz);
    u_xlat0.xyz = vec3(u_xlat16_65) * u_xlat4.xyz + u_xlat21.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat16.y = u_xlat0.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_65 = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat14.y = u_xlat16_11.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_65);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_24.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_24.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat16_11.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_10.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_10.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_10.xyz + u_xlat16_2.xyz;
    u_xlat16_65 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_65 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_21.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_21.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat42.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat42.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat42.xy;
    u_xlat10_4.x = texture(_WarpTex, u_xlat42.xy).y;
    u_xlat16_65 = u_xlat10_4.x * 2.0 + -1.0;
    u_xlat16_3.xy = vec2(u_xlat16_65) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat42.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb21.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb21.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb21.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb21.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb21.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_3.x = (u_xlatb21.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.y = (u_xlatb21.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_3.z = (u_xlatb21.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_3.w = (u_xlatb21.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_65 = (u_xlatb21.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_3.x = (u_xlatb21.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_21.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_65 = u_xlat16_65 + u_xlat16_3.x;
    u_xlat16_3.x = _Cutoff + -1.0;
    u_xlat16_65 = u_xlat16_3.x * -1.5 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_65 + -1.20000005;
    u_xlat16_3.x = u_xlat16_65 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_65 = u_xlat16_65 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat16_3.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = (-u_xlat16_24.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_10.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_10.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlat16_3.x = (-u_xlat10_21.x) + u_xlat16_3.x;
    u_xlat16_24.xyz = u_xlat10_21.xxx * u_xlat16_24.xyz;
    SV_Target0.w = u_xlat16_3.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = _ScorchAtten * u_xlat16_3.x + u_xlat16_65;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_65) + u_xlat16_24.xyz;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat42.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat42.xy = fract(u_xlat42.xy);
    u_xlat42.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat42.xy;
    u_xlat16_65 = _SingleParallaxFactory.x * -2.0;
    u_xlat42.xy = vec2(u_xlat16_65) * u_xlat0.xy + u_xlat42.xy;
    u_xlat4.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat4.xy = u_xlat4.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_65) * u_xlat0.xy + u_xlat4.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_65 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_3.xy = vec2(u_xlat16_65) * vec2(_SingleParallaxWarp) + u_xlat42.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * _SingleParallaxColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat10_8.xxx + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_8.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(13) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(15) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat10_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat10_19;
bvec3 u_xlatb19;
float u_xlat20;
mediump float u_xlat16_20;
float u_xlat21;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
vec2 u_xlat38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat40;
vec2 u_xlat41;
mediump float u_xlat16_48;
float u_xlat58;
float u_xlat59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat10_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat10_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat10_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat10_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
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
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat21 * u_xlat21;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat21 * u_xlat16_10.x;
    u_xlat21 = (-u_xlat16_10.x) * u_xlat21 + 1.0;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat2.z = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.z = min(max(u_xlat2.z, 0.0), 1.0);
#else
    u_xlat2.z = clamp(u_xlat2.z, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xz = u_xlat2.zz * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat2.xz = u_xlat2.xz * u_xlat2.xz;
    u_xlat10_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat10_3.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat10_3.xyz * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _LaserColor.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_3.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_68 = u_xlat16_68 * u_xlat10_3.z;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat10_4.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat10_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat10_4.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat10_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat10_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_12.xyz;
    u_xlat21 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_29.xxx + u_xlat9.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat41.x = (-u_xlat58) * u_xlat16_29.x + u_xlat58;
    u_xlat41.x = u_xlat58 * u_xlat41.x + u_xlat16_29.x;
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat58 + u_xlat41.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat14.x) * u_xlat16_29.x + u_xlat14.x;
    u_xlat60 = u_xlat14.x * u_xlat60 + u_xlat16_29.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat41.y = u_xlat60 + u_xlat14.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat41.x = min(u_xlat41.x, 16.0);
    u_xlat4.x = u_xlat16_29.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat41.x * u_xlat2.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16_68 = u_xlat59 * u_xlat59;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_69 = u_xlat59 * u_xlat16_68;
    u_xlat2.x = (-u_xlat16_68) * u_xlat59 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat2.xxx;
    u_xlat15.xyz = vec3(u_xlat21) * vec3(u_xlat16_69) + u_xlat15.xyz;
    u_xlat2.x = u_xlat2.z * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat40) * u_xlat16_29.x + u_xlat40;
    u_xlat59 = u_xlat40 * u_xlat59 + u_xlat16_29.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat40;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat41.y;
    u_xlat2.w = float(1.0) / u_xlat59;
    u_xlat2.xw = min(u_xlat2.xw, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat40) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_18.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat16_63) + 1.0;
    u_xlat39 = u_xlat2.x * u_xlat2.x;
    u_xlat39 = u_xlat39 * u_xlat4.x + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_29.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat2.x = (-u_xlat1.x) * u_xlat16_29.x + u_xlat1.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x + u_xlat16_29.x;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat1.x + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat41.y;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat2.x;
    u_xlat16_63 = u_xlat20 * u_xlat20;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_68 = u_xlat20 * u_xlat16_63;
    u_xlat20 = (-u_xlat16_63) * u_xlat20 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat20);
    u_xlat2.xyw = vec3(u_xlat21) * vec3(u_xlat16_68) + u_xlat9.xyz;
    u_xlat2.xyw = vec3(u_xlat39) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat16_18.xyz * u_xlat2.xyw;
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat19.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat40) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
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
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_39;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat1.x * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_4.z, u_xlat16_10.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_63 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_63 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_19.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat38.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat38.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat38.xy;
    u_xlat10_1 = texture(_WarpTex, u_xlat38.xy).y;
    u_xlat16_63 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat38.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb19.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb19.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb19.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb19.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_63 = (u_xlatb19.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_10.x = (u_xlatb19.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_19.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_63 = u_xlat16_63 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_63 = u_xlat16_10.x * -1.5 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 + -1.20000005;
    u_xlat16_10.x = u_xlat16_63 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_63 = u_xlat16_63 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_29.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.xyz = u_xlat16_29.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_29.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_10.x = (-u_xlat10_19.x) + u_xlat16_10.x;
    u_xlat16_29.xyz = u_xlat10_19.xxx * u_xlat16_29.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = _ScorchAtten * u_xlat16_10.x + u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_63) + u_xlat16_29.xyz;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat38.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat38.xy = fract(u_xlat38.xy);
    u_xlat38.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat38.xy;
    u_xlat16_63 = _SingleParallaxFactory.x * -2.0;
    u_xlat38.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat38.xy;
    u_xlat41.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat41.x = fract(u_xlat41.x);
    u_xlat41.xy = u_xlat41.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat41.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_63 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(_SingleParallaxWarp) + u_xlat38.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_0.xyz * _SingleParallaxColor.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat10_3.xxx + u_xlat16_6.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = in_COLOR0;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _DissolveTex_ST;
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
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _SingleParallaxTex_ST;
uniform 	mediump vec4 _SingleParallaxColor;
uniform 	mediump vec4 _SingleParallaxFactory;
uniform 	mediump float _SingleParallaxWarp;
uniform 	mediump float _SingleParallaxWarpSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _SingleParallaxTex;
UNITY_LOCATION(13) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(15) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat10_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat10_19;
bvec3 u_xlatb19;
float u_xlat20;
mediump float u_xlat16_20;
float u_xlat21;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
vec2 u_xlat38;
int u_xlati38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat40;
vec2 u_xlat41;
mediump float u_xlat16_48;
float u_xlat58;
float u_xlat59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
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
    u_xlat10_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
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
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat10_19.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat10_19.z * _shadowStrength;
    u_xlat19.xy = u_xlat10_19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xy = min(max(u_xlat19.xy, 0.0), 1.0);
#else
    u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
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
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat21 * u_xlat21;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat21 * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat21 * u_xlat16_10.x;
    u_xlat21 = (-u_xlat16_10.x) * u_xlat21 + 1.0;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat2.z = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.z = min(max(u_xlat2.z, 0.0), 1.0);
#else
    u_xlat2.z = clamp(u_xlat2.z, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xz = u_xlat2.zz * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat2.xz = u_xlat2.xz * u_xlat2.xz;
    u_xlat10_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat10_3.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat10_3.xyz * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_10.xzw * _LaserColor.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat10_3.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).yzw;
    u_xlat16_68 = u_xlat16_68 * u_xlat10_3.z;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat10_4.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat10_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat10_4.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat10_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat10_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_12.xyz;
    u_xlat21 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat16_29.xxx + u_xlat9.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat41.x = (-u_xlat58) * u_xlat16_29.x + u_xlat58;
    u_xlat41.x = u_xlat58 * u_xlat41.x + u_xlat16_29.x;
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat58 + u_xlat41.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat14.x) * u_xlat16_29.x + u_xlat14.x;
    u_xlat60 = u_xlat14.x * u_xlat60 + u_xlat16_29.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat41.y = u_xlat60 + u_xlat14.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat41.x = min(u_xlat41.x, 16.0);
    u_xlat4.x = u_xlat16_29.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat41.x * u_xlat2.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_11.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat16_68 = u_xlat59 * u_xlat59;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_68 = u_xlat59 * u_xlat16_68;
    u_xlat16_69 = u_xlat59 * u_xlat16_68;
    u_xlat2.x = (-u_xlat16_68) * u_xlat59 + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat2.xxx;
    u_xlat15.xyz = vec3(u_xlat21) * vec3(u_xlat16_69) + u_xlat15.xyz;
    u_xlat2.x = u_xlat2.z * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_29.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat59 = (-u_xlat40) * u_xlat16_29.x + u_xlat40;
    u_xlat59 = u_xlat40 * u_xlat59 + u_xlat16_29.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat40;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat41.y;
    u_xlat2.w = float(1.0) / u_xlat59;
    u_xlat2.xw = min(u_xlat2.xw, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat40) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_18.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat16_63) + 1.0;
    u_xlat39 = u_xlat2.x * u_xlat2.x;
    u_xlat39 = u_xlat39 * u_xlat4.x + 1.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat16_29.x / u_xlat39;
    u_xlat39 = u_xlat39 * 0.318309873;
    u_xlat39 = min(u_xlat39, 16.0);
    u_xlat2.x = (-u_xlat1.x) * u_xlat16_29.x + u_xlat1.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x + u_xlat16_29.x;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat1.x + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat41.y;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat39 = u_xlat39 * u_xlat2.x;
    u_xlat16_63 = u_xlat20 * u_xlat20;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_63 = u_xlat20 * u_xlat16_63;
    u_xlat16_68 = u_xlat20 * u_xlat16_63;
    u_xlat20 = (-u_xlat16_63) * u_xlat20 + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat20);
    u_xlat2.xyw = vec3(u_xlat21) * vec3(u_xlat16_68) + u_xlat9.xyz;
    u_xlat2.xyw = vec3(u_xlat39) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat16_18.xyz * u_xlat2.xyw;
    u_xlat16_16.xyz = u_xlat2.xyw * u_xlat19.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat58) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat40) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
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
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_39) + u_xlat16_20;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_39;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat1.x * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_4.z, u_xlat16_10.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_63 = vs_TEXCOORD5.w * _emissiveBreathe.y;
    u_xlat0.x = u_xlat16_63 * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = max(abs(u_xlat0.x), _emissiveBreathe.z);
    u_xlat10_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_19.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xy = _DissolveDirSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat38.xy = u_xlat0.xy + _WarpTex_ST.zw;
    u_xlat38.xy = vs_TEXCOORD3.zw * _WarpTex_ST.xy + u_xlat38.xy;
    u_xlat10_1 = texture(_WarpTex, u_xlat38.xy).y;
    u_xlat16_63 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(vec2(_DissolveWarp, _DissolveWarp)) + u_xlat38.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat10_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb19.xyz = greaterThanEqual(vec4(_UseMask2U, _UseDissolve2U, _UseVertical, _UseVertical), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.y = (u_xlatb19.x) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_1.z = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.x;
    u_xlat16_1.w = (u_xlatb19.y) ? float(0.0) : vs_TEXCOORD3.y;
    u_xlat16_2.x = (u_xlatb19.x) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.y = (u_xlatb19.x) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_2.z = (u_xlatb19.y) ? vs_TEXCOORD3.z : float(0.0);
    u_xlat16_2.w = (u_xlatb19.y) ? vs_TEXCOORD3.w : float(0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_2;
    u_xlat16_63 = (u_xlatb19.z) ? 0.0 : u_xlat16_1.z;
    u_xlat16_10.x = (u_xlatb19.z) ? u_xlat16_1.w : 0.0;
    u_xlat10_19.x = texture(_MaskTex, u_xlat16_1.xy).x;
    u_xlat16_63 = u_xlat16_63 + u_xlat16_10.x;
    u_xlat16_10.x = _Cutoff + -1.0;
    u_xlat16_63 = u_xlat16_10.x * -1.5 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 + -1.20000005;
    u_xlat16_10.x = u_xlat16_63 * _DissolveShrink + u_xlat10_0.x;
    u_xlat16_63 = u_xlat16_63 * _ScorchShrink + u_xlat10_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(u_xlat16_10.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_10.x = u_xlat16_10.x + -0.100000001;
    u_xlat16_10.x = u_xlat16_10.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_29.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.xyz = u_xlat16_29.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_12.x;
    u_xlat16_10.x = min(u_xlat16_10.x, 1.0);
    u_xlat16_29.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_10.x = (-u_xlat10_19.x) + u_xlat16_10.x;
    u_xlat16_29.xyz = u_xlat10_19.xxx * u_xlat16_29.xyz;
    SV_Target0.w = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = _ScorchAtten * u_xlat16_10.x + u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_63) + u_xlat16_29.xyz;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat38.xy = _Time.yy * _SingleParallaxFactory.yz + _SingleParallaxTex_ST.zw;
    u_xlat38.xy = fract(u_xlat38.xy);
    u_xlat38.xy = vs_TEXCOORD3.xy * _SingleParallaxTex_ST.xy + u_xlat38.xy;
    u_xlat16_63 = _SingleParallaxFactory.x * -2.0;
    u_xlat38.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat38.xy;
    u_xlat41.x = _SingleParallaxWarpSpeed * _Time.y;
    u_xlat41.x = fract(u_xlat41.x);
    u_xlat41.xy = u_xlat41.xx + _WarpTex_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_63) * u_xlat0.xy + u_xlat41.xy;
    u_xlat0.xy = vs_TEXCOORD3.xy * _WarpTex_ST.xy + u_xlat0.xy;
    u_xlat10_0.x = texture(_WarpTex, u_xlat0.xy).x;
    u_xlat16_63 = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat16_10.xy = vec2(u_xlat16_63) * vec2(_SingleParallaxWarp) + u_xlat38.xy;
    u_xlat10_0.xyz = texture(_SingleParallaxTex, u_xlat16_10.xy).xyz;
    u_xlat16_10.xyz = u_xlat10_0.xyz * _SingleParallaxColor.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat10_3.xxx + u_xlat16_6.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat10_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
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
  GpuProgramID 65977
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_FireDissolve_SingleParallaxGUI"
}