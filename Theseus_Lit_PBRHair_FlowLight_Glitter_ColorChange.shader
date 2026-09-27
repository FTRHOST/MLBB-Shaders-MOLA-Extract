//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Hair)_FlowLight_Glitter_ColorChange" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_Cutoff ("cut off", Range(0, 1)) = 0.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_AlbedoTex ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

_AlphaClipPower ("alpha Clip Power", Range(0.001, 3)) = 1.0

_AlphaBlendPower ("alpha Blend Power", Range(0.001, 3)) = 1.0

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_MaskTex ("遮罩贴图", 2D) = "white" { }

_GlitterTex ("闪点贴图", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,1,1,1)

_AlbedoChangTex ("换色后Albedo贴图", 2D) = "white" { }

_AlbedoChangColor ("换色后Albedo颜色", Color) = (1,1,1,1)

_ChangColorDissolveTex ("换色边缘扰动贴图", 2D) = "white" { }

_UpChangEdgeColor ("上层换色边缘颜色", Color) = (1,1,1,1)

_UpChangColorShrink ("上层换色边缘压缩", Float) = 4.0

_UpChangColorRange ("上层换色边缘范围", Float) = 1.0

_ChangEdgeColor ("下层换色边缘颜色", Color) = (1,1,1,1)

_ChangColorShrink ("下层换色边缘压缩", Float) = 4.0

_ChangColorRange ("下层换色边缘范围", Float) = 1.0

_ChangColorAmount ("换色进度", Range(0, 1)) = 1.0

_AnisotropicTex ("各向异性扰动贴图", 2D) = "white" { }

[Toggle] _AnisoUse2U ("各向异性使用2U", Float) = 0.0

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
 Pass {
 Name "PBR Hair (PrePass AlphaClip)"
  Tags { "LIGHTMODE" = "FORWARDBASE" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 15320
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
ivec3 u_xlati22;
bool u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_26;
float u_xlat27;
vec3 u_xlat28;
float u_xlat33;
vec3 u_xlat35;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat45;
mediump float u_xlat16_48;
mediump vec2 u_xlat16_56;
float u_xlat66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb66 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb66){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_68 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = u_xlat16_68 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_69 = u_xlat16_68 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_68 = u_xlat16_68 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_69 + -0.100000001;
    u_xlat16_69 = dot(vec2(u_xlat16_69), vec2(_ChangColorRange));
    u_xlat16_69 = u_xlat16_69 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = (-u_xlat16_69) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_69) * _ChangEdgeColor.zxy;
    u_xlat16_69 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_69 * -2.0 + 3.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_69 = min(u_xlat16_69, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_69) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_69) * u_xlat16_26.xyz;
    u_xlat16_4.x = u_xlat16_68 + -0.100000001;
    u_xlat16_68 = dot(vec2(u_xlat16_68), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_68 = u_xlat16_68 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = (-u_xlat16_68) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_68) * _UpChangEdgeColor.zxy;
    u_xlat16_68 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_68 * -2.0 + 3.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_3.xyz = u_xlat16_26.xyz * vec3(u_xlat16_68) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_68 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_68) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat22.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat1.xyz = vec3(u_xlat67) * u_xlat1.xyz;
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat67;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.x = (-u_xlat16_26.x) * u_xlat67 + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_26.xxx + u_xlat5.xyz;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_26.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat71 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat71 = u_xlat71 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat28.x = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat16_26.xyz * u_xlat28.xxx;
    u_xlat8.xyz = u_xlat28.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat28.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat28.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_26.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat28.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_26.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat28.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_26.xyz, u_xlat8.xyz);
    u_xlat73 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat7.xyz;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat8.xyz);
    u_xlat28.xyz = (-u_xlat8.yzx) * vec3(u_xlat74) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat74);
    u_xlat9.xyz = u_xlat28.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat28.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_26.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_68));
    u_xlat16_48 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_48 = max(u_xlat16_48, 0.0078125);
    u_xlat6 = u_xlat16_26.x * u_xlat16_48;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat74 = (-u_xlat16_26.x) + 1.0;
    u_xlat74 = u_xlat16_48 * u_xlat74;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat11.y = u_xlat71 * u_xlat6;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat74 * u_xlat6;
    u_xlat11.z = u_xlat71 * u_xlat75;
    u_xlat16_26.x = dot(u_xlat28.zxy, u_xlat1.xyz);
    u_xlat11.x = u_xlat16_26.x * u_xlat74;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat75 / u_xlat76;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.z = u_xlat74 * u_xlat76;
    u_xlat16_70 = dot(u_xlat28.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.y = u_xlat16_70 * u_xlat6;
    u_xlat11.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat11.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat22.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat74 * u_xlat10.x;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat16_12.xyz);
    u_xlat10.y = u_xlat6 * u_xlat74;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat76 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat75 * u_xlat6;
    u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_14.xyz;
    u_xlat13.xyz = u_xlat11.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat67) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat15.xyz = vec3(u_xlat6) * u_xlat15.xyz;
    u_xlat6 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_78 = u_xlat16_69 + -1.0;
    u_xlat75 = u_xlat16_69 * u_xlat16_48;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat76 = (-u_xlat16_78) + 1.0;
    u_xlat77 = u_xlat16_48 * u_xlat76;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat11.z = u_xlat6 * u_xlat77;
    u_xlat11.y = u_xlat16_70 * u_xlat75;
    u_xlat6 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat11.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat33 = dot(u_xlat15.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat33 * u_xlat77;
    u_xlat10.y = u_xlat74 * u_xlat75;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat10.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat6 = u_xlat74 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat75;
    u_xlat1.x = u_xlat16_26.x * u_xlat77;
    u_xlat33 = u_xlat75 * u_xlat77;
    u_xlat1.z = u_xlat71 * u_xlat33;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat23.x = u_xlat33 * 0.318309873;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_14.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat11.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat13.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_26.zzz + u_xlat16_17.xyz;
    u_xlat13.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat1.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat13.xyz = u_xlat1.xxx * u_xlat13.xyz;
    u_xlat16_70 = dot(u_xlat16_16.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat1.x;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat45 = (-u_xlat16_70) * u_xlat1.x + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat18.xyz = u_xlat16_3.xyz * vec3(u_xlat45);
    u_xlat18.xyz = u_xlat0.xxx * vec3(u_xlat16_70) + u_xlat18.xyz;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat13.xyz);
    u_xlat19.y = u_xlat1.x * u_xlat75;
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat1.x * u_xlat33;
    u_xlat19.x = u_xlat16_70 * u_xlat77;
    u_xlat1.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat45 = dot(u_xlat15.xyz, u_xlat16_16.xyz);
    u_xlat13.z = u_xlat45 * u_xlat77;
    u_xlat13.x = dot(u_xlat8.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat16_16.xyz);
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat13.y = u_xlat16_70 * u_xlat75;
    u_xlat45 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat13.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat45 = u_xlat74 * u_xlat45 + 6.10351563e-05;
    u_xlat45 = float(1.0) / u_xlat45;
    u_xlat1.x = u_xlat45 * u_xlat1.x;
    u_xlat35.xyz = u_xlat18.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat16_14.xyz * u_xlat35.xyz;
    u_xlat35.xyz = u_xlat13.xxx * u_xlat35.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_80);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_26.x;
    u_xlat16_16.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat35.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_20.xyz = u_xlat16_26.xxx * u_xlat5.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_26.zzz + u_xlat16_21.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_20.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(u_xlat16_20.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat5.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat27 = (-u_xlat16_4.x) * u_xlat5.x + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat27);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_4.xxx + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat15.xyz, u_xlat22.xyz);
    u_xlat71 = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat15.z = u_xlat71 * u_xlat77;
    u_xlat18.y = u_xlat0.x * u_xlat75;
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat22.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat0.x * u_xlat33;
    u_xlat18.x = u_xlat16_4.x * u_xlat77;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat33 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat23.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat16_20.xyz);
    u_xlat15.y = u_xlat16_4.x * u_xlat75;
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat22.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat15.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = u_xlat74 * u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat0.x = u_xlat22.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_14.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_26.x, u_xlat16_4.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_4.xyw = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_17.xyz;
    u_xlat16_69 = (-u_xlat16_68) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_69);
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat16_2.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyw = u_xlat1.zzz * u_xlat16_4.xyw;
    u_xlat16_17.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat13.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat11.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat15.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_17.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_17.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_69) + u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80 + u_xlat16_69;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 + -1.0;
    u_xlat16_82 = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat0.x = min(u_xlat16_80, 1.0);
    u_xlat22.x = min(u_xlat0.x, u_xlat16_68);
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat22.xxx + (-u_xlat16_21.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat22.xxx + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlat16_21.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati22.x = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati44 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati22.x].xyz + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_4.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyw = u_xlat16_4.xxx * vs_TEXCOORD1.yzx;
    u_xlat22.xyz = vec3(u_xlat67) * u_xlat16_4.xyw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb1)) ? u_xlat22.xyz : u_xlat28.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat22.xyz;
    u_xlat1.xyz = u_xlat22.zxy * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat22.xyz * u_xlat1.xyz;
    u_xlat22.xyz = u_xlat1.zxy * u_xlat22.yzx + (-u_xlat5.xyz);
    u_xlat22.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + u_xlat22.xyz;
    u_xlat16_4.x = u_xlat16_48 * 8.0;
    u_xlat16_26.x = u_xlat16_48 * u_xlat16_48;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_78);
    u_xlat22.xyz = u_xlat16_4.xxx * u_xlat22.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat23.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat23.xyz = u_xlat7.xyz * vec3(u_xlat73) + (-u_xlat22.xyz);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat5.xyz = u_xlat22.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = abs(vec3(u_xlat16_78)) * u_xlat5.xyz + u_xlat23.xyz;
    u_xlat16_4.x = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat22.x = dot(u_xlat16_17.xyz, u_xlat22.xyz);
    u_xlat16_42.y = u_xlat22.x * 0.5;
    u_xlat16_26.x = dot(_IndirectCubemapRotationParams.xy, u_xlat23.xz);
    u_xlat23.z = dot(_IndirectCubemapRotationParams.zw, u_xlat23.xz);
    u_xlat23.x = u_xlat16_26.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat23.xyz, u_xlat16_4.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat22.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb22)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.y = u_xlat16_68;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_42.x = u_xlat10.y * 1.09769487;
    u_xlat16_16.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_16.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_68 = floor(u_xlat16_3.w);
    u_xlat16_78 = u_xlat16_68 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_3.x = u_xlat16_78 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_3.x = u_xlat16_68 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_68 = u_xlat16_16.z * 15.0 + (-u_xlat16_68);
    u_xlat16_78 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_78 + u_xlat16_44;
    u_xlat16_68 = u_xlat16_82 * u_xlat16_68;
    u_xlat22.x = u_xlat1.x * u_xlat16_68;
    u_xlat16_68 = u_xlat0.x * 0.5;
    u_xlat16_78 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_68 = u_xlat22.x * u_xlat16_78 + u_xlat16_68;
    u_xlat16_78 = u_xlat16_68 + u_xlat16_68;
    u_xlat16_80 = (-u_xlat16_68) * 2.0 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_80 + u_xlat16_78;
    u_xlat16_68 = u_xlat0.x * u_xlat16_68;
    u_xlat16_68 = min(u_xlat16_68, u_xlat10.y);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_14.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_14.xyz, u_xlat16_12.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_68 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_68);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_GlitterIntensity);
    u_xlat16_12.xyz = log2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_12.xyz = exp2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = min(u_xlat16_12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_12.xyz = u_xlat16_12.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_68 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat16_68) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_12.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_56.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_12.xy = u_xlat16_56.xy + u_xlat16_12.xy;
    u_xlat16_12.xy = u_xlat16_12.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_12.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_68 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_12.xyz = vec3(u_xlat16_68) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat66 * 0.0625 + u_xlat1.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_22.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
