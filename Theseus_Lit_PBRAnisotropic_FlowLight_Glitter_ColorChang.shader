//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_FlowLight_Glitter_ColorChang" {
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

_ChangEdgeColor ("基础换色边缘颜色", Color) = (1,1,1,1)

_ChangColorShrink ("基础换色边缘压缩", Float) = 4.0

_ChangColorRange ("基础换色边缘范围", Float) = 1.0

_SoftChangEdgeColor ("过度换色边缘颜色", Color) = (1,1,1,1)

_SoftChangColorShrink ("过度换色边缘压缩", Float) = 4.0

_SoftChangColorRange ("过度换色边缘范围", Float) = 1.0

_ChangColorAmount ("换色进度", Range(-2, 2)) = 0.0

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

_USE_MENDS_LIGHT ("补光开关", Float) = 0.0

_MendsLightMask ("补光遮罩贴图", 2D) = "white" { }

_MendsLightDirection ("补光1方向", Vector) = (1,0,1,0)

_MendsLightColor ("补光1颜色", Color) = (1,1,1,1)

_MendsLightFallOff ("补光1衰减", Range(0, 1)) = 0.0

_MendsLightDirection2 ("补光2方向", Vector) = (1,0,1,0)

_MendsLightColor2 ("补光2颜色", Color) = (1,1,1,1)

_MendsLightFallOff2 ("补光2衰减", Range(0, 1)) = 0.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 513
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
ivec3 u_xlati7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump vec3 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat30;
vec3 u_xlat37;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_51;
float u_xlat53;
float u_xlat69;
mediump float u_xlat16_69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_24.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24.x = (-u_xlat16_24.x) * u_xlat16_24.x + 1.0;
    u_xlat16_24.x = max(u_xlat16_24.x, 0.0);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_47 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_24.x * u_xlat16_47;
    u_xlat16_24.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_24.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_24.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_2.xyz * u_xlat16_24.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
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
    u_xlat16_25 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_25, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_1.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_71 = u_xlat16_1.x * _SoftChangColorShrink + u_xlat16_0.x;
    u_xlat16_1.x = u_xlat16_1.x * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_71 + -0.100000001;
    u_xlat16_71 = dot(vec2(u_xlat16_71), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_71 = u_xlat16_71 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_71) * _SoftChangEdgeColor.zxy;
    u_xlat16_71 = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_71 * -2.0 + 3.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_3.x;
    u_xlat16_71 = min(u_xlat16_71, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_71) * u_xlat16_26.xyz;
    u_xlat16_71 = dot(u_xlat16_1.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_71) * _ChangEdgeColor.zxy;
    u_xlat16_71 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz;
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.zxy + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = u_xlat16_5.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_4.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat7.xyz;
    u_xlat16_72 = dot(u_xlat16_24.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat69;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat75 = (-u_xlat16_72) * u_xlat69 + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(u_xlat75);
    u_xlat8.xyz = u_xlat0.xxx * vec3(u_xlat16_72) + u_xlat8.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_69 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat69 = u_xlat16_69 * 2.0 + -1.0;
    u_xlat69 = u_xlat69 * _SunShift + _SunShiftOffset;
    u_xlat69 = u_xlat69 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = u_xlat16_28.xyz * vec3(u_xlat76);
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_28.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_28.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat9.xyz;
    u_xlat77 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat77) + u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat69) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat13.xyz = vec3(u_xlat75) * u_xlat13.xyz;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_72 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_0.zz);
    u_xlat16_73 = u_xlat16_72 + -1.0;
    u_xlat77 = (-u_xlat16_73) + 1.0;
    u_xlat16_28.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat77 = u_xlat77 * u_xlat16_28.x;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat77;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat75 = u_xlat16_72 * u_xlat16_28.x;
    u_xlat78 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat78;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat14.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_24.xyz = vec3(u_xlat16_71) * u_xlat6.xyz;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat77 * u_xlat80;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat78 * u_xlat80;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat15.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat7.xyz);
    u_xlat16.y = u_xlat78 * u_xlat81;
    u_xlat16_72 = dot(u_xlat10.zxy, u_xlat7.xyz);
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_72 * u_xlat77;
    u_xlat30 = u_xlat77 * u_xlat78;
    u_xlat16.z = u_xlat7.x * u_xlat30;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat30 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat53 = u_xlat30 * 0.318309873;
    u_xlat7.x = u_xlat53 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat7.x = u_xlat79 * u_xlat7.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_7.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat7.x = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat37.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat79 = dot(u_xlat37.xyz, u_xlat37.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat37.xyz = vec3(u_xlat79) * u_xlat37.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat79 * u_xlat79;
    u_xlat16_1.x = u_xlat79 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat79 * u_xlat16_1.x;
    u_xlat81 = (-u_xlat16_1.x) * u_xlat79 + 1.0;
    u_xlat16_1.x = u_xlat79 * u_xlat16_1.x;
    u_xlat16.xyz = u_xlat16_4.xyz * vec3(u_xlat81);
    u_xlat16.xyz = u_xlat0.xxx * u_xlat16_1.xxx + u_xlat16.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat37.xyz);
    u_xlat18.y = u_xlat78 * u_xlat79;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat37.xyz);
    u_xlat79 = dot(u_xlat11.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat30 * u_xlat79;
    u_xlat18.x = u_xlat16_1.x * u_xlat77;
    u_xlat79 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat79 = max(u_xlat79, 6.10351563e-05);
    u_xlat79 = u_xlat30 / u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat53 * u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat81 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat77 * u_xlat81;
    u_xlat18.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_1.x * u_xlat78;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat18.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat80 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat79 = u_xlat79 * u_xlat81;
    u_xlat37.xyz = u_xlat16.xyz * vec3(u_xlat79);
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat18.xxx * u_xlat37.xyz;
    u_xlat16_19.xyz = u_xlat37.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat8.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_51.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_51.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_51.yyy + u_xlat16_21.xyz;
    u_xlat8.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_20.xyz;
    u_xlat79 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat79);
    u_xlat16_71 = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat79 * u_xlat79;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat81 = (-u_xlat16_71) * u_xlat79 + 1.0;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat37.xyz = u_xlat16_4.xyz * vec3(u_xlat81);
    u_xlat37.xyz = u_xlat0.xxx * vec3(u_xlat16_71) + u_xlat37.xyz;
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat8.xyz);
    u_xlat79 = dot(u_xlat13.xyz, u_xlat16_20.xyz);
    u_xlat13.z = u_xlat77 * u_xlat79;
    u_xlat16.y = u_xlat0.x * u_xlat78;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat0.x * u_xlat30;
    u_xlat16.x = u_xlat16_71 * u_xlat77;
    u_xlat0.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat30 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat53 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16_20.xyz);
    u_xlat13.y = u_xlat16_71 * u_xlat78;
    u_xlat13.x = dot(u_xlat11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat30 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = u_xlat30 + u_xlat13.x;
    u_xlat30 = u_xlat30 + 6.10351563e-05;
    u_xlat30 = u_xlat80 * u_xlat30 + 6.10351563e-05;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat0.x * u_xlat30;
    u_xlat8.xyz = u_xlat37.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat16_17.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat13.xxx * u_xlat8.xyz;
    u_xlat16_72 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_72;
    u_xlat16_1.x = max(u_xlat16_51.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat8.xyz * u_xlat7.xxx + u_xlat16_19.xyz;
    u_xlat16_1.x = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat13.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_OcclusionScale) * u_xlat16_20.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_1.x;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat23 = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_22.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_22.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati7.x = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati7.x].xyz + u_xlat16_19.xyw;
    u_xlat16_22.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat16_3.xyz + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat7.xyz = vec3(u_xlat23) * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb23 = u_xlat16_73>=0.0;
#endif
    u_xlat7.xyz = (bool(u_xlatb23)) ? u_xlat7.xyz : u_xlat10.xyz;
    u_xlat8.xyz = u_xlat16_24.xyz * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat7.zxy * u_xlat16_24.yzx + (-u_xlat8.xyz);
    u_xlat10.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat8.zxy * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat7.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + u_xlat7.xyz;
    u_xlat16_3.x = u_xlat16_28.x * 8.0;
    u_xlat16_26.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_28.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_28.x = abs(u_xlat16_73) * u_xlat16_28.x;
    u_xlat7.xyz = u_xlat16_28.xxx * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat23 = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat69 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat7.xyz;
    u_xlat16_28.x = dot((-u_xlat16_24.xyz), u_xlat7.xyz);
    u_xlat16_28.x = u_xlat16_28.x + u_xlat16_28.x;
    u_xlat7.xyz = (-u_xlat7.xyz) * u_xlat16_28.xxx + (-u_xlat16_24.xyz);
    u_xlat8.xyz = u_xlat9.xyz * vec3(u_xlat76) + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat16_26.xxx * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat8.xyz = abs(vec3(u_xlat16_73)) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat16_73 = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_73 = u_xlat16_5.x * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_73);
    u_xlat69 = dot(u_xlat16_20.xyz, u_xlat7.xyz);
    u_xlat16_44.y = u_xlat69 * 0.5;
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_28.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_73);
    u_xlat16_28.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat7.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb69 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_28.xyz = (bool(u_xlatb69)) ? u_xlat16_17.xyz : u_xlat16_28.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_44.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_4.xyz = u_xlat16_28.xyz * u_xlat16_4.xyz;
    u_xlat16_3.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_3.w);
    u_xlat16_73 = u_xlat16_1.x + 1.0;
    u_xlat16_73 = min(u_xlat16_73, 15.0);
    u_xlat16_3.x = u_xlat16_73 * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_69 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_3.x = u_xlat16_1.x * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_1.x = u_xlat16_17.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_73 = u_xlat16_69 + (-u_xlat16_7.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_7.x;
    u_xlat16_1.x = u_xlat16_71 * u_xlat16_1.x;
    u_xlat23 = u_xlat23 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat23 * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_71 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_73 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_71;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_0.z, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat16_24.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_24.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_24.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat7.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(1.5, 1.5);
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_7.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_GlitterIntensity);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlitterColor.zxy;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_48.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_48.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_2.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_2.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_70 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_70) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_0.yyy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_23.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_23.xyz;
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
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
ivec3 u_xlati7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump vec3 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat30;
vec3 u_xlat37;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_51;
float u_xlat53;
float u_xlat69;
mediump float u_xlat16_69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_24.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24.x = (-u_xlat16_24.x) * u_xlat16_24.x + 1.0;
    u_xlat16_24.x = max(u_xlat16_24.x, 0.0);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_47 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_24.x * u_xlat16_47;
    u_xlat16_24.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_24.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_24.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_2.xyz * u_xlat16_24.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
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
    u_xlat16_25 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_25, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_1.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_71 = u_xlat16_1.x * _SoftChangColorShrink + u_xlat16_0.x;
    u_xlat16_1.x = u_xlat16_1.x * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_71 + -0.100000001;
    u_xlat16_71 = dot(vec2(u_xlat16_71), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_71 = u_xlat16_71 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_71) * _SoftChangEdgeColor.zxy;
    u_xlat16_71 = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_71 * -2.0 + 3.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_3.x;
    u_xlat16_71 = min(u_xlat16_71, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_71) * u_xlat16_26.xyz;
    u_xlat16_71 = dot(u_xlat16_1.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_71) * _ChangEdgeColor.zxy;
    u_xlat16_71 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz;
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.zxy + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = u_xlat16_5.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_4.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat7.xyz;
    u_xlat16_72 = dot(u_xlat16_24.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat69;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat75 = (-u_xlat16_72) * u_xlat69 + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(u_xlat75);
    u_xlat8.xyz = u_xlat0.xxx * vec3(u_xlat16_72) + u_xlat8.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_69 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat69 = u_xlat16_69 * 2.0 + -1.0;
    u_xlat69 = u_xlat69 * _SunShift + _SunShiftOffset;
    u_xlat69 = u_xlat69 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = u_xlat16_28.xyz * vec3(u_xlat76);
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_28.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_28.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat9.xyz;
    u_xlat77 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat77) + u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat69) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat13.xyz = vec3(u_xlat75) * u_xlat13.xyz;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_72 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_0.zz);
    u_xlat16_73 = u_xlat16_72 + -1.0;
    u_xlat77 = (-u_xlat16_73) + 1.0;
    u_xlat16_28.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat77 = u_xlat77 * u_xlat16_28.x;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat77;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat75 = u_xlat16_72 * u_xlat16_28.x;
    u_xlat78 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat78;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat14.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_24.xyz = vec3(u_xlat16_71) * u_xlat6.xyz;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat77 * u_xlat80;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat78 * u_xlat80;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat15.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat7.xyz);
    u_xlat16.y = u_xlat78 * u_xlat81;
    u_xlat16_72 = dot(u_xlat10.zxy, u_xlat7.xyz);
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_72 * u_xlat77;
    u_xlat30 = u_xlat77 * u_xlat78;
    u_xlat16.z = u_xlat7.x * u_xlat30;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat30 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat53 = u_xlat30 * 0.318309873;
    u_xlat7.x = u_xlat53 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat7.x = u_xlat79 * u_xlat7.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_17.xyz + _DirectSpecularColor.zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_7.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat7.x = u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat37.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat79 = dot(u_xlat37.xyz, u_xlat37.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat37.xyz = vec3(u_xlat79) * u_xlat37.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat79 * u_xlat79;
    u_xlat16_1.x = u_xlat79 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat79 * u_xlat16_1.x;
    u_xlat81 = (-u_xlat16_1.x) * u_xlat79 + 1.0;
    u_xlat16_1.x = u_xlat79 * u_xlat16_1.x;
    u_xlat16.xyz = u_xlat16_4.xyz * vec3(u_xlat81);
    u_xlat16.xyz = u_xlat0.xxx * u_xlat16_1.xxx + u_xlat16.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat37.xyz);
    u_xlat18.y = u_xlat78 * u_xlat79;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat37.xyz);
    u_xlat79 = dot(u_xlat11.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat30 * u_xlat79;
    u_xlat18.x = u_xlat16_1.x * u_xlat77;
    u_xlat79 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat79 = max(u_xlat79, 6.10351563e-05);
    u_xlat79 = u_xlat30 / u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat53 * u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat81 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat77 * u_xlat81;
    u_xlat18.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_1.x * u_xlat78;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat18.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat80 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat79 = u_xlat79 * u_xlat81;
    u_xlat37.xyz = u_xlat16.xyz * vec3(u_xlat79);
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat18.xxx * u_xlat37.xyz;
    u_xlat16_19.xyz = u_xlat37.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat8.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_51.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_51.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_51.yyy + u_xlat16_21.xyz;
    u_xlat8.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_20.xyz;
    u_xlat79 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat79);
    u_xlat16_71 = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat79 * u_xlat79;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat81 = (-u_xlat16_71) * u_xlat79 + 1.0;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat37.xyz = u_xlat16_4.xyz * vec3(u_xlat81);
    u_xlat37.xyz = u_xlat0.xxx * vec3(u_xlat16_71) + u_xlat37.xyz;
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat8.xyz);
    u_xlat79 = dot(u_xlat13.xyz, u_xlat16_20.xyz);
    u_xlat13.z = u_xlat77 * u_xlat79;
    u_xlat16.y = u_xlat0.x * u_xlat78;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat0.x * u_xlat30;
    u_xlat16.x = u_xlat16_71 * u_xlat77;
    u_xlat0.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat30 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat53 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16_20.xyz);
    u_xlat13.y = u_xlat16_71 * u_xlat78;
    u_xlat13.x = dot(u_xlat11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat30 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = u_xlat30 + u_xlat13.x;
    u_xlat30 = u_xlat30 + 6.10351563e-05;
    u_xlat30 = u_xlat80 * u_xlat30 + 6.10351563e-05;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat0.x * u_xlat30;
    u_xlat8.xyz = u_xlat37.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat16_17.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat13.xxx * u_xlat8.xyz;
    u_xlat16_72 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_72;
    u_xlat16_1.x = max(u_xlat16_51.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat8.xyz * u_xlat7.xxx + u_xlat16_19.xyz;
    u_xlat16_1.x = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat13.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_OcclusionScale) * u_xlat16_20.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_1.x;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat23 = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_22.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_22.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati7.x = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati7.x].xyz + u_xlat16_19.xyw;
    u_xlat16_22.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat16_3.xyz + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat7.xyz = vec3(u_xlat23) * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb23 = u_xlat16_73>=0.0;