ivec3 u_xlati22;
bool u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_26;
float u_xlat27;
vec3 u_xlat28;
float u_xlat33;
vec3 u_xlat35;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat45;
mediump float u_xlat16_48;
mediump vec2 u_xlat16_56;
float u_xlat66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb66 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb66){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_68 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = u_xlat16_68 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_69 = u_xlat16_68 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_68 = u_xlat16_68 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_69 + -0.100000001;
    u_xlat16_69 = dot(vec2(u_xlat16_69), vec2(_ChangColorRange));
    u_xlat16_69 = u_xlat16_69 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = (-u_xlat16_69) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_69) * _ChangEdgeColor.zxy;
    u_xlat16_69 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_69 * -2.0 + 3.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_69 = min(u_xlat16_69, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_69) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_69) * u_xlat16_26.xyz;
    u_xlat16_4.x = u_xlat16_68 + -0.100000001;
    u_xlat16_68 = dot(vec2(u_xlat16_68), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_68 = u_xlat16_68 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = (-u_xlat16_68) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_68) * _UpChangEdgeColor.zxy;
    u_xlat16_68 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_68 * -2.0 + 3.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_3.xyz = u_xlat16_26.xyz * vec3(u_xlat16_68) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_68 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_68) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat22.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat1.xyz = vec3(u_xlat67) * u_xlat1.xyz;
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat67;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.x = (-u_xlat16_26.x) * u_xlat67 + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_26.xxx + u_xlat5.xyz;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_26.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat71 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat71 = u_xlat71 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat28.x = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat16_26.xyz * u_xlat28.xxx;
    u_xlat8.xyz = u_xlat28.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat28.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat28.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_26.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat28.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_26.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat28.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_26.xyz, u_xlat8.xyz);
    u_xlat73 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat7.xyz;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat8.xyz);
    u_xlat28.xyz = (-u_xlat8.yzx) * vec3(u_xlat74) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat74);
    u_xlat9.xyz = u_xlat28.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat28.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_26.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_68));
    u_xlat16_48 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_48 = max(u_xlat16_48, 0.0078125);
    u_xlat6 = u_xlat16_26.x * u_xlat16_48;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat74 = (-u_xlat16_26.x) + 1.0;
    u_xlat74 = u_xlat16_48 * u_xlat74;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat11.y = u_xlat71 * u_xlat6;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat74 * u_xlat6;
    u_xlat11.z = u_xlat71 * u_xlat75;
    u_xlat16_26.x = dot(u_xlat28.zxy, u_xlat1.xyz);
    u_xlat11.x = u_xlat16_26.x * u_xlat74;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat75 / u_xlat76;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.z = u_xlat74 * u_xlat76;
    u_xlat16_70 = dot(u_xlat28.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.y = u_xlat16_70 * u_xlat6;
    u_xlat11.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat11.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat22.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat74 * u_xlat10.x;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat16_12.xyz);
    u_xlat10.y = u_xlat6 * u_xlat74;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat76 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat75 * u_xlat6;
    u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_14.xyz;
    u_xlat13.xyz = u_xlat11.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat67) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat15.xyz = vec3(u_xlat6) * u_xlat15.xyz;
    u_xlat6 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_78 = u_xlat16_69 + -1.0;
    u_xlat75 = u_xlat16_69 * u_xlat16_48;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat76 = (-u_xlat16_78) + 1.0;
    u_xlat77 = u_xlat16_48 * u_xlat76;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat11.z = u_xlat6 * u_xlat77;
    u_xlat11.y = u_xlat16_70 * u_xlat75;
    u_xlat6 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat11.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat33 = dot(u_xlat15.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat33 * u_xlat77;
    u_xlat10.y = u_xlat74 * u_xlat75;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat10.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat6 = u_xlat74 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat75;
    u_xlat1.x = u_xlat16_26.x * u_xlat77;
    u_xlat33 = u_xlat75 * u_xlat77;
    u_xlat1.z = u_xlat71 * u_xlat33;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat23.x = u_xlat33 * 0.318309873;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_14.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat11.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat13.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_26.zzz + u_xlat16_17.xyz;
    u_xlat13.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat1.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat13.xyz = u_xlat1.xxx * u_xlat13.xyz;
    u_xlat16_70 = dot(u_xlat16_16.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat1.x;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat45 = (-u_xlat16_70) * u_xlat1.x + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat18.xyz = u_xlat16_3.xyz * vec3(u_xlat45);
    u_xlat18.xyz = u_xlat0.xxx * vec3(u_xlat16_70) + u_xlat18.xyz;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat13.xyz);
    u_xlat19.y = u_xlat1.x * u_xlat75;
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat1.x * u_xlat33;
    u_xlat19.x = u_xlat16_70 * u_xlat77;
    u_xlat1.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat45 = dot(u_xlat15.xyz, u_xlat16_16.xyz);
    u_xlat13.z = u_xlat45 * u_xlat77;
    u_xlat13.x = dot(u_xlat8.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat16_16.xyz);
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat13.y = u_xlat16_70 * u_xlat75;
    u_xlat45 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat13.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat45 = u_xlat74 * u_xlat45 + 6.10351563e-05;
    u_xlat45 = float(1.0) / u_xlat45;
    u_xlat1.x = u_xlat45 * u_xlat1.x;
    u_xlat35.xyz = u_xlat18.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat16_14.xyz * u_xlat35.xyz;
    u_xlat35.xyz = u_xlat13.xxx * u_xlat35.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_80);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_26.x;
    u_xlat16_16.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat35.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_20.xyz = u_xlat16_26.xxx * u_xlat5.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_26.zzz + u_xlat16_21.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_20.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(u_xlat16_20.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat5.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat27 = (-u_xlat16_4.x) * u_xlat5.x + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat27);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_4.xxx + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat15.xyz, u_xlat22.xyz);
    u_xlat71 = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat15.z = u_xlat71 * u_xlat77;
    u_xlat18.y = u_xlat0.x * u_xlat75;
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat22.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat0.x * u_xlat33;
    u_xlat18.x = u_xlat16_4.x * u_xlat77;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat33 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat23.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat16_20.xyz);
    u_xlat15.y = u_xlat16_4.x * u_xlat75;
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat22.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat15.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = u_xlat74 * u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat0.x = u_xlat22.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_14.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_26.x, u_xlat16_4.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_4.xyw = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_17.xyz;
    u_xlat16_69 = (-u_xlat16_68) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_69);
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat16_2.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyw = u_xlat1.zzz * u_xlat16_4.xyw;
    u_xlat16_17.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat13.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat11.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat15.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_17.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_17.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_69) + u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80 + u_xlat16_69;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 + -1.0;
    u_xlat16_82 = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat0.x = min(u_xlat16_80, 1.0);
    u_xlat22.x = min(u_xlat0.x, u_xlat16_68);
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat22.xxx + (-u_xlat16_21.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat22.xxx + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlat16_21.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati22.x = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati44 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati22.x].xyz + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_4.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyw = u_xlat16_4.xxx * vs_TEXCOORD1.yzx;
    u_xlat22.xyz = vec3(u_xlat67) * u_xlat16_4.xyw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb1)) ? u_xlat22.xyz : u_xlat28.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat22.xyz;
    u_xlat1.xyz = u_xlat22.zxy * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat22.xyz * u_xlat1.xyz;
    u_xlat22.xyz = u_xlat1.zxy * u_xlat22.yzx + (-u_xlat5.xyz);
    u_xlat22.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + u_xlat22.xyz;
    u_xlat16_4.x = u_xlat16_48 * 8.0;
    u_xlat16_26.x = u_xlat16_48 * u_xlat16_48;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_78);
    u_xlat22.xyz = u_xlat16_4.xxx * u_xlat22.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat23.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat23.xyz = u_xlat7.xyz * vec3(u_xlat73) + (-u_xlat22.xyz);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat5.xyz = u_xlat22.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = abs(vec3(u_xlat16_78)) * u_xlat5.xyz + u_xlat23.xyz;
    u_xlat16_4.x = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat22.x = dot(u_xlat16_17.xyz, u_xlat22.xyz);
    u_xlat16_42.y = u_xlat22.x * 0.5;
    u_xlat16_26.x = dot(_IndirectCubemapRotationParams.xy, u_xlat23.xz);
    u_xlat23.z = dot(_IndirectCubemapRotationParams.zw, u_xlat23.xz);
    u_xlat23.x = u_xlat16_26.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat23.xyz, u_xlat16_4.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat22.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb22)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.y = u_xlat16_68;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_42.x = u_xlat10.y * 1.09769487;
    u_xlat16_16.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_16.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_68 = floor(u_xlat16_3.w);
    u_xlat16_78 = u_xlat16_68 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_3.x = u_xlat16_78 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_3.x = u_xlat16_68 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_68 = u_xlat16_16.z * 15.0 + (-u_xlat16_68);
    u_xlat16_78 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_78 + u_xlat16_44;
    u_xlat16_68 = u_xlat16_82 * u_xlat16_68;
    u_xlat22.x = u_xlat1.x * u_xlat16_68;
    u_xlat16_68 = u_xlat0.x * 0.5;
    u_xlat16_78 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_68 = u_xlat22.x * u_xlat16_78 + u_xlat16_68;
    u_xlat16_78 = u_xlat16_68 + u_xlat16_68;
    u_xlat16_80 = (-u_xlat16_68) * 2.0 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_80 + u_xlat16_78;
    u_xlat16_68 = u_xlat0.x * u_xlat16_68;
    u_xlat16_68 = min(u_xlat16_68, u_xlat10.y);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_14.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_14.xyz, u_xlat16_12.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_68 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_68);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_GlitterIntensity);
    u_xlat16_12.xyz = log2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_12.xyz = exp2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = min(u_xlat16_12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_12.xyz = u_xlat16_12.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_68 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat16_68) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_12.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_56.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_12.xy = u_xlat16_56.xy + u_xlat16_12.xy;
    u_xlat16_12.xy = u_xlat16_12.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_12.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_68 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_12.xyz = vec3(u_xlat16_68) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat66 * 0.0625 + u_xlat1.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_22.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(16) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.zxy;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.zxy;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.zxy;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.zxy;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat75 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(16) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.zxy;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.zxy;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.zxy;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.zxy;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat75 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
ivec3 u_xlati24;
bool u_xlatb24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
float u_xlat29;
vec3 u_xlat30;
mediump vec2 u_xlat16_35;
vec3 u_xlat36;
mediump vec3 u_xlat16_46;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat58;
mediump float u_xlat16_59;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
float u_xlat77;
float u_xlat79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb72 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb72){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_74 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = u_xlat16_74 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_75 = u_xlat16_74 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_74 = u_xlat16_74 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_75 + -0.100000001;
    u_xlat16_75 = dot(vec2(u_xlat16_75), vec2(_ChangColorRange));
    u_xlat16_75 = u_xlat16_75 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = (-u_xlat16_75) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_75) * _ChangEdgeColor.xyz;
    u_xlat16_75 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_75 * -2.0 + 3.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_4.x;
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_75) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_75) * u_xlat16_28.xyz;
    u_xlat16_4.x = u_xlat16_74 + -0.100000001;
    u_xlat16_74 = dot(vec2(u_xlat16_74), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_74 = u_xlat16_74 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = (-u_xlat16_74) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_74) * _UpChangEdgeColor.xyz;
    u_xlat16_74 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_74 * -2.0 + 3.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_4.x;
    u_xlat16_74 = min(u_xlat16_74, 1.0);
    u_xlat16_3.xyz = u_xlat16_28.xyz * vec3(u_xlat16_74) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_74 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat24.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xyz = vec3(u_xlat73) * u_xlat1.xyz;
    u_xlat16_28.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat73;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.x = (-u_xlat16_28.x) * u_xlat73 + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_28.xxx + u_xlat5.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat77 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat77 = u_xlat77 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_28.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_28.xxx + vs_TEXCOORD2.yzx;
    u_xlat30.x = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat30.x = max(u_xlat30.x, 1.17549435e-38);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat30.xyz = u_xlat16_28.xyz * u_xlat30.xxx;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat30.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_28.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat30.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat30.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat79 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat8.xyz = vec3(u_xlat79) * u_xlat7.xyz;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat80) + u_xlat30.xyz;
    u_xlat80 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat80);
    u_xlat9.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_28.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_74));
    u_xlat16_52 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_11.x = max(u_xlat16_52, 0.0078125);
    u_xlat6 = u_xlat16_28.x * u_xlat16_11.x;
    u_xlat16_35.x = u_xlat16_28.x + -1.0;
    u_xlat80 = (-u_xlat16_35.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_11.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat12.y = u_xlat77 * u_xlat6;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat80 * u_xlat6;
    u_xlat12.z = u_xlat77 * u_xlat81;
    u_xlat16_35.x = dot(u_xlat30.zxy, u_xlat1.xyz);
    u_xlat12.x = u_xlat80 * u_xlat16_35.x;
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat80 * u_xlat82;
    u_xlat16_59 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat6 * u_xlat16_59;
    u_xlat12.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat12.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat24.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat80 * u_xlat10.x;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat16_13.xyz);
    u_xlat10.y = u_xlat6 * u_xlat80;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat82 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat81 * u_xlat6;
    u_xlat14.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat73) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat17.xyz = vec3(u_xlat6) * u_xlat16.xyz;
    u_xlat6 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_75 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_74));
    u_xlat16_83 = u_xlat16_75 + -1.0;
    u_xlat81 = u_xlat16_75 * u_xlat16_11.x;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat82 = (-u_xlat16_83) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_11.x;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat12.z = u_xlat6 * u_xlat82;
    u_xlat12.y = u_xlat16_59 * u_xlat81;
    u_xlat6 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat12.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat36.x = dot(u_xlat17.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat82 * u_xlat36.x;
    u_xlat10.y = u_xlat80 * u_xlat81;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat6 = u_xlat80 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat81;
    u_xlat1.x = u_xlat16_35.x * u_xlat82;
    u_xlat58 = u_xlat81 * u_xlat82;
    u_xlat1.z = u_xlat77 * u_xlat58;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat25.x = u_xlat58 * 0.318309873;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_15.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat36.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_75 = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = u_xlat16_35.xxx * u_xlat36.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.yyy + u_xlat16_19.xyz;
    u_xlat36.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_18.xyz;
    u_xlat1.x = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat36.xyz = u_xlat1.xxx * u_xlat36.xyz;
    u_xlat16_59 = dot(u_xlat16_18.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat1.x;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat49 = (-u_xlat16_59) * u_xlat1.x + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat14.xyz = u_xlat16_3.xyz * vec3(u_xlat49);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat14.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat36.xyz);
    u_xlat20.y = u_xlat1.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat36.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20.z = u_xlat1.x * u_xlat58;
    u_xlat20.x = u_xlat82 * u_xlat16_59;
    u_xlat1.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat49 = dot(u_xlat17.xyz, u_xlat16_18.xyz);
    u_xlat20.z = u_xlat49 * u_xlat82;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_18.xyz);
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat20.y = u_xlat81 * u_xlat16_59;
    u_xlat49 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat49 + u_xlat20.x;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat80 * u_xlat49 + 6.10351563e-05;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat1.x = u_xlat49 * u_xlat1.x;
    u_xlat36.xyz = u_xlat14.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_15.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat20.xxx * u_xlat36.xyz;
    u_xlat16_59 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_59 = (-u_xlat16_59) * u_xlat16_59 + 1.0;
    u_xlat16_59 = max(u_xlat16_59, 0.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_59;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_35.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_85);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_18.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat36.xyz = u_xlat36.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat36.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_35.yyy + u_xlat16_22.xyz;
    u_xlat24.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_21.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat16_59 = dot(u_xlat16_21.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat5.x;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat29 = (-u_xlat16_59) * u_xlat5.x + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat29);
    u_xlat5.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat24.xyz);
    u_xlat77 = dot(u_xlat17.xyz, u_xlat16_21.xyz);
    u_xlat14.z = u_xlat77 * u_xlat82;
    u_xlat17.y = u_xlat0.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat24.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat0.x * u_xlat58;
    u_xlat17.x = u_xlat82 * u_xlat16_59;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat58 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_21.xyz);
    u_xlat14.y = u_xlat81 * u_xlat16_59;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_59 = u_xlat16_59 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat24.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat14.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat80 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_15.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat14.xxx * u_xlat0.xyz;
    u_xlat16_85 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_85;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_59);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_19.xyz;
    u_xlat16_75 = (-u_xlat16_74) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_75);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.zzz * u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat12.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_21.xyz + u_xlat8.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = vec3(u_xlat16_75) * u_xlat16_21.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_75) + u_xlat16_35.x;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_35.x + u_xlat16_75;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_75;
    u_xlat16_35.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x + -1.0;
    u_xlat16_35.x = _OcclusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat0.x = min(u_xlat16_75, 1.0);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_74);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_23.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_19.y = u_xlat16_21.y;
    u_xlat16_23.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = u_xlat16_35.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_19.xyw;
    u_xlat16_23.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_59 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_15.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.yzx;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat24.xyz = (bool(u_xlatb1)) ? u_xlat24.xyz : u_xlat30.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * u_xlat24.xyz;
    u_xlat1.xyz = u_xlat24.zxy * u_xlat16_13.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat24.xyz * u_xlat1.xyz;
    u_xlat24.xyz = u_xlat1.zxy * u_xlat24.yzx + (-u_xlat5.xyz);
    u_xlat24.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + u_xlat24.xyz;
    u_xlat16_59 = u_xlat16_11.x * 8.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0078125);
    u_xlat16_59 = min(u_xlat16_59, 1.0);
    u_xlat16_59 = u_xlat16_59 * abs(u_xlat16_83);
    u_xlat24.xyz = vec3(u_xlat16_59) * u_xlat24.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat25.xxx;
    u_xlat16_59 = dot((-u_xlat16_13.xyz), u_xlat24.xyz);
    u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
    u_xlat24.xyz = (-u_xlat24.xyz) * vec3(u_xlat16_59) + (-u_xlat16_13.xyz);
    u_xlat25.xyz = u_xlat7.xyz * vec3(u_xlat79) + (-u_xlat24.xyz);
    u_xlat25.xyz = u_xlat16_11.xxx * u_xlat25.xyz + u_xlat24.xyz;
    u_xlat5.xyz = u_xlat24.xyz + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat5.xyz + u_xlat25.xyz;
    u_xlat16_11.x = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_74 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat24.x = dot(u_xlat16_21.xyz, u_xlat24.xyz);
    u_xlat16_46.y = u_xlat24.x * 0.5;
    u_xlat16_59 = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_59;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat24.xyz = u_xlat16_11.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xzw = u_xlat24.xyz * u_xlat24.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_11.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb24 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb24)) ? u_xlat16_15.xyz : u_xlat16_11.xzw;
    u_xlat10.y = u_xlat16_74;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat16_3.xyz = u_xlat16_11.xzw * u_xlat16_3.xyz;
    u_xlat16_46.x = u_xlat10.y * 1.09769487;
    u_xlat16_11.xzw = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_4.w);
    u_xlat16_75 = u_xlat16_74 + 1.0;
    u_xlat16_75 = min(u_xlat16_75, 15.0);
    u_xlat16_4.x = u_xlat16_75 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_4.x = u_xlat16_74 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_74 = u_xlat16_11.w * 15.0 + (-u_xlat16_74);
    u_xlat16_75 = (-u_xlat16_48) + u_xlat16_24.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75 + u_xlat16_48;
    u_xlat16_74 = u_xlat16_35.x * u_xlat16_74;
    u_xlat24.x = u_xlat1.x * u_xlat16_74;
    u_xlat16_74 = u_xlat0.x * 0.5;
    u_xlat16_75 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat24.x * u_xlat16_75 + u_xlat16_74;
    u_xlat16_75 = u_xlat16_74 + u_xlat16_74;
    u_xlat16_11.x = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_11.x + u_xlat16_75;
    u_xlat16_74 = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = min(u_xlat16_74, u_xlat10.y);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_3.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat16_13.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_13.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_74 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_74);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_GlitterIntensity);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_74 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_74) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_51.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_74 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