#endif
    u_xlat7.xyz = (bool(u_xlatb23)) ? u_xlat7.xyz : u_xlat10.xyz;
    u_xlat8.xyz = u_xlat16_24.xyz * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat7.zxy * u_xlat16_24.yzx + (-u_xlat8.xyz);
    u_xlat10.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat8.zxy * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat7.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + u_xlat7.xyz;
    u_xlat16_3.x = u_xlat16_28.x * 8.0;
    u_xlat16_26.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_28.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_28.x = abs(u_xlat16_73) * u_xlat16_28.x;
    u_xlat7.xyz = u_xlat16_28.xxx * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat23 = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat69 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat7.xyz;
    u_xlat16_28.x = dot((-u_xlat16_24.xyz), u_xlat7.xyz);
    u_xlat16_28.x = u_xlat16_28.x + u_xlat16_28.x;
    u_xlat7.xyz = (-u_xlat7.xyz) * u_xlat16_28.xxx + (-u_xlat16_24.xyz);
    u_xlat8.xyz = u_xlat9.xyz * vec3(u_xlat76) + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat16_26.xxx * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.xyz + (-u_xlat8.xyz);
    u_xlat8.xyz = abs(vec3(u_xlat16_73)) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat16_73 = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_73 = u_xlat16_5.x * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_73);
    u_xlat69 = dot(u_xlat16_20.xyz, u_xlat7.xyz);
    u_xlat16_44.y = u_xlat69 * 0.5;
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat8.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat8.x = u_xlat16_28.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat8.xyz, u_xlat16_73);
    u_xlat16_28.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat7.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat7.xyz * u_xlat7.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb69 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_28.xyz = (bool(u_xlatb69)) ? u_xlat16_17.xyz : u_xlat16_28.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_44.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_4.xyz = u_xlat16_28.xyz * u_xlat16_4.xyz;
    u_xlat16_3.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_3.w);
    u_xlat16_73 = u_xlat16_1.x + 1.0;
    u_xlat16_73 = min(u_xlat16_73, 15.0);
    u_xlat16_3.x = u_xlat16_73 * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_69 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_3.x = u_xlat16_1.x * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_7.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_1.x = u_xlat16_17.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_73 = u_xlat16_69 + (-u_xlat16_7.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_7.x;
    u_xlat16_1.x = u_xlat16_71 * u_xlat16_1.x;
    u_xlat23 = u_xlat23 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat23 * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_71 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_73 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_71;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_0.z, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat16_24.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_24.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_24.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat7.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(1.5, 1.5);
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_7.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_GlitterIntensity);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlitterColor.zxy;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_48.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_48.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_2.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_2.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_70 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_70) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_0.yyy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_23.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_23.xyz;
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
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(15) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(16) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
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
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_24;
float u_xlat25;
float u_xlat27;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump vec3 u_xlat16_39;
vec3 u_xlat40;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat51;
mediump vec2 u_xlat16_59;
float u_xlat72;
mediump float u_xlat16_72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
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
    u_xlat24 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_24.x * _ShadowStrength;
    u_xlat24 = u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_35 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = u_xlat16_11.x * u_xlat16_35;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb72 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb72)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_72 = texture(_ChangColorDissolveTex, u_xlat16_13.xy).x;
    u_xlat16_79 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_83 = u_xlat16_79 * _SoftChangColorShrink + u_xlat16_72;
    u_xlat16_79 = u_xlat16_79 * _ChangColorShrink + u_xlat16_72;
    u_xlat16_84 = u_xlat16_83 + -0.100000001;
    u_xlat16_83 = dot(vec2(u_xlat16_83), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_83 = u_xlat16_83 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_83) * _SoftChangEdgeColor.zxy;
    u_xlat16_83 = u_xlat16_84 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_84;
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_83) * u_xlat16_13.xyz;
    u_xlat16_83 = dot(vec2(u_xlat16_79), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_79 = u_xlat16_79 + -0.100000001;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_83) * _ChangEdgeColor.zxy;
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat16_79) + u_xlat16_13.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_1.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_1.zxy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoChangColor.zxy + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_15.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat72 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_11.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_84 = dot(u_xlat16_11.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat1.x;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat73 = (-u_xlat16_84) * u_xlat1.x + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_39.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_39.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb73 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat73 = (u_xlatb73) ? 1.0 : -1.0;
    u_xlat73 = u_xlat73 * vs_TEXCOORD2.w;
    u_xlat74 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat74) + u_xlat8.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_84 + -1.0;
    u_xlat74 = (-u_xlat16_85) + 1.0;
    u_xlat16_86 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_86 = max(u_xlat16_86, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_86;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat16.z = u_xlat73 * u_xlat74;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat73 = u_xlat16_84 * u_xlat16_86;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat16.y = u_xlat16_11.x * u_xlat73;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat76 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat17.z = u_xlat74 * u_xlat76;
    u_xlat17.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat17.y = u_xlat73 * u_xlat76;
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat17.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat18.y = u_xlat73 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat74 * u_xlat16_84;
    u_xlat27 = u_xlat74 * u_xlat73;
    u_xlat18.z = u_xlat3.x * u_xlat27;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat51 = u_xlat27 * 0.318309873;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat16_39.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz + _DirectSpecularColor.zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_39.xyz;
    u_xlat4.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat40.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat40.xyz, u_xlat40.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat40.xyz = u_xlat3.xxx * u_xlat40.xyz;
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat3.x;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat75 = (-u_xlat16_79) * u_xlat3.x + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat18.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat72) * vec3(u_xlat16_79) + u_xlat18.xyz;
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat40.xyz);
    u_xlat19.y = u_xlat73 * u_xlat3.x;
    u_xlat16_79 = dot(u_xlat5.zxy, u_xlat40.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat3.x * u_xlat27;
    u_xlat19.x = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat75 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat74 * u_xlat75;
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat73 * u_xlat16_79;
    u_xlat75 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat19.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat40.xyz = u_xlat18.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat40.xyz = min(max(u_xlat40.xyz, 0.0), 1.0);
#else
    u_xlat40.xyz = clamp(u_xlat40.xyz, 0.0, 1.0);
#endif
    u_xlat40.xyz = u_xlat16_39.xyz * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat19.xxx * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat40.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat40.xyz * u_xlat16_7.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat3.x;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat75 = (-u_xlat16_83) * u_xlat3.x + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_83) + u_xlat4.xyz;
    u_xlat72 = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat16_21.xyz);
    u_xlat10.z = u_xlat74 * u_xlat3.x;
    u_xlat18.y = u_xlat72 * u_xlat73;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat72 = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat72 * u_xlat27;
    u_xlat18.x = u_xlat74 * u_xlat16_83;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat27 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat51 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat10.y = u_xlat73 * u_xlat16_83;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat10.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat73 = u_xlat76 * u_xlat73 + 6.10351563e-05;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat2.xyz = u_xlat4.xyz * vec3(u_xlat72);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_39.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * vec3(u_xlat24) + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39.xyz = vec3(u_xlat24) * u_xlat16_39.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat24) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_39.xyz * u_xlat10.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_39.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_39.xyz = vec3(_OcclusionScale) * u_xlat16_39.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat16_39.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat9.xyz);
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
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_39.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_39.xz);
    u_xlat16_21.y = u_xlat16_39.y;
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
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_11.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_11.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_12.x = u_xlat16_86 * 8.0;
    u_xlat16_36 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_36 = max(u_xlat16_36, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = u_xlat16_12.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_12.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_39.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat0.xzw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_36) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_12.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_12.x = u_xlat16_15.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat0.x = dot(u_xlat16_39.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_36 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_36;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat17.y = u_xlat16_15.x;
    u_xlat16_44.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_84 = u_xlat16_79 + 1.0;
    u_xlat16_84 = min(u_xlat16_84, 15.0);
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_84 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_79 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_79);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_GlitterIntensity);
    u_xlat16_11.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = min(u_xlat16_11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_11.xyz = u_xlat16_11.xyz * _GlitterColor.zxy;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_11.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_11.xy = u_xlat16_59.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_11.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_11.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_79 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy + u_xlat16_7.xyz;
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
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(15) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(16) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
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
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_24;
float u_xlat25;
float u_xlat27;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump vec3 u_xlat16_39;
vec3 u_xlat40;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat51;
mediump vec2 u_xlat16_59;
float u_xlat72;
mediump float u_xlat16_72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
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
    u_xlat24 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_24.x * _ShadowStrength;
    u_xlat24 = u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_35 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = u_xlat16_11.x * u_xlat16_35;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb72 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb72)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_72 = texture(_ChangColorDissolveTex, u_xlat16_13.xy).x;
    u_xlat16_79 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_83 = u_xlat16_79 * _SoftChangColorShrink + u_xlat16_72;
    u_xlat16_79 = u_xlat16_79 * _ChangColorShrink + u_xlat16_72;
    u_xlat16_84 = u_xlat16_83 + -0.100000001;
    u_xlat16_83 = dot(vec2(u_xlat16_83), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_83 = u_xlat16_83 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_83) * _SoftChangEdgeColor.zxy;
    u_xlat16_83 = u_xlat16_84 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_84;
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_83) * u_xlat16_13.xyz;
    u_xlat16_83 = dot(vec2(u_xlat16_79), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_79 = u_xlat16_79 + -0.100000001;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_83) * _ChangEdgeColor.zxy;
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat16_79) + u_xlat16_13.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_1.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_1.zxy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoChangColor.zxy + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_15.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat72 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_11.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_84 = dot(u_xlat16_11.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat1.x;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat73 = (-u_xlat16_84) * u_xlat1.x + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_39.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_39.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb73 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat73 = (u_xlatb73) ? 1.0 : -1.0;
    u_xlat73 = u_xlat73 * vs_TEXCOORD2.w;
    u_xlat74 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat74) + u_xlat8.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_84 + -1.0;
    u_xlat74 = (-u_xlat16_85) + 1.0;
    u_xlat16_86 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_86 = max(u_xlat16_86, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_86;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat16.z = u_xlat73 * u_xlat74;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat73 = u_xlat16_84 * u_xlat16_86;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat16.y = u_xlat16_11.x * u_xlat73;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat76 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat17.z = u_xlat74 * u_xlat76;
    u_xlat17.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat17.y = u_xlat73 * u_xlat76;
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat17.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat18.y = u_xlat73 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat74 * u_xlat16_84;
    u_xlat27 = u_xlat74 * u_xlat73;
    u_xlat18.z = u_xlat3.x * u_xlat27;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat51 = u_xlat27 * 0.318309873;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat16_39.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz + _DirectSpecularColor.zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_39.xyz;
    u_xlat4.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat40.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat40.xyz, u_xlat40.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat40.xyz = u_xlat3.xxx * u_xlat40.xyz;
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat3.x;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat75 = (-u_xlat16_79) * u_xlat3.x + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat18.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat72) * vec3(u_xlat16_79) + u_xlat18.xyz;
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat40.xyz);
    u_xlat19.y = u_xlat73 * u_xlat3.x;
    u_xlat16_79 = dot(u_xlat5.zxy, u_xlat40.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat3.x * u_xlat27;
    u_xlat19.x = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat75 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat74 * u_xlat75;
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat73 * u_xlat16_79;
    u_xlat75 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat19.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat40.xyz = u_xlat18.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat40.xyz = min(max(u_xlat40.xyz, 0.0), 1.0);
#else
    u_xlat40.xyz = clamp(u_xlat40.xyz, 0.0, 1.0);
#endif
    u_xlat40.xyz = u_xlat16_39.xyz * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat19.xxx * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat40.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat40.xyz * u_xlat16_7.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat3.x;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat75 = (-u_xlat16_83) * u_xlat3.x + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_83) + u_xlat4.xyz;
    u_xlat72 = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat16_21.xyz);
    u_xlat10.z = u_xlat74 * u_xlat3.x;
    u_xlat18.y = u_xlat72 * u_xlat73;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat72 = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat72 * u_xlat27;
    u_xlat18.x = u_xlat74 * u_xlat16_83;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat27 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat51 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat10.y = u_xlat73 * u_xlat16_83;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat10.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat73 = u_xlat76 * u_xlat73 + 6.10351563e-05;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat2.xyz = u_xlat4.xyz * vec3(u_xlat72);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_39.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * vec3(u_xlat24) + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39.xyz = vec3(u_xlat24) * u_xlat16_39.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat24) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_39.xyz * u_xlat10.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_39.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_39.xyz = vec3(_OcclusionScale) * u_xlat16_39.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat16_39.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat9.xyz);
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
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_39.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_39.xz);
    u_xlat16_21.y = u_xlat16_39.y;
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
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_11.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_11.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_12.x = u_xlat16_86 * 8.0;
    u_xlat16_36 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_36 = max(u_xlat16_36, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = u_xlat16_12.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_12.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_39.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat0.xzw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_36) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_12.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_12.x = u_xlat16_15.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat0.x = dot(u_xlat16_39.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_36 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_36;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat17.y = u_xlat16_15.x;
    u_xlat16_44.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_84 = u_xlat16_79 + 1.0;
    u_xlat16_84 = min(u_xlat16_84, 15.0);
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_84 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_79 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_79);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_GlitterIntensity);
    u_xlat16_11.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = min(u_xlat16_11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_11.xyz = u_xlat16_11.xyz * _GlitterColor.zxy;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_11.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_11.xy = u_xlat16_59.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_11.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_11.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_79 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy + u_xlat16_7.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
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
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat22;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_40;
mediump vec2 u_xlat16_44;
float u_xlat47;
float u_xlat64;
mediump float u_xlat16_64;
int u_xlati64;
bool u_xlatb64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat68;
bool u_xlatb68;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_0.x = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_21 = u_xlat16_0.x + -0.100000001;
    u_xlat16_0.x = dot(u_xlat16_0.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_0.x = u_xlat16_0.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _ChangEdgeColor.zxy;
    u_xlat16_21 = u_xlat16_21 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_2.x;
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_2.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoChangColor.zxy + (-u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_21) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_4.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat5.xyz;
    u_xlat64 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat6.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat64;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat68 = (-u_xlat16_65) * u_xlat64 + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat68);
    u_xlat6.xyz = u_xlat1.xxx * vec3(u_xlat16_65) + u_xlat6.xyz;
    u_xlat16_7.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_7.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.w = u_xlat1.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.xw = u_xlat1.xw + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb68 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat68 = (u_xlatb68) ? 1.0 : -1.0;
    u_xlat68 = u_xlat68 * vs_TEXCOORD2.w;
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat10.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat10.x;
    u_xlat9.x = u_xlat8.z;
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat8.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat8.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat10.xyz = vec3(u_xlat69) * u_xlat9.xyz;
    u_xlat71 = dot(u_xlat8.zxy, u_xlat10.xyz);
    u_xlat8.xyz = (-u_xlat10.yzx) * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat8.xyz;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat11.xyz = vec3(u_xlat68) * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat1.www * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat12.xyz;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat5.xyz);
    u_xlat16_65 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_66 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat68 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat71 = (-u_xlat16_65) + 1.0;
    u_xlat71 = u_xlat16_66 * u_xlat71;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat13.y = u_xlat64 * u_xlat68;
    u_xlat16_65 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat13.x = u_xlat16_65 * u_xlat71;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat72 = u_xlat71 * u_xlat68;
    u_xlat13.z = u_xlat64 * u_xlat72;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = max(u_xlat73, 6.10351563e-05);
    u_xlat73 = u_xlat72 / u_xlat73;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat73 = dot(u_xlat12.xyz, u_xlat16_25.xyz);
    u_xlat74 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat71 * u_xlat74;
    u_xlat13.z = u_xlat71 * u_xlat73;
    u_xlat13.x = dot(u_xlat10.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat8.zxy, u_xlat16_25.xyz);
    u_xlat13.y = u_xlat68 * u_xlat71;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat16_7.x = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat68 * u_xlat16_7.x;
    u_xlat12.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat12.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat73 * u_xlat68 + 6.10351563e-05;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = u_xlat72 * u_xlat68;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat68);
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor.zxy;
    u_xlat15.xyz = u_xlat1.xxx * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat68 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat15.xyz = vec3(u_xlat68) * u_xlat15.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat5.xyz);
    u_xlat16_21 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat26 = u_xlat16_21 * u_xlat16_66;
    u_xlat16_21 = u_xlat16_21 + -1.0;
    u_xlat26 = max(u_xlat26, 0.00100000005);
    u_xlat16.y = u_xlat5.x * u_xlat26;
    u_xlat5.x = (-u_xlat16_21) + 1.0;
    u_xlat5.x = u_xlat16_66 * u_xlat5.x;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat16.x = u_xlat16_65 * u_xlat5.x;
    u_xlat47 = u_xlat5.x * u_xlat26;
    u_xlat16.z = u_xlat64 * u_xlat47;
    u_xlat64 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat64 = max(u_xlat64, 6.10351563e-05);
    u_xlat64 = u_xlat47 / u_xlat64;
    u_xlat47 = u_xlat47 * 0.318309873;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat47 * u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat47 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat15.xyz, u_xlat16_25.xyz);
    u_xlat13.z = u_xlat68 * u_xlat5.x;
    u_xlat12.z = u_xlat47 * u_xlat5.x;
    u_xlat12.y = u_xlat16_7.x * u_xlat26;
    u_xlat13.y = u_xlat71 * u_xlat26;
    u_xlat5.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat12.x;
    u_xlat26 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat26 = sqrt(u_xlat26);
    u_xlat5.y = u_xlat26 + u_xlat13.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.y * u_xlat5.x + 6.10351563e-05;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat64 = u_xlat64 * u_xlat5.x;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb64 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb64) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_23 = max(u_xlat16_23, 6.10351563e-05);
    u_xlat16_44.x = inversesqrt(u_xlat16_23);
    u_xlat16_7.xyz = u_xlat16_44.xxx * u_xlat6.xyz;
    u_xlat16_44.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.00100000005>=abs(u_xlat16_44.x));
#else
    u_xlatb64 = 0.00100000005>=abs(u_xlat16_44.x);
#endif
    u_xlat16_44.xy = (bool(u_xlatb64)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_44.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_44.yyy + u_xlat16_17.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_7.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_23 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23 = float(1.0) / float(u_xlat16_23);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_23 = u_xlat16_65 * u_xlat16_23;
    u_xlat16_23 = max(u_xlat16_44.x, u_xlat16_23);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_65 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_65);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat22 = u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_65 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_17.x = inversesqrt(u_xlat16_70);
    u_xlat16_17.xyz = u_xlat6.xyz * u_xlat16_17.xxx;
    u_xlat16_80 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_80));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_80);
#endif
    u_xlat16_18.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat68 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_17.x);
    u_xlat16_17.x = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_17.x = (-u_xlat16_17.x) * u_xlat16_17.x + 1.0;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_70 = max(u_xlat16_18.x, u_xlat16_70);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_65) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_17.xyz = u_xlat16_0.xzw * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = vec3(u_xlat22) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat5.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_0.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat10.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_65) + u_xlat16_70;
    u_xlat16_80 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_70 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_65;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _OcclusionScale * u_xlat16_70 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat22 = min(u_xlat16_65, 1.0);
    u_xlat64 = min(u_xlat22, u_xlat16_1.z);
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_0.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat64) + (-u_xlat16_20.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat64) + u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_20.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_20.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_21>=0.0);
#else
    u_xlatb1 = u_xlat16_21>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat16_25.xyz * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat16_25.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_2.x = u_xlat16_66 * 8.0;
    u_xlat16_23 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = abs(u_xlat16_21) * u_xlat16_2.x;
    u_xlat5.xyz = u_xlat16_2.xxx * u_xlat5.xyz + u_xlat10.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat5.xyz;
    u_xlat16_2.x = dot((-u_xlat16_25.xyz), u_xlat5.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_2.xxx + (-u_xlat16_25.xyz);
    u_xlat6.xyz = u_xlat9.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat6.xyz = vec3(u_xlat16_23) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat6.xyz = abs(vec3(u_xlat16_21)) * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat16_21 = -abs(u_xlat16_21) * 0.800000012 + 1.0;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21);
    u_xlat64 = dot(u_xlat16_18.xyz, u_xlat5.xyz);
    u_xlat16_40.y = u_xlat64 * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_2.x;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_21);
    u_xlat16_2.xyz = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb64 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb64)) ? u_xlat16_25.xyz : u_xlat16_2.xyz;
    u_xlat13.y = u_xlat16_4.x;
    u_xlat16_40.x = u_xlat16_4.x * 1.09769487;
    u_xlat16_4.xyz = u_xlat16_40.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_21 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_21 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_21 = u_xlat16_4.z * 15.0 + (-u_xlat16_21);
    u_xlat16_65 = u_xlat16_64 + (-u_xlat16_5.x);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_65 + u_xlat16_5.x;
    u_xlat16_21 = u_xlat16_70 * u_xlat16_21;
    u_xlat1.x = u_xlat1.x * u_xlat16_21;
    u_xlat16_21 = u_xlat22 * 0.5;
    u_xlat16_65 = (-u_xlat22) * 0.5 + 1.0;
    u_xlat16_21 = u_xlat1.x * u_xlat16_65 + u_xlat16_21;
    u_xlat16_65 = u_xlat16_21 + u_xlat16_21;
    u_xlat16_3.x = (-u_xlat16_21) * 2.0 + 1.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_3.x + u_xlat16_65;
    u_xlat16_21 = u_xlat16_21 * u_xlat22;
    u_xlat16_21 = min(u_xlat16_21, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xzw;
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
    u_xlat64 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat64);
    u_xlat0.x = u_xlat64 * 0.0625 + u_xlat0.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_22.xyz) + u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
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
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat22;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_40;
mediump vec2 u_xlat16_44;
float u_xlat47;
float u_xlat64;
mediump float u_xlat16_64;
int u_xlati64;
bool u_xlatb64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat68;
bool u_xlatb68;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_0.x = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_21 = u_xlat16_0.x + -0.100000001;
    u_xlat16_0.x = dot(u_xlat16_0.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_0.x = u_xlat16_0.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _ChangEdgeColor.zxy;
    u_xlat16_21 = u_xlat16_21 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_2.x;
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_2.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoChangColor.zxy + (-u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_21) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_4.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat5.xyz;
    u_xlat64 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat6.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat64;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat68 = (-u_xlat16_65) * u_xlat64 + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat68);
    u_xlat6.xyz = u_xlat1.xxx * vec3(u_xlat16_65) + u_xlat6.xyz;
    u_xlat16_7.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_7.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.w = u_xlat1.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.xw = u_xlat1.xw + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb68 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat68 = (u_xlatb68) ? 1.0 : -1.0;
    u_xlat68 = u_xlat68 * vs_TEXCOORD2.w;
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat10.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat10.x;
    u_xlat9.x = u_xlat8.z;
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat8.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat8.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat10.xyz = vec3(u_xlat69) * u_xlat9.xyz;
    u_xlat71 = dot(u_xlat8.zxy, u_xlat10.xyz);
    u_xlat8.xyz = (-u_xlat10.yzx) * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat8.xyz;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat11.xyz = vec3(u_xlat68) * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat1.www * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat12.xyz;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat5.xyz);
    u_xlat16_65 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_66 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat68 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat71 = (-u_xlat16_65) + 1.0;
    u_xlat71 = u_xlat16_66 * u_xlat71;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat13.y = u_xlat64 * u_xlat68;
    u_xlat16_65 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat13.x = u_xlat16_65 * u_xlat71;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat72 = u_xlat71 * u_xlat68;
    u_xlat13.z = u_xlat64 * u_xlat72;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = max(u_xlat73, 6.10351563e-05);
    u_xlat73 = u_xlat72 / u_xlat73;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat73 = dot(u_xlat12.xyz, u_xlat16_25.xyz);
    u_xlat74 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat71 * u_xlat74;
    u_xlat13.z = u_xlat71 * u_xlat73;
    u_xlat13.x = dot(u_xlat10.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat8.zxy, u_xlat16_25.xyz);
    u_xlat13.y = u_xlat68 * u_xlat71;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat16_7.x = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat68 * u_xlat16_7.x;
    u_xlat12.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat12.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat73 * u_xlat68 + 6.10351563e-05;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = u_xlat72 * u_xlat68;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat68);
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor.zxy;
    u_xlat15.xyz = u_xlat1.xxx * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat68 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat15.xyz = vec3(u_xlat68) * u_xlat15.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat5.xyz);
    u_xlat16_21 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat26 = u_xlat16_21 * u_xlat16_66;
    u_xlat16_21 = u_xlat16_21 + -1.0;
    u_xlat26 = max(u_xlat26, 0.00100000005);
    u_xlat16.y = u_xlat5.x * u_xlat26;
    u_xlat5.x = (-u_xlat16_21) + 1.0;
    u_xlat5.x = u_xlat16_66 * u_xlat5.x;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat16.x = u_xlat16_65 * u_xlat5.x;
    u_xlat47 = u_xlat5.x * u_xlat26;
    u_xlat16.z = u_xlat64 * u_xlat47;
    u_xlat64 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat64 = max(u_xlat64, 6.10351563e-05);
    u_xlat64 = u_xlat47 / u_xlat64;
    u_xlat47 = u_xlat47 * 0.318309873;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat47 * u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat47 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat15.xyz, u_xlat16_25.xyz);
    u_xlat13.z = u_xlat68 * u_xlat5.x;
    u_xlat12.z = u_xlat47 * u_xlat5.x;
    u_xlat12.y = u_xlat16_7.x * u_xlat26;
    u_xlat13.y = u_xlat71 * u_xlat26;
    u_xlat5.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat12.x;
    u_xlat26 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat26 = sqrt(u_xlat26);
    u_xlat5.y = u_xlat26 + u_xlat13.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.y * u_xlat5.x + 6.10351563e-05;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat64 = u_xlat64 * u_xlat5.x;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb64 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb64) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_23 = max(u_xlat16_23, 6.10351563e-05);
    u_xlat16_44.x = inversesqrt(u_xlat16_23);
    u_xlat16_7.xyz = u_xlat16_44.xxx * u_xlat6.xyz;
    u_xlat16_44.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.00100000005>=abs(u_xlat16_44.x));
#else
    u_xlatb64 = 0.00100000005>=abs(u_xlat16_44.x);
#endif
    u_xlat16_44.xy = (bool(u_xlatb64)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_44.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_44.yyy + u_xlat16_17.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_7.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_23 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23 = float(1.0) / float(u_xlat16_23);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_23 = u_xlat16_65 * u_xlat16_23;
    u_xlat16_23 = max(u_xlat16_44.x, u_xlat16_23);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_65 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_65);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat22 = u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_65 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_17.x = inversesqrt(u_xlat16_70);
    u_xlat16_17.xyz = u_xlat6.xyz * u_xlat16_17.xxx;
    u_xlat16_80 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_80));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_80);