ivec3 u_xlati24;
bool u_xlatb24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
float u_xlat29;
vec3 u_xlat30;
mediump vec2 u_xlat16_35;
vec3 u_xlat36;
mediump vec3 u_xlat16_46;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat58;
mediump float u_xlat16_59;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
float u_xlat77;
float u_xlat79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb72 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb72){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_74 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = u_xlat16_74 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_75 = u_xlat16_74 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_74 = u_xlat16_74 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_75 + -0.100000001;
    u_xlat16_75 = dot(vec2(u_xlat16_75), vec2(_ChangColorRange));
    u_xlat16_75 = u_xlat16_75 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = (-u_xlat16_75) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_75) * _ChangEdgeColor.xyz;
    u_xlat16_75 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_75 * -2.0 + 3.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_4.x;
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_75) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_75) * u_xlat16_28.xyz;
    u_xlat16_4.x = u_xlat16_74 + -0.100000001;
    u_xlat16_74 = dot(vec2(u_xlat16_74), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_74 = u_xlat16_74 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = (-u_xlat16_74) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_74) * _UpChangEdgeColor.xyz;
    u_xlat16_74 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_74 * -2.0 + 3.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_4.x;
    u_xlat16_74 = min(u_xlat16_74, 1.0);
    u_xlat16_3.xyz = u_xlat16_28.xyz * vec3(u_xlat16_74) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_74 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat24.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xyz = vec3(u_xlat73) * u_xlat1.xyz;
    u_xlat16_28.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat73;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.x = (-u_xlat16_28.x) * u_xlat73 + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_28.xxx + u_xlat5.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat77 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat77 = u_xlat77 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_28.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_28.xxx + vs_TEXCOORD2.yzx;
    u_xlat30.x = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat30.x = max(u_xlat30.x, 1.17549435e-38);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat30.xyz = u_xlat16_28.xyz * u_xlat30.xxx;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat30.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_28.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat30.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat30.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat79 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat8.xyz = vec3(u_xlat79) * u_xlat7.xyz;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat80) + u_xlat30.xyz;
    u_xlat80 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat80);
    u_xlat9.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_28.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_74));
    u_xlat16_52 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_11.x = max(u_xlat16_52, 0.0078125);
    u_xlat6 = u_xlat16_28.x * u_xlat16_11.x;
    u_xlat16_35.x = u_xlat16_28.x + -1.0;
    u_xlat80 = (-u_xlat16_35.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_11.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat12.y = u_xlat77 * u_xlat6;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat80 * u_xlat6;
    u_xlat12.z = u_xlat77 * u_xlat81;
    u_xlat16_35.x = dot(u_xlat30.zxy, u_xlat1.xyz);
    u_xlat12.x = u_xlat80 * u_xlat16_35.x;
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat80 * u_xlat82;
    u_xlat16_59 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat6 * u_xlat16_59;
    u_xlat12.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat12.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat24.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat80 * u_xlat10.x;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat16_13.xyz);
    u_xlat10.y = u_xlat6 * u_xlat80;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat82 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat81 * u_xlat6;
    u_xlat14.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat73) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat17.xyz = vec3(u_xlat6) * u_xlat16.xyz;
    u_xlat6 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_75 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_74));
    u_xlat16_83 = u_xlat16_75 + -1.0;
    u_xlat81 = u_xlat16_75 * u_xlat16_11.x;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat82 = (-u_xlat16_83) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_11.x;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat12.z = u_xlat6 * u_xlat82;
    u_xlat12.y = u_xlat16_59 * u_xlat81;
    u_xlat6 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat12.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat36.x = dot(u_xlat17.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat82 * u_xlat36.x;
    u_xlat10.y = u_xlat80 * u_xlat81;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat6 = u_xlat80 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat81;
    u_xlat1.x = u_xlat16_35.x * u_xlat82;
    u_xlat58 = u_xlat81 * u_xlat82;
    u_xlat1.z = u_xlat77 * u_xlat58;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat25.x = u_xlat58 * 0.318309873;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_15.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat36.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_75 = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = u_xlat16_35.xxx * u_xlat36.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.yyy + u_xlat16_19.xyz;
    u_xlat36.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_18.xyz;
    u_xlat1.x = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat36.xyz = u_xlat1.xxx * u_xlat36.xyz;
    u_xlat16_59 = dot(u_xlat16_18.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat1.x;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat49 = (-u_xlat16_59) * u_xlat1.x + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat14.xyz = u_xlat16_3.xyz * vec3(u_xlat49);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat14.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat36.xyz);
    u_xlat20.y = u_xlat1.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat36.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20.z = u_xlat1.x * u_xlat58;
    u_xlat20.x = u_xlat82 * u_xlat16_59;
    u_xlat1.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat49 = dot(u_xlat17.xyz, u_xlat16_18.xyz);
    u_xlat20.z = u_xlat49 * u_xlat82;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_18.xyz);
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat20.y = u_xlat81 * u_xlat16_59;
    u_xlat49 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat49 + u_xlat20.x;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat80 * u_xlat49 + 6.10351563e-05;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat1.x = u_xlat49 * u_xlat1.x;
    u_xlat36.xyz = u_xlat14.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_15.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat20.xxx * u_xlat36.xyz;
    u_xlat16_59 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_59 = (-u_xlat16_59) * u_xlat16_59 + 1.0;
    u_xlat16_59 = max(u_xlat16_59, 0.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_59;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_35.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_85);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_18.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat36.xyz = u_xlat36.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat36.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_35.yyy + u_xlat16_22.xyz;
    u_xlat24.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_21.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat16_59 = dot(u_xlat16_21.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat5.x;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat29 = (-u_xlat16_59) * u_xlat5.x + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat29);
    u_xlat5.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat24.xyz);
    u_xlat77 = dot(u_xlat17.xyz, u_xlat16_21.xyz);
    u_xlat14.z = u_xlat77 * u_xlat82;
    u_xlat17.y = u_xlat0.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat24.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat0.x * u_xlat58;
    u_xlat17.x = u_xlat82 * u_xlat16_59;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat58 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_21.xyz);
    u_xlat14.y = u_xlat81 * u_xlat16_59;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_59 = u_xlat16_59 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat24.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat14.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat80 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_15.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat14.xxx * u_xlat0.xyz;
    u_xlat16_85 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_85;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_59);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_19.xyz;
    u_xlat16_75 = (-u_xlat16_74) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_75);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.zzz * u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat12.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_21.xyz + u_xlat8.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = vec3(u_xlat16_75) * u_xlat16_21.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_75) + u_xlat16_35.x;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_35.x + u_xlat16_75;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_75;
    u_xlat16_35.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x + -1.0;
    u_xlat16_35.x = _OcclusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat0.x = min(u_xlat16_75, 1.0);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_74);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_23.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_19.y = u_xlat16_21.y;
    u_xlat16_23.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = u_xlat16_35.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_19.xyw;
    u_xlat16_23.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_59 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_15.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.yzx;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat24.xyz = (bool(u_xlatb1)) ? u_xlat24.xyz : u_xlat30.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * u_xlat24.xyz;
    u_xlat1.xyz = u_xlat24.zxy * u_xlat16_13.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat24.xyz * u_xlat1.xyz;
    u_xlat24.xyz = u_xlat1.zxy * u_xlat24.yzx + (-u_xlat5.xyz);
    u_xlat24.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + u_xlat24.xyz;
    u_xlat16_59 = u_xlat16_11.x * 8.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0078125);
    u_xlat16_59 = min(u_xlat16_59, 1.0);
    u_xlat16_59 = u_xlat16_59 * abs(u_xlat16_83);
    u_xlat24.xyz = vec3(u_xlat16_59) * u_xlat24.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat25.xxx;
    u_xlat16_59 = dot((-u_xlat16_13.xyz), u_xlat24.xyz);
    u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
    u_xlat24.xyz = (-u_xlat24.xyz) * vec3(u_xlat16_59) + (-u_xlat16_13.xyz);
    u_xlat25.xyz = u_xlat7.xyz * vec3(u_xlat79) + (-u_xlat24.xyz);
    u_xlat25.xyz = u_xlat16_11.xxx * u_xlat25.xyz + u_xlat24.xyz;
    u_xlat5.xyz = u_xlat24.xyz + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat5.xyz + u_xlat25.xyz;
    u_xlat16_11.x = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_74 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat24.x = dot(u_xlat16_21.xyz, u_xlat24.xyz);
    u_xlat16_46.y = u_xlat24.x * 0.5;
    u_xlat16_59 = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_59;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat24.xyz = u_xlat16_11.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xzw = u_xlat24.xyz * u_xlat24.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_11.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb24 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb24)) ? u_xlat16_15.xyz : u_xlat16_11.xzw;
    u_xlat10.y = u_xlat16_74;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat16_3.xyz = u_xlat16_11.xzw * u_xlat16_3.xyz;
    u_xlat16_46.x = u_xlat10.y * 1.09769487;
    u_xlat16_11.xzw = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_4.w);
    u_xlat16_75 = u_xlat16_74 + 1.0;
    u_xlat16_75 = min(u_xlat16_75, 15.0);
    u_xlat16_4.x = u_xlat16_75 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_4.x = u_xlat16_74 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_74 = u_xlat16_11.w * 15.0 + (-u_xlat16_74);
    u_xlat16_75 = (-u_xlat16_48) + u_xlat16_24.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75 + u_xlat16_48;
    u_xlat16_74 = u_xlat16_35.x * u_xlat16_74;
    u_xlat24.x = u_xlat1.x * u_xlat16_74;
    u_xlat16_74 = u_xlat0.x * 0.5;
    u_xlat16_75 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat24.x * u_xlat16_75 + u_xlat16_74;
    u_xlat16_75 = u_xlat16_74 + u_xlat16_74;
    u_xlat16_11.x = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_11.x + u_xlat16_75;
    u_xlat16_74 = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = min(u_xlat16_74, u_xlat10.y);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_3.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat16_13.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_13.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_74 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_74);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_GlitterIntensity);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_74 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_74) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_51.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_74 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.xyz;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.xyz;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.xyz;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.xyz;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.xyz;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.xyz;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
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
 Name "PBR Hair (Transparent)"
  Tags { "LIGHTMODE" = "FORWARDBASE" "SHADOWSUPPORT" = "true" }
 ZTest Less
 ZWrite Off
 Cull Off
  GpuProgramID 128204
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
ivec3 u_xlati22;
bool u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_26;
float u_xlat27;
vec3 u_xlat28;
float u_xlat33;
vec3 u_xlat35;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat45;
mediump float u_xlat16_48;
mediump vec2 u_xlat16_56;
float u_xlat66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb66 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb66){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_68 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = u_xlat16_68 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_69 = u_xlat16_68 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_68 = u_xlat16_68 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_69 + -0.100000001;
    u_xlat16_69 = dot(vec2(u_xlat16_69), vec2(_ChangColorRange));
    u_xlat16_69 = u_xlat16_69 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = (-u_xlat16_69) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_69) * _ChangEdgeColor.zxy;
    u_xlat16_69 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_69 * -2.0 + 3.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_69 = min(u_xlat16_69, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_69) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_69) * u_xlat16_26.xyz;
    u_xlat16_4.x = u_xlat16_68 + -0.100000001;
    u_xlat16_68 = dot(vec2(u_xlat16_68), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_68 = u_xlat16_68 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = (-u_xlat16_68) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_68) * _UpChangEdgeColor.zxy;
    u_xlat16_68 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_68 * -2.0 + 3.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_3.xyz = u_xlat16_26.xyz * vec3(u_xlat16_68) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_68 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_68) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat22.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat1.xyz = vec3(u_xlat67) * u_xlat1.xyz;
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat67;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.x = (-u_xlat16_26.x) * u_xlat67 + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_26.xxx + u_xlat5.xyz;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_26.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat71 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat71 = u_xlat71 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat28.x = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat16_26.xyz * u_xlat28.xxx;
    u_xlat8.xyz = u_xlat28.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat28.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat28.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_26.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat28.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_26.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat28.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_26.xyz, u_xlat8.xyz);
    u_xlat73 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat7.xyz;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat8.xyz);
    u_xlat28.xyz = (-u_xlat8.yzx) * vec3(u_xlat74) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat74);
    u_xlat9.xyz = u_xlat28.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat28.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_26.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_68));
    u_xlat16_48 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_48 = max(u_xlat16_48, 0.0078125);
    u_xlat6 = u_xlat16_26.x * u_xlat16_48;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat74 = (-u_xlat16_26.x) + 1.0;
    u_xlat74 = u_xlat16_48 * u_xlat74;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat11.y = u_xlat71 * u_xlat6;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat74 * u_xlat6;
    u_xlat11.z = u_xlat71 * u_xlat75;
    u_xlat16_26.x = dot(u_xlat28.zxy, u_xlat1.xyz);
    u_xlat11.x = u_xlat16_26.x * u_xlat74;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat75 / u_xlat76;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.z = u_xlat74 * u_xlat76;
    u_xlat16_70 = dot(u_xlat28.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.y = u_xlat16_70 * u_xlat6;
    u_xlat11.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat11.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat22.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat74 * u_xlat10.x;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat16_12.xyz);
    u_xlat10.y = u_xlat6 * u_xlat74;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat76 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat75 * u_xlat6;
    u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_14.xyz;
    u_xlat13.xyz = u_xlat11.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat67) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat15.xyz = vec3(u_xlat6) * u_xlat15.xyz;
    u_xlat6 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_78 = u_xlat16_69 + -1.0;
    u_xlat75 = u_xlat16_69 * u_xlat16_48;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat76 = (-u_xlat16_78) + 1.0;
    u_xlat77 = u_xlat16_48 * u_xlat76;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat11.z = u_xlat6 * u_xlat77;
    u_xlat11.y = u_xlat16_70 * u_xlat75;
    u_xlat6 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat11.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat33 = dot(u_xlat15.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat33 * u_xlat77;
    u_xlat10.y = u_xlat74 * u_xlat75;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat10.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat6 = u_xlat74 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat75;
    u_xlat1.x = u_xlat16_26.x * u_xlat77;
    u_xlat33 = u_xlat75 * u_xlat77;
    u_xlat1.z = u_xlat71 * u_xlat33;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat23.x = u_xlat33 * 0.318309873;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_14.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat11.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat13.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_26.zzz + u_xlat16_17.xyz;
    u_xlat13.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat1.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat13.xyz = u_xlat1.xxx * u_xlat13.xyz;
    u_xlat16_70 = dot(u_xlat16_16.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat1.x;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat45 = (-u_xlat16_70) * u_xlat1.x + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat18.xyz = u_xlat16_3.xyz * vec3(u_xlat45);
    u_xlat18.xyz = u_xlat0.xxx * vec3(u_xlat16_70) + u_xlat18.xyz;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat13.xyz);
    u_xlat19.y = u_xlat1.x * u_xlat75;
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat1.x * u_xlat33;
    u_xlat19.x = u_xlat16_70 * u_xlat77;
    u_xlat1.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat45 = dot(u_xlat15.xyz, u_xlat16_16.xyz);
    u_xlat13.z = u_xlat45 * u_xlat77;
    u_xlat13.x = dot(u_xlat8.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat16_16.xyz);
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat13.y = u_xlat16_70 * u_xlat75;
    u_xlat45 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat13.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat45 = u_xlat74 * u_xlat45 + 6.10351563e-05;
    u_xlat45 = float(1.0) / u_xlat45;
    u_xlat1.x = u_xlat45 * u_xlat1.x;
    u_xlat35.xyz = u_xlat18.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat16_14.xyz * u_xlat35.xyz;
    u_xlat35.xyz = u_xlat13.xxx * u_xlat35.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_80);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_26.x;
    u_xlat16_16.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat35.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_20.xyz = u_xlat16_26.xxx * u_xlat5.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_26.zzz + u_xlat16_21.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_20.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(u_xlat16_20.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat5.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat27 = (-u_xlat16_4.x) * u_xlat5.x + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat27);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_4.xxx + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat15.xyz, u_xlat22.xyz);
    u_xlat71 = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat15.z = u_xlat71 * u_xlat77;
    u_xlat18.y = u_xlat0.x * u_xlat75;
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat22.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat0.x * u_xlat33;
    u_xlat18.x = u_xlat16_4.x * u_xlat77;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat33 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat23.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat16_20.xyz);
    u_xlat15.y = u_xlat16_4.x * u_xlat75;
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat22.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat15.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = u_xlat74 * u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat0.x = u_xlat22.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_14.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_26.x, u_xlat16_4.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_4.xyw = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_17.xyz;
    u_xlat16_69 = (-u_xlat16_68) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_69);
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat16_2.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyw = u_xlat1.zzz * u_xlat16_4.xyw;
    u_xlat16_17.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat13.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat11.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat15.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_17.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_17.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_69) + u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80 + u_xlat16_69;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 + -1.0;
    u_xlat16_82 = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat0.x = min(u_xlat16_80, 1.0);
    u_xlat22.x = min(u_xlat0.x, u_xlat16_68);
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat22.xxx + (-u_xlat16_21.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat22.xxx + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlat16_21.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati22.x = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati44 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati22.x].xyz + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_4.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyw = u_xlat16_4.xxx * vs_TEXCOORD1.yzx;
    u_xlat22.xyz = vec3(u_xlat67) * u_xlat16_4.xyw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb1)) ? u_xlat22.xyz : u_xlat28.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat22.xyz;
    u_xlat1.xyz = u_xlat22.zxy * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat22.xyz * u_xlat1.xyz;
    u_xlat22.xyz = u_xlat1.zxy * u_xlat22.yzx + (-u_xlat5.xyz);
    u_xlat22.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + u_xlat22.xyz;
    u_xlat16_4.x = u_xlat16_48 * 8.0;
    u_xlat16_26.x = u_xlat16_48 * u_xlat16_48;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_78);
    u_xlat22.xyz = u_xlat16_4.xxx * u_xlat22.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat23.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat23.xyz = u_xlat7.xyz * vec3(u_xlat73) + (-u_xlat22.xyz);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat5.xyz = u_xlat22.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = abs(vec3(u_xlat16_78)) * u_xlat5.xyz + u_xlat23.xyz;
    u_xlat16_4.x = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat22.x = dot(u_xlat16_17.xyz, u_xlat22.xyz);
    u_xlat16_42.y = u_xlat22.x * 0.5;
    u_xlat16_26.x = dot(_IndirectCubemapRotationParams.xy, u_xlat23.xz);
    u_xlat23.z = dot(_IndirectCubemapRotationParams.zw, u_xlat23.xz);
    u_xlat23.x = u_xlat16_26.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat23.xyz, u_xlat16_4.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat22.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb22)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.y = u_xlat16_68;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_42.x = u_xlat10.y * 1.09769487;
    u_xlat16_16.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_16.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_68 = floor(u_xlat16_3.w);
    u_xlat16_78 = u_xlat16_68 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_3.x = u_xlat16_78 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_3.x = u_xlat16_68 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_68 = u_xlat16_16.z * 15.0 + (-u_xlat16_68);
    u_xlat16_78 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_78 + u_xlat16_44;
    u_xlat16_68 = u_xlat16_82 * u_xlat16_68;
    u_xlat22.x = u_xlat1.x * u_xlat16_68;
    u_xlat16_68 = u_xlat0.x * 0.5;
    u_xlat16_78 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_68 = u_xlat22.x * u_xlat16_78 + u_xlat16_68;
    u_xlat16_78 = u_xlat16_68 + u_xlat16_68;
    u_xlat16_80 = (-u_xlat16_68) * 2.0 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_80 + u_xlat16_78;
    u_xlat16_68 = u_xlat0.x * u_xlat16_68;
    u_xlat16_68 = min(u_xlat16_68, u_xlat10.y);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_14.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_14.xyz, u_xlat16_12.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_68 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_68);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_GlitterIntensity);
    u_xlat16_12.xyz = log2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_12.xyz = exp2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = min(u_xlat16_12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_12.xyz = u_xlat16_12.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_68 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat16_68) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_12.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_56.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_12.xy = u_xlat16_56.xy + u_xlat16_12.xy;
    u_xlat16_12.xy = u_xlat16_12.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_12.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_68 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_12.xyz = vec3(u_xlat16_68) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat66 * 0.0625 + u_xlat1.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_22.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