#endif
    u_xlat16_18.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat68 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_17.x);
    u_xlat16_17.x = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_17.x = (-u_xlat16_17.x) * u_xlat16_17.x + 1.0;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_70 = max(u_xlat16_18.x, u_xlat16_70);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_65) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_17.xyz = u_xlat16_0.xzw * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = vec3(u_xlat22) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat5.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_0.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat10.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_65) + u_xlat16_70;
    u_xlat16_80 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_70 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_65;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _OcclusionScale * u_xlat16_70 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat22 = min(u_xlat16_65, 1.0);
    u_xlat64 = min(u_xlat22, u_xlat16_1.z);
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_0.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat64) + (-u_xlat16_20.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat64) + u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_20.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_20.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_21>=0.0);
#else
    u_xlatb1 = u_xlat16_21>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat16_25.xyz * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat16_25.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_2.x = u_xlat16_66 * 8.0;
    u_xlat16_23 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = abs(u_xlat16_21) * u_xlat16_2.x;
    u_xlat5.xyz = u_xlat16_2.xxx * u_xlat5.xyz + u_xlat10.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat5.xyz;
    u_xlat16_2.x = dot((-u_xlat16_25.xyz), u_xlat5.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_2.xxx + (-u_xlat16_25.xyz);
    u_xlat6.xyz = u_xlat9.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat6.xyz = vec3(u_xlat16_23) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat6.xyz = abs(vec3(u_xlat16_21)) * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat16_21 = -abs(u_xlat16_21) * 0.800000012 + 1.0;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21);
    u_xlat64 = dot(u_xlat16_18.xyz, u_xlat5.xyz);
    u_xlat16_40.y = u_xlat64 * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_2.x;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_21);
    u_xlat16_2.xyz = u_xlat16_5.www * u_xlat16_5.zxy;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb64 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb64)) ? u_xlat16_25.xyz : u_xlat16_2.xyz;
    u_xlat13.y = u_xlat16_4.x;
    u_xlat16_40.x = u_xlat16_4.x * 1.09769487;
    u_xlat16_4.xyz = u_xlat16_40.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_21 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_21 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_21 = u_xlat16_4.z * 15.0 + (-u_xlat16_21);
    u_xlat16_65 = u_xlat16_64 + (-u_xlat16_5.x);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_65 + u_xlat16_5.x;
    u_xlat16_21 = u_xlat16_70 * u_xlat16_21;
    u_xlat1.x = u_xlat1.x * u_xlat16_21;
    u_xlat16_21 = u_xlat22 * 0.5;
    u_xlat16_65 = (-u_xlat22) * 0.5 + 1.0;
    u_xlat16_21 = u_xlat1.x * u_xlat16_65 + u_xlat16_21;
    u_xlat16_65 = u_xlat16_21 + u_xlat16_21;
    u_xlat16_3.x = (-u_xlat16_21) * 2.0 + 1.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_3.x + u_xlat16_65;
    u_xlat16_21 = u_xlat16_21 * u_xlat22;
    u_xlat16_21 = min(u_xlat16_21, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xzw;
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
    u_xlat64 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat64);
    u_xlat0.x = u_xlat64 * 0.0625 + u_xlat0.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_22.xyz) + u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
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
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec4 u_xlati1;
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
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump vec3 u_xlat16_22;
float u_xlat23;
float u_xlat24;
mediump float u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat46;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
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
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
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
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat66);
    u_xlat2.x = (-u_xlat66) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat66;
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
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22.x * _ShadowStrength;
    u_xlat22 = u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_66 = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat16_73 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_73 = u_xlat16_73 * 2.0 + -0.0599999987;
    u_xlat16_73 = u_xlat16_73 * _ChangColorShrink + u_xlat16_66;
    u_xlat16_11.x = dot(vec2(u_xlat16_73), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_73 = u_xlat16_73 + -0.100000001;
    u_xlat16_73 = u_xlat16_73 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _ChangEdgeColor.zxy;
    u_xlat16_77 = u_xlat16_73 * -2.0 + 3.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_73 = min(u_xlat16_73, 1.0);
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
    u_xlat16_12.xyz = vec3(u_xlat16_73) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_73) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat66 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_77 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_77) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_35.xyz = u_xlat2.xyz * vec3(u_xlat16_77);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat1.x;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat67 = (-u_xlat16_77) * u_xlat1.x + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat3.xyz = u_xlat16_12.xyz * vec3(u_xlat67);
    u_xlat3.xyz = vec3(u_xlat66) * vec3(u_xlat16_77) + u_xlat3.xyz;
    u_xlat16_14.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_66 = texture(_AnisotropicTex, u_xlat16_14.xy).x;
    u_xlat66 = u_xlat16_66 * 2.0 + -1.0;
    u_xlat1.x = u_xlat66 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat66 = u_xlat66 * _SunShift + _SunShiftOffset;
    u_xlat66 = u_xlat66 + vs_TEXCOORD5;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb67 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat67 = (u_xlatb67) ? 1.0 : -1.0;
    u_xlat67 = u_xlat67 * vs_TEXCOORD2.w;
    u_xlat68 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat68) + u_xlat8.xyz;
    u_xlat68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat4.xyz = vec3(u_xlat68) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat2.xyz);
    u_xlat16_77 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat67 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat68 = (-u_xlat16_77) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_78;
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat67;
    u_xlat16_77 = dot(u_xlat4.zxy, u_xlat2.xyz);
    u_xlat10.x = u_xlat68 * u_xlat16_77;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat69 = u_xlat68 * u_xlat67;
    u_xlat10.z = u_xlat1.x * u_xlat69;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat69 / u_xlat70;
    u_xlat69 = u_xlat69 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat69 = u_xlat69 * u_xlat70;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat70 = dot(u_xlat8.xyz, u_xlat16_35.xyz);
    u_xlat72 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.z = u_xlat68 * u_xlat72;
    u_xlat10.z = u_xlat68 * u_xlat70;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat4.zxy, u_xlat16_35.xyz);
    u_xlat10.y = u_xlat67 * u_xlat68;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat70 + u_xlat10.x;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat16_14.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.y = u_xlat67 * u_xlat16_14.x;
    u_xlat8.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat70 * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = u_xlat69 * u_xlat67;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat67);
    u_xlat16_36.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat15.xyz = u_xlat16_36.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat8.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat15.xyz = u_xlat16_7.xyz * u_xlat15.xyz;
    u_xlat16_36.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat2.xyz);
    u_xlat16_73 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat2.x = u_xlat16_73 * u_xlat16_78;
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat17.y = u_xlat67 * u_xlat2.x;
    u_xlat67 = (-u_xlat16_73) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat16_78;
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat17.x = u_xlat16_77 * u_xlat67;
    u_xlat24 = u_xlat67 * u_xlat2.x;
    u_xlat17.z = u_xlat1.x * u_xlat24;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat24 / u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat24 * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat24 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat46 = dot(u_xlat16.xyz, u_xlat16_35.xyz);
    u_xlat10.z = u_xlat67 * u_xlat46;
    u_xlat8.z = u_xlat67 * u_xlat24;
    u_xlat8.y = u_xlat16_14.x * u_xlat2.x;
    u_xlat10.y = u_xlat68 * u_xlat2.x;
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat2.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat10.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat67 = u_xlat2.x * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat1.x = u_xlat67 * u_xlat1.x;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_36.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat16_77 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_77) * u_xlat16_18.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_77) + u_xlat16_80;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_80 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_77;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_80;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_77));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_20.y = u_xlat16_18.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati1.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati44 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat66) * u_xlat16_11.xyz + u_xlat5.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb1 = u_xlat16_73>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat4.xyz;
    u_xlat1.xyw = u_xlat16_35.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_35.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_78 * 8.0;
    u_xlat16_33 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_73) * u_xlat16_11.x;
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat23);
    u_xlat16_11.x = dot((-u_xlat16_35.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_35.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_33) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_73)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_73 = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_73 = u_xlat16_13.x * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_73);
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_73);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_2.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_2.x = u_xlat16_77 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_73 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_73 = u_xlat16_13.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = (-u_xlat16_44) + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_44;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat0.x = u_xlat1.x * u_xlat16_73;
    u_xlat16_73 = u_xlat0.y * 0.5;
    u_xlat16_77 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_12.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_12.x + u_xlat16_77;
    u_xlat16_73 = u_xlat0.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_1.z, u_xlat16_73);
    u_xlat16_11.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
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
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec4 u_xlati1;
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
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump vec3 u_xlat16_22;
float u_xlat23;
float u_xlat24;
mediump float u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat46;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
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
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
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
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat66);
    u_xlat2.x = (-u_xlat66) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat66;
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
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22.x * _ShadowStrength;
    u_xlat22 = u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_66 = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat16_73 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_73 = u_xlat16_73 * 2.0 + -0.0599999987;
    u_xlat16_73 = u_xlat16_73 * _ChangColorShrink + u_xlat16_66;
    u_xlat16_11.x = dot(vec2(u_xlat16_73), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_73 = u_xlat16_73 + -0.100000001;
    u_xlat16_73 = u_xlat16_73 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _ChangEdgeColor.zxy;
    u_xlat16_77 = u_xlat16_73 * -2.0 + 3.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_73 = min(u_xlat16_73, 1.0);
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
    u_xlat16_12.xyz = vec3(u_xlat16_73) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_73) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat66 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_77 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_77) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_35.xyz = u_xlat2.xyz * vec3(u_xlat16_77);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat1.x;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat67 = (-u_xlat16_77) * u_xlat1.x + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat3.xyz = u_xlat16_12.xyz * vec3(u_xlat67);
    u_xlat3.xyz = vec3(u_xlat66) * vec3(u_xlat16_77) + u_xlat3.xyz;
    u_xlat16_14.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_66 = texture(_AnisotropicTex, u_xlat16_14.xy).x;
    u_xlat66 = u_xlat16_66 * 2.0 + -1.0;
    u_xlat1.x = u_xlat66 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat66 = u_xlat66 * _SunShift + _SunShiftOffset;
    u_xlat66 = u_xlat66 + vs_TEXCOORD5;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb67 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat67 = (u_xlatb67) ? 1.0 : -1.0;
    u_xlat67 = u_xlat67 * vs_TEXCOORD2.w;
    u_xlat68 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat68) + u_xlat8.xyz;
    u_xlat68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat4.xyz = vec3(u_xlat68) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat2.xyz);
    u_xlat16_77 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat67 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat68 = (-u_xlat16_77) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_78;
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat67;
    u_xlat16_77 = dot(u_xlat4.zxy, u_xlat2.xyz);
    u_xlat10.x = u_xlat68 * u_xlat16_77;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat69 = u_xlat68 * u_xlat67;
    u_xlat10.z = u_xlat1.x * u_xlat69;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat69 / u_xlat70;
    u_xlat69 = u_xlat69 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat69 = u_xlat69 * u_xlat70;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat70 = dot(u_xlat8.xyz, u_xlat16_35.xyz);
    u_xlat72 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.z = u_xlat68 * u_xlat72;
    u_xlat10.z = u_xlat68 * u_xlat70;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat4.zxy, u_xlat16_35.xyz);
    u_xlat10.y = u_xlat67 * u_xlat68;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat70 + u_xlat10.x;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat16_14.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.y = u_xlat67 * u_xlat16_14.x;
    u_xlat8.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat70 * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = u_xlat69 * u_xlat67;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat67);
    u_xlat16_36.xyz = (-_DirectSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor2nd.zxy;
    u_xlat15.xyz = u_xlat16_36.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat8.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat15.xyz = u_xlat16_7.xyz * u_xlat15.xyz;
    u_xlat16_36.xyz = (-_DirectSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat2.xyz);
    u_xlat16_73 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat2.x = u_xlat16_73 * u_xlat16_78;
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat17.y = u_xlat67 * u_xlat2.x;
    u_xlat67 = (-u_xlat16_73) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat16_78;
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat17.x = u_xlat16_77 * u_xlat67;
    u_xlat24 = u_xlat67 * u_xlat2.x;
    u_xlat17.z = u_xlat1.x * u_xlat24;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat24 / u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat24 * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat24 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat46 = dot(u_xlat16.xyz, u_xlat16_35.xyz);
    u_xlat10.z = u_xlat67 * u_xlat46;
    u_xlat8.z = u_xlat67 * u_xlat24;
    u_xlat8.y = u_xlat16_14.x * u_xlat2.x;
    u_xlat10.y = u_xlat68 * u_xlat2.x;
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat2.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat10.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat67 = u_xlat2.x * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat1.x = u_xlat67 * u_xlat1.x;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_36.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat16_77 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_77) * u_xlat16_18.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_77) + u_xlat16_80;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_80 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_77;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_80;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_77));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_20.y = u_xlat16_18.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati1.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati44 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat66) * u_xlat16_11.xyz + u_xlat5.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb1 = u_xlat16_73>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat4.xyz;
    u_xlat1.xyw = u_xlat16_35.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_35.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_78 * 8.0;
    u_xlat16_33 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_73) * u_xlat16_11.x;
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat23);
    u_xlat16_11.x = dot((-u_xlat16_35.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_35.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_33) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_73)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_73 = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_73 = u_xlat16_13.x * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_73);
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_73);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_2.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_2.x = u_xlat16_77 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_73 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_73 = u_xlat16_13.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = (-u_xlat16_44) + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_44;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat0.x = u_xlat1.x * u_xlat16_73;
    u_xlat16_73 = u_xlat0.y * 0.5;
    u_xlat16_77 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_12.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_12.x + u_xlat16_77;
    u_xlat16_73 = u_xlat0.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_1.z, u_xlat16_73);
    u_xlat16_11.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat30;
float u_xlat31;
vec3 u_xlat37;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_51;
float u_xlat53;
float u_xlat69;
mediump float u_xlat16_69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_24.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24.x = (-u_xlat16_24.x) * u_xlat16_24.x + 1.0;
    u_xlat16_24.x = max(u_xlat16_24.x, 0.0);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_47 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_24.x * u_xlat16_47;
    u_xlat16_24.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_24.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_24.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_2.xyz * u_xlat16_24.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
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
    u_xlat16_25 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_25, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_1.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_71 = u_xlat16_1.x * _SoftChangColorShrink + u_xlat16_0.x;
    u_xlat16_1.x = u_xlat16_1.x * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_71 + -0.100000001;
    u_xlat16_71 = dot(vec2(u_xlat16_71), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_71 = u_xlat16_71 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_71) * _SoftChangEdgeColor.xyz;
    u_xlat16_71 = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_71 * -2.0 + 3.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_3.x;
    u_xlat16_71 = min(u_xlat16_71, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_71) * u_xlat16_26.xyz;
    u_xlat16_71 = dot(u_xlat16_1.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_71) * _ChangEdgeColor.xyz;
    u_xlat16_71 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = u_xlat16_5.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_4.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat7.xyz;
    u_xlat16_72 = dot(u_xlat16_24.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat69;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat75 = (-u_xlat16_72) * u_xlat69 + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(u_xlat75);
    u_xlat8.xyz = u_xlat0.xxx * vec3(u_xlat16_72) + u_xlat8.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_69 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat69 = u_xlat16_69 * 2.0 + -1.0;
    u_xlat69 = u_xlat69 * _SunShift + _SunShiftOffset;
    u_xlat69 = u_xlat69 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = u_xlat16_28.xyz * vec3(u_xlat76);
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_28.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_28.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat9.xyz;
    u_xlat77 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat77) + u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat69) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat13.xyz = vec3(u_xlat75) * u_xlat13.xyz;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_72 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_0.zz);
    u_xlat16_73 = u_xlat16_72 + -1.0;
    u_xlat77 = (-u_xlat16_73) + 1.0;
    u_xlat16_28.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat77 = u_xlat77 * u_xlat16_28.x;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat77;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat75 = u_xlat16_72 * u_xlat16_28.x;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat75;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat14.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat16_24.xyz = vec3(u_xlat16_71) * u_xlat6.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat77 * u_xlat79;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat75 * u_xlat79;
    u_xlat79 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat15.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat78 = u_xlat79 * u_xlat78 + 6.10351563e-05;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat7.xyz);
    u_xlat16.y = u_xlat75 * u_xlat80;
    u_xlat16_72 = dot(u_xlat10.zxy, u_xlat7.xyz);
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_72 * u_xlat77;
    u_xlat30 = u_xlat77 * u_xlat75;
    u_xlat16.z = u_xlat7.x * u_xlat30;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat30 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat53 = u_xlat30 * 0.318309873;
    u_xlat7.x = u_xlat53 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat7.x = u_xlat78 * u_xlat7.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_7 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat7.x = u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat37.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat78 = dot(u_xlat37.xyz, u_xlat37.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat37.xyz = vec3(u_xlat78) * u_xlat37.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat78 * u_xlat78;
    u_xlat16_1.x = u_xlat78 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat78 * u_xlat16_1.x;
    u_xlat80 = (-u_xlat16_1.x) * u_xlat78 + 1.0;
    u_xlat16_1.x = u_xlat78 * u_xlat16_1.x;
    u_xlat16.xyz = u_xlat16_4.xyz * vec3(u_xlat80);
    u_xlat16.xyz = u_xlat0.xxx * u_xlat16_1.xxx + u_xlat16.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat37.xyz);
    u_xlat18.y = u_xlat75 * u_xlat78;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat37.xyz);
    u_xlat78 = dot(u_xlat11.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat30 * u_xlat78;
    u_xlat18.x = u_xlat16_1.x * u_xlat77;
    u_xlat78 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat30 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat53 * u_xlat78;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat80 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat77 * u_xlat80;
    u_xlat18.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_1.x * u_xlat75;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat18.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat80 = u_xlat79 * u_xlat80 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat78 = u_xlat78 * u_xlat80;
    u_xlat37.xyz = u_xlat16.xyz * vec3(u_xlat78);
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat18.xxx * u_xlat37.xyz;
    u_xlat16_19.xyz = u_xlat37.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat8.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_51.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_51.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_51.yyy + u_xlat16_21.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_20.xyz;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat8.xxx;
    u_xlat16_71 = dot(u_xlat16_20.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat8.x * u_xlat8.x;
    u_xlat16_71 = u_xlat8.x * u_xlat16_71;
    u_xlat16_71 = u_xlat8.x * u_xlat16_71;
    u_xlat31 = (-u_xlat16_71) * u_xlat8.x + 1.0;
    u_xlat16_71 = u_xlat8.x * u_xlat16_71;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(u_xlat31);
    u_xlat8.xyz = u_xlat0.xxx * vec3(u_xlat16_71) + u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat6.xyz);
    u_xlat78 = dot(u_xlat13.xyz, u_xlat16_20.xyz);
    u_xlat13.z = u_xlat77 * u_xlat78;
    u_xlat16.y = u_xlat0.x * u_xlat75;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat0.x * u_xlat30;
    u_xlat16.x = u_xlat16_71 * u_xlat77;
    u_xlat0.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat30 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat53 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16_20.xyz);
    u_xlat13.y = u_xlat16_71 * u_xlat75;
    u_xlat13.x = dot(u_xlat11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat6.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + u_xlat13.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = u_xlat79 * u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat8.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat16_17.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz;
    u_xlat16_72 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_72;
    u_xlat16_1.x = max(u_xlat16_51.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat7.xxx + u_xlat16_19.xyz;
    u_xlat16_1.x = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat13.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_OcclusionScale) * u_xlat16_20.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_1.x;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat23 = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_22.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_22.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_19.xyw;
    u_xlat16_22.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.yzx;
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_3.xyz + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb23 = u_xlat16_73>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb23)) ? u_xlat6.xyz : u_xlat10.xyz;
    u_xlat7.xyz = u_xlat16_24.xyz * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat16_24.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat7.zxy * u_xlat6.yzx + (-u_xlat8.xyz);
    u_xlat6.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + u_xlat6.xyz;
    u_xlat16_3.x = u_xlat16_28.x * 8.0;
    u_xlat16_26.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(u_xlat16_73);
    u_xlat6.xyz = u_xlat16_3.xxx * u_xlat6.xyz + u_xlat11.xyz;
    u_xlat23 = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat16_3.x = dot((-u_xlat16_24.xyz), u_xlat6.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat6.xyz = (-u_xlat6.xyz) * u_xlat16_3.xxx + (-u_xlat16_24.xyz);
    u_xlat7.xyz = u_xlat9.xyz * vec3(u_xlat76) + (-u_xlat6.xyz);
    u_xlat7.xyz = u_xlat16_26.xxx * u_xlat7.xyz + u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.xyz + (-u_xlat7.xyz);
    u_xlat7.xyz = abs(vec3(u_xlat16_73)) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat16_3.x = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat69 = dot(u_xlat16_20.xyz, u_xlat6.xyz);
    u_xlat16_44.y = u_xlat69 * 0.5;
    u_xlat16_26.x = dot(_IndirectCubemapRotationParams.xy, u_xlat7.xz);
    u_xlat7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat7.xz);
    u_xlat7.x = u_xlat16_26.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb69 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_28.xyz = (bool(u_xlatb69)) ? u_xlat16_17.xyz : u_xlat16_28.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_44.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_4.xyz = u_xlat16_28.xyz * u_xlat16_4.xyz;
    u_xlat16_3.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_3.w);
    u_xlat16_73 = u_xlat16_1.x + 1.0;
    u_xlat16_73 = min(u_xlat16_73, 15.0);
    u_xlat16_3.x = u_xlat16_73 * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_69 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_3.x = u_xlat16_1.x * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_1.x = u_xlat16_17.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_73 = u_xlat16_69 + (-u_xlat16_6.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_71 * u_xlat16_1.x;
    u_xlat23 = u_xlat23 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat23 * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_71 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_73 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_71;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_0.z, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat16_24.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_24.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_24.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_1.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(1.5, 1.5);
    u_xlat16_6.xyz = texture(_GlitterTex, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_GlitterIntensity);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlitterColor.xyz;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_48.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_48.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_2.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_2.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_70 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_70) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_0.yyy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
int u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat30;
float u_xlat31;
vec3 u_xlat37;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_51;
float u_xlat53;
float u_xlat69;
mediump float u_xlat16_69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_24.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24.x = (-u_xlat16_24.x) * u_xlat16_24.x + 1.0;
    u_xlat16_24.x = max(u_xlat16_24.x, 0.0);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_47 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_24.x * u_xlat16_47;
    u_xlat16_24.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_24.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_24.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_2.xyz * u_xlat16_24.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
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
    u_xlat16_25 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_25, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_1.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_71 = u_xlat16_1.x * _SoftChangColorShrink + u_xlat16_0.x;
    u_xlat16_1.x = u_xlat16_1.x * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_71 + -0.100000001;
    u_xlat16_71 = dot(vec2(u_xlat16_71), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_71 = u_xlat16_71 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_26.xyz = vec3(u_xlat16_71) * _SoftChangEdgeColor.xyz;
    u_xlat16_71 = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_71 * -2.0 + 3.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_3.x;
    u_xlat16_71 = min(u_xlat16_71, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_71) * u_xlat16_26.xyz;
    u_xlat16_71 = dot(u_xlat16_1.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = (-u_xlat16_71) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_71) * _ChangEdgeColor.xyz;
    u_xlat16_71 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = u_xlat16_5.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_4.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat7.xyz = vec3(u_xlat69) * u_xlat7.xyz;
    u_xlat16_72 = dot(u_xlat16_24.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat69;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat75 = (-u_xlat16_72) * u_xlat69 + 1.0;
    u_xlat16_72 = u_xlat69 * u_xlat16_72;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(u_xlat75);
    u_xlat8.xyz = u_xlat0.xxx * vec3(u_xlat16_72) + u_xlat8.xyz;
    u_xlat16_28.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_69 = texture(_AnisotropicTex, u_xlat16_28.xy).x;
    u_xlat69 = u_xlat16_69 * 2.0 + -1.0;
    u_xlat69 = u_xlat69 * _SunShift + _SunShiftOffset;
    u_xlat69 = u_xlat69 + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb75 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat75 = (u_xlatb75) ? 1.0 : -1.0;
    u_xlat75 = u_xlat75 * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_28.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = u_xlat16_28.xyz * vec3(u_xlat76);
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_28.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_28.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_28.xyz, u_xlat11.xyz);
    u_xlat76 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat11.xyz = vec3(u_xlat76) * u_xlat9.xyz;
    u_xlat77 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat77) + u_xlat10.xyz;
    u_xlat77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat10.xyz = vec3(u_xlat77) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat69) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat13.xyz = vec3(u_xlat75) * u_xlat13.xyz;
    u_xlat75 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_72 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_0.zz);
    u_xlat16_73 = u_xlat16_72 + -1.0;
    u_xlat77 = (-u_xlat16_73) + 1.0;
    u_xlat16_28.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0078125);
    u_xlat77 = u_xlat77 * u_xlat16_28.x;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat14.z = u_xlat75 * u_xlat77;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat75 = u_xlat16_72 * u_xlat16_28.x;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat75;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat14.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat16_24.xyz = vec3(u_xlat16_71) * u_xlat6.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat77 * u_xlat79;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat75 * u_xlat79;
    u_xlat79 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat15.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat78 = u_xlat79 * u_xlat78 + 6.10351563e-05;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat7.xyz);
    u_xlat16.y = u_xlat75 * u_xlat80;
    u_xlat16_72 = dot(u_xlat10.zxy, u_xlat7.xyz);
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_72 * u_xlat77;
    u_xlat30 = u_xlat77 * u_xlat75;
    u_xlat16.z = u_xlat7.x * u_xlat30;
    u_xlat7.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat30 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat53 = u_xlat30 * 0.318309873;
    u_xlat7.x = u_xlat53 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat7.x = u_xlat78 * u_xlat7.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_17.xyz + _DirectSpecularColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_17.xyz;
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_7 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat7.x = u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat37.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat78 = dot(u_xlat37.xyz, u_xlat37.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat37.xyz = vec3(u_xlat78) * u_xlat37.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat78 * u_xlat78;
    u_xlat16_1.x = u_xlat78 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat78 * u_xlat16_1.x;
    u_xlat80 = (-u_xlat16_1.x) * u_xlat78 + 1.0;
    u_xlat16_1.x = u_xlat78 * u_xlat16_1.x;
    u_xlat16.xyz = u_xlat16_4.xyz * vec3(u_xlat80);
    u_xlat16.xyz = u_xlat0.xxx * u_xlat16_1.xxx + u_xlat16.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat37.xyz);
    u_xlat18.y = u_xlat75 * u_xlat78;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat37.xyz);
    u_xlat78 = dot(u_xlat11.xyz, u_xlat37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat30 * u_xlat78;
    u_xlat18.x = u_xlat16_1.x * u_xlat77;
    u_xlat78 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat30 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat53 * u_xlat78;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat80 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat77 * u_xlat80;
    u_xlat18.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_1.x * u_xlat75;
    u_xlat80 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat18.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat80 = u_xlat79 * u_xlat80 + 6.10351563e-05;
    u_xlat80 = float(1.0) / u_xlat80;
    u_xlat78 = u_xlat78 * u_xlat80;
    u_xlat37.xyz = u_xlat16.xyz * vec3(u_xlat78);
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat16_17.xyz * u_xlat37.xyz;
    u_xlat37.xyz = u_xlat18.xxx * u_xlat37.xyz;
    u_xlat16_19.xyz = u_xlat37.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_72 = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = vec3(u_xlat16_72) * u_xlat8.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_51.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_51.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_51.yyy + u_xlat16_21.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_71) + u_xlat16_20.xyz;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat8.xxx;
    u_xlat16_71 = dot(u_xlat16_20.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat8.x * u_xlat8.x;
    u_xlat16_71 = u_xlat8.x * u_xlat16_71;
    u_xlat16_71 = u_xlat8.x * u_xlat16_71;
    u_xlat31 = (-u_xlat16_71) * u_xlat8.x + 1.0;
    u_xlat16_71 = u_xlat8.x * u_xlat16_71;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(u_xlat31);
    u_xlat8.xyz = u_xlat0.xxx * vec3(u_xlat16_71) + u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat13.xyz, u_xlat6.xyz);
    u_xlat78 = dot(u_xlat13.xyz, u_xlat16_20.xyz);
    u_xlat13.z = u_xlat77 * u_xlat78;
    u_xlat16.y = u_xlat0.x * u_xlat75;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat0.x * u_xlat30;
    u_xlat16.x = u_xlat16_71 * u_xlat77;
    u_xlat0.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat30 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat53 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16_20.xyz);
    u_xlat13.y = u_xlat16_71 * u_xlat75;
    u_xlat13.x = dot(u_xlat11.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat6.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + u_xlat13.x;
    u_xlat6.x = u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = u_xlat79 * u_xlat6.x + 6.10351563e-05;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat8.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat16_17.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz;
    u_xlat16_72 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_72;
    u_xlat16_1.x = max(u_xlat16_51.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat6.xyz * u_xlat7.xxx + u_xlat16_19.xyz;
    u_xlat16_1.x = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat7.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat13.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(_OcclusionScale) * u_xlat16_20.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_20.xyz;
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_44.z * u_xlat16_1.x;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat23 = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat23) * u_xlat16_19.xyz;
    u_xlat16_22.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat23) * u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat23) + (-u_xlat16_22.xyz);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat23) + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_19.y = u_xlat16_20.y;
    u_xlat16_22.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati6.x = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_19.xyw;
    u_xlat16_22.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.yzx;
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_3.xyz + u_xlat12.xyz;
    u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb23 = u_xlat16_73>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb23)) ? u_xlat6.xyz : u_xlat10.xyz;
    u_xlat7.xyz = u_xlat16_24.xyz * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat16_24.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat7.zxy * u_xlat6.yzx + (-u_xlat8.xyz);
    u_xlat6.xyz = (-u_xlat9.xyz) * vec3(u_xlat76) + u_xlat6.xyz;
    u_xlat16_3.x = u_xlat16_28.x * 8.0;
    u_xlat16_26.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(u_xlat16_73);
    u_xlat6.xyz = u_xlat16_3.xxx * u_xlat6.xyz + u_xlat11.xyz;
    u_xlat23 = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat16_3.x = dot((-u_xlat16_24.xyz), u_xlat6.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat6.xyz = (-u_xlat6.xyz) * u_xlat16_3.xxx + (-u_xlat16_24.xyz);
    u_xlat7.xyz = u_xlat9.xyz * vec3(u_xlat76) + (-u_xlat6.xyz);
    u_xlat7.xyz = u_xlat16_26.xxx * u_xlat7.xyz + u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.xyz + (-u_xlat7.xyz);
    u_xlat7.xyz = abs(vec3(u_xlat16_73)) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat16_3.x = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat69 = dot(u_xlat16_20.xyz, u_xlat6.xyz);
    u_xlat16_44.y = u_xlat69 * 0.5;
    u_xlat16_26.x = dot(_IndirectCubemapRotationParams.xy, u_xlat7.xz);
    u_xlat7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat7.xz);
    u_xlat7.x = u_xlat16_26.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = u_xlat16_1.xxx * u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb69 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_28.xyz = (bool(u_xlatb69)) ? u_xlat16_17.xyz : u_xlat16_28.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_44.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_4.xyz = u_xlat16_28.xyz * u_xlat16_4.xyz;
    u_xlat16_3.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_3.w);
    u_xlat16_73 = u_xlat16_1.x + 1.0;
    u_xlat16_73 = min(u_xlat16_73, 15.0);
    u_xlat16_3.x = u_xlat16_73 * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_69 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_3.x = u_xlat16_1.x * 16.0 + u_xlat16_3.z;
    u_xlat16_5.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_1.x = u_xlat16_17.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_73 = u_xlat16_69 + (-u_xlat16_6.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_71 * u_xlat16_1.x;
    u_xlat23 = u_xlat23 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat23 * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_71 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_73 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_73 + u_xlat16_71;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_0.z, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat16_24.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_24.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_24.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_1.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(1.5, 1.5);
    u_xlat16_6.xyz = texture(_GlitterTex, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_GlitterIntensity);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlitterColor.xyz;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_48.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_48.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_2.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_2.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_70 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_70) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_0.yyy + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
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
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat27;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump vec3 u_xlat16_39;
vec3 u_xlat40;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat51;
mediump vec2 u_xlat16_59;
float u_xlat72;
mediump float u_xlat16_72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
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
    u_xlat24 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_24 * _ShadowStrength;
    u_xlat24 = u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_35 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = u_xlat16_11.x * u_xlat16_35;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb72 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb72)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_72 = texture(_ChangColorDissolveTex, u_xlat16_13.xy).x;
    u_xlat16_79 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_83 = u_xlat16_79 * _SoftChangColorShrink + u_xlat16_72;
    u_xlat16_79 = u_xlat16_79 * _ChangColorShrink + u_xlat16_72;
    u_xlat16_84 = u_xlat16_83 + -0.100000001;
    u_xlat16_83 = dot(vec2(u_xlat16_83), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_83 = u_xlat16_83 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_83) * _SoftChangEdgeColor.xyz;
    u_xlat16_83 = u_xlat16_84 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_84;
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_83) * u_xlat16_13.xyz;
    u_xlat16_83 = dot(vec2(u_xlat16_79), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_79 = u_xlat16_79 + -0.100000001;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_83) * _ChangEdgeColor.xyz;
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat16_79) + u_xlat16_13.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoChangColor.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_15.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat72 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_11.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_84 = dot(u_xlat16_11.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat1.x;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat73 = (-u_xlat16_84) * u_xlat1.x + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_39.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_39.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb73 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat73 = (u_xlatb73) ? 1.0 : -1.0;
    u_xlat73 = u_xlat73 * vs_TEXCOORD2.w;
    u_xlat74 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat74) + u_xlat8.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_84 + -1.0;
    u_xlat74 = (-u_xlat16_85) + 1.0;
    u_xlat16_86 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_86 = max(u_xlat16_86, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_86;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat16.z = u_xlat73 * u_xlat74;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat73 = u_xlat16_84 * u_xlat16_86;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat16.y = u_xlat16_11.x * u_xlat73;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat76 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat17.z = u_xlat74 * u_xlat76;
    u_xlat17.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat17.y = u_xlat73 * u_xlat76;
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat17.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat18.y = u_xlat73 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat74 * u_xlat16_84;
    u_xlat27 = u_xlat74 * u_xlat73;
    u_xlat18.z = u_xlat3.x * u_xlat27;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat51 = u_xlat27 * 0.318309873;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat16_39.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz + _DirectSpecularColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_39.xyz;
    u_xlat4.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat40.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat40.xyz, u_xlat40.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat40.xyz = u_xlat3.xxx * u_xlat40.xyz;
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat3.x;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat75 = (-u_xlat16_79) * u_xlat3.x + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat18.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat72) * vec3(u_xlat16_79) + u_xlat18.xyz;
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat40.xyz);
    u_xlat19.y = u_xlat73 * u_xlat3.x;
    u_xlat16_79 = dot(u_xlat5.zxy, u_xlat40.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat3.x * u_xlat27;
    u_xlat19.x = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat75 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat74 * u_xlat75;
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat73 * u_xlat16_79;
    u_xlat75 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat19.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat40.xyz = u_xlat18.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat40.xyz = min(max(u_xlat40.xyz, 0.0), 1.0);
#else
    u_xlat40.xyz = clamp(u_xlat40.xyz, 0.0, 1.0);
#endif
    u_xlat40.xyz = u_xlat16_39.xyz * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat19.xxx * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat40.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat40.xyz * u_xlat16_7.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat3.x;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat75 = (-u_xlat16_83) * u_xlat3.x + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_83) + u_xlat4.xyz;
    u_xlat72 = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat16_21.xyz);
    u_xlat10.z = u_xlat74 * u_xlat3.x;
    u_xlat18.y = u_xlat72 * u_xlat73;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat72 = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat72 * u_xlat27;
    u_xlat18.x = u_xlat74 * u_xlat16_83;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat27 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat51 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat10.y = u_xlat73 * u_xlat16_83;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat10.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat73 = u_xlat76 * u_xlat73 + 6.10351563e-05;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat2.xyz = u_xlat4.xyz * vec3(u_xlat72);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_39.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * vec3(u_xlat24) + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39.xyz = vec3(u_xlat24) * u_xlat16_39.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat24) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_39.xyz * u_xlat10.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_39.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_39.xyz = vec3(_OcclusionScale) * u_xlat16_39.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat16_39.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat9.xyz);
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
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_39.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_39.xz);
    u_xlat16_21.y = u_xlat16_39.y;
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
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_11.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_11.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_12.x = u_xlat16_86 * 8.0;
    u_xlat16_36 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_36 = max(u_xlat16_36, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = u_xlat16_12.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_12.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_39.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat0.xzw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_36) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_12.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_12.x = u_xlat16_15.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat0.x = dot(u_xlat16_39.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_36 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_36;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat17.y = u_xlat16_15.x;
    u_xlat16_44.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_84 = u_xlat16_79 + 1.0;
    u_xlat16_84 = min(u_xlat16_84, 15.0);
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_84 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_79 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_79);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_GlitterIntensity);
    u_xlat16_11.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = min(u_xlat16_11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_11.xyz = u_xlat16_11.xyz * _GlitterColor.xyz;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_11.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_11.xy = u_xlat16_59.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_11.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_11.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_79 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy + u_xlat16_7.xyz;
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
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in mediump float vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
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
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat27;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump vec3 u_xlat16_39;
vec3 u_xlat40;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat51;
mediump vec2 u_xlat16_59;
float u_xlat72;
mediump float u_xlat16_72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
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
    u_xlat24 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_24 * _ShadowStrength;
    u_xlat24 = u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_79 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_79 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_35 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = u_xlat16_11.x * u_xlat16_35;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb72 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb72)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_72 = texture(_ChangColorDissolveTex, u_xlat16_13.xy).x;
    u_xlat16_79 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_79 = u_xlat16_79 * 2.0 + -0.0599999987;
    u_xlat16_83 = u_xlat16_79 * _SoftChangColorShrink + u_xlat16_72;
    u_xlat16_79 = u_xlat16_79 * _ChangColorShrink + u_xlat16_72;
    u_xlat16_84 = u_xlat16_83 + -0.100000001;
    u_xlat16_83 = dot(vec2(u_xlat16_83), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_83 = u_xlat16_83 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_83) * _SoftChangEdgeColor.xyz;
    u_xlat16_83 = u_xlat16_84 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_83 * -2.0 + 3.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_84;
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat16_83) * u_xlat16_13.xyz;
    u_xlat16_83 = dot(vec2(u_xlat16_79), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_79 = u_xlat16_79 + -0.100000001;
    u_xlat16_79 = u_xlat16_79 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = (-u_xlat16_83) + 1.0;
    u_xlat16_14.xyz = vec3(u_xlat16_83) * _ChangEdgeColor.xyz;
    u_xlat16_83 = u_xlat16_79 * -2.0 + 3.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_79 = min(u_xlat16_79, 1.0);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat16_79) + u_xlat16_13.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoChangColor.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_15.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat72 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_83 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_11.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_84 = dot(u_xlat16_11.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat1.x;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat73 = (-u_xlat16_84) * u_xlat1.x + 1.0;
    u_xlat16_84 = u_xlat1.x * u_xlat16_84;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat16_39.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_39.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb73 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat73 = (u_xlatb73) ? 1.0 : -1.0;
    u_xlat73 = u_xlat73 * vs_TEXCOORD2.w;
    u_xlat74 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat9.yzx) * vec3(u_xlat74) + u_xlat8.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.yzx * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat9.zxy * u_xlat5.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat73) * u_xlat8.xyz;
    u_xlat10.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat8.zxy;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat16_84 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat16_85 = u_xlat16_84 + -1.0;
    u_xlat74 = (-u_xlat16_85) + 1.0;
    u_xlat16_86 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_86 = max(u_xlat16_86, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_86;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat16.z = u_xlat73 * u_xlat74;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat73 = u_xlat16_84 * u_xlat16_86;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat16.y = u_xlat16_11.x * u_xlat73;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_83);
    u_xlat76 = dot(u_xlat10.xyz, u_xlat16_11.xyz);
    u_xlat17.z = u_xlat74 * u_xlat76;
    u_xlat17.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat17.y = u_xlat73 * u_xlat76;
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat17.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat3.xyz);
    u_xlat18.y = u_xlat73 * u_xlat78;
    u_xlat16_84 = dot(u_xlat5.zxy, u_xlat3.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat74 * u_xlat16_84;
    u_xlat27 = u_xlat74 * u_xlat73;
    u_xlat18.z = u_xlat3.x * u_xlat27;
    u_xlat3.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat51 = u_xlat27 * 0.318309873;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat16_39.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz + _DirectSpecularColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_39.xyz;
    u_xlat4.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat40.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat40.xyz, u_xlat40.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat40.xyz = u_xlat3.xxx * u_xlat40.xyz;
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat3.x;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat75 = (-u_xlat16_79) * u_xlat3.x + 1.0;
    u_xlat16_79 = u_xlat3.x * u_xlat16_79;
    u_xlat18.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat72) * vec3(u_xlat16_79) + u_xlat18.xyz;
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat40.xyz);
    u_xlat19.y = u_xlat73 * u_xlat3.x;
    u_xlat16_79 = dot(u_xlat5.zxy, u_xlat40.xyz);
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat40.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat19.z = u_xlat3.x * u_xlat27;
    u_xlat19.x = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat27 / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat51 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat75 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat74 * u_xlat75;
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat73 * u_xlat16_79;
    u_xlat75 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat19.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat3.x = u_xlat75 * u_xlat3.x;
    u_xlat40.xyz = u_xlat18.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat40.xyz = min(max(u_xlat40.xyz, 0.0), 1.0);