ivec3 u_xlati22;
bool u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_26;
float u_xlat27;
vec3 u_xlat28;
float u_xlat33;
vec3 u_xlat35;
mediump vec3 u_xlat16_42;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat45;
mediump float u_xlat16_48;
mediump vec2 u_xlat16_56;
float u_xlat66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb66 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb66){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_68 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = u_xlat16_68 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_69 = u_xlat16_68 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_68 = u_xlat16_68 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_69 + -0.100000001;
    u_xlat16_69 = dot(vec2(u_xlat16_69), vec2(_ChangColorRange));
    u_xlat16_69 = u_xlat16_69 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = (-u_xlat16_69) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_69) * _ChangEdgeColor.zxy;
    u_xlat16_69 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_69 * -2.0 + 3.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_69 = min(u_xlat16_69, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_69) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_69) * u_xlat16_26.xyz;
    u_xlat16_4.x = u_xlat16_68 + -0.100000001;
    u_xlat16_68 = dot(vec2(u_xlat16_68), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_68 = u_xlat16_68 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = (-u_xlat16_68) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_68) * _UpChangEdgeColor.zxy;
    u_xlat16_68 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_68 * -2.0 + 3.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_3.xyz = u_xlat16_26.xyz * vec3(u_xlat16_68) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_68 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_68) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat22.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat1.xyz = vec3(u_xlat67) * u_xlat1.xyz;
    u_xlat16_26.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat67;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.x = (-u_xlat16_26.x) * u_xlat67 + 1.0;
    u_xlat16_26.x = u_xlat67 * u_xlat16_26.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_26.xxx + u_xlat5.xyz;
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_67 = texture(_AnisotropicTex, u_xlat16_26.xy).x;
    u_xlat67 = u_xlat16_67 * 2.0 + -1.0;
    u_xlat71 = u_xlat67 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat67 = u_xlat67 * _SunShift + _SunShiftOffset;
    u_xlat67 = u_xlat67 + vs_TEXCOORD5;
    u_xlat71 = u_xlat71 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_26.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_26.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_26.xxx + vs_TEXCOORD2.yzx;
    u_xlat28.x = dot(u_xlat16_26.xyz, u_xlat16_26.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat16_26.xyz * u_xlat28.xxx;
    u_xlat8.xyz = u_xlat28.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat28.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat28.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_26.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat28.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_26.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat28.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_26.xyz, u_xlat8.xyz);
    u_xlat73 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat7.xyz;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat8.xyz);
    u_xlat28.xyz = (-u_xlat8.yzx) * vec3(u_xlat74) + u_xlat28.xyz;
    u_xlat74 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat28.xyz = u_xlat28.xyz * vec3(u_xlat74);
    u_xlat9.xyz = u_xlat28.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat28.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat71 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_26.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_68));
    u_xlat16_48 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_48 = max(u_xlat16_48, 0.0078125);
    u_xlat6 = u_xlat16_26.x * u_xlat16_48;
    u_xlat16_26.x = u_xlat16_26.x + -1.0;
    u_xlat74 = (-u_xlat16_26.x) + 1.0;
    u_xlat74 = u_xlat16_48 * u_xlat74;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat11.y = u_xlat71 * u_xlat6;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat74 * u_xlat6;
    u_xlat11.z = u_xlat71 * u_xlat75;
    u_xlat16_26.x = dot(u_xlat28.zxy, u_xlat1.xyz);
    u_xlat11.x = u_xlat16_26.x * u_xlat74;
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat75 / u_xlat76;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.z = u_xlat74 * u_xlat76;
    u_xlat16_70 = dot(u_xlat28.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.y = u_xlat16_70 * u_xlat6;
    u_xlat11.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat11.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat22.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat74 * u_xlat10.x;
    u_xlat74 = dot(u_xlat28.zxy, u_xlat16_12.xyz);
    u_xlat10.y = u_xlat6 * u_xlat74;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat76 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat75 * u_xlat6;
    u_xlat13.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_14.xyz;
    u_xlat13.xyz = u_xlat11.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * u_xlat16_14.xyz + _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat67) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat15.xyz = vec3(u_xlat6) * u_xlat15.xyz;
    u_xlat6 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_68));
    u_xlat16_78 = u_xlat16_69 + -1.0;
    u_xlat75 = u_xlat16_69 * u_xlat16_48;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat76 = (-u_xlat16_78) + 1.0;
    u_xlat77 = u_xlat16_48 * u_xlat76;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat11.z = u_xlat6 * u_xlat77;
    u_xlat11.y = u_xlat16_70 * u_xlat75;
    u_xlat6 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat11.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat33 = dot(u_xlat15.xyz, u_xlat16_12.xyz);
    u_xlat10.z = u_xlat33 * u_xlat77;
    u_xlat10.y = u_xlat74 * u_xlat75;
    u_xlat74 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat10.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat6 = u_xlat74 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat75;
    u_xlat1.x = u_xlat16_26.x * u_xlat77;
    u_xlat33 = u_xlat75 * u_xlat77;
    u_xlat1.z = u_xlat71 * u_xlat33;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat23.x = u_xlat33 * 0.318309873;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_14.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat11.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_16.xyz = u_xlat16_26.xxx * u_xlat13.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_26.zzz + u_xlat16_17.xyz;
    u_xlat13.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_16.xyz;
    u_xlat1.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat13.xyz = u_xlat1.xxx * u_xlat13.xyz;
    u_xlat16_70 = dot(u_xlat16_16.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_70) + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat1.x;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat45 = (-u_xlat16_70) * u_xlat1.x + 1.0;
    u_xlat16_70 = u_xlat1.x * u_xlat16_70;
    u_xlat18.xyz = u_xlat16_3.xyz * vec3(u_xlat45);
    u_xlat18.xyz = u_xlat0.xxx * vec3(u_xlat16_70) + u_xlat18.xyz;
    u_xlat1.x = dot(u_xlat15.xyz, u_xlat13.xyz);
    u_xlat19.y = u_xlat1.x * u_xlat75;
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat1.x * u_xlat33;
    u_xlat19.x = u_xlat16_70 * u_xlat77;
    u_xlat1.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat33 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat23.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat45 = dot(u_xlat15.xyz, u_xlat16_16.xyz);
    u_xlat13.z = u_xlat45 * u_xlat77;
    u_xlat13.x = dot(u_xlat8.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(u_xlat28.zxy, u_xlat16_16.xyz);
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat13.y = u_xlat16_70 * u_xlat75;
    u_xlat45 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat13.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat45 = u_xlat74 * u_xlat45 + 6.10351563e-05;
    u_xlat45 = float(1.0) / u_xlat45;
    u_xlat1.x = u_xlat45 * u_xlat1.x;
    u_xlat35.xyz = u_xlat18.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.xyz = min(max(u_xlat35.xyz, 0.0), 1.0);
#else
    u_xlat35.xyz = clamp(u_xlat35.xyz, 0.0, 1.0);
#endif
    u_xlat35.xyz = u_xlat16_14.xyz * u_xlat35.xyz;
    u_xlat35.xyz = u_xlat13.xxx * u_xlat35.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_26.x = max(u_xlat16_26.x, u_xlat16_80);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_26.x;
    u_xlat16_16.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat35.xyz = u_xlat35.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat35.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_69);
    u_xlat16_20.xyz = u_xlat16_26.xxx * u_xlat5.xyz;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xz = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_26.zzz + u_xlat16_21.xyz;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat16_4.xxx + u_xlat16_20.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat16_4.x = dot(u_xlat16_20.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat5.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat27 = (-u_xlat16_4.x) * u_xlat5.x + 1.0;
    u_xlat16_4.x = u_xlat5.x * u_xlat16_4.x;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat27);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_4.xxx + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat15.xyz, u_xlat22.xyz);
    u_xlat71 = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat15.z = u_xlat71 * u_xlat77;
    u_xlat18.y = u_xlat0.x * u_xlat75;
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat22.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat0.x * u_xlat33;
    u_xlat18.x = u_xlat16_4.x * u_xlat77;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat33 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat23.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_4.x = dot(u_xlat28.zxy, u_xlat16_20.xyz);
    u_xlat15.y = u_xlat16_4.x * u_xlat75;
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat22.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat15.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = u_xlat74 * u_xlat22.x + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat0.x = u_xlat22.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_14.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_26.x, u_xlat16_69);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_26.x, u_xlat16_4.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_4.x;
    u_xlat16_4.xyw = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_17.xyz;
    u_xlat16_69 = (-u_xlat16_68) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_69);
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat16_2.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyw = u_xlat1.zzz * u_xlat16_4.xyw;
    u_xlat16_17.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat13.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat11.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_4.xyw * u_xlat15.xxx + u_xlat16_16.xyz;
    u_xlat16_4.xyw = u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_17.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_17.xyz;
    u_xlat16_69 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_69) + u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_42.z = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80 + u_xlat16_69;
    u_xlat16_80 = u_xlat16_42.z * u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 + -1.0;
    u_xlat16_82 = _OcclusionScale * u_xlat16_82 + 1.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_82;
    u_xlat0.x = min(u_xlat16_80, 1.0);
    u_xlat22.x = min(u_xlat0.x, u_xlat16_68);
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat22.xxx * u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat22.xxx * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat22.xxx + (-u_xlat16_21.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat22.xxx + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlat16_21.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati22.x = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati44 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati22.x].xyz + u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_80 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + u_xlat16_4.xyw;
    u_xlat16_4.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyw = u_xlat16_4.xxx * vs_TEXCOORD1.yzx;
    u_xlat22.xyz = vec3(u_xlat67) * u_xlat16_4.xyw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb1)) ? u_xlat22.xyz : u_xlat28.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat22.xyz;
    u_xlat1.xyz = u_xlat22.zxy * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat22.xyz * u_xlat1.xyz;
    u_xlat22.xyz = u_xlat1.zxy * u_xlat22.yzx + (-u_xlat5.xyz);
    u_xlat22.xyz = (-u_xlat7.xyz) * vec3(u_xlat73) + u_xlat22.xyz;
    u_xlat16_4.x = u_xlat16_48 * 8.0;
    u_xlat16_26.x = u_xlat16_48 * u_xlat16_48;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_78);
    u_xlat22.xyz = u_xlat16_4.xxx * u_xlat22.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat23.x = inversesqrt(u_xlat23.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat23.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat22.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat23.xyz = u_xlat7.xyz * vec3(u_xlat73) + (-u_xlat22.xyz);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat5.xyz = u_xlat22.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = abs(vec3(u_xlat16_78)) * u_xlat5.xyz + u_xlat23.xyz;
    u_xlat16_4.x = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_68 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat22.x = dot(u_xlat16_17.xyz, u_xlat22.xyz);
    u_xlat16_42.y = u_xlat22.x * 0.5;
    u_xlat16_26.x = dot(_IndirectCubemapRotationParams.xy, u_xlat23.xz);
    u_xlat23.z = dot(_IndirectCubemapRotationParams.zw, u_xlat23.xz);
    u_xlat23.x = u_xlat16_26.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat23.xyz, u_xlat16_4.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat22.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb22)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.y = u_xlat16_68;
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_16.xyz = u_xlat16_3.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_42.x = u_xlat10.y * 1.09769487;
    u_xlat16_16.xyz = u_xlat16_42.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_16.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_68 = floor(u_xlat16_3.w);
    u_xlat16_78 = u_xlat16_68 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_3.x = u_xlat16_78 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_3.x = u_xlat16_68 * 16.0 + u_xlat16_3.z;
    u_xlat16_16.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_68 = u_xlat16_16.z * 15.0 + (-u_xlat16_68);
    u_xlat16_78 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_78 + u_xlat16_44;
    u_xlat16_68 = u_xlat16_82 * u_xlat16_68;
    u_xlat22.x = u_xlat1.x * u_xlat16_68;
    u_xlat16_68 = u_xlat0.x * 0.5;
    u_xlat16_78 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_68 = u_xlat22.x * u_xlat16_78 + u_xlat16_68;
    u_xlat16_78 = u_xlat16_68 + u_xlat16_68;
    u_xlat16_80 = (-u_xlat16_68) * 2.0 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_80 + u_xlat16_78;
    u_xlat16_68 = u_xlat0.x * u_xlat16_68;
    u_xlat16_68 = min(u_xlat16_68, u_xlat10.y);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_14.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_14.xyz, u_xlat16_12.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_68 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_68);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(_GlitterIntensity);
    u_xlat16_12.xyz = log2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_12.xyz = exp2(u_xlat16_12.xyz);
    u_xlat16_12.xyz = min(u_xlat16_12.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_12.xyz = u_xlat16_12.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_68 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_12.xyz * vec3(u_xlat16_68) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_12.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_56.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_12.xy = u_xlat16_56.xy + u_xlat16_12.xy;
    u_xlat16_12.xy = u_xlat16_12.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_12.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_68 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_12.xyz = vec3(u_xlat16_68) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat66 * 0.0625 + u_xlat1.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_22.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(16) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.zxy;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.zxy;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.zxy;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.zxy;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat75 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(16) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.zxy;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.zxy;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.zxy;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.zxy;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.zxy;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat75 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
ivec3 u_xlati24;
bool u_xlatb24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
float u_xlat29;
vec3 u_xlat30;
mediump vec2 u_xlat16_35;
vec3 u_xlat36;
mediump vec3 u_xlat16_46;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat58;
mediump float u_xlat16_59;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
float u_xlat77;
float u_xlat79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb72 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb72){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_74 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = u_xlat16_74 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_75 = u_xlat16_74 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_74 = u_xlat16_74 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_75 + -0.100000001;
    u_xlat16_75 = dot(vec2(u_xlat16_75), vec2(_ChangColorRange));
    u_xlat16_75 = u_xlat16_75 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = (-u_xlat16_75) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_75) * _ChangEdgeColor.xyz;
    u_xlat16_75 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_75 * -2.0 + 3.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_4.x;
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_75) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_75) * u_xlat16_28.xyz;
    u_xlat16_4.x = u_xlat16_74 + -0.100000001;
    u_xlat16_74 = dot(vec2(u_xlat16_74), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_74 = u_xlat16_74 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = (-u_xlat16_74) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_74) * _UpChangEdgeColor.xyz;
    u_xlat16_74 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_74 * -2.0 + 3.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_4.x;
    u_xlat16_74 = min(u_xlat16_74, 1.0);
    u_xlat16_3.xyz = u_xlat16_28.xyz * vec3(u_xlat16_74) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_74 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat24.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xyz = vec3(u_xlat73) * u_xlat1.xyz;
    u_xlat16_28.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat73;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.x = (-u_xlat16_28.x) * u_xlat73 + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_28.xxx + u_xlat5.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat77 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat77 = u_xlat77 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_28.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_28.xxx + vs_TEXCOORD2.yzx;
    u_xlat30.x = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat30.x = max(u_xlat30.x, 1.17549435e-38);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat30.xyz = u_xlat16_28.xyz * u_xlat30.xxx;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat30.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_28.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat30.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat30.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat79 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat8.xyz = vec3(u_xlat79) * u_xlat7.xyz;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat80) + u_xlat30.xyz;
    u_xlat80 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat80);
    u_xlat9.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_28.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_74));
    u_xlat16_52 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_11.x = max(u_xlat16_52, 0.0078125);
    u_xlat6 = u_xlat16_28.x * u_xlat16_11.x;
    u_xlat16_35.x = u_xlat16_28.x + -1.0;
    u_xlat80 = (-u_xlat16_35.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_11.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat12.y = u_xlat77 * u_xlat6;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat80 * u_xlat6;
    u_xlat12.z = u_xlat77 * u_xlat81;
    u_xlat16_35.x = dot(u_xlat30.zxy, u_xlat1.xyz);
    u_xlat12.x = u_xlat80 * u_xlat16_35.x;
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat80 * u_xlat82;
    u_xlat16_59 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat6 * u_xlat16_59;
    u_xlat12.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat12.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat24.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat80 * u_xlat10.x;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat16_13.xyz);
    u_xlat10.y = u_xlat6 * u_xlat80;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat82 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat81 * u_xlat6;
    u_xlat14.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat73) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat17.xyz = vec3(u_xlat6) * u_xlat16.xyz;
    u_xlat6 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_75 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_74));
    u_xlat16_83 = u_xlat16_75 + -1.0;
    u_xlat81 = u_xlat16_75 * u_xlat16_11.x;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat82 = (-u_xlat16_83) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_11.x;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat12.z = u_xlat6 * u_xlat82;
    u_xlat12.y = u_xlat16_59 * u_xlat81;
    u_xlat6 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat12.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat36.x = dot(u_xlat17.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat82 * u_xlat36.x;
    u_xlat10.y = u_xlat80 * u_xlat81;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat6 = u_xlat80 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat81;
    u_xlat1.x = u_xlat16_35.x * u_xlat82;
    u_xlat58 = u_xlat81 * u_xlat82;
    u_xlat1.z = u_xlat77 * u_xlat58;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat25.x = u_xlat58 * 0.318309873;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_15.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat36.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_75 = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = u_xlat16_35.xxx * u_xlat36.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.yyy + u_xlat16_19.xyz;
    u_xlat36.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_18.xyz;
    u_xlat1.x = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat36.xyz = u_xlat1.xxx * u_xlat36.xyz;
    u_xlat16_59 = dot(u_xlat16_18.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat1.x;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat49 = (-u_xlat16_59) * u_xlat1.x + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat14.xyz = u_xlat16_3.xyz * vec3(u_xlat49);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat14.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat36.xyz);
    u_xlat20.y = u_xlat1.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat36.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20.z = u_xlat1.x * u_xlat58;
    u_xlat20.x = u_xlat82 * u_xlat16_59;
    u_xlat1.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat49 = dot(u_xlat17.xyz, u_xlat16_18.xyz);
    u_xlat20.z = u_xlat49 * u_xlat82;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_18.xyz);
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat20.y = u_xlat81 * u_xlat16_59;
    u_xlat49 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat49 + u_xlat20.x;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat80 * u_xlat49 + 6.10351563e-05;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat1.x = u_xlat49 * u_xlat1.x;
    u_xlat36.xyz = u_xlat14.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_15.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat20.xxx * u_xlat36.xyz;
    u_xlat16_59 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_59 = (-u_xlat16_59) * u_xlat16_59 + 1.0;
    u_xlat16_59 = max(u_xlat16_59, 0.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_59;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_35.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_85);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_18.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat36.xyz = u_xlat36.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat36.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_35.yyy + u_xlat16_22.xyz;
    u_xlat24.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_21.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat16_59 = dot(u_xlat16_21.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat5.x;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat29 = (-u_xlat16_59) * u_xlat5.x + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat29);
    u_xlat5.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat24.xyz);
    u_xlat77 = dot(u_xlat17.xyz, u_xlat16_21.xyz);
    u_xlat14.z = u_xlat77 * u_xlat82;
    u_xlat17.y = u_xlat0.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat24.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat0.x * u_xlat58;
    u_xlat17.x = u_xlat82 * u_xlat16_59;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat58 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_21.xyz);
    u_xlat14.y = u_xlat81 * u_xlat16_59;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_59 = u_xlat16_59 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat24.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat14.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat80 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_15.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat14.xxx * u_xlat0.xyz;
    u_xlat16_85 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_85;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_59);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_19.xyz;
    u_xlat16_75 = (-u_xlat16_74) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_75);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.zzz * u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat12.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_21.xyz + u_xlat8.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = vec3(u_xlat16_75) * u_xlat16_21.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_75) + u_xlat16_35.x;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_35.x + u_xlat16_75;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_75;
    u_xlat16_35.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x + -1.0;
    u_xlat16_35.x = _OcclusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat0.x = min(u_xlat16_75, 1.0);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_74);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_23.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_19.y = u_xlat16_21.y;
    u_xlat16_23.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = u_xlat16_35.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_19.xyw;
    u_xlat16_23.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_59 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_15.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.yzx;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat24.xyz = (bool(u_xlatb1)) ? u_xlat24.xyz : u_xlat30.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * u_xlat24.xyz;
    u_xlat1.xyz = u_xlat24.zxy * u_xlat16_13.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat24.xyz * u_xlat1.xyz;
    u_xlat24.xyz = u_xlat1.zxy * u_xlat24.yzx + (-u_xlat5.xyz);
    u_xlat24.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + u_xlat24.xyz;
    u_xlat16_59 = u_xlat16_11.x * 8.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0078125);
    u_xlat16_59 = min(u_xlat16_59, 1.0);
    u_xlat16_59 = u_xlat16_59 * abs(u_xlat16_83);
    u_xlat24.xyz = vec3(u_xlat16_59) * u_xlat24.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat25.xxx;
    u_xlat16_59 = dot((-u_xlat16_13.xyz), u_xlat24.xyz);
    u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
    u_xlat24.xyz = (-u_xlat24.xyz) * vec3(u_xlat16_59) + (-u_xlat16_13.xyz);
    u_xlat25.xyz = u_xlat7.xyz * vec3(u_xlat79) + (-u_xlat24.xyz);
    u_xlat25.xyz = u_xlat16_11.xxx * u_xlat25.xyz + u_xlat24.xyz;
    u_xlat5.xyz = u_xlat24.xyz + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat5.xyz + u_xlat25.xyz;
    u_xlat16_11.x = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_74 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat24.x = dot(u_xlat16_21.xyz, u_xlat24.xyz);
    u_xlat16_46.y = u_xlat24.x * 0.5;
    u_xlat16_59 = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_59;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat24.xyz = u_xlat16_11.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xzw = u_xlat24.xyz * u_xlat24.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_11.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb24 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb24)) ? u_xlat16_15.xyz : u_xlat16_11.xzw;
    u_xlat10.y = u_xlat16_74;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat16_3.xyz = u_xlat16_11.xzw * u_xlat16_3.xyz;
    u_xlat16_46.x = u_xlat10.y * 1.09769487;
    u_xlat16_11.xzw = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_4.w);
    u_xlat16_75 = u_xlat16_74 + 1.0;
    u_xlat16_75 = min(u_xlat16_75, 15.0);
    u_xlat16_4.x = u_xlat16_75 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_4.x = u_xlat16_74 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_74 = u_xlat16_11.w * 15.0 + (-u_xlat16_74);
    u_xlat16_75 = (-u_xlat16_48) + u_xlat16_24.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75 + u_xlat16_48;
    u_xlat16_74 = u_xlat16_35.x * u_xlat16_74;
    u_xlat24.x = u_xlat1.x * u_xlat16_74;
    u_xlat16_74 = u_xlat0.x * 0.5;
    u_xlat16_75 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat24.x * u_xlat16_75 + u_xlat16_74;
    u_xlat16_75 = u_xlat16_74 + u_xlat16_74;
    u_xlat16_11.x = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_11.x + u_xlat16_75;
    u_xlat16_74 = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = min(u_xlat16_74, u_xlat10.y);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_3.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat16_13.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_13.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_74 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_74);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_GlitterIntensity);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_74 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_74) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_51.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_74 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
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
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
ivec3 u_xlati24;
bool u_xlatb24;
vec3 u_xlat25;
mediump vec3 u_xlat16_28;
float u_xlat29;
vec3 u_xlat30;
mediump vec2 u_xlat16_35;
vec3 u_xlat36;
mediump vec3 u_xlat16_46;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat58;
mediump float u_xlat16_59;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
float u_xlat77;
float u_xlat79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb72 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb72){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_74 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = u_xlat16_74 * 2.0 + -0.0599999987;
    u_xlat16_4.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_4.xy).x;
    u_xlat16_75 = u_xlat16_74 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_74 = u_xlat16_74 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_4.x = u_xlat16_75 + -0.100000001;
    u_xlat16_75 = dot(vec2(u_xlat16_75), vec2(_ChangColorRange));
    u_xlat16_75 = u_xlat16_75 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = (-u_xlat16_75) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_75) * _ChangEdgeColor.xyz;
    u_xlat16_75 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_75 * -2.0 + 3.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_4.x;
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_75) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_75) * u_xlat16_28.xyz;
    u_xlat16_4.x = u_xlat16_74 + -0.100000001;
    u_xlat16_74 = dot(vec2(u_xlat16_74), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_74 = u_xlat16_74 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = (-u_xlat16_74) + 1.0;
    u_xlat16_28.xyz = vec3(u_xlat16_74) * _UpChangEdgeColor.xyz;
    u_xlat16_74 = u_xlat16_4.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_74 * -2.0 + 3.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_4.x;
    u_xlat16_74 = min(u_xlat16_74, 1.0);
    u_xlat16_3.xyz = u_xlat16_28.xyz * vec3(u_xlat16_74) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.z = 1.0;
    u_xlat16_74 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_4.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat1.xyz = u_xlat24.xyz * u_xlat16_4.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xyz = vec3(u_xlat73) * u_xlat1.xyz;
    u_xlat16_28.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_28.x) + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat73;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.x = (-u_xlat16_28.x) * u_xlat73 + 1.0;
    u_xlat16_28.x = u_xlat73 * u_xlat16_28.x;
    u_xlat5.xyz = u_xlat16_3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_28.xxx + u_xlat5.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_73 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat77 = u_xlat73 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD5;
    u_xlat77 = u_xlat77 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb6 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat6 = (u_xlatb6) ? 1.0 : -1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.w;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_28.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_28.xxx + vs_TEXCOORD2.yzx;
    u_xlat30.x = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat30.x = max(u_xlat30.x, 1.17549435e-38);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat30.xyz = u_xlat16_28.xyz * u_xlat30.xxx;
    u_xlat8.xyz = u_xlat30.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat30.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat8.x;
    u_xlat7.x = u_xlat30.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_28.xyz, u_xlat7.xyz);
    u_xlat9.x = u_xlat30.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat30.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_28.xyz, u_xlat8.xyz);
    u_xlat79 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat8.xyz = vec3(u_xlat79) * u_xlat7.xyz;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat8.xyz);
    u_xlat30.xyz = (-u_xlat8.yzx) * vec3(u_xlat80) + u_xlat30.xyz;
    u_xlat80 = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat30.xyz = u_xlat30.xyz * vec3(u_xlat80);
    u_xlat9.xyz = u_xlat30.yzx * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.zxy * u_xlat30.zxy + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(u_xlat6) * u_xlat9.xyz;
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat16_28.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_74));
    u_xlat16_52 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_11.x = max(u_xlat16_52, 0.0078125);
    u_xlat6 = u_xlat16_28.x * u_xlat16_11.x;
    u_xlat16_35.x = u_xlat16_28.x + -1.0;
    u_xlat80 = (-u_xlat16_35.x) + 1.0;
    u_xlat80 = u_xlat80 * u_xlat16_11.x;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat12.y = u_xlat77 * u_xlat6;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat80 * u_xlat6;
    u_xlat12.z = u_xlat77 * u_xlat81;
    u_xlat16_35.x = dot(u_xlat30.zxy, u_xlat1.xyz);
    u_xlat12.x = u_xlat80 * u_xlat16_35.x;
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat80 * u_xlat82;
    u_xlat16_59 = dot(u_xlat30.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat6 * u_xlat16_59;
    u_xlat12.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat82 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat12.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat24.xyz * u_xlat16_4.xxx;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat80 * u_xlat10.x;
    u_xlat80 = dot(u_xlat30.zxy, u_xlat16_13.xyz);
    u_xlat10.y = u_xlat6 * u_xlat80;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat10.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat6 = u_xlat6 * u_xlat82 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat81 * u_xlat6;
    u_xlat14.xyz = u_xlat5.xyz * vec3(u_xlat6);
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_15.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat73) * u_xlat8.xyz + u_xlat9.zxy;
    u_xlat6 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat17.xyz = vec3(u_xlat6) * u_xlat16.xyz;
    u_xlat6 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_75 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_74));
    u_xlat16_83 = u_xlat16_75 + -1.0;
    u_xlat81 = u_xlat16_75 * u_xlat16_11.x;
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat82 = (-u_xlat16_83) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_11.x;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat12.z = u_xlat6 * u_xlat82;
    u_xlat12.y = u_xlat16_59 * u_xlat81;
    u_xlat6 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + u_xlat12.x;
    u_xlat6 = u_xlat6 + 6.10351563e-05;
    u_xlat36.x = dot(u_xlat17.xyz, u_xlat16_13.xyz);
    u_xlat10.z = u_xlat82 * u_xlat36.x;
    u_xlat10.y = u_xlat80 * u_xlat81;
    u_xlat80 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat10.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat6 = u_xlat80 * u_xlat6 + 6.10351563e-05;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat81;
    u_xlat1.x = u_xlat16_35.x * u_xlat82;
    u_xlat58 = u_xlat81 * u_xlat82;
    u_xlat1.z = u_xlat77 * u_xlat58;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat25.x = u_xlat58 * 0.318309873;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_15.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat36.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_75 = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = u_xlat16_35.xxx * u_xlat36.xyz;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.yyy + u_xlat16_19.xyz;
    u_xlat36.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_18.xyz;
    u_xlat1.x = dot(u_xlat36.xyz, u_xlat36.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat36.xyz = u_xlat1.xxx * u_xlat36.xyz;
    u_xlat16_59 = dot(u_xlat16_18.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat1.x;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat49 = (-u_xlat16_59) * u_xlat1.x + 1.0;
    u_xlat16_59 = u_xlat1.x * u_xlat16_59;
    u_xlat14.xyz = u_xlat16_3.xyz * vec3(u_xlat49);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat14.xyz;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat36.xyz);
    u_xlat20.y = u_xlat1.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat36.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat20.z = u_xlat1.x * u_xlat58;
    u_xlat20.x = u_xlat82 * u_xlat16_59;
    u_xlat1.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat58 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat25.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat49 = dot(u_xlat17.xyz, u_xlat16_18.xyz);
    u_xlat20.z = u_xlat49 * u_xlat82;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_18.xyz);
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat20.y = u_xlat81 * u_xlat16_59;
    u_xlat49 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat49 + u_xlat20.x;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat80 * u_xlat49 + 6.10351563e-05;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat1.x = u_xlat49 * u_xlat1.x;
    u_xlat36.xyz = u_xlat14.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_15.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat20.xxx * u_xlat36.xyz;
    u_xlat16_59 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_59 = (-u_xlat16_59) * u_xlat16_59 + 1.0;
    u_xlat16_59 = max(u_xlat16_59, 0.0);
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_59;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_35.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_85);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_18.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat36.xyz = u_xlat36.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat1.xz = u_xlat16_1.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xz = min(max(u_xlat1.xz, 0.0), 1.0);
#else
    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat36.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = u_xlat5.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_35.yyy + u_xlat16_22.xyz;
    u_xlat24.xyz = u_xlat24.xyz * u_xlat16_4.xxx + u_xlat16_21.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat16_59 = dot(u_xlat16_21.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat5.x = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat5.x;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat29 = (-u_xlat16_59) * u_xlat5.x + 1.0;
    u_xlat16_59 = u_xlat5.x * u_xlat16_59;
    u_xlat5.xyz = u_xlat16_3.xyz * vec3(u_xlat29);
    u_xlat5.xyz = u_xlat0.xxx * vec3(u_xlat16_59) + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat24.xyz);
    u_xlat77 = dot(u_xlat17.xyz, u_xlat16_21.xyz);
    u_xlat14.z = u_xlat77 * u_xlat82;
    u_xlat17.y = u_xlat0.x * u_xlat81;
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat24.xyz);
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat17.z = u_xlat0.x * u_xlat58;
    u_xlat17.x = u_xlat82 * u_xlat16_59;
    u_xlat0.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat58 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_59 = dot(u_xlat30.zxy, u_xlat16_21.xyz);
    u_xlat14.y = u_xlat81 * u_xlat16_59;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_59 = u_xlat16_59 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
    u_xlat24.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat14.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat80 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_15.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat14.xxx * u_xlat0.xyz;
    u_xlat16_85 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_75 = float(1.0) / float(u_xlat16_75);
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_85;
    u_xlat16_75 = max(u_xlat16_35.x, u_xlat16_75);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_35.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_35.x = max(u_xlat16_35.x, u_xlat16_59);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat16_15.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_19.xyz = u_xlat0.xyz * u_xlat1.zzz + u_xlat16_19.xyz;
    u_xlat16_75 = (-u_xlat16_74) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_75);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.zzz * u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat12.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat14.xxx + u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz + u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_21.xyz + u_xlat8.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_21.xyz = vec3(u_xlat16_75) * u_xlat16_21.xyz;
    u_xlat16_75 = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_75) + u_xlat16_35.x;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_35.x + u_xlat16_75;
    u_xlat16_75 = u_xlat16_46.z * u_xlat16_75;
    u_xlat16_35.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x + -1.0;
    u_xlat16_35.x = _OcclusionScale * u_xlat16_35.x + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_35.x;
    u_xlat0.x = min(u_xlat16_75, 1.0);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_74);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat24.xxx * u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_23.xyz);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_19.y = u_xlat16_21.y;
    u_xlat16_23.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = u_xlat16_35.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_23.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_19.xyw;
    u_xlat16_23.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz + u_xlat16_15.xyz;
    u_xlat16_59 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_15.xyz = vec3(u_xlat16_59) * vs_TEXCOORD1.yzx;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat24.xyz = (bool(u_xlatb1)) ? u_xlat24.xyz : u_xlat30.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * u_xlat24.xyz;
    u_xlat1.xyz = u_xlat24.zxy * u_xlat16_13.yzx + (-u_xlat1.xyz);
    u_xlat5.xyz = u_xlat24.xyz * u_xlat1.xyz;
    u_xlat24.xyz = u_xlat1.zxy * u_xlat24.yzx + (-u_xlat5.xyz);
    u_xlat24.xyz = (-u_xlat7.xyz) * vec3(u_xlat79) + u_xlat24.xyz;
    u_xlat16_59 = u_xlat16_11.x * 8.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0078125);
    u_xlat16_59 = min(u_xlat16_59, 1.0);
    u_xlat16_59 = u_xlat16_59 * abs(u_xlat16_83);
    u_xlat24.xyz = vec3(u_xlat16_59) * u_xlat24.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat16_21.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat25.xxx;
    u_xlat16_59 = dot((-u_xlat16_13.xyz), u_xlat24.xyz);
    u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
    u_xlat24.xyz = (-u_xlat24.xyz) * vec3(u_xlat16_59) + (-u_xlat16_13.xyz);
    u_xlat25.xyz = u_xlat7.xyz * vec3(u_xlat79) + (-u_xlat24.xyz);
    u_xlat25.xyz = u_xlat16_11.xxx * u_xlat25.xyz + u_xlat24.xyz;
    u_xlat5.xyz = u_xlat24.xyz + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat5.xyz + u_xlat25.xyz;
    u_xlat16_11.x = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_11.x = u_xlat16_74 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat16_11.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_11.x);
    u_xlat24.x = dot(u_xlat16_21.xyz, u_xlat24.xyz);
    u_xlat16_46.y = u_xlat24.x * 0.5;
    u_xlat16_59 = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_59;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat24.xyz = u_xlat16_11.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xzw = u_xlat24.xyz * u_xlat24.xyz;
    u_xlat16_11.xzw = u_xlat16_11.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_11.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb24 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb24)) ? u_xlat16_15.xyz : u_xlat16_11.xzw;
    u_xlat10.y = u_xlat16_74;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat16_3.xyz = u_xlat16_11.xzw * u_xlat16_3.xyz;
    u_xlat16_46.x = u_xlat10.y * 1.09769487;
    u_xlat16_11.xzw = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_4.w);
    u_xlat16_75 = u_xlat16_74 + 1.0;
    u_xlat16_75 = min(u_xlat16_75, 15.0);
    u_xlat16_4.x = u_xlat16_75 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_4.x = u_xlat16_74 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xz = u_xlat16_11.xz * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xz).x;
    u_xlat16_74 = u_xlat16_11.w * 15.0 + (-u_xlat16_74);
    u_xlat16_75 = (-u_xlat16_48) + u_xlat16_24.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_75 + u_xlat16_48;
    u_xlat16_74 = u_xlat16_35.x * u_xlat16_74;
    u_xlat24.x = u_xlat1.x * u_xlat16_74;
    u_xlat16_74 = u_xlat0.x * 0.5;
    u_xlat16_75 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat24.x * u_xlat16_75 + u_xlat16_74;
    u_xlat16_75 = u_xlat16_74 + u_xlat16_74;
    u_xlat16_11.x = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_11.x + u_xlat16_75;
    u_xlat16_74 = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = min(u_xlat16_74, u_xlat10.y);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_3.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat16_13.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_13.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_74 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_74);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_GlitterIntensity);
    u_xlat16_3.xyz = log2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_74 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_74) + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_3.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_51.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_74 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_74) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.zzz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.xyz;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.xyz;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.xyz;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
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
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _Cutoff;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _UpChangColorShrink;
uniform 	mediump float _UpChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump float _OcclusionScale;
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
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat29;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat35;
vec3 u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_45;
mediump float u_xlat16_50;
int u_xlati50;
float u_xlat51;
vec2 u_xlat53;
float u_xlat55;
float u_xlat57;
mediump vec2 u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_79;
float u_xlat81;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_1 = texture(_AlbedoChangTex, vs_TEXCOORD3.xy);
    u_xlat16_2.x = u_xlat16_0.w * u_xlat16_1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb75 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb75){discard;}
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat7.xyz = vec3(u_xlat76) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat8.xyz;
    u_xlat78 = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat78 = (-u_xlat78) * u_xlat78 + 1.0;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * vec3(u_xlat78) + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb75)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat2 = u_xlat2 + u_xlat4;
    u_xlat75 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) + u_xlat2.z;
    u_xlat78 = max((-u_xlat2.w), u_xlat75);
    u_xlat78 = (-u_xlat75) + u_xlat78;
    u_xlat2.z = _ShadowBias.y * u_xlat78 + u_xlat75;
    u_xlat4.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyw;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat75 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat3.x = (-u_xlat16_9.x) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat3.x + u_xlat16_9.x;
    u_xlat75 = (-u_xlat75) + 1.0;
    u_xlat16_3.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_9.x = u_xlat16_3.z * _ShadowStrength;
    u_xlat3.xy = u_xlat16_3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat75) * u_xlat16_9.x + 1.0;
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat16_9.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = vec3(u_xlat75) * u_xlat16_9.xyz + _ShadowColor.xyz;
    u_xlat75 = u_xlat75 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat75) + vec2(1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_84 = _ChangColorAmount * 1.29999995 + vs_TEXCOORD3.w;
    u_xlat16_84 = u_xlat16_84 + -1.0;
    u_xlat16_84 = u_xlat16_84 * 2.0 + -0.0599999987;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_15.xy).x;
    u_xlat16_88 = u_xlat16_84 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * _UpChangColorShrink + u_xlat16_0.x;
    u_xlat16_89 = u_xlat16_88 + -0.100000001;
    u_xlat16_88 = dot(vec2(u_xlat16_88), vec2(_ChangColorRange));
    u_xlat16_88 = u_xlat16_88 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = (-u_xlat16_88) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_88) * _ChangEdgeColor.xyz;
    u_xlat16_88 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * -2.0 + 3.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_88) * u_xlat16_15.xyz;
    u_xlat16_89 = u_xlat16_84 + -0.100000001;
    u_xlat16_84 = dot(vec2(u_xlat16_84), vec2(vec2(_UpChangColorRange, _UpChangColorRange)));
    u_xlat16_84 = u_xlat16_84 + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = (-u_xlat16_84) + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_84) * _UpChangEdgeColor.xyz;
    u_xlat16_84 = u_xlat16_89 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * -2.0 + 3.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_84 = min(u_xlat16_84, 1.0);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat16_84) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_15.z = 1.0;
    u_xlat16_84 = dot(u_xlat16_0.xyz, u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_84) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_89 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat1.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xxx;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat29 = (-u_xlat16_15.x) * u_xlat4.x + 1.0;
    u_xlat16_15.x = u_xlat4.x * u_xlat16_15.x;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat29);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_15.xxx + u_xlat4.xyz;
    u_xlat16_15.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_79 = texture(_AnisotropicTex, u_xlat16_15.xy).x;
    u_xlat79 = u_xlat16_79 * 2.0 + -1.0;
    u_xlat5.x = u_xlat79 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat79 = u_xlat79 * _SunShift + _SunShiftOffset;
    u_xlat79 = u_xlat79 + vs_TEXCOORD5;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat55 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat11.yzx) * vec3(u_xlat55) + u_xlat10.xyz;
    u_xlat55 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat6.xyz = vec3(u_xlat55) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat11.xyz;
    u_xlat7.xyz = u_xlat11.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat5.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat7.xyz = u_xlat5.xxx * u_xlat7.xyz;
    u_xlat5.x = dot(u_xlat7.xyz, u_xlat1.xyz);
    u_xlat16_15.x = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), vec2(u_xlat16_84));
    u_xlat16_40 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_40 = max(u_xlat16_40, 0.0078125);
    u_xlat81 = u_xlat16_15.x * u_xlat16_40;
    u_xlat16_15.x = u_xlat16_15.x + -1.0;
    u_xlat82 = (-u_xlat16_15.x) + 1.0;
    u_xlat82 = u_xlat82 * u_xlat16_40;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat81 = max(u_xlat81, 0.00100000005);
    u_xlat10.y = u_xlat5.x * u_xlat81;
    u_xlat16_15.x = dot(u_xlat6.zxy, u_xlat1.xyz);
    u_xlat10.x = u_xlat82 * u_xlat16_15.x;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat82 * u_xlat81;
    u_xlat10.z = u_xlat5.x * u_xlat83;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat83 / u_xlat10.x;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat83 = u_xlat83 * u_xlat10.x;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat10.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.z = u_xlat82 * u_xlat10.x;
    u_xlat16_65 = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat10.y = u_xlat81 * u_xlat16_65;
    u_xlat10.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat10.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat25.xyz * vec3(u_xlat16_89);
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat7.x * u_xlat82;
    u_xlat82 = dot(u_xlat6.zxy, u_xlat16_16.xyz);
    u_xlat7.y = u_xlat81 * u_xlat82;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat81 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat7.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat85 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = u_xlat83 * u_xlat81;
    u_xlat12.xyz = u_xlat4.xyz * vec3(u_xlat81);
    u_xlat16_17.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat16_17.xyz;
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_9.xyz * u_xlat12.xyz;
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat79) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz;
    u_xlat81 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_88 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), vec2(u_xlat16_84));
    u_xlat16_90 = u_xlat16_88 + -1.0;
    u_xlat83 = u_xlat16_88 * u_xlat16_40;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat85 = (-u_xlat16_90) + 1.0;
    u_xlat85 = u_xlat85 * u_xlat16_40;
    u_xlat85 = max(u_xlat85, 0.00100000005);
    u_xlat10.z = u_xlat81 * u_xlat85;
    u_xlat10.y = u_xlat16_65 * u_xlat83;
    u_xlat81 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat10.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat35 = dot(u_xlat18.xyz, u_xlat16_16.xyz);
    u_xlat7.z = u_xlat35 * u_xlat85;
    u_xlat7.y = u_xlat82 * u_xlat83;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat7.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat81 = u_xlat57 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat1.xyz);
    u_xlat1.y = u_xlat1.x * u_xlat83;
    u_xlat1.x = u_xlat16_15.x * u_xlat85;
    u_xlat82 = u_xlat83 * u_xlat85;
    u_xlat1.z = u_xlat5.x * u_xlat82;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat26.x = u_xlat82 * 0.318309873;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat81 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat16_17.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_9.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = u_xlat12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_15.zzz + u_xlat16_20.xyz;
    u_xlat12.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_19.xyz;
    u_xlat1.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat12.xyz = u_xlat1.xxx * u_xlat12.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat1.x;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat51 = (-u_xlat16_65) * u_xlat1.x + 1.0;
    u_xlat16_65 = u_xlat1.x * u_xlat16_65;
    u_xlat21.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat21.xyz = u_xlat0.xxx * vec3(u_xlat16_65) + u_xlat21.xyz;
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat12.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat83;
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat12.xyz);
    u_xlat1.x = dot(u_xlat11.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat22.z = u_xlat1.x * u_xlat82;
    u_xlat22.x = u_xlat85 * u_xlat16_65;
    u_xlat1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat82 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat26.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat51 = dot(u_xlat18.xyz, u_xlat16_19.xyz);
    u_xlat12.z = u_xlat51 * u_xlat85;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(u_xlat6.zxy, u_xlat16_19.xyz);
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat12.y = u_xlat83 * u_xlat16_65;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat12.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat57 * u_xlat51 + 6.10351563e-05;
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat1.x = u_xlat51 * u_xlat1.x;
    u_xlat37.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat12.xxx * u_xlat37.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_15.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_15.x = max(u_xlat16_15.x, u_xlat16_91);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_15.x;
    u_xlat16_19.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat37.xyz = u_xlat37.xyz * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat37.xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_15.x = inversesqrt(u_xlat16_88);
    u_xlat16_23.xyz = u_xlat4.xyz * u_xlat16_15.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xz = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.zzz + u_xlat16_24.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat16_89) + u_xlat16_23.xyz;
    u_xlat1.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat1.xxx;
    u_xlat16_89 = dot(u_xlat16_23.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat1.x;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat51 = (-u_xlat16_89) * u_xlat1.x + 1.0;
    u_xlat16_89 = u_xlat1.x * u_xlat16_89;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat51);
    u_xlat4.xyz = u_xlat0.xxx * vec3(u_xlat16_89) + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat18.xyz, u_xlat25.xyz);
    u_xlat1.x = dot(u_xlat18.xyz, u_xlat16_23.xyz);
    u_xlat18.z = u_xlat1.x * u_xlat85;
    u_xlat21.y = u_xlat0.x * u_xlat83;
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat25.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat21.z = u_xlat0.x * u_xlat82;
    u_xlat21.x = u_xlat85 * u_xlat16_89;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat82 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat26.x * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_89 = dot(u_xlat6.zxy, u_xlat16_23.xyz);
    u_xlat18.y = u_xlat83 * u_xlat16_89;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x + u_xlat18.x;
    u_xlat25.x = u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = u_xlat57 * u_xlat25.x + 6.10351563e-05;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_17.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx * u_xlat0.xyz;
    u_xlat16_65 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = float(1.0) / float(u_xlat16_88);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_65;
    u_xlat16_88 = max(u_xlat16_15.x, u_xlat16_88);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_15.x = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_15.x);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat3.yyy + u_xlat16_20.xyz;
    u_xlat16_88 = (-u_xlat16_84) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat3.yyy * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_19.xyz = u_xlat3.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat12.xxx * u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat10.xxx + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat18.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_19.xyz;
    u_xlat16_88 = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_88 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_88) + u_xlat16_89;
    u_xlat16_15.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_15.x + 1.0;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_89 + u_xlat16_88;
    u_xlat16_88 = u_xlat16_45.z * u_xlat16_88;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _OcclusionScale * u_xlat16_89 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat0.xy = min(u_xlat53.xy, vec2(u_xlat16_88));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_84);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_23.y = u_xlat16_19.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_23.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_89) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati50 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_88 = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_24.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat79) * u_xlat16_13.xyz + u_xlat30.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_90>=0.0);