#else
    u_xlat40.xyz = clamp(u_xlat40.xyz, 0.0, 1.0);
#endif
    u_xlat40.xyz = u_xlat16_39.xyz * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat19.xxx * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat40.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat40.xyz * u_xlat16_7.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_79);
    u_xlat16_21.xyz = u_xlat4.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat16_22.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_23.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_83) + u_xlat16_21.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat16_83 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_83) + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat3.x;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat75 = (-u_xlat16_83) * u_xlat3.x + 1.0;
    u_xlat16_83 = u_xlat3.x * u_xlat16_83;
    u_xlat4.xyz = u_xlat16_14.xyz * vec3(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat72) * vec3(u_xlat16_83) + u_xlat4.xyz;
    u_xlat72 = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat3.x = dot(u_xlat10.xyz, u_xlat16_21.xyz);
    u_xlat10.z = u_xlat74 * u_xlat3.x;
    u_xlat18.y = u_xlat72 * u_xlat73;
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat2.xyz);
    u_xlat72 = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat18.z = u_xlat72 * u_xlat27;
    u_xlat18.x = u_xlat74 * u_xlat16_83;
    u_xlat72 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat27 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat51 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_83 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat10.y = u_xlat73 * u_xlat16_83;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_21.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat10.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat73 = u_xlat76 * u_xlat73 + 6.10351563e-05;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat2.xyz = u_xlat4.xyz * vec3(u_xlat72);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10.xxx * u_xlat2.xyz;
    u_xlat16_84 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = float(1.0) / float(u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84;
    u_xlat16_79 = max(u_xlat16_22.x, u_xlat16_79);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_39.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_39.xyz;
    u_xlat16_20.xyz = u_xlat2.xyz * vec3(u_xlat24) + u_xlat16_20.xyz;
    u_xlat16_79 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_13.xyz;
    u_xlat16_39.xyz = u_xlat16_39.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39.xyz = vec3(u_xlat24) * u_xlat16_39.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat24) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat19.xxx + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_39.xyz * u_xlat10.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_39.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_39.xyz = vec3(_OcclusionScale) * u_xlat16_39.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat16_39.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_39.xyz = vec3(u_xlat16_79) * u_xlat16_39.xyz;
    u_xlat16_79 = dot(u_xlat16_39.xyz, u_xlat9.xyz);
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
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_39.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_39.xz);
    u_xlat16_21.y = u_xlat16_39.y;
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
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_85>=0.0);
#else
    u_xlatb1 = u_xlat16_85>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat5.xyz;
    u_xlat1.xyw = u_xlat16_11.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_11.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_12.x = u_xlat16_86 * 8.0;
    u_xlat16_36 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_36 = max(u_xlat16_36, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = u_xlat16_12.x * abs(u_xlat16_85);
    u_xlat0.xzw = u_xlat16_12.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_39.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat25);
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat0.xzw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_36) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_85)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_12.x = -abs(u_xlat16_85) * 0.800000012 + 1.0;
    u_xlat16_12.x = u_xlat16_15.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_12.x);
    u_xlat0.x = dot(u_xlat16_39.xyz, u_xlat0.xzw);
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_36 = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_36;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat17.y = u_xlat16_15.x;
    u_xlat16_44.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_84 = u_xlat16_79 + 1.0;
    u_xlat16_84 = min(u_xlat16_84, 15.0);
    u_xlat16_2.x = u_xlat16_84 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_13.z * 15.0 + (-u_xlat16_79);
    u_xlat16_84 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_83 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_83 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_83 + u_xlat16_79;
    u_xlat16_83 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_84 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_84 + u_xlat16_83;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_1.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xy = u_xlat16_11.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_11.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_11.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_79 = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat16_79);
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_11.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(1.5, 1.5);
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_GlitterIntensity);
    u_xlat16_11.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = min(u_xlat16_11.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_11.xyz = u_xlat16_11.xyz * _GlitterColor.xyz;
    u_xlat16_0.xy = texture(_MaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_11.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_59.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_11.xy = u_xlat16_59.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_11.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_11.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_79 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_79) * u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_0.yyy + u_xlat16_7.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_40;
mediump vec2 u_xlat16_44;
float u_xlat47;
float u_xlat64;
mediump float u_xlat16_64;
int u_xlati64;
bool u_xlatb64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat68;
bool u_xlatb68;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_0.x = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_21 = u_xlat16_0.x + -0.100000001;
    u_xlat16_0.x = dot(u_xlat16_0.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_0.x = u_xlat16_0.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _ChangEdgeColor.xyz;
    u_xlat16_21 = u_xlat16_21 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_2.x;
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_2.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoChangColor.xyz + (-u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_21) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_4.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat5.xyz;
    u_xlat64 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat6.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat64;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat68 = (-u_xlat16_65) * u_xlat64 + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat68);
    u_xlat6.xyz = u_xlat1.xxx * vec3(u_xlat16_65) + u_xlat6.xyz;
    u_xlat16_7.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_7.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.w = u_xlat1.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.xw = u_xlat1.xw + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb68 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat68 = (u_xlatb68) ? 1.0 : -1.0;
    u_xlat68 = u_xlat68 * vs_TEXCOORD2.w;
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat10.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat10.x;
    u_xlat9.x = u_xlat8.z;
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat8.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat8.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat10.xyz = vec3(u_xlat69) * u_xlat9.xyz;
    u_xlat71 = dot(u_xlat8.zxy, u_xlat10.xyz);
    u_xlat8.xyz = (-u_xlat10.yzx) * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat8.xyz;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat11.xyz = vec3(u_xlat68) * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat1.www * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat12.xyz;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat5.xyz);
    u_xlat16_65 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_66 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat68 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat71 = (-u_xlat16_65) + 1.0;
    u_xlat71 = u_xlat16_66 * u_xlat71;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat13.y = u_xlat64 * u_xlat68;
    u_xlat16_65 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat13.x = u_xlat16_65 * u_xlat71;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat72 = u_xlat71 * u_xlat68;
    u_xlat13.z = u_xlat64 * u_xlat72;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = max(u_xlat73, 6.10351563e-05);
    u_xlat73 = u_xlat72 / u_xlat73;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat73 = dot(u_xlat12.xyz, u_xlat16_25.xyz);
    u_xlat74 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat71 * u_xlat74;
    u_xlat13.z = u_xlat71 * u_xlat73;
    u_xlat13.x = dot(u_xlat10.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat8.zxy, u_xlat16_25.xyz);
    u_xlat13.y = u_xlat68 * u_xlat71;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat16_7.x = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat68 * u_xlat16_7.x;
    u_xlat12.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat12.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat73 * u_xlat68 + 6.10351563e-05;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = u_xlat72 * u_xlat68;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat68);
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor.xyz;
    u_xlat15.xyz = u_xlat1.xxx * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat68 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat15.xyz = vec3(u_xlat68) * u_xlat15.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat5.xyz);
    u_xlat16_21 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat26 = u_xlat16_21 * u_xlat16_66;
    u_xlat16_21 = u_xlat16_21 + -1.0;
    u_xlat26 = max(u_xlat26, 0.00100000005);
    u_xlat16.y = u_xlat5.x * u_xlat26;
    u_xlat5.x = (-u_xlat16_21) + 1.0;
    u_xlat5.x = u_xlat16_66 * u_xlat5.x;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat16.x = u_xlat16_65 * u_xlat5.x;
    u_xlat47 = u_xlat5.x * u_xlat26;
    u_xlat16.z = u_xlat64 * u_xlat47;
    u_xlat64 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat64 = max(u_xlat64, 6.10351563e-05);
    u_xlat64 = u_xlat47 / u_xlat64;
    u_xlat47 = u_xlat47 * 0.318309873;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat47 * u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat47 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat15.xyz, u_xlat16_25.xyz);
    u_xlat13.z = u_xlat68 * u_xlat5.x;
    u_xlat12.z = u_xlat47 * u_xlat5.x;
    u_xlat12.y = u_xlat16_7.x * u_xlat26;
    u_xlat13.y = u_xlat71 * u_xlat26;
    u_xlat5.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat12.x;
    u_xlat26 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat26 = sqrt(u_xlat26);
    u_xlat5.y = u_xlat26 + u_xlat13.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.y * u_xlat5.x + 6.10351563e-05;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat64 = u_xlat64 * u_xlat5.x;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb64 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb64) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_23 = max(u_xlat16_23, 6.10351563e-05);
    u_xlat16_44.x = inversesqrt(u_xlat16_23);
    u_xlat16_7.xyz = u_xlat16_44.xxx * u_xlat6.xyz;
    u_xlat16_44.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.00100000005>=abs(u_xlat16_44.x));
#else
    u_xlatb64 = 0.00100000005>=abs(u_xlat16_44.x);
#endif
    u_xlat16_44.xy = (bool(u_xlatb64)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_44.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_44.yyy + u_xlat16_17.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_7.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_23 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23 = float(1.0) / float(u_xlat16_23);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_23 = u_xlat16_65 * u_xlat16_23;
    u_xlat16_23 = max(u_xlat16_44.x, u_xlat16_23);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_65 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_65);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat22 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_65 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_17.x = inversesqrt(u_xlat16_70);
    u_xlat16_17.xyz = u_xlat6.xyz * u_xlat16_17.xxx;
    u_xlat16_80 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_80));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_80);
#endif
    u_xlat16_18.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat68 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_17.x);
    u_xlat16_17.x = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_17.x = (-u_xlat16_17.x) * u_xlat16_17.x + 1.0;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_70 = max(u_xlat16_18.x, u_xlat16_70);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_65) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_17.xyz = u_xlat16_0.xzw * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = vec3(u_xlat22) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat5.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_0.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat10.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_65) + u_xlat16_70;
    u_xlat16_80 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_70 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_65;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _OcclusionScale * u_xlat16_70 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat22 = min(u_xlat16_65, 1.0);
    u_xlat64 = min(u_xlat22, u_xlat16_1.z);
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_0.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat64) + (-u_xlat16_20.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat64) + u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_20.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_20.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_21>=0.0);
#else
    u_xlatb1 = u_xlat16_21>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat16_25.xyz * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat16_25.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_2.x = u_xlat16_66 * 8.0;
    u_xlat16_23 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = abs(u_xlat16_21) * u_xlat16_2.x;
    u_xlat5.xyz = u_xlat16_2.xxx * u_xlat5.xyz + u_xlat10.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat5.xyz;
    u_xlat16_2.x = dot((-u_xlat16_25.xyz), u_xlat5.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_2.xxx + (-u_xlat16_25.xyz);
    u_xlat6.xyz = u_xlat9.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat6.xyz = vec3(u_xlat16_23) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat6.xyz = abs(vec3(u_xlat16_21)) * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat16_21 = -abs(u_xlat16_21) * 0.800000012 + 1.0;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21);
    u_xlat64 = dot(u_xlat16_18.xyz, u_xlat5.xyz);
    u_xlat16_40.y = u_xlat64 * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_2.x;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_21);
    u_xlat16_2.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb64 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb64)) ? u_xlat16_25.xyz : u_xlat16_2.xyz;
    u_xlat13.y = u_xlat16_4.x;
    u_xlat16_40.x = u_xlat16_4.x * 1.09769487;
    u_xlat16_4.xyz = u_xlat16_40.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_21 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_21 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_21 = u_xlat16_4.z * 15.0 + (-u_xlat16_21);
    u_xlat16_65 = u_xlat16_64 + (-u_xlat16_5.x);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_65 + u_xlat16_5.x;
    u_xlat16_21 = u_xlat16_70 * u_xlat16_21;
    u_xlat1.x = u_xlat1.x * u_xlat16_21;
    u_xlat16_21 = u_xlat22 * 0.5;
    u_xlat16_65 = (-u_xlat22) * 0.5 + 1.0;
    u_xlat16_21 = u_xlat1.x * u_xlat16_65 + u_xlat16_21;
    u_xlat16_65 = u_xlat16_21 + u_xlat16_21;
    u_xlat16_3.x = (-u_xlat16_21) * 2.0 + 1.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_3.x + u_xlat16_65;
    u_xlat16_21 = u_xlat16_21 * u_xlat22;
    u_xlat16_21 = min(u_xlat16_21, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xzw;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_40;
mediump vec2 u_xlat16_44;
float u_xlat47;
float u_xlat64;
mediump float u_xlat16_64;
int u_xlati64;
bool u_xlatb64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat68;
bool u_xlatb68;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_0.xy).x;
    u_xlat16_0.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.0599999987;
    u_xlat16_0.x = u_xlat16_0.x * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_21 = u_xlat16_0.x + -0.100000001;
    u_xlat16_0.x = dot(u_xlat16_0.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_0.x = u_xlat16_0.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _ChangEdgeColor.xyz;
    u_xlat16_21 = u_xlat16_21 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_2.x;
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_2.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _AlbedoChangColor.xyz + (-u_xlat16_4.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_21) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_4.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat5.xyz;
    u_xlat64 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat6.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat64;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat68 = (-u_xlat16_65) * u_xlat64 + 1.0;
    u_xlat16_65 = u_xlat64 * u_xlat16_65;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat68);
    u_xlat6.xyz = u_xlat1.xxx * vec3(u_xlat16_65) + u_xlat6.xyz;
    u_xlat16_7.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicTex, u_xlat16_7.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.w = u_xlat1.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.xw = u_xlat1.xw + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb68 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat68 = (u_xlatb68) ? 1.0 : -1.0;
    u_xlat68 = u_xlat68 * vs_TEXCOORD2.w;
    u_xlat16_65 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_65) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat10.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat10.x;
    u_xlat9.x = u_xlat8.z;
    u_xlat16_11.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat11.x = u_xlat8.x;
    u_xlat11.y = u_xlat10.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat10.x = u_xlat8.y;
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat10.xyz = vec3(u_xlat69) * u_xlat9.xyz;
    u_xlat71 = dot(u_xlat8.zxy, u_xlat10.xyz);
    u_xlat8.xyz = (-u_xlat10.yzx) * vec3(u_xlat71) + u_xlat8.xyz;
    u_xlat71 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat8.xyz;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat11.xyz = vec3(u_xlat68) * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat1.www * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat12.xyz;
    u_xlat64 = dot(u_xlat12.xyz, u_xlat5.xyz);
    u_xlat16_65 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_66 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat68 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat71 = (-u_xlat16_65) + 1.0;
    u_xlat71 = u_xlat16_66 * u_xlat71;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat13.y = u_xlat64 * u_xlat68;
    u_xlat16_65 = dot(u_xlat8.zxy, u_xlat5.xyz);
    u_xlat13.x = u_xlat16_65 * u_xlat71;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat72 = u_xlat71 * u_xlat68;
    u_xlat13.z = u_xlat64 * u_xlat72;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = max(u_xlat73, 6.10351563e-05);
    u_xlat73 = u_xlat72 / u_xlat73;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat73 = dot(u_xlat12.xyz, u_xlat16_25.xyz);
    u_xlat74 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.z = u_xlat71 * u_xlat74;
    u_xlat13.z = u_xlat71 * u_xlat73;
    u_xlat13.x = dot(u_xlat10.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat8.zxy, u_xlat16_25.xyz);
    u_xlat13.y = u_xlat68 * u_xlat71;
    u_xlat73 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat13.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat16_7.x = dot(u_xlat8.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat12.y = u_xlat68 * u_xlat16_7.x;
    u_xlat12.x = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat68 + u_xlat12.x;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat73 * u_xlat68 + 6.10351563e-05;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = u_xlat72 * u_xlat68;
    u_xlat14.xyz = u_xlat6.xyz * vec3(u_xlat68);
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat12.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz + _DirectSpecularColor.xyz;
    u_xlat15.xyz = u_xlat1.xxx * u_xlat10.xyz + u_xlat11.zxy;
    u_xlat68 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat15.xyz = vec3(u_xlat68) * u_xlat15.xyz;
    u_xlat5.x = dot(u_xlat15.xyz, u_xlat5.xyz);
    u_xlat16_21 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat26 = u_xlat16_21 * u_xlat16_66;
    u_xlat16_21 = u_xlat16_21 + -1.0;
    u_xlat26 = max(u_xlat26, 0.00100000005);
    u_xlat16.y = u_xlat5.x * u_xlat26;
    u_xlat5.x = (-u_xlat16_21) + 1.0;
    u_xlat5.x = u_xlat16_66 * u_xlat5.x;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat16.x = u_xlat16_65 * u_xlat5.x;
    u_xlat47 = u_xlat5.x * u_xlat26;
    u_xlat16.z = u_xlat64 * u_xlat47;
    u_xlat64 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat64 = max(u_xlat64, 6.10351563e-05);
    u_xlat64 = u_xlat47 / u_xlat64;
    u_xlat47 = u_xlat47 * 0.318309873;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat47 * u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat47 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat15.xyz, u_xlat16_25.xyz);
    u_xlat13.z = u_xlat68 * u_xlat5.x;
    u_xlat12.z = u_xlat47 * u_xlat5.x;
    u_xlat12.y = u_xlat16_7.x * u_xlat26;
    u_xlat13.y = u_xlat71 * u_xlat26;
    u_xlat5.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat12.x;
    u_xlat26 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat26 = sqrt(u_xlat26);
    u_xlat5.y = u_xlat26 + u_xlat13.x;
    u_xlat5.xy = u_xlat5.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.y * u_xlat5.x + 6.10351563e-05;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat64 = u_xlat64 * u_xlat5.x;
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat12.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb64 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb64) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_23 = max(u_xlat16_23, 6.10351563e-05);
    u_xlat16_44.x = inversesqrt(u_xlat16_23);
    u_xlat16_7.xyz = u_xlat16_44.xxx * u_xlat6.xyz;
    u_xlat16_44.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.00100000005>=abs(u_xlat16_44.x));
#else
    u_xlatb64 = 0.00100000005>=abs(u_xlat16_44.x);
#endif
    u_xlat16_44.xy = (bool(u_xlatb64)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_44.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_44.yyy + u_xlat16_17.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_7.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_65);
    u_xlat16_65 = u_xlat16_23 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23 = float(1.0) / float(u_xlat16_23);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_23 = u_xlat16_65 * u_xlat16_23;
    u_xlat16_23 = max(u_xlat16_44.x, u_xlat16_23);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_23;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_65 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_65);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat22 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_65 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_17.x = inversesqrt(u_xlat16_70);
    u_xlat16_17.xyz = u_xlat6.xyz * u_xlat16_17.xxx;
    u_xlat16_80 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_80));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_80);