#else
    u_xlatb1 = u_xlat16_90>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_16.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat3.xyz);
    u_xlat0.xzw = (-u_xlat8.xyz) * vec3(u_xlat76) + u_xlat0.xzw;
    u_xlat16_13.x = u_xlat16_40 * 8.0;
    u_xlat16_38 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_38 = max(u_xlat16_38, 0.0078125);
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x * abs(u_xlat16_90);
    u_xlat0.xzw = u_xlat16_13.xxx * u_xlat0.xzw + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat26.xxx;
    u_xlat16_13.x = dot((-u_xlat16_16.xyz), u_xlat0.xzw);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_13.xxx + (-u_xlat16_16.xyz);
    u_xlat26.xyz = u_xlat8.xyz * vec3(u_xlat76) + (-u_xlat0.xzw);
    u_xlat26.xyz = vec3(u_xlat16_38) * u_xlat26.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat26.xyz);
    u_xlat26.xyz = abs(vec3(u_xlat16_90)) * u_xlat3.xyz + u_xlat26.xyz;
    u_xlat16_13.x = -abs(u_xlat16_90) * 0.800000012 + 1.0;
    u_xlat16_13.x = u_xlat16_84 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_13.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xzw);
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_38 = dot(_IndirectCubemapRotationParams.xy, u_xlat26.xz);
    u_xlat26.z = dot(_IndirectCubemapRotationParams.zw, u_xlat26.xz);
    u_xlat26.x = u_xlat16_38;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat26.xyz, u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_84;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_45.x = u_xlat7.y * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_2.w);
    u_xlat16_88 = u_xlat16_84 + 1.0;
    u_xlat16_88 = min(u_xlat16_88, 15.0);
    u_xlat16_2.x = u_xlat16_88 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_84 = u_xlat16_14.z * 15.0 + (-u_xlat16_84);
    u_xlat16_88 = (-u_xlat16_50) + u_xlat16_0.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88 + u_xlat16_50;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.y * 0.5;
    u_xlat16_88 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_88 + u_xlat16_84;
    u_xlat16_88 = u_xlat16_84 + u_xlat16_84;
    u_xlat16_14.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_14.x + u_xlat16_88;
    u_xlat16_84 = u_xlat0.y * u_xlat16_84;
    u_xlat16_84 = min(u_xlat7.y, u_xlat16_84);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_13.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vs_TEXCOORD2.www;
    u_xlat0.y = dot(u_xlat16_13.xyz, u_xlat16_16.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_16.xyz);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_84 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_84);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_GlitterIntensity);
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = min(u_xlat16_13.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_13.xyz = u_xlat16_13.xyz * _GlitterColor.xyz;
    u_xlat16_0.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_84 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat16_84) + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_63.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_13.xy = u_xlat16_63.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = u_xlat16_13.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_13.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_84 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_13.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_0.zzz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_9.xyz;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" }
  GpuProgramID 139028
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Hair_FlowLight_Glitter_ColorChangeGUI"
}