#endif
    u_xlat16_18.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat68 = dot(u_xlat10.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_17.x);
    u_xlat16_17.x = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_17.x = (-u_xlat16_17.x) * u_xlat16_17.x + 1.0;
    u_xlat16_17.x = max(u_xlat16_17.x, 0.0);
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_70 = max(u_xlat16_18.x, u_xlat16_70);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_65) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_17.xyz = u_xlat16_0.xzw * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = vec3(u_xlat22) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat5.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_0.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat10.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlat16_65 = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_65) + u_xlat16_70;
    u_xlat16_80 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_40.z = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_70 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_40.z * u_xlat16_65;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _OcclusionScale * u_xlat16_70 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_70;
    u_xlat22 = min(u_xlat16_65, 1.0);
    u_xlat64 = min(u_xlat22, u_xlat16_1.z);
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat64) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_0.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat64) * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat64) + (-u_xlat16_20.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat64) + u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_20.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_20.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_21>=0.0);
#else
    u_xlatb1 = u_xlat16_21>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat16_25.xyz * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.zxy * u_xlat16_25.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat9.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_2.x = u_xlat16_66 * 8.0;
    u_xlat16_23 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = abs(u_xlat16_21) * u_xlat16_2.x;
    u_xlat5.xyz = u_xlat16_2.xxx * u_xlat5.xyz + u_xlat10.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat5.xyz = vec3(u_xlat64) * u_xlat5.xyz;
    u_xlat16_2.x = dot((-u_xlat16_25.xyz), u_xlat5.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_2.xxx + (-u_xlat16_25.xyz);
    u_xlat6.xyz = u_xlat9.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat6.xyz = vec3(u_xlat16_23) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat8.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat6.xyz = abs(vec3(u_xlat16_21)) * u_xlat8.xyz + u_xlat6.xyz;
    u_xlat16_21 = -abs(u_xlat16_21) * 0.800000012 + 1.0;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_21);
    u_xlat64 = dot(u_xlat16_18.xyz, u_xlat5.xyz);
    u_xlat16_40.y = u_xlat64 * 0.5;
    u_xlat16_2.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_2.x;
    u_xlat16_5 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_21);
    u_xlat16_2.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_25.xyz = vec3(u_xlat16_65) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb64 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb64)) ? u_xlat16_25.xyz : u_xlat16_2.xyz;
    u_xlat13.y = u_xlat16_4.x;
    u_xlat16_40.x = u_xlat16_4.x * 1.09769487;
    u_xlat16_4.xyz = u_xlat16_40.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_21 = floor(u_xlat16_3.w);
    u_xlat16_65 = u_xlat16_21 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_3.x = u_xlat16_65 * 16.0 + u_xlat16_3.z;
    u_xlat16_4.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_3.x = u_xlat16_21 * 16.0 + u_xlat16_3.z;
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_5.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_21 = u_xlat16_4.z * 15.0 + (-u_xlat16_21);
    u_xlat16_65 = u_xlat16_64 + (-u_xlat16_5.x);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_65 + u_xlat16_5.x;
    u_xlat16_21 = u_xlat16_70 * u_xlat16_21;
    u_xlat1.x = u_xlat1.x * u_xlat16_21;
    u_xlat16_21 = u_xlat22 * 0.5;
    u_xlat16_65 = (-u_xlat22) * 0.5 + 1.0;
    u_xlat16_21 = u_xlat1.x * u_xlat16_65 + u_xlat16_21;
    u_xlat16_65 = u_xlat16_21 + u_xlat16_21;
    u_xlat16_3.x = (-u_xlat16_21) * 2.0 + 1.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_3.x + u_xlat16_65;
    u_xlat16_21 = u_xlat16_21 * u_xlat22;
    u_xlat16_21 = min(u_xlat16_21, u_xlat16_1.z);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * u_xlat16_2.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_0.xzw;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
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
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec4 u_xlati1;
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
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
mediump float u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat46;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
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
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
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
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat66);
    u_xlat2.x = (-u_xlat66) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat66;
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
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22 * _ShadowStrength;
    u_xlat22 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_66 = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat16_73 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_73 = u_xlat16_73 * 2.0 + -0.0599999987;
    u_xlat16_73 = u_xlat16_73 * _ChangColorShrink + u_xlat16_66;
    u_xlat16_11.x = dot(vec2(u_xlat16_73), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_73 = u_xlat16_73 + -0.100000001;
    u_xlat16_73 = u_xlat16_73 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _ChangEdgeColor.xyz;
    u_xlat16_77 = u_xlat16_73 * -2.0 + 3.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_73 = min(u_xlat16_73, 1.0);
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
    u_xlat16_12.xyz = vec3(u_xlat16_73) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_73) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat66 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_77 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_77) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_35.xyz = u_xlat2.xyz * vec3(u_xlat16_77);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat1.x;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat67 = (-u_xlat16_77) * u_xlat1.x + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat3.xyz = u_xlat16_12.xyz * vec3(u_xlat67);
    u_xlat3.xyz = vec3(u_xlat66) * vec3(u_xlat16_77) + u_xlat3.xyz;
    u_xlat16_14.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_66 = texture(_AnisotropicTex, u_xlat16_14.xy).x;
    u_xlat66 = u_xlat16_66 * 2.0 + -1.0;
    u_xlat1.x = u_xlat66 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat66 = u_xlat66 * _SunShift + _SunShiftOffset;
    u_xlat66 = u_xlat66 + vs_TEXCOORD5;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb67 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat67 = (u_xlatb67) ? 1.0 : -1.0;
    u_xlat67 = u_xlat67 * vs_TEXCOORD2.w;
    u_xlat68 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat68) + u_xlat8.xyz;
    u_xlat68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat4.xyz = vec3(u_xlat68) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat2.xyz);
    u_xlat16_77 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat67 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat68 = (-u_xlat16_77) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_78;
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat67;
    u_xlat16_77 = dot(u_xlat4.zxy, u_xlat2.xyz);
    u_xlat10.x = u_xlat68 * u_xlat16_77;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat69 = u_xlat68 * u_xlat67;
    u_xlat10.z = u_xlat1.x * u_xlat69;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat69 / u_xlat70;
    u_xlat69 = u_xlat69 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat69 = u_xlat69 * u_xlat70;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat70 = dot(u_xlat8.xyz, u_xlat16_35.xyz);
    u_xlat72 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.z = u_xlat68 * u_xlat72;
    u_xlat10.z = u_xlat68 * u_xlat70;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat4.zxy, u_xlat16_35.xyz);
    u_xlat10.y = u_xlat67 * u_xlat68;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat70 + u_xlat10.x;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat16_14.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.y = u_xlat67 * u_xlat16_14.x;
    u_xlat8.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat70 * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = u_xlat69 * u_xlat67;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat67);
    u_xlat16_36.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat15.xyz = u_xlat16_36.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat8.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_7.xyz * u_xlat15.xyz;
    u_xlat16_36.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat2.xyz);
    u_xlat16_73 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat2.x = u_xlat16_73 * u_xlat16_78;
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat17.y = u_xlat67 * u_xlat2.x;
    u_xlat67 = (-u_xlat16_73) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat16_78;
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat17.x = u_xlat16_77 * u_xlat67;
    u_xlat24 = u_xlat67 * u_xlat2.x;
    u_xlat17.z = u_xlat1.x * u_xlat24;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat24 / u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat24 * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat24 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat46 = dot(u_xlat16.xyz, u_xlat16_35.xyz);
    u_xlat10.z = u_xlat67 * u_xlat46;
    u_xlat8.z = u_xlat67 * u_xlat24;
    u_xlat8.y = u_xlat16_14.x * u_xlat2.x;
    u_xlat10.y = u_xlat68 * u_xlat2.x;
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat2.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat10.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat67 = u_xlat2.x * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat1.x = u_xlat67 * u_xlat1.x;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_36.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat16_77 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_77) * u_xlat16_18.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_77) + u_xlat16_80;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_80 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_77;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_80;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_77));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_20.y = u_xlat16_18.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati1.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati44 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat66) * u_xlat16_11.xyz + u_xlat5.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb1 = u_xlat16_73>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat4.xyz;
    u_xlat1.xyw = u_xlat16_35.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_35.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_78 * 8.0;
    u_xlat16_33 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_73) * u_xlat16_11.x;
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat23);
    u_xlat16_11.x = dot((-u_xlat16_35.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_35.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_33) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_73)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_73 = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_73 = u_xlat16_13.x * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_73);
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_73);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_2.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_2.x = u_xlat16_77 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_73 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_73 = u_xlat16_13.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = (-u_xlat16_44) + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_44;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat0.x = u_xlat1.x * u_xlat16_73;
    u_xlat16_73 = u_xlat0.y * 0.5;
    u_xlat16_77 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_12.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_12.x + u_xlat16_77;
    u_xlat16_73 = u_xlat0.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_1.z, u_xlat16_73);
    u_xlat16_11.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out mediump float vs_TEXCOORD5;
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
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	mediump vec4 _ChangEdgeColor;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicTex;
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
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec4 u_xlati1;
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
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
mediump float u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_36;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat46;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
float u_xlat70;
float u_xlat71;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_84;
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
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat5.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat8.xyz = vec3(u_xlat71) * u_xlat16_7.xyz;
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
    u_xlat71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat66);
    u_xlat2.x = (-u_xlat66) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat66;
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
    u_xlat22 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_22 * _ShadowStrength;
    u_xlat22 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_66 = texture(_ChangColorDissolveTex, u_xlat16_11.xy).x;
    u_xlat16_73 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_73 = u_xlat16_73 * 2.0 + -0.0599999987;
    u_xlat16_73 = u_xlat16_73 * _ChangColorShrink + u_xlat16_66;
    u_xlat16_11.x = dot(vec2(u_xlat16_73), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_73 = u_xlat16_73 + -0.100000001;
    u_xlat16_73 = u_xlat16_73 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _ChangEdgeColor.xyz;
    u_xlat16_77 = u_xlat16_73 * -2.0 + 3.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77;
    u_xlat16_73 = min(u_xlat16_73, 1.0);
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
    u_xlat16_12.xyz = vec3(u_xlat16_73) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(u_xlat16_73) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_13.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat66 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_77 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_77) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_35.xyz = u_xlat2.xyz * vec3(u_xlat16_77);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat1.x;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat67 = (-u_xlat16_77) * u_xlat1.x + 1.0;
    u_xlat16_77 = u_xlat1.x * u_xlat16_77;
    u_xlat3.xyz = u_xlat16_12.xyz * vec3(u_xlat67);
    u_xlat3.xyz = vec3(u_xlat66) * vec3(u_xlat16_77) + u_xlat3.xyz;
    u_xlat16_14.xy = vs_TEXCOORD3.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_66 = texture(_AnisotropicTex, u_xlat16_14.xy).x;
    u_xlat66 = u_xlat16_66 * 2.0 + -1.0;
    u_xlat1.x = u_xlat66 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat66 = u_xlat66 * _SunShift + _SunShiftOffset;
    u_xlat66 = u_xlat66 + vs_TEXCOORD5;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb67 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat67 = (u_xlatb67) ? 1.0 : -1.0;
    u_xlat67 = u_xlat67 * vs_TEXCOORD2.w;
    u_xlat68 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat68) + u_xlat8.xyz;
    u_xlat68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat4.xyz = vec3(u_xlat68) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat8.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat2.xyz);
    u_xlat16_77 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_1.zz);
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat67 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat68 = (-u_xlat16_77) + 1.0;
    u_xlat68 = u_xlat68 * u_xlat16_78;
    u_xlat68 = max(u_xlat68, 0.00100000005);
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat10.y = u_xlat1.x * u_xlat67;
    u_xlat16_77 = dot(u_xlat4.zxy, u_xlat2.xyz);
    u_xlat10.x = u_xlat68 * u_xlat16_77;
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat69 = u_xlat68 * u_xlat67;
    u_xlat10.z = u_xlat1.x * u_xlat69;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat69 / u_xlat70;
    u_xlat69 = u_xlat69 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat69 = u_xlat69 * u_xlat70;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat70 = dot(u_xlat8.xyz, u_xlat16_35.xyz);
    u_xlat72 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.z = u_xlat68 * u_xlat72;
    u_xlat10.z = u_xlat68 * u_xlat70;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat68 = dot(u_xlat4.zxy, u_xlat16_35.xyz);
    u_xlat10.y = u_xlat67 * u_xlat68;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat70 + u_xlat10.x;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat16_14.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat8.y = u_xlat67 * u_xlat16_14.x;
    u_xlat8.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat70 * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = u_xlat69 * u_xlat67;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat67);
    u_xlat16_36.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat15.xyz = u_xlat16_36.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat8.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_7.xyz * u_xlat15.xyz;
    u_xlat16_36.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_36.xyz = vec3(u_xlat16_73) * u_xlat16_36.xyz + _DirectSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat9.xyz + u_xlat5.zxy;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat2.xyz);
    u_xlat16_73 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_1.zz);
    u_xlat2.x = u_xlat16_73 * u_xlat16_78;
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat17.y = u_xlat67 * u_xlat2.x;
    u_xlat67 = (-u_xlat16_73) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat16_78;
    u_xlat67 = max(u_xlat67, 0.00100000005);
    u_xlat17.x = u_xlat16_77 * u_xlat67;
    u_xlat24 = u_xlat67 * u_xlat2.x;
    u_xlat17.z = u_xlat1.x * u_xlat24;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat24 / u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat24 * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat24 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat46 = dot(u_xlat16.xyz, u_xlat16_35.xyz);
    u_xlat10.z = u_xlat67 * u_xlat46;
    u_xlat8.z = u_xlat67 * u_xlat24;
    u_xlat8.y = u_xlat16_14.x * u_xlat2.x;
    u_xlat10.y = u_xlat68 * u_xlat2.x;
    u_xlat67 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat8.x;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat2.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat10.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat67 = u_xlat2.x * u_xlat67 + 6.10351563e-05;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat1.x = u_xlat67 * u_xlat1.x;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_36.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat16_77 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_36.xyz = u_xlat1.xyw * u_xlat16_36.xxx;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_36.xyz = u_xlat16_36.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat16_40 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_36.xyz);
    u_xlat1.x = dot(u_xlat9.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_40 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_36.x);
    u_xlat16_36.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_36.x = (-u_xlat16_36.x) * u_xlat16_36.x + 1.0;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_14.x = u_xlat16_36.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_18.x, u_xlat16_14.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat22) * u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat6.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_OcclusionScale) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_77) * u_xlat16_18.xyz;
    u_xlat16_77 = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_77) + u_xlat16_80;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_84 + 1.0;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_80 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_41.z * u_xlat16_77;
    u_xlat16_80 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 + -1.0;
    u_xlat16_80 = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_80;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_77));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_20.y = u_xlat16_18.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati1.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_80) * u_xlat16_21.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati44 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = vec3(u_xlat66) * u_xlat16_11.xyz + u_xlat5.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_73>=0.0);
#else
    u_xlatb1 = u_xlat16_73>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat4.xyz;
    u_xlat1.xyw = u_xlat16_35.xyz * u_xlat0.xzw;
    u_xlat1.xyw = u_xlat0.wxz * u_xlat16_35.yzx + (-u_xlat1.xyw);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyw;
    u_xlat0.xzw = u_xlat1.wxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat71) + u_xlat0.xzw;
    u_xlat16_11.x = u_xlat16_78 * 8.0;
    u_xlat16_33 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_33 = max(u_xlat16_33, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_73) * u_xlat16_11.x;
    u_xlat0.xzw = u_xlat16_11.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat23);
    u_xlat16_11.x = dot((-u_xlat16_35.xyz), u_xlat0.xzw);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_11.xxx + (-u_xlat16_35.xyz);
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat71) + (-u_xlat0.xzw);
    u_xlat2.xyz = vec3(u_xlat16_33) * u_xlat2.xyz + u_xlat0.xzw;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat2.xyz);
    u_xlat2.xyz = abs(vec3(u_xlat16_73)) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_73 = -abs(u_xlat16_73) * 0.800000012 + 1.0;
    u_xlat16_73 = u_xlat16_13.x * u_xlat16_73;
    u_xlat16_73 = u_xlat16_73 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_73);
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat2.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat2.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat2.xyz, u_xlat16_73);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_77) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_11.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_2.w);
    u_xlat16_77 = u_xlat16_73 + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_2.x = u_xlat16_77 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_73 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_73 = u_xlat16_13.z * 15.0 + (-u_xlat16_73);
    u_xlat16_77 = (-u_xlat16_44) + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_77 + u_xlat16_44;
    u_xlat16_73 = u_xlat16_80 * u_xlat16_73;
    u_xlat0.x = u_xlat1.x * u_xlat16_73;
    u_xlat16_73 = u_xlat0.y * 0.5;
    u_xlat16_77 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_77 + u_xlat16_73;
    u_xlat16_77 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_12.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_12.x + u_xlat16_77;
    u_xlat16_73 = u_xlat0.y * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_1.z, u_xlat16_73);
    u_xlat16_11.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
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
  GpuProgramID 94424
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_FlowLight_Glitter_ColorChangGUI"
}