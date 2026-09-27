//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_GradientFlowHair_Simple" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _AlbedoMap ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_GradientFlowMap ("彩色流动贴图", 2D) = "white" { }

_GradientFlowMask ("彩色流动遮罩", 2D) = "white" { }

_GradientFlowDirSpeed ("流动方向速度", Vector) = (1,0,0,0)

[Toggle] _anisoUse2U ("各向异性使用2U", Float) = 0.0

_AnisotropicMap ("各向异性贴图", 2D) = "white" { }

_SunShift ("各向异性扭曲", Float) = 1.0

_SunShiftOffset ("各向异性偏移", Float) = 1.0

_AnisotropicMultiplier ("各向异性强度", Range(0, 1)) = 1.0

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.0

_ShadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 42984
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_23;
ivec3 u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
vec3 u_xlat39;
mediump float u_xlat16_41;
mediump vec3 u_xlat16_43;
float u_xlat46;
mediump float u_xlat16_46;
int u_xlati46;
mediump float u_xlat16_47;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
mediump float u_xlat16_73;
bool u_xlatb73;
float u_xlat74;
mediump float u_xlat16_76;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_87;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_24.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat69 * u_xlat69;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_3.x = u_xlat69 * u_xlat16_71;
    u_xlat69 = (-u_xlat16_71) * u_xlat69 + 1.0;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_GradientFlowMap, u_xlat5.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_26.xyz = u_xlat16_5.zxy * u_xlat16_26.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.zxy;
    u_xlat16_26.xyz = u_xlat16_5.zxy * u_xlat16_26.xyz + (-u_xlat16_7.xyz);
    u_xlat16_73 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_26.xyz = vec3(u_xlat16_73) * u_xlat16_26.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_26.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat69 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_3.xxx + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.5<_anisoUse2U);
#else
    u_xlatb73 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb73)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_73 = texture(_AnisotropicMap, u_xlat5.xw).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb5 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat5.x = (u_xlatb5) ? 1.0 : -1.0;
    u_xlat5.x = u_xlat5.x * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_71 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_31.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_71) + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_31.xyz, u_xlat16_31.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat16_31.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_31.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_31.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_31.xyz, u_xlat11.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat11.xyz = vec3(u_xlat74) * u_xlat9.xyz;
    u_xlat78 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat78) + u_xlat10.xyz;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat10.xyz = vec3(u_xlat78) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat5.xxx * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat73) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat13.xyz = u_xlat5.xxx * u_xlat13.xyz;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_71 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_71 + -1.0;
    u_xlat78 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_76 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_76 = max(u_xlat16_76, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_76;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat14.z = u_xlat5.x * u_xlat78;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat5.x = u_xlat16_71 * u_xlat16_76;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat5.x;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat14.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_24.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat78 * u_xlat80;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat5.x * u_xlat80;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat15.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat5.x * u_xlat81;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_71 * u_xlat78;
    u_xlat27.x = u_xlat78 * u_xlat5.x;
    u_xlat16.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat50 = u_xlat27.x * 0.318309873;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _DirectSpecularColor.zxy;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_37.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat37.xy = u_xlat16_37.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xy = min(max(u_xlat37.xy, 0.0), 1.0);
#else
    u_xlat37.xy = clamp(u_xlat37.xy, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * u_xlat37.xxx;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat16_71 * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_71) + 1.0;
    u_xlat17.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat81 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat78 * u_xlat81;
    u_xlat16.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat16_71 * u_xlat5.x;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat16.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat80 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat4.x = u_xlat4.x * u_xlat81;
    u_xlat16_71 = u_xlat79 * u_xlat79;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_31.x = u_xlat79 * u_xlat16_71;
    u_xlat79 = (-u_xlat16_71) * u_xlat79 + 1.0;
    u_xlat39.xyz = u_xlat16_7.xyz * vec3(u_xlat79);
    u_xlat39.xyz = vec3(u_xlat69) * u_xlat16_31.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _DirectSpecularColor.zxy;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat16_31.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_18.x = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat6.xyz * u_xlat16_18.xxx;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat13.xyz, u_xlat16_18.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat78;
    u_xlat13.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat0.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_18.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat4.x * u_xlat27.x;
    u_xlat23.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23.x = max(u_xlat23.x, 6.10351563e-05);
    u_xlat23.x = u_xlat27.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat50 * u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat16_18.xyz);
    u_xlat6.y = u_xlat16_1.x * u_xlat5.x;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat6.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat80 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat23.x = u_xlat46 * u_xlat23.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_41 = u_xlat0.x * u_xlat16_18.x;
    u_xlat0.x = (-u_xlat16_18.x) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_7.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat69) * vec3(u_xlat16_41) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat23.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_18.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = float(1.0) / float(u_xlat16_71);
    u_xlat16_18.x = (-u_xlat16_18.x) * u_xlat16_18.x + 1.0;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_18.x;
    u_xlat16_71 = max(u_xlat16_19.x, u_xlat16_71);
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_18.x = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_18.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_18.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_18.xyz;
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat37.yyy + u_xlat16_31.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_26.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat37.yyy * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_26.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat37.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat16_26.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_26.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_19.xyz = u_xlat16_1.xxx * u_xlat16_19.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_1.x;
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
    u_xlat23.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati23.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati23.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati23.x = int(uint(uint(u_xlati23.x) & 1u));
    u_xlati46 = (u_xlati23.z != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati23.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_26.xyz * u_xlat16_18.xyz + u_xlat16_2.xyz;
    u_xlat16_26.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * vs_TEXCOORD1.yzx;
    u_xlat23.xyz = vec3(u_xlat73) * u_xlat16_26.xyz + u_xlat12.xyz;
    u_xlat4.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat23.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : u_xlat10.xyz;
    u_xlat4.xyz = u_xlat16_24.xyz * u_xlat23.xyz;
    u_xlat4.xyz = u_xlat23.zxy * u_xlat16_24.yzx + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat23.xyz * u_xlat4.xyz;
    u_xlat23.xyz = u_xlat4.zxy * u_xlat23.yzx + (-u_xlat6.xyz);
    u_xlat23.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + u_xlat23.xyz;
    u_xlat16_26.x = u_xlat16_76 * 8.0;
    u_xlat16_49 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_26.x = u_xlat16_26.x * abs(u_xlat16_3.x);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat11.xyz;
    u_xlat4.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat27.xxx;
    u_xlat16_26.x = dot((-u_xlat16_24.xyz), u_xlat23.xyz);
    u_xlat16_26.x = u_xlat16_26.x + u_xlat16_26.x;
    u_xlat23.xyz = (-u_xlat23.xyz) * u_xlat16_26.xxx + (-u_xlat16_24.xyz);
    u_xlat27.xyz = u_xlat9.xyz * vec3(u_xlat74) + (-u_xlat23.xyz);
    u_xlat27.xyz = vec3(u_xlat16_49) * u_xlat27.xyz + u_xlat23.xyz;
    u_xlat5.xyw = u_xlat23.xyz + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(u_xlat16_3.xxx) * u_xlat5.xyw + u_xlat27.xyz;
    u_xlat16_24.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_24.x = u_xlat16_8.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_24.x);
    u_xlat23.x = dot(u_xlat16_19.xyz, u_xlat23.xyz);
    u_xlat16_43.y = u_xlat23.x * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_47;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_24.x);
    u_xlat16_24.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat23.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat23.xyz * u_xlat23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = u_xlat16_1.xxx * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb23 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb23)) ? u_xlat16_18.xyz : u_xlat16_24.xyz;
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_43.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_3.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_70 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_70 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_70 = u_xlat16_18.z * 15.0 + (-u_xlat16_70);
    u_xlat16_7.x = (-u_xlat16_46) + u_xlat16_23.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_46;
    u_xlat16_70 = u_xlat16_71 * u_xlat16_70;
    u_xlat23.x = u_xlat4.x * u_xlat16_70;
    u_xlat16_70 = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_70 = u_xlat23.x * u_xlat16_71 + u_xlat16_70;
    u_xlat16_71 = u_xlat16_70 + u_xlat16_70;
    u_xlat16_7.x = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_71;
    u_xlat16_70 = u_xlat0.x * u_xlat16_70;
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_70) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_7.yzx + u_xlat16_31.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_2.xyz;
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
    u_xlat69 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat2.x = u_xlat69 * 0.0625 + u_xlat2.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_23.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_24.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_23;
ivec3 u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
vec3 u_xlat39;
mediump float u_xlat16_41;
mediump vec3 u_xlat16_43;
float u_xlat46;
mediump float u_xlat16_46;
int u_xlati46;
mediump float u_xlat16_47;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
mediump float u_xlat16_73;
bool u_xlatb73;
float u_xlat74;
mediump float u_xlat16_76;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_87;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_24.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat69 * u_xlat69;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_3.x = u_xlat69 * u_xlat16_71;
    u_xlat69 = (-u_xlat16_71) * u_xlat69 + 1.0;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_GradientFlowMap, u_xlat5.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_26.xyz = u_xlat16_5.zxy * u_xlat16_26.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.zxy;
    u_xlat16_26.xyz = u_xlat16_5.zxy * u_xlat16_26.xyz + (-u_xlat16_7.xyz);
    u_xlat16_73 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_26.xyz = vec3(u_xlat16_73) * u_xlat16_26.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_26.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat69 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_3.xxx + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.5<_anisoUse2U);
#else
    u_xlatb73 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb73)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_73 = texture(_AnisotropicMap, u_xlat5.xw).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb5 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat5.x = (u_xlatb5) ? 1.0 : -1.0;
    u_xlat5.x = u_xlat5.x * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_71 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_31.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_71) + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_31.xyz, u_xlat16_31.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat16_31.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_31.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_31.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_31.xyz, u_xlat11.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat11.xyz = vec3(u_xlat74) * u_xlat9.xyz;
    u_xlat78 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat78) + u_xlat10.xyz;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat10.xyz = vec3(u_xlat78) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat5.xxx * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat73) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat13.xyz = u_xlat5.xxx * u_xlat13.xyz;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_71 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_71 + -1.0;
    u_xlat78 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_76 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_76 = max(u_xlat16_76, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_76;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat14.z = u_xlat5.x * u_xlat78;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat5.x = u_xlat16_71 * u_xlat16_76;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat5.x;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat14.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_24.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat78 * u_xlat80;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat5.x * u_xlat80;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat15.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat5.x * u_xlat81;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_71 * u_xlat78;
    u_xlat27.x = u_xlat78 * u_xlat5.x;
    u_xlat16.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat50 = u_xlat27.x * 0.318309873;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _DirectSpecularColor.zxy;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_37.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat37.xy = u_xlat16_37.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xy = min(max(u_xlat37.xy, 0.0), 1.0);
#else
    u_xlat37.xy = clamp(u_xlat37.xy, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * u_xlat37.xxx;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat16_71 * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_71) + 1.0;
    u_xlat17.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat81 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat78 * u_xlat81;
    u_xlat16.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat16_71 * u_xlat5.x;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat16.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat80 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat4.x = u_xlat4.x * u_xlat81;
    u_xlat16_71 = u_xlat79 * u_xlat79;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_31.x = u_xlat79 * u_xlat16_71;
    u_xlat79 = (-u_xlat16_71) * u_xlat79 + 1.0;
    u_xlat39.xyz = u_xlat16_7.xyz * vec3(u_xlat79);
    u_xlat39.xyz = vec3(u_xlat69) * u_xlat16_31.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _DirectSpecularColor.zxy;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat16_31.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_18.x = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat6.xyz * u_xlat16_18.xxx;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat13.xyz, u_xlat16_18.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat78;
    u_xlat13.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat0.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_18.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat4.x * u_xlat27.x;
    u_xlat23.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23.x = max(u_xlat23.x, 6.10351563e-05);
    u_xlat23.x = u_xlat27.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat50 * u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat16_18.xyz);
    u_xlat6.y = u_xlat16_1.x * u_xlat5.x;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat6.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat80 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat23.x = u_xlat46 * u_xlat23.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_41 = u_xlat0.x * u_xlat16_18.x;
    u_xlat0.x = (-u_xlat16_18.x) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_7.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat69) * vec3(u_xlat16_41) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat23.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_18.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = float(1.0) / float(u_xlat16_71);
    u_xlat16_18.x = (-u_xlat16_18.x) * u_xlat16_18.x + 1.0;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_18.x;
    u_xlat16_71 = max(u_xlat16_19.x, u_xlat16_71);
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_18.x = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_18.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_18.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_18.xyz;
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat37.yyy + u_xlat16_31.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_26.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat37.yyy * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_26.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat37.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat16_26.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_26.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_19.xyz = u_xlat16_1.xxx * u_xlat16_19.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_1.x;
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
    u_xlat23.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati23.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati23.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati23.x = int(uint(uint(u_xlati23.x) & 1u));
    u_xlati46 = (u_xlati23.z != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati23.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_26.xyz * u_xlat16_18.xyz + u_xlat16_2.xyz;
    u_xlat16_26.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * vs_TEXCOORD1.yzx;
    u_xlat23.xyz = vec3(u_xlat73) * u_xlat16_26.xyz + u_xlat12.xyz;
    u_xlat4.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat23.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : u_xlat10.xyz;
    u_xlat4.xyz = u_xlat16_24.xyz * u_xlat23.xyz;
    u_xlat4.xyz = u_xlat23.zxy * u_xlat16_24.yzx + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat23.xyz * u_xlat4.xyz;
    u_xlat23.xyz = u_xlat4.zxy * u_xlat23.yzx + (-u_xlat6.xyz);
    u_xlat23.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + u_xlat23.xyz;
    u_xlat16_26.x = u_xlat16_76 * 8.0;
    u_xlat16_49 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_26.x = u_xlat16_26.x * abs(u_xlat16_3.x);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat11.xyz;
    u_xlat4.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat27.xxx;
    u_xlat16_26.x = dot((-u_xlat16_24.xyz), u_xlat23.xyz);
    u_xlat16_26.x = u_xlat16_26.x + u_xlat16_26.x;
    u_xlat23.xyz = (-u_xlat23.xyz) * u_xlat16_26.xxx + (-u_xlat16_24.xyz);
    u_xlat27.xyz = u_xlat9.xyz * vec3(u_xlat74) + (-u_xlat23.xyz);
    u_xlat27.xyz = vec3(u_xlat16_49) * u_xlat27.xyz + u_xlat23.xyz;
    u_xlat5.xyw = u_xlat23.xyz + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(u_xlat16_3.xxx) * u_xlat5.xyw + u_xlat27.xyz;
    u_xlat16_24.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_24.x = u_xlat16_8.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_24.x);
    u_xlat23.x = dot(u_xlat16_19.xyz, u_xlat23.xyz);
    u_xlat16_43.y = u_xlat23.x * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_47;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_24.x);
    u_xlat16_24.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat23.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat23.xyz * u_xlat23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = u_xlat16_1.xxx * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb23 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb23)) ? u_xlat16_18.xyz : u_xlat16_24.xyz;
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_43.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_3.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_70 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_70 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_70 = u_xlat16_18.z * 15.0 + (-u_xlat16_70);
    u_xlat16_7.x = (-u_xlat16_46) + u_xlat16_23.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_46;
    u_xlat16_70 = u_xlat16_71 * u_xlat16_70;
    u_xlat23.x = u_xlat4.x * u_xlat16_70;
    u_xlat16_70 = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_70 = u_xlat23.x * u_xlat16_71 + u_xlat16_70;
    u_xlat16_71 = u_xlat16_70 + u_xlat16_70;
    u_xlat16_7.x = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_71;
    u_xlat16_70 = u_xlat0.x * u_xlat16_70;
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_70) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_7.yzx + u_xlat16_31.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_2.xyz;
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
    u_xlat69 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat2.x = u_xlat69 * 0.0625 + u_xlat2.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_23.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_24.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
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
mediump vec3 u_xlat16_4;
bool u_xlatb4;
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
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
float u_xlat28;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_51;
vec2 u_xlat56;
mediump float u_xlat16_59;
float u_xlat69;
bool u_xlatb69;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlatb69 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb69 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat16_7.xyz;
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
    u_xlat74 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat9.xyz = vec3(u_xlat74) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb69)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat69 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat69) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat69);
    u_xlat2.x = (-u_xlat69) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat69;
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
    u_xlat23.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_23.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _ShadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_34.x = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_76);
    u_xlat16_76 = u_xlat16_11.x * u_xlat16_34.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_12.x);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat47 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat47) + u_xlat8.xyz;
    u_xlat47 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat2.xyz = vec3(u_xlat47) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat3.xyz = vec3(u_xlat71) * u_xlat3.xyz;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_76 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_81 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_81;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat5.z = u_xlat71 * u_xlat72;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat71 = u_xlat16_76 * u_xlat16_81;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat5.y = u_xlat16_59 * u_xlat71;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat73;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat73;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat4.w = u_xlat73 + u_xlat10.x;
    u_xlat4.xw = u_xlat4.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat4.x = u_xlat4.w * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat28 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat15.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat28;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat28 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat75 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat28 * u_xlat75;
    u_xlat28 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat75 / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat77 = u_xlat75 * 0.318309873;
    u_xlat28 = u_xlat28 * u_xlat77;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat28 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat56.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat56.xy = fract(u_xlat56.xy);
    u_xlat56.xy = u_xlat56.xy + vs_TEXCOORD3.zw;
    u_xlat16_15.xyz = texture(_GradientFlowMap, u_xlat56.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_16.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_16.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.zxy;
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_51 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_36.xyz;
    u_xlat28 = u_xlat16_36.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat19.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_11.x;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat75;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat75 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat77 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat78 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat78;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat78 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat16.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat78 = u_xlat4.w * u_xlat78 + 6.10351563e-05;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat4.x = u_xlat4.x * u_xlat78;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat19.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat19.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat4.xxx * u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _DirectSpecularColor.zxy;
    u_xlat19.xyz = u_xlat16.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat19.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_83);
    u_xlat16_18.xyz = u_xlat15.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_18.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat72;
    u_xlat15.y = u_xlat71 * u_xlat4.x;
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat72 * u_xlat16_76;
    u_xlat72 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_76) + 1.0;
    u_xlat15.z = u_xlat72 * u_xlat75;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat75 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat77 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat16_18.xyz);
    u_xlat3.y = u_xlat71 * u_xlat16_76;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat3.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat4.w * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat28) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _DirectSpecularColor.zxy;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_20.x, u_xlat16_83);
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_86);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_18.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat26.xyz = u_xlat26.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat26.xyz * u_xlat23.yyy + u_xlat16_11.xyz;
    u_xlat16_76 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_76 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_76) + u_xlat16_83;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati46 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_17.xyz = u_xlat16_17.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat24.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_80>=0.0);
#else
    u_xlatb1 = u_xlat16_80>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat74) + u_xlat0.xzw;
    u_xlat16_17.x = u_xlat16_81 * 8.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat16_17.x = min(u_xlat16_17.x, 1.0);
    u_xlat16_17.x = abs(u_xlat16_80) * u_xlat16_17.x;
    u_xlat0.xzw = u_xlat16_17.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat24.xxx;
    u_xlat16_17.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_17.x = u_xlat16_17.x + u_xlat16_17.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_17.xxx + (-u_xlat16_14.xyz);
    u_xlat24.xyz = u_xlat6.xyz * vec3(u_xlat74) + (-u_xlat0.xzw);
    u_xlat24.xyz = vec3(u_xlat16_81) * u_xlat24.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat24.xyz);
    u_xlat24.xyz = abs(vec3(u_xlat16_80)) * u_xlat2.xyz + u_xlat24.xyz;
    u_xlat16_80 = -abs(u_xlat16_80) * 0.800000012 + 1.0;
    u_xlat16_80 = u_xlat16_13.x * u_xlat16_80;
    u_xlat16_80 = u_xlat16_80 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_80);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat24.xz);
    u_xlat24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat24.xz);
    u_xlat24.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_80);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_2.w);
    u_xlat16_80 = u_xlat16_76 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_2.x = u_xlat16_80 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_76 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_76 = u_xlat16_14.z * 15.0 + (-u_xlat16_76);
    u_xlat16_80 = (-u_xlat16_46) + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80 + u_xlat16_46;
    u_xlat16_76 = u_xlat16_83 * u_xlat16_76;
    u_xlat0.x = u_xlat1.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.y * 0.5;
    u_xlat16_80 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_80 + u_xlat16_76;
    u_xlat16_80 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_81 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_81 + u_xlat16_80;
    u_xlat16_76 = u_xlat0.y * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_4.z, u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_12.yzx * u_xlat16_13.yzx + u_xlat16_11.yzx;
    u_xlat16_76 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_34.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_7.xyz;
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
    u_xlat69 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_23.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_76 : u_xlat16_11.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
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
mediump vec3 u_xlat16_4;
bool u_xlatb4;
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
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
float u_xlat28;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_51;
vec2 u_xlat56;
mediump float u_xlat16_59;
float u_xlat69;
bool u_xlatb69;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlatb69 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb69 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat16_7.xyz;
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
    u_xlat74 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat9.xyz = vec3(u_xlat74) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb69)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat69 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat69) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat69);
    u_xlat2.x = (-u_xlat69) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat69;
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
    u_xlat23.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_23.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _ShadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_34.x = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_76);
    u_xlat16_76 = u_xlat16_11.x * u_xlat16_34.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_12.x);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_AnisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat47 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat47) + u_xlat8.xyz;
    u_xlat47 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat2.xyz = vec3(u_xlat47) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat3.xyz = vec3(u_xlat71) * u_xlat3.xyz;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_76 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_81 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_81;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat5.z = u_xlat71 * u_xlat72;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat71 = u_xlat16_76 * u_xlat16_81;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat5.y = u_xlat16_59 * u_xlat71;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat73;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat73;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat4.w = u_xlat73 + u_xlat10.x;
    u_xlat4.xw = u_xlat4.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat4.x = u_xlat4.w * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat28 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat15.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat28;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat28 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat75 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat28 * u_xlat75;
    u_xlat28 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat75 / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat77 = u_xlat75 * 0.318309873;
    u_xlat28 = u_xlat28 * u_xlat77;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat28 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat56.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat56.xy = fract(u_xlat56.xy);
    u_xlat56.xy = u_xlat56.xy + vs_TEXCOORD3.zw;
    u_xlat16_15.xyz = texture(_GradientFlowMap, u_xlat56.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_16.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_16.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.zxy;
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_51 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_36.xyz;
    u_xlat28 = u_xlat16_36.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat19.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_11.x;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat75;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat75 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat77 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat78 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat78;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat78 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat16.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat78 = u_xlat4.w * u_xlat78 + 6.10351563e-05;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat4.x = u_xlat4.x * u_xlat78;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat19.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat19.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat4.xxx * u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _DirectSpecularColor.zxy;
    u_xlat19.xyz = u_xlat16.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat19.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_83);
    u_xlat16_18.xyz = u_xlat15.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_18.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat72;
    u_xlat15.y = u_xlat71 * u_xlat4.x;
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat72 * u_xlat16_76;
    u_xlat72 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_76) + 1.0;
    u_xlat15.z = u_xlat72 * u_xlat75;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat75 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat77 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat16_18.xyz);
    u_xlat3.y = u_xlat71 * u_xlat16_76;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat3.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat4.w * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat28) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _DirectSpecularColor.zxy;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_20.x, u_xlat16_83);
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_86);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_18.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat26.xyz = u_xlat26.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat26.xyz * u_xlat23.yyy + u_xlat16_11.xyz;
    u_xlat16_76 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_76 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_76) + u_xlat16_83;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati46 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_17.xyz = u_xlat16_17.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat24.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_80>=0.0);
#else
    u_xlatb1 = u_xlat16_80>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat74) + u_xlat0.xzw;
    u_xlat16_17.x = u_xlat16_81 * 8.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat16_17.x = min(u_xlat16_17.x, 1.0);
    u_xlat16_17.x = abs(u_xlat16_80) * u_xlat16_17.x;
    u_xlat0.xzw = u_xlat16_17.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat24.xxx;
    u_xlat16_17.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_17.x = u_xlat16_17.x + u_xlat16_17.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_17.xxx + (-u_xlat16_14.xyz);
    u_xlat24.xyz = u_xlat6.xyz * vec3(u_xlat74) + (-u_xlat0.xzw);
    u_xlat24.xyz = vec3(u_xlat16_81) * u_xlat24.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat24.xyz);
    u_xlat24.xyz = abs(vec3(u_xlat16_80)) * u_xlat2.xyz + u_xlat24.xyz;
    u_xlat16_80 = -abs(u_xlat16_80) * 0.800000012 + 1.0;
    u_xlat16_80 = u_xlat16_13.x * u_xlat16_80;
    u_xlat16_80 = u_xlat16_80 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_80);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat24.xz);
    u_xlat24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat24.xz);
    u_xlat24.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_80);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_2.w);
    u_xlat16_80 = u_xlat16_76 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_2.x = u_xlat16_80 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_76 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_76 = u_xlat16_14.z * 15.0 + (-u_xlat16_76);
    u_xlat16_80 = (-u_xlat16_46) + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80 + u_xlat16_46;
    u_xlat16_76 = u_xlat16_83 * u_xlat16_76;
    u_xlat0.x = u_xlat1.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.y * 0.5;
    u_xlat16_80 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_80 + u_xlat16_76;
    u_xlat16_80 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_81 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_81 + u_xlat16_80;
    u_xlat16_76 = u_xlat0.y * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_4.z, u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_12.yzx * u_xlat16_13.yzx + u_xlat16_11.yzx;
    u_xlat16_76 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_34.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_7.xyz;
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
    u_xlat69 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_23.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_23.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_23.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_76 : u_xlat16_11.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
ivec3 u_xlati9;
vec3 u_xlat10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
vec3 u_xlat25;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat38;
mediump vec2 u_xlat16_38;
int u_xlati38;
bool u_xlatb38;
mediump vec2 u_xlat16_39;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_59;
bool u_xlatb59;
mediump float u_xlat16_65;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.x;
    u_xlat4.y = u_xlat3.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.5<_anisoUse2U);
#else
    u_xlatb59 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb59)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_59 = texture(_AnisotropicMap, u_xlat3.xy).x;
    u_xlat59 = u_xlat16_59 * 2.0 + -1.0;
    u_xlat59 = u_xlat59 * _SunShift + _SunShiftOffset;
    u_xlat59 = u_xlat59 + vs_TEXCOORD6;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
    u_xlat22.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat4.x = dot(u_xlat2.zxy, u_xlat22.xyz);
    u_xlat2.xyz = (-u_xlat22.yzx) * u_xlat4.xxx + u_xlat2.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xxx;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat22.xyz;
    u_xlat4.xyz = u_xlat22.zxy * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(u_xlat59) * u_xlat16_1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat59) * u_xlat22.xyz + u_xlat4.zxy;
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat5.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_6.zz);
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb59 = u_xlat16_20.x>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb59)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_8.xyz = u_xlat16_39.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.xyz = u_xlat5.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat5.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat5.yzx + (-u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat57) + u_xlat5.xyz;
    u_xlat16_39.xy = u_xlat16_6.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_65 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat16_11.x = u_xlat16_65 * 8.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_20.x) * u_xlat16_11.x;
    u_xlat5.xyz = u_xlat16_11.xxx * u_xlat5.xyz + u_xlat22.xyz;
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat5.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.xyz), u_xlat5.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_11.xxx + (-u_xlat16_8.xyz);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat57) + (-u_xlat5.xyz);
    u_xlat16_11.xyz = (-u_xlat0.xyz) * vec3(u_xlat57) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat22.xyz;
    u_xlat16_68 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat0.xyz = vec3(u_xlat16_68) * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat9.xyz = (-u_xlat0.xyz) + u_xlat5.xyz;
    u_xlat0.xyz = abs(u_xlat16_20.xxx) * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_13.x = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat0.x = (-u_xlat16_20.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_65;
    u_xlat0.y = u_xlat16_1.x * u_xlat16_65;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_39.x * u_xlat16_13.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_9 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_9.zxy;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat9.xyz * u_xlat9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_15.y = u_xlat16_14.y;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _OcclusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati38 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati57 = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_15.xyw;
    u_xlat16_20.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_20.xxx * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb38)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat9.x = dot(u_xlat22.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat9.x;
    u_xlat10.y = u_xlat16_39.x;
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat6.xw = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat6.xw = fract(u_xlat6.xw);
    u_xlat6.xw = u_xlat6.xw + vs_TEXCOORD3.zw;
    u_xlat16_29.xyz = texture(_GradientFlowMap, u_xlat6.xw).xyz;
    u_xlat16_16.xyz = u_xlat16_29.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_29.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_11.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_11.zxy * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _AlbedoColor.zxy;
    u_xlat16_16.xyz = u_xlat16_29.zxy * u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_59 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_39.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20.x = u_xlat16_39.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_20.y = u_xlat38 * 0.5;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_20.z = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_18.xyz = u_xlat16_20.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_5.w);
    u_xlat16_39.x = u_xlat16_20.x + 1.0;
    u_xlat16_39.x = min(u_xlat16_39.x, 15.0);
    u_xlat16_5.x = u_xlat16_39.x * 16.0 + u_xlat16_5.z;
    u_xlat16_18.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_5.x = u_xlat16_20.x * 16.0 + u_xlat16_5.z;
    u_xlat16_18.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_20.x = u_xlat16_18.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_39.x = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_39.x + u_xlat16_57;
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_39.x = dot(u_xlat16_14.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_39.x * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat16_39.x) + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x + u_xlat16_39.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat57 = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat57 * 0.5;
    u_xlat16_20.x = (-u_xlat57) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat38 * u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_20.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_39.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39.x + u_xlat16_20.x;
    u_xlat16_1.x = u_xlat57 * u_xlat16_1.x;
    u_xlat38 = min(u_xlat57, u_xlat16_6.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_6.z);
    u_xlat16_20.x = (-u_xlat16_6.y) * _MetallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat16_8.xyz);
    u_xlat59 = dot(u_xlat2.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat0.y * u_xlat59;
    u_xlat9.z = u_xlat57 * u_xlat0.x;
    u_xlat57 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat10.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat59 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat0.x * u_xlat59;
    u_xlat16_1.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat0.y * u_xlat16_1.x;
    u_xlat6.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat6.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat59 + 6.10351563e-05;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat59 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat25.xyz = vec3(u_xlat59) * u_xlat7.xyz;
    u_xlat59 = dot(u_xlat4.xyz, u_xlat25.xyz);
    u_xlat4.y = u_xlat0.y * u_xlat59;
    u_xlat19 = u_xlat0.x * u_xlat0.y;
    u_xlat16_1.x = dot(u_xlat2.zxy, u_xlat25.xyz);
    u_xlat4.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.x = dot(u_xlat22.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_1.x) + 1.0;
    u_xlat4.z = u_xlat0.x * u_xlat19;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat19 / u_xlat0.x;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat19 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat57 * u_xlat0.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_8.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat19 = (-u_xlat16_1.x) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_17.xyz * vec3(u_xlat19);
    u_xlat19 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _DirectSpecularColor.zxy;
    u_xlat0.xyw = u_xlat6.xxx * u_xlat0.xyw;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_8.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat2.xyz * u_xlat16_8.xxx;
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.yyy + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_27.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_27.x = (-u_xlat16_27.x) * u_xlat16_27.x + 1.0;
    u_xlat16_27.x = max(u_xlat16_27.x, 0.0);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_27.x;
    u_xlat16_1.x = max(u_xlat16_14.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_27.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_27.x, u_xlat16_8.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_20.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat21.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_8.xyz;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat2.xyw * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_70 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_70;
    u_xlat16_1.x = max(u_xlat16_16.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_70);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_65;
    u_xlat16_14.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.yyy * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat2.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = vec3(u_xlat38) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat38) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat38) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat38) * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat38) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * vec3(u_xlat38) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat0.ywx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.yzx;
    u_xlat16_58 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_11.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_11.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_27.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_27.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_27.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_27.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat2.x = u_xlat57 * 0.0625 + u_xlat2.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_19.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_8.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
ivec3 u_xlati9;
vec3 u_xlat10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
vec3 u_xlat25;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat38;
mediump vec2 u_xlat16_38;
int u_xlati38;
bool u_xlatb38;
mediump vec2 u_xlat16_39;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_59;
bool u_xlatb59;
mediump float u_xlat16_65;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.x;
    u_xlat4.y = u_xlat3.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.5<_anisoUse2U);
#else
    u_xlatb59 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb59)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_59 = texture(_AnisotropicMap, u_xlat3.xy).x;
    u_xlat59 = u_xlat16_59 * 2.0 + -1.0;
    u_xlat59 = u_xlat59 * _SunShift + _SunShiftOffset;
    u_xlat59 = u_xlat59 + vs_TEXCOORD6;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
    u_xlat22.xyz = vec3(u_xlat57) * u_xlat0.xyz;
    u_xlat4.x = dot(u_xlat2.zxy, u_xlat22.xyz);
    u_xlat2.xyz = (-u_xlat22.yzx) * u_xlat4.xxx + u_xlat2.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xxx;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat22.xyz;
    u_xlat4.xyz = u_xlat22.zxy * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(u_xlat59) * u_xlat16_1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat59) * u_xlat22.xyz + u_xlat4.zxy;
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat5.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_6.zz);
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb59 = u_xlat16_20.x>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb59)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_8.xyz = u_xlat16_39.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.xyz = u_xlat5.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat5.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat5.yzx + (-u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat57) + u_xlat5.xyz;
    u_xlat16_39.xy = u_xlat16_6.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_65 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat16_11.x = u_xlat16_65 * 8.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_20.x) * u_xlat16_11.x;
    u_xlat5.xyz = u_xlat16_11.xxx * u_xlat5.xyz + u_xlat22.xyz;
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat5.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.xyz), u_xlat5.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_11.xxx + (-u_xlat16_8.xyz);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat57) + (-u_xlat5.xyz);
    u_xlat16_11.xyz = (-u_xlat0.xyz) * vec3(u_xlat57) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat22.xyz;
    u_xlat16_68 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat0.xyz = vec3(u_xlat16_68) * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat9.xyz = (-u_xlat0.xyz) + u_xlat5.xyz;
    u_xlat0.xyz = abs(u_xlat16_20.xxx) * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_13.x = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat0.x = (-u_xlat16_20.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_65;
    u_xlat0.y = u_xlat16_1.x * u_xlat16_65;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_39.x * u_xlat16_13.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_9 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_9.zxy;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat9.xyz * u_xlat9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_15.y = u_xlat16_14.y;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _OcclusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati38 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati57 = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_15.xyw;
    u_xlat16_20.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_20.xxx * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb38)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat9.x = dot(u_xlat22.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat9.x;
    u_xlat10.y = u_xlat16_39.x;
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat6.xw = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat6.xw = fract(u_xlat6.xw);
    u_xlat6.xw = u_xlat6.xw + vs_TEXCOORD3.zw;
    u_xlat16_29.xyz = texture(_GradientFlowMap, u_xlat6.xw).xyz;
    u_xlat16_16.xyz = u_xlat16_29.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_29.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_11.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_11.zxy * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _AlbedoColor.zxy;
    u_xlat16_16.xyz = u_xlat16_29.zxy * u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_59 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_39.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20.x = u_xlat16_39.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_20.y = u_xlat38 * 0.5;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_20.z = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_18.xyz = u_xlat16_20.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_5.w);
    u_xlat16_39.x = u_xlat16_20.x + 1.0;
    u_xlat16_39.x = min(u_xlat16_39.x, 15.0);
    u_xlat16_5.x = u_xlat16_39.x * 16.0 + u_xlat16_5.z;
    u_xlat16_18.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_5.x = u_xlat16_20.x * 16.0 + u_xlat16_5.z;
    u_xlat16_18.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_20.x = u_xlat16_18.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_39.x = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_39.x + u_xlat16_57;
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_39.x = dot(u_xlat16_14.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_39.x * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat16_39.x) + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x + u_xlat16_39.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat57 = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat57 * 0.5;
    u_xlat16_20.x = (-u_xlat57) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat38 * u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_20.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_39.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39.x + u_xlat16_20.x;
    u_xlat16_1.x = u_xlat57 * u_xlat16_1.x;
    u_xlat38 = min(u_xlat57, u_xlat16_6.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_6.z);
    u_xlat16_20.x = (-u_xlat16_6.y) * _MetallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat16_8.xyz);
    u_xlat59 = dot(u_xlat2.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat0.y * u_xlat59;
    u_xlat9.z = u_xlat57 * u_xlat0.x;
    u_xlat57 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat10.x;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat59 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat0.x * u_xlat59;
    u_xlat16_1.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat0.y * u_xlat16_1.x;
    u_xlat6.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat6.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat59 + 6.10351563e-05;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat59 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat25.xyz = vec3(u_xlat59) * u_xlat7.xyz;
    u_xlat59 = dot(u_xlat4.xyz, u_xlat25.xyz);
    u_xlat4.y = u_xlat0.y * u_xlat59;
    u_xlat19 = u_xlat0.x * u_xlat0.y;
    u_xlat16_1.x = dot(u_xlat2.zxy, u_xlat25.xyz);
    u_xlat4.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.x = dot(u_xlat22.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_1.x) + 1.0;
    u_xlat4.z = u_xlat0.x * u_xlat19;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat19 / u_xlat0.x;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat19 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat57 * u_xlat0.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_8.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat19 = (-u_xlat16_1.x) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_17.xyz * vec3(u_xlat19);
    u_xlat19 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _DirectSpecularColor.zxy;
    u_xlat0.xyw = u_xlat6.xxx * u_xlat0.xyw;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_8.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat2.xyz * u_xlat16_8.xxx;
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.yyy + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_27.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_27.x = (-u_xlat16_27.x) * u_xlat16_27.x + 1.0;
    u_xlat16_27.x = max(u_xlat16_27.x, 0.0);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_27.x;
    u_xlat16_1.x = max(u_xlat16_14.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_27.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_27.x, u_xlat16_8.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_20.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat21.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat6.xxx + u_xlat16_8.xyz;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat2.xyw * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_70 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_70;
    u_xlat16_1.x = max(u_xlat16_16.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat16_65 = max(u_xlat16_65, u_xlat16_70);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_65;
    u_xlat16_14.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.yyy * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat2.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = vec3(u_xlat38) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat38) * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat38) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat38) * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat38) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * vec3(u_xlat38) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat0.ywx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.yzx;
    u_xlat16_58 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_11.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_11.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_27.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_27.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_27.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_27.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat2.x = u_xlat57 * 0.0625 + u_xlat2.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_19.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_8.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec3 u_xlat21;
vec3 u_xlat24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
int u_xlati41;
bool u_xlatb41;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_55;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
float u_xlat61;
int u_xlati61;
bool u_xlatb61;
mediump float u_xlat16_62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
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
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat65 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat8.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21.x = (-u_xlat1.x) + u_xlat21.x;
    u_xlat0.z = _ShadowBias.y * u_xlat21.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat60 = u_xlat0.x + -1.0;
    u_xlat1.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat60) + vec2(1.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(_OcclusionScale) * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_6.xyz = vec3(u_xlat16_66) * u_xlat16_6.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat16_66) + u_xlat16_10.x;
    u_xlat16_30.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _OcclusionScale * u_xlat16_30.x + 1.0;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_10.x + u_xlat16_66;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_66;
    u_xlat16_10.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + -1.0;
    u_xlat16_10.x = _OcclusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_10.x;
    u_xlat1.xy = min(u_xlat1.xy, vec2(u_xlat16_66));
    u_xlat16_66 = u_xlat1.y * 0.5;
    u_xlat16_11.x = (-u_xlat1.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat41.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat41.xy = u_xlat41.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_60 = texture(_AnisotropicMap, u_xlat41.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _SunShift + _SunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD6;
    u_xlat16_31.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_31.x = inversesqrt(u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_31.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb41 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat41.x = (u_xlatb41) ? 1.0 : -1.0;
    u_xlat41.x = u_xlat41.x * vs_TEXCOORD2.w;
    u_xlat61 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat8.yzx) * vec3(u_xlat61) + u_xlat7.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat8.xyz;
    u_xlat3.xyz = u_xlat8.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_31.xyz + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat60) * u_xlat8.xyz + u_xlat3.zxy;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_51 = u_xlat16_31.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_51>=0.0);
#else
    u_xlatb60 = u_xlat16_51>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb60)) ? u_xlat4.xyz : u_xlat2.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_12.xyz = u_xlat9.xyz * vec3(u_xlat16_71);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat13.xyz = u_xlat4.xyz * u_xlat16_12.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat13.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat4.xyz;
    u_xlat16_15.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_71 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_72 = u_xlat16_71 * 8.0;
    u_xlat16_72 = min(u_xlat16_72, 1.0);
    u_xlat16_72 = abs(u_xlat16_51) * u_xlat16_72;
    u_xlat4.xyz = vec3(u_xlat16_72) * u_xlat4.xyz + u_xlat8.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_72 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_72 = u_xlat16_72 + u_xlat16_72;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_72) + (-u_xlat16_12.xyz);
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat16_30.y = u_xlat60 * 0.5;
    u_xlat16_30.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_30.xyz = u_xlat16_30.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.yzw = u_xlat16_30.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_13.w);
    u_xlat16_50 = u_xlat16_30.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_13.x = u_xlat16_50 * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_13.x = u_xlat16_30.x * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_41.x = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_30.x = u_xlat16_30.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_50 = u_xlat16_60 + (-u_xlat16_41.x);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_50 + u_xlat16_41.x;
    u_xlat16_30.x = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat60 = u_xlat60 * u_xlat16_30.x;
    u_xlat16_66 = u_xlat60 * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_30.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_50 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_50 + u_xlat16_30.x;
    u_xlat16_66 = u_xlat1.y * u_xlat16_66;
    u_xlat60 = min(u_xlat1.x, u_xlat16_7.z);
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_7.z);
    u_xlat16_30.x = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat4.xyz);
    u_xlat16_50 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat1.xyz = abs(vec3(u_xlat16_51)) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat16.y = u_xlat1.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_50 = -abs(u_xlat16_51) * 0.800000012 + 1.0;
    u_xlat1.x = (-u_xlat16_51) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_71;
    u_xlat1.y = u_xlat16_31.x * u_xlat16_71;
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_50 = u_xlat16_15.x * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_50);
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_50);
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_17.y = u_xlat16_6.y;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_6.xyz = u_xlat16_10.xxx * u_xlat16_6.xyz;
    u_xlati41 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_10.xzw = u_xlat16_6.yyy * _IrradianceACCoeffs[u_xlati41].xyz;
    u_xlati41 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati61 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_10.xzw = u_xlat16_6.xxx * _IrradianceACCoeffs[u_xlati41].xyz + u_xlat16_10.xzw;
    u_xlat16_6.xyz = u_xlat16_6.zzz * _IrradianceACCoeffs[u_xlati61].xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_6.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb41 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xzw = (bool(u_xlatb41)) ? u_xlat16_10.xzw : u_xlat16_11.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat4.x;
    u_xlat5.y = u_xlat16_15.x;
    u_xlat16_41.xy = texture(_DfgTexture, u_xlat5.xy).xy;
    u_xlat25.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat25.xy = u_xlat25.xy + vs_TEXCOORD3.zw;
    u_xlat16_25.xyz = texture(_GradientFlowMap, u_xlat25.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_25.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_25.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xzw = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_7.zxy * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_7.zxy * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _AlbedoColor.zxy;
    u_xlat16_11.xyz = u_xlat16_25.zxy * u_xlat16_11.xyz + (-u_xlat16_15.xzw);
    u_xlat16_62 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_30.xxx * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_15.yyy * u_xlat16_15.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_41.xxx + u_xlat16_41.yyy;
    u_xlat16_10.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat41.x = inversesqrt(u_xlat41.x);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat16_12.xyz);
    u_xlat41.y = dot(u_xlat2.zxy, u_xlat16_12.xyz);
    u_xlat4.yz = u_xlat41.yx * u_xlat1.yx;
    u_xlat41.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat41.x + u_xlat5.x;
    u_xlat61 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat61 * u_xlat1.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat1.y * u_xlat16_66;
    u_xlat4.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat61 = sqrt(u_xlat61);
    u_xlat41.y = u_xlat61 + u_xlat4.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y + 6.10351563e-05;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat24.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat3.xyz, u_xlat24.xyz);
    u_xlat3.y = u_xlat61 * u_xlat1.y;
    u_xlat21.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat24.xyz);
    u_xlat3.x = u_xlat1.x * u_xlat16_66;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat16_66) + 1.0;
    u_xlat3.z = u_xlat1.x * u_xlat21.x;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat21.x / u_xlat1.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat21.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat41.x * u_xlat1.x;
    u_xlat16_66 = u_xlat61 * u_xlat61;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_70 = u_xlat61 * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat61 + 1.0;
    u_xlat21.xyz = u_xlat16_15.xyz * u_xlat21.xxx;
    u_xlat2.x = u_xlat16_15.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat2.xxx * vec3(u_xlat16_70) + u_xlat21.xyz;
    u_xlat1.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _ShadowColor.zxy;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_6.w = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_11.w = u_xlat16_71 * u_xlat16_71;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_6.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_15.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat1.yzx * u_xlat16_12.yzx + u_xlat16_10.yzx;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_7.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_7.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
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
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_20.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_10.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec3 u_xlat21;
vec3 u_xlat24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
int u_xlati41;
bool u_xlatb41;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_55;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
float u_xlat61;
int u_xlati61;
bool u_xlatb61;
mediump float u_xlat16_62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
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
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat65 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat8.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21.x = (-u_xlat1.x) + u_xlat21.x;
    u_xlat0.z = _ShadowBias.y * u_xlat21.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat60 = u_xlat0.x + -1.0;
    u_xlat1.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat60) + vec2(1.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(_OcclusionScale) * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_6.xyz = vec3(u_xlat16_66) * u_xlat16_6.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat16_66) + u_xlat16_10.x;
    u_xlat16_30.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _OcclusionScale * u_xlat16_30.x + 1.0;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_10.x + u_xlat16_66;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_66;
    u_xlat16_10.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + -1.0;
    u_xlat16_10.x = _OcclusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_10.x;
    u_xlat1.xy = min(u_xlat1.xy, vec2(u_xlat16_66));
    u_xlat16_66 = u_xlat1.y * 0.5;
    u_xlat16_11.x = (-u_xlat1.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat41.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat41.xy = u_xlat41.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_60 = texture(_AnisotropicMap, u_xlat41.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _SunShift + _SunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD6;
    u_xlat16_31.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_31.x = inversesqrt(u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_31.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb41 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat41.x = (u_xlatb41) ? 1.0 : -1.0;
    u_xlat41.x = u_xlat41.x * vs_TEXCOORD2.w;
    u_xlat61 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat8.yzx) * vec3(u_xlat61) + u_xlat7.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat8.xyz;
    u_xlat3.xyz = u_xlat8.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_31.xyz + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat60) * u_xlat8.xyz + u_xlat3.zxy;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_51 = u_xlat16_31.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_51>=0.0);
#else
    u_xlatb60 = u_xlat16_51>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb60)) ? u_xlat4.xyz : u_xlat2.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_12.xyz = u_xlat9.xyz * vec3(u_xlat16_71);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat13.xyz = u_xlat4.xyz * u_xlat16_12.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat13.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat4.xyz;
    u_xlat16_15.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_71 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_72 = u_xlat16_71 * 8.0;
    u_xlat16_72 = min(u_xlat16_72, 1.0);
    u_xlat16_72 = abs(u_xlat16_51) * u_xlat16_72;
    u_xlat4.xyz = vec3(u_xlat16_72) * u_xlat4.xyz + u_xlat8.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_72 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_72 = u_xlat16_72 + u_xlat16_72;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_72) + (-u_xlat16_12.xyz);
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat16_30.y = u_xlat60 * 0.5;
    u_xlat16_30.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_30.xyz = u_xlat16_30.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.yzw = u_xlat16_30.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_13.w);
    u_xlat16_50 = u_xlat16_30.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_13.x = u_xlat16_50 * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_13.x = u_xlat16_30.x * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_41.x = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_30.x = u_xlat16_30.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_50 = u_xlat16_60 + (-u_xlat16_41.x);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_50 + u_xlat16_41.x;
    u_xlat16_30.x = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat60 = u_xlat60 * u_xlat16_30.x;
    u_xlat16_66 = u_xlat60 * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_30.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_50 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_50 + u_xlat16_30.x;
    u_xlat16_66 = u_xlat1.y * u_xlat16_66;
    u_xlat60 = min(u_xlat1.x, u_xlat16_7.z);
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_7.z);
    u_xlat16_30.x = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat4.xyz);
    u_xlat16_50 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat1.xyz = abs(vec3(u_xlat16_51)) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat16.y = u_xlat1.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_50 = -abs(u_xlat16_51) * 0.800000012 + 1.0;
    u_xlat1.x = (-u_xlat16_51) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_71;
    u_xlat1.y = u_xlat16_31.x * u_xlat16_71;
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_50 = u_xlat16_15.x * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_50);
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_50);
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_17.y = u_xlat16_6.y;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_6.xyz = u_xlat16_10.xxx * u_xlat16_6.xyz;
    u_xlati41 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_10.xzw = u_xlat16_6.yyy * _IrradianceACCoeffs[u_xlati41].xyz;
    u_xlati41 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati61 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_10.xzw = u_xlat16_6.xxx * _IrradianceACCoeffs[u_xlati41].xyz + u_xlat16_10.xzw;
    u_xlat16_6.xyz = u_xlat16_6.zzz * _IrradianceACCoeffs[u_xlati61].xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_6.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb41 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xzw = (bool(u_xlatb41)) ? u_xlat16_10.xzw : u_xlat16_11.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat4.x;
    u_xlat5.y = u_xlat16_15.x;
    u_xlat16_41.xy = texture(_DfgTexture, u_xlat5.xy).xy;
    u_xlat25.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat25.xy = u_xlat25.xy + vs_TEXCOORD3.zw;
    u_xlat16_25.xyz = texture(_GradientFlowMap, u_xlat25.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_25.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_25.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xzw = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_7.zxy * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_7.zxy * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _AlbedoColor.zxy;
    u_xlat16_11.xyz = u_xlat16_25.zxy * u_xlat16_11.xyz + (-u_xlat16_15.xzw);
    u_xlat16_62 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_30.xxx * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_15.yyy * u_xlat16_15.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_41.xxx + u_xlat16_41.yyy;
    u_xlat16_10.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat41.x = inversesqrt(u_xlat41.x);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat16_12.xyz);
    u_xlat41.y = dot(u_xlat2.zxy, u_xlat16_12.xyz);
    u_xlat4.yz = u_xlat41.yx * u_xlat1.yx;
    u_xlat41.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat41.x + u_xlat5.x;
    u_xlat61 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat61 * u_xlat1.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat1.y * u_xlat16_66;
    u_xlat4.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat61 = sqrt(u_xlat61);
    u_xlat41.y = u_xlat61 + u_xlat4.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y + 6.10351563e-05;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat24.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat3.xyz, u_xlat24.xyz);
    u_xlat3.y = u_xlat61 * u_xlat1.y;
    u_xlat21.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat24.xyz);
    u_xlat3.x = u_xlat1.x * u_xlat16_66;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat16_66) + 1.0;
    u_xlat3.z = u_xlat1.x * u_xlat21.x;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat21.x / u_xlat1.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat21.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat41.x * u_xlat1.x;
    u_xlat16_66 = u_xlat61 * u_xlat61;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_70 = u_xlat61 * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat61 + 1.0;
    u_xlat21.xyz = u_xlat16_15.xyz * u_xlat21.xxx;
    u_xlat2.x = u_xlat16_15.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat2.xxx * vec3(u_xlat16_70) + u_xlat21.xyz;
    u_xlat1.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _ShadowColor.zxy;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_6.w = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_11.w = u_xlat16_71 * u_xlat16_71;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_6.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_15.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat1.yzx * u_xlat16_12.yzx + u_xlat16_10.yzx;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_7.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_7.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
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
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_20.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_10.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
mediump vec2 u_xlat16_23;
ivec3 u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
vec3 u_xlat39;
mediump float u_xlat16_41;
mediump vec3 u_xlat16_43;
float u_xlat46;
mediump float u_xlat16_46;
int u_xlati46;
mediump float u_xlat16_47;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
mediump float u_xlat16_73;
bool u_xlatb73;
float u_xlat74;
mediump float u_xlat16_76;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_87;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_24.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat69 * u_xlat69;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_3.x = u_xlat69 * u_xlat16_71;
    u_xlat69 = (-u_xlat16_71) * u_xlat69 + 1.0;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_GradientFlowMap, u_xlat5.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + (-u_xlat16_7.xyz);
    u_xlat16_73 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_26.xyz = vec3(u_xlat16_73) * u_xlat16_26.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_26.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat69 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_3.xxx + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.5<_anisoUse2U);
#else
    u_xlatb73 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb73)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_73 = texture(_AnisotropicMap, u_xlat5.xw).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb5 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat5.x = (u_xlatb5) ? 1.0 : -1.0;
    u_xlat5.x = u_xlat5.x * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_71 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_31.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_71) + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_31.xyz, u_xlat16_31.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat16_31.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_31.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_31.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_31.xyz, u_xlat11.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat11.xyz = vec3(u_xlat74) * u_xlat9.xyz;
    u_xlat78 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat78) + u_xlat10.xyz;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat10.xyz = vec3(u_xlat78) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat5.xxx * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat73) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat13.xyz = u_xlat5.xxx * u_xlat13.xyz;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_71 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_71 + -1.0;
    u_xlat78 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_76 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_76 = max(u_xlat16_76, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_76;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat14.z = u_xlat5.x * u_xlat78;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat5.x = u_xlat16_71 * u_xlat16_76;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat5.x;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat14.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_24.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat78 * u_xlat80;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat5.x * u_xlat80;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat15.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat5.x * u_xlat81;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_71 * u_xlat78;
    u_xlat27.x = u_xlat78 * u_xlat5.x;
    u_xlat16.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat50 = u_xlat27.x * 0.318309873;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _DirectSpecularColor.xyz;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_37.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat37.xy = u_xlat16_37.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xy = min(max(u_xlat37.xy, 0.0), 1.0);
#else
    u_xlat37.xy = clamp(u_xlat37.xy, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * u_xlat37.xxx;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat16_71 * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_71) + 1.0;
    u_xlat17.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat81 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat78 * u_xlat81;
    u_xlat16.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat16_71 * u_xlat5.x;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat16.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat80 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat4.x = u_xlat4.x * u_xlat81;
    u_xlat16_71 = u_xlat79 * u_xlat79;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_31.x = u_xlat79 * u_xlat16_71;
    u_xlat79 = (-u_xlat16_71) * u_xlat79 + 1.0;
    u_xlat39.xyz = u_xlat16_7.xyz * vec3(u_xlat79);
    u_xlat39.xyz = vec3(u_xlat69) * u_xlat16_31.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _DirectSpecularColor.xyz;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat16_31.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_18.x = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat6.xyz * u_xlat16_18.xxx;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat13.xyz, u_xlat16_18.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat78;
    u_xlat13.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat0.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_18.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat4.x * u_xlat27.x;
    u_xlat23.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23.x = max(u_xlat23.x, 6.10351563e-05);
    u_xlat23.x = u_xlat27.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat50 * u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat16_18.xyz);
    u_xlat6.y = u_xlat16_1.x * u_xlat5.x;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat6.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat80 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat23.x = u_xlat46 * u_xlat23.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_41 = u_xlat0.x * u_xlat16_18.x;
    u_xlat0.x = (-u_xlat16_18.x) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_7.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat69) * vec3(u_xlat16_41) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat23.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_18.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = float(1.0) / float(u_xlat16_71);
    u_xlat16_18.x = (-u_xlat16_18.x) * u_xlat16_18.x + 1.0;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_18.x;
    u_xlat16_71 = max(u_xlat16_19.x, u_xlat16_71);
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_18.x = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_18.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_18.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_18.xyz;
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat37.yyy + u_xlat16_31.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_26.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat37.yyy * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_26.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat37.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat16_26.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_26.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_19.xyz = u_xlat16_1.xxx * u_xlat16_19.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_1.x;
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
    u_xlat23.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati23.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati23.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati23.x = int(uint(uint(u_xlati23.x) & 1u));
    u_xlati46 = (u_xlati23.z != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati23.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_26.xyz * u_xlat16_18.xyz + u_xlat16_2.xyz;
    u_xlat16_26.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * vs_TEXCOORD1.yzx;
    u_xlat23.xyz = vec3(u_xlat73) * u_xlat16_26.xyz + u_xlat12.xyz;
    u_xlat4.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat23.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : u_xlat10.xyz;
    u_xlat4.xyz = u_xlat16_24.xyz * u_xlat23.xyz;
    u_xlat4.xyz = u_xlat23.zxy * u_xlat16_24.yzx + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat23.xyz * u_xlat4.xyz;
    u_xlat23.xyz = u_xlat4.zxy * u_xlat23.yzx + (-u_xlat6.xyz);
    u_xlat23.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + u_xlat23.xyz;
    u_xlat16_26.x = u_xlat16_76 * 8.0;
    u_xlat16_49 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_26.x = u_xlat16_26.x * abs(u_xlat16_3.x);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat11.xyz;
    u_xlat4.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat27.xxx;
    u_xlat16_26.x = dot((-u_xlat16_24.xyz), u_xlat23.xyz);
    u_xlat16_26.x = u_xlat16_26.x + u_xlat16_26.x;
    u_xlat23.xyz = (-u_xlat23.xyz) * u_xlat16_26.xxx + (-u_xlat16_24.xyz);
    u_xlat27.xyz = u_xlat9.xyz * vec3(u_xlat74) + (-u_xlat23.xyz);
    u_xlat27.xyz = vec3(u_xlat16_49) * u_xlat27.xyz + u_xlat23.xyz;
    u_xlat5.xyw = u_xlat23.xyz + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(u_xlat16_3.xxx) * u_xlat5.xyw + u_xlat27.xyz;
    u_xlat16_24.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_24.x = u_xlat16_8.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_24.x);
    u_xlat23.x = dot(u_xlat16_19.xyz, u_xlat23.xyz);
    u_xlat16_43.y = u_xlat23.x * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_47;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_24.x);
    u_xlat16_24.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat23.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat23.xyz * u_xlat23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = u_xlat16_1.xxx * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb23 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb23)) ? u_xlat16_18.xyz : u_xlat16_24.xyz;
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_43.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_3.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_70 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_70 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_70 = u_xlat16_18.z * 15.0 + (-u_xlat16_70);
    u_xlat16_7.x = (-u_xlat16_46) + u_xlat16_23.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_46;
    u_xlat16_70 = u_xlat16_71 * u_xlat16_70;
    u_xlat23.x = u_xlat4.x * u_xlat16_70;
    u_xlat16_70 = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_70 = u_xlat23.x * u_xlat16_71 + u_xlat16_70;
    u_xlat16_71 = u_xlat16_70 + u_xlat16_70;
    u_xlat16_7.x = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_71;
    u_xlat16_70 = u_xlat0.x * u_xlat16_70;
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_70) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_31.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_24.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
mediump vec2 u_xlat16_23;
ivec3 u_xlati23;
bool u_xlatb23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
vec3 u_xlat39;
mediump float u_xlat16_41;
mediump vec3 u_xlat16_43;
float u_xlat46;
mediump float u_xlat16_46;
int u_xlati46;
mediump float u_xlat16_47;
mediump float u_xlat16_49;
float u_xlat50;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
mediump float u_xlat16_73;
bool u_xlatb73;
float u_xlat74;
mediump float u_xlat16_76;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_87;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_24.xyz;
    u_xlat69 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_24.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat69 * u_xlat69;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_71 = u_xlat69 * u_xlat16_71;
    u_xlat16_3.x = u_xlat69 * u_xlat16_71;
    u_xlat69 = (-u_xlat16_71) * u_xlat69 + 1.0;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_GradientFlowMap, u_xlat5.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + (-u_xlat16_7.xyz);
    u_xlat16_73 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_26.xyz = vec3(u_xlat16_73) * u_xlat16_26.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_26.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
    u_xlat69 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat6.xyz = vec3(u_xlat69) * u_xlat16_3.xxx + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(0.5<_anisoUse2U);
#else
    u_xlatb73 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb73)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_73 = texture(_AnisotropicMap, u_xlat5.xw).x;
    u_xlat73 = u_xlat16_73 * 2.0 + -1.0;
    u_xlat73 = u_xlat73 * _SunShift + _SunShiftOffset;
    u_xlat73 = u_xlat73 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb5 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat5.x = (u_xlatb5) ? 1.0 : -1.0;
    u_xlat5.x = u_xlat5.x * vs_TEXCOORD2.w;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_71 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_31.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_71) + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_31.xyz, u_xlat16_31.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat16_31.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_31.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_31.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_31.xyz, u_xlat11.xyz);
    u_xlat74 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat11.xyz = vec3(u_xlat74) * u_xlat9.xyz;
    u_xlat78 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat10.xyz = (-u_xlat11.yzx) * vec3(u_xlat78) + u_xlat10.xyz;
    u_xlat78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat10.xyz = vec3(u_xlat78) * u_xlat10.xyz;
    u_xlat12.xyz = u_xlat10.yzx * u_xlat11.xyz;
    u_xlat12.xyz = u_xlat11.zxy * u_xlat10.zxy + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat5.xxx * u_xlat12.xyz;
    u_xlat13.xyz = vec3(u_xlat73) * u_xlat11.xyz + u_xlat12.zxy;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat13.xyz = u_xlat5.xxx * u_xlat13.xyz;
    u_xlat5.x = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat16_71 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_71 + -1.0;
    u_xlat78 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_76 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_76 = max(u_xlat16_76, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_76;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat14.z = u_xlat5.x * u_xlat78;
    u_xlat14.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat5.x = u_xlat16_71 * u_xlat16_76;
    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
    u_xlat14.y = u_xlat16_24.x * u_xlat5.x;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat14.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_24.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat80 = dot(u_xlat13.xyz, u_xlat16_24.xyz);
    u_xlat15.z = u_xlat78 * u_xlat80;
    u_xlat15.x = dot(u_xlat11.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat10.zxy, u_xlat16_24.xyz);
    u_xlat15.y = u_xlat5.x * u_xlat80;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat15.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat80 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat81 = dot(u_xlat13.xyz, u_xlat4.xyz);
    u_xlat16.y = u_xlat5.x * u_xlat81;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16_71 * u_xlat78;
    u_xlat27.x = u_xlat78 * u_xlat5.x;
    u_xlat16.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat50 = u_xlat27.x * 0.318309873;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * _DirectSpecularColor.xyz;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat16_37.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat37.xy = u_xlat16_37.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xy = min(max(u_xlat37.xy, 0.0), 1.0);
#else
    u_xlat37.xy = clamp(u_xlat37.xy, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz * u_xlat37.xxx;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_71 = dot(u_xlat10.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat16_71 * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_71) + 1.0;
    u_xlat17.z = u_xlat4.x * u_xlat27.x;
    u_xlat4.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat27.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat50 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat81 = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat78 * u_xlat81;
    u_xlat16.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat10.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat16_71 * u_xlat5.x;
    u_xlat81 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat16.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat81 = u_xlat80 * u_xlat81 + 6.10351563e-05;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat4.x = u_xlat4.x * u_xlat81;
    u_xlat16_71 = u_xlat79 * u_xlat79;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_71 = u_xlat79 * u_xlat16_71;
    u_xlat16_31.x = u_xlat79 * u_xlat16_71;
    u_xlat79 = (-u_xlat16_71) * u_xlat79 + 1.0;
    u_xlat39.xyz = u_xlat16_7.xyz * vec3(u_xlat79);
    u_xlat39.xyz = vec3(u_xlat69) * u_xlat16_31.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _DirectSpecularColor.xyz;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat16_31.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat6.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_18.x = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = u_xlat6.xyz * u_xlat16_18.xxx;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
    u_xlat6.x = dot(u_xlat13.xyz, u_xlat16_18.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat78;
    u_xlat13.y = u_xlat4.x * u_xlat5.x;
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat0.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_18.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat4.x * u_xlat27.x;
    u_xlat23.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat23.x = max(u_xlat23.x, 6.10351563e-05);
    u_xlat23.x = u_xlat27.x / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat50 * u_xlat23.x;
    u_xlat23.x = min(u_xlat23.x, 16.0);
    u_xlat16_1.x = dot(u_xlat10.zxy, u_xlat16_18.xyz);
    u_xlat6.y = u_xlat16_1.x * u_xlat5.x;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat6.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat80 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat23.x = u_xlat46 * u_xlat23.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_41 = u_xlat0.x * u_xlat16_18.x;
    u_xlat0.x = (-u_xlat16_18.x) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_7.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat69) * vec3(u_xlat16_41) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat23.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz;
    u_xlat16_18.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = float(1.0) / float(u_xlat16_71);
    u_xlat16_18.x = (-u_xlat16_18.x) * u_xlat16_18.x + 1.0;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_18.x;
    u_xlat16_71 = max(u_xlat16_19.x, u_xlat16_71);
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_18.x = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_18.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_18.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_18.xyz;
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat37.yyy + u_xlat16_31.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_26.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat37.yyy * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_26.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat37.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat16_26.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_26.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(_OcclusionScale) * u_xlat16_19.xyz + u_xlat11.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_19.xyz = u_xlat16_1.xxx * u_xlat16_19.xyz;
    u_xlat16_1.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_1.x) + u_xlat16_71;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_71 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_43.z * u_xlat16_1.x;
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
    u_xlat23.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat23.xxx * u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat23.xxx * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat23.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_26.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_21.xyz * u_xlat23.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati23.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_71) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati23.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati23.x = int(uint(uint(u_xlati23.x) & 1u));
    u_xlati46 = (u_xlati23.z != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati23.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_22.xyz;
    u_xlat16_2.xyz = u_xlat16_26.xyz * u_xlat16_18.xyz + u_xlat16_2.xyz;
    u_xlat16_26.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_26.x = inversesqrt(u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * vs_TEXCOORD1.yzx;
    u_xlat23.xyz = vec3(u_xlat73) * u_xlat16_26.xyz + u_xlat12.xyz;
    u_xlat4.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat23.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : u_xlat10.xyz;
    u_xlat4.xyz = u_xlat16_24.xyz * u_xlat23.xyz;
    u_xlat4.xyz = u_xlat23.zxy * u_xlat16_24.yzx + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat23.xyz * u_xlat4.xyz;
    u_xlat23.xyz = u_xlat4.zxy * u_xlat23.yzx + (-u_xlat6.xyz);
    u_xlat23.xyz = (-u_xlat9.xyz) * vec3(u_xlat74) + u_xlat23.xyz;
    u_xlat16_26.x = u_xlat16_76 * 8.0;
    u_xlat16_49 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_49 = max(u_xlat16_49, 0.0078125);
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_26.x = u_xlat16_26.x * abs(u_xlat16_3.x);
    u_xlat23.xyz = u_xlat16_26.xxx * u_xlat23.xyz + u_xlat11.xyz;
    u_xlat4.x = dot(u_xlat16_19.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat27.xxx;
    u_xlat16_26.x = dot((-u_xlat16_24.xyz), u_xlat23.xyz);
    u_xlat16_26.x = u_xlat16_26.x + u_xlat16_26.x;
    u_xlat23.xyz = (-u_xlat23.xyz) * u_xlat16_26.xxx + (-u_xlat16_24.xyz);
    u_xlat27.xyz = u_xlat9.xyz * vec3(u_xlat74) + (-u_xlat23.xyz);
    u_xlat27.xyz = vec3(u_xlat16_49) * u_xlat27.xyz + u_xlat23.xyz;
    u_xlat5.xyw = u_xlat23.xyz + (-u_xlat27.xyz);
    u_xlat27.xyz = abs(u_xlat16_3.xxx) * u_xlat5.xyw + u_xlat27.xyz;
    u_xlat16_24.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_24.x = u_xlat16_8.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_24.x);
    u_xlat23.x = dot(u_xlat16_19.xyz, u_xlat23.xyz);
    u_xlat16_43.y = u_xlat23.x * 0.5;
    u_xlat16_47 = dot(_IndirectCubemapRotationParams.xy, u_xlat27.xz);
    u_xlat27.z = dot(_IndirectCubemapRotationParams.zw, u_xlat27.xz);
    u_xlat27.x = u_xlat16_47;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat27.xyz, u_xlat16_24.x);
    u_xlat16_24.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat23.xyz = u_xlat16_24.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_24.xyz = u_xlat23.xyz * u_xlat23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = u_xlat16_1.xxx * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb23 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb23)) ? u_xlat16_18.xyz : u_xlat16_24.xyz;
    u_xlat15.y = u_xlat16_8.x;
    u_xlat16_43.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_3.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_70 = floor(u_xlat16_3.w);
    u_xlat16_7.x = u_xlat16_70 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_3.x = u_xlat16_7.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_70 = u_xlat16_18.z * 15.0 + (-u_xlat16_70);
    u_xlat16_7.x = (-u_xlat16_46) + u_xlat16_23.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_46;
    u_xlat16_70 = u_xlat16_71 * u_xlat16_70;
    u_xlat23.x = u_xlat4.x * u_xlat16_70;
    u_xlat16_70 = u_xlat0.x * 0.5;
    u_xlat16_71 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_70 = u_xlat23.x * u_xlat16_71 + u_xlat16_70;
    u_xlat16_71 = u_xlat16_70 + u_xlat16_70;
    u_xlat16_7.x = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_7.x + u_xlat16_71;
    u_xlat16_70 = u_xlat0.x * u_xlat16_70;
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_70) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + u_xlat16_31.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_24.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
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
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
float u_xlat28;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_51;
vec2 u_xlat56;
mediump float u_xlat16_59;
float u_xlat69;
bool u_xlatb69;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlatb69 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb69 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat16_7.xyz;
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
    u_xlat74 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat9.xyz = vec3(u_xlat74) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb69)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat69 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat69) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat69);
    u_xlat2.x = (-u_xlat69) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat69;
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
    u_xlat23.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_23.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _ShadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_34.x = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_76);
    u_xlat16_76 = u_xlat16_11.x * u_xlat16_34.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_12.x);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_1 = texture(_AnisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat47 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat47) + u_xlat8.xyz;
    u_xlat47 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat2.xyz = vec3(u_xlat47) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat3.xyz = vec3(u_xlat71) * u_xlat3.xyz;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_76 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_81 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_81;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat5.z = u_xlat71 * u_xlat72;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat71 = u_xlat16_76 * u_xlat16_81;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat5.y = u_xlat16_59 * u_xlat71;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat73;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat73;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat4.w = u_xlat73 + u_xlat10.x;
    u_xlat4.xw = u_xlat4.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat4.x = u_xlat4.w * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat28 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat15.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat28;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat28 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat75 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat28 * u_xlat75;
    u_xlat28 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat75 / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat77 = u_xlat75 * 0.318309873;
    u_xlat28 = u_xlat28 * u_xlat77;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat28 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat56.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat56.xy = fract(u_xlat56.xy);
    u_xlat56.xy = u_xlat56.xy + vs_TEXCOORD3.zw;
    u_xlat16_15.xyz = texture(_GradientFlowMap, u_xlat56.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_51 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_36.xyz;
    u_xlat28 = u_xlat16_36.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat19.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_11.x;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat75;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat75 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat77 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat78 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat78;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat78 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat16.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat78 = u_xlat4.w * u_xlat78 + 6.10351563e-05;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat4.x = u_xlat4.x * u_xlat78;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat19.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat19.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat4.xxx * u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _DirectSpecularColor.xyz;
    u_xlat19.xyz = u_xlat16.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat19.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_83);
    u_xlat16_18.xyz = u_xlat15.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_18.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat72;
    u_xlat15.y = u_xlat71 * u_xlat4.x;
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat72 * u_xlat16_76;
    u_xlat72 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_76) + 1.0;
    u_xlat15.z = u_xlat72 * u_xlat75;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat75 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat77 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat16_18.xyz);
    u_xlat3.y = u_xlat71 * u_xlat16_76;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat3.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat4.w * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat28) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _DirectSpecularColor.xyz;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_20.x, u_xlat16_83);
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_86);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_18.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat26.xyz = u_xlat26.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat26.xyz * u_xlat23.yyy + u_xlat16_11.xyz;
    u_xlat16_76 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_76 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_76) + u_xlat16_83;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati46 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_17.xyz = u_xlat16_17.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat24.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_80>=0.0);
#else
    u_xlatb1 = u_xlat16_80>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat74) + u_xlat0.xzw;
    u_xlat16_17.x = u_xlat16_81 * 8.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat16_17.x = min(u_xlat16_17.x, 1.0);
    u_xlat16_17.x = abs(u_xlat16_80) * u_xlat16_17.x;
    u_xlat0.xzw = u_xlat16_17.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat24.xxx;
    u_xlat16_17.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_17.x = u_xlat16_17.x + u_xlat16_17.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_17.xxx + (-u_xlat16_14.xyz);
    u_xlat24.xyz = u_xlat6.xyz * vec3(u_xlat74) + (-u_xlat0.xzw);
    u_xlat24.xyz = vec3(u_xlat16_81) * u_xlat24.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat24.xyz);
    u_xlat24.xyz = abs(vec3(u_xlat16_80)) * u_xlat2.xyz + u_xlat24.xyz;
    u_xlat16_80 = -abs(u_xlat16_80) * 0.800000012 + 1.0;
    u_xlat16_80 = u_xlat16_13.x * u_xlat16_80;
    u_xlat16_80 = u_xlat16_80 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_80);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat24.xz);
    u_xlat24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat24.xz);
    u_xlat24.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_80);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_2.w);
    u_xlat16_80 = u_xlat16_76 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_2.x = u_xlat16_80 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_76 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_76 = u_xlat16_14.z * 15.0 + (-u_xlat16_76);
    u_xlat16_80 = (-u_xlat16_46) + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80 + u_xlat16_46;
    u_xlat16_76 = u_xlat16_83 * u_xlat16_76;
    u_xlat0.x = u_xlat1.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.y * 0.5;
    u_xlat16_80 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_80 + u_xlat16_76;
    u_xlat16_80 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_81 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_81 + u_xlat16_80;
    u_xlat16_76 = u_xlat0.y * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_4.z, u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_76 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_34.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_76 : u_xlat16_11.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
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
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
float u_xlat28;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_51;
vec2 u_xlat56;
mediump float u_xlat16_59;
float u_xlat69;
bool u_xlatb69;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlatb69 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb69 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat5.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat16_7.xyz;
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
    u_xlat74 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat9.xyz = vec3(u_xlat74) * u_xlat6.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
    u_xlat5.x = (-u_xlat5.x) * u_xlat5.x + 1.0;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat5.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb69)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat69 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat69) + u_xlat1.z;
    u_xlat2.x = max((-u_xlat1.w), u_xlat69);
    u_xlat2.x = (-u_xlat69) + u_xlat2.x;
    u_xlat1.z = _ShadowBias.y * u_xlat2.x + u_xlat69;
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
    u_xlat23.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_23.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _ShadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_76 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_76 = max(u_xlat16_76, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_76 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_34.x = float(1.0) / float(u_xlat16_76);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_76);
    u_xlat16_76 = u_xlat16_11.x * u_xlat16_34.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_12.x);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_1 = texture(_AnisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _SunShift + _SunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat47 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat47) + u_xlat8.xyz;
    u_xlat47 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat2.xyz = vec3(u_xlat47) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat3.xyz = vec3(u_xlat71) * u_xlat3.xyz;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_76 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_81 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_81;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat5.z = u_xlat71 * u_xlat72;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat71 = u_xlat16_76 * u_xlat16_81;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat5.y = u_xlat16_59 * u_xlat71;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat73 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat73;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat73;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat4.w = u_xlat73 + u_xlat10.x;
    u_xlat4.xw = u_xlat4.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat4.x = u_xlat4.w * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat28 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat15.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat28;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat28 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat75 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat28 * u_xlat75;
    u_xlat28 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat28 = max(u_xlat28, 6.10351563e-05);
    u_xlat28 = u_xlat75 / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat77 = u_xlat75 * 0.318309873;
    u_xlat28 = u_xlat28 * u_xlat77;
    u_xlat28 = min(u_xlat28, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat28 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat56.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat56.xy = fract(u_xlat56.xy);
    u_xlat56.xy = u_xlat56.xy + vs_TEXCOORD3.zw;
    u_xlat16_15.xyz = texture(_GradientFlowMap, u_xlat56.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.xyz;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_51 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_36.xyz;
    u_xlat28 = u_xlat16_36.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat19.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_11.x;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_11.x) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat75;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat75 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat77 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat78 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat78;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat78 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat78 + u_xlat16.x;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat78 = u_xlat4.w * u_xlat78 + 6.10351563e-05;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat4.x = u_xlat4.x * u_xlat78;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat19.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat19.xyz = vec3(u_xlat28) * u_xlat16_34.xxx + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat4.xxx * u_xlat19.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat19.xyz * _DirectSpecularColor.xyz;
    u_xlat19.xyz = u_xlat16.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat19.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_83);
    u_xlat16_18.xyz = u_xlat15.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_18.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_18.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat72;
    u_xlat15.y = u_xlat71 * u_xlat4.x;
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat72 * u_xlat16_76;
    u_xlat72 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_76) + 1.0;
    u_xlat15.z = u_xlat72 * u_xlat75;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat75 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat77 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_76 = dot(u_xlat2.zxy, u_xlat16_18.xyz);
    u_xlat3.y = u_xlat71 * u_xlat16_76;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat71 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat3.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat71 = u_xlat4.w * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat28) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _DirectSpecularColor.xyz;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_20.x, u_xlat16_83);
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_86);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat16_18.xyz = vec3(u_xlat16_76) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat26.xyz = u_xlat26.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat26.xyz * u_xlat23.yyy + u_xlat16_11.xyz;
    u_xlat16_76 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_OcclusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_76 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_76 * 0.5 + 0.5;
    u_xlat16_83 = (-u_xlat16_76) + u_xlat16_83;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _OcclusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_21.y = u_xlat16_12.y;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_21.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati46 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_17.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_17.x = inversesqrt(u_xlat16_17.x);
    u_xlat16_17.xyz = u_xlat16_17.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat24.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_80>=0.0);
#else
    u_xlatb1 = u_xlat16_80>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat74) + u_xlat0.xzw;
    u_xlat16_17.x = u_xlat16_81 * 8.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_81 = max(u_xlat16_81, 0.0078125);
    u_xlat16_17.x = min(u_xlat16_17.x, 1.0);
    u_xlat16_17.x = abs(u_xlat16_80) * u_xlat16_17.x;
    u_xlat0.xzw = u_xlat16_17.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat24.xxx;
    u_xlat16_17.x = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_17.x = u_xlat16_17.x + u_xlat16_17.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_17.xxx + (-u_xlat16_14.xyz);
    u_xlat24.xyz = u_xlat6.xyz * vec3(u_xlat74) + (-u_xlat0.xzw);
    u_xlat24.xyz = vec3(u_xlat16_81) * u_xlat24.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat24.xyz);
    u_xlat24.xyz = abs(vec3(u_xlat16_80)) * u_xlat2.xyz + u_xlat24.xyz;
    u_xlat16_80 = -abs(u_xlat16_80) * 0.800000012 + 1.0;
    u_xlat16_80 = u_xlat16_13.x * u_xlat16_80;
    u_xlat16_80 = u_xlat16_80 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_80);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_41.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat24.xz);
    u_xlat24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat24.xz);
    u_xlat24.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_80);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_41.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_2.w);
    u_xlat16_80 = u_xlat16_76 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_2.x = u_xlat16_80 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_76 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_76 = u_xlat16_14.z * 15.0 + (-u_xlat16_76);
    u_xlat16_80 = (-u_xlat16_46) + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_80 + u_xlat16_46;
    u_xlat16_76 = u_xlat16_83 * u_xlat16_76;
    u_xlat0.x = u_xlat1.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.y * 0.5;
    u_xlat16_80 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_80 + u_xlat16_76;
    u_xlat16_80 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_81 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_81 + u_xlat16_80;
    u_xlat16_76 = u_xlat0.y * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_4.z, u_xlat16_76);
    u_xlat16_12.xyz = vec3(u_xlat16_76) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_76 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_34.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_34.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_76 : u_xlat16_11.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
ivec3 u_xlati9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec2 u_xlat16_20;
bool u_xlatb20;
vec3 u_xlat21;
vec3 u_xlat24;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat36;
mediump vec2 u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump vec2 u_xlat16_37;
float u_xlat54;
mediump float u_xlat16_54;
int u_xlati54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_62;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.x;
    u_xlat4.y = u_xlat3.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.5<_anisoUse2U);
#else
    u_xlatb56 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb56)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_56 = texture(_AnisotropicMap, u_xlat3.xy).x;
    u_xlat56 = u_xlat16_56 * 2.0 + -1.0;
    u_xlat56 = u_xlat56 * _SunShift + _SunShiftOffset;
    u_xlat56 = u_xlat56 + vs_TEXCOORD6;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
    u_xlat21.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat4.x = dot(u_xlat2.zxy, u_xlat21.xyz);
    u_xlat2.xyz = (-u_xlat21.yzx) * u_xlat4.xxx + u_xlat2.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xxx;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat21.xyz;
    u_xlat4.xyz = u_xlat21.zxy * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat16_1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat21.xyz + u_xlat4.zxy;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_6.zz);
    u_xlat16_19.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat16_19.x>=0.0);
#else
    u_xlatb56 = u_xlat16_19.x>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb56)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_37.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_8.xyz = u_xlat16_37.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_37.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.xyz = u_xlat5.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat5.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat5.yzx + (-u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + u_xlat5.xyz;
    u_xlat16_37.xy = u_xlat16_6.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_62 = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_62 = max(u_xlat16_62, 0.0078125);
    u_xlat16_11.x = u_xlat16_62 * 8.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_19.x) * u_xlat16_11.x;
    u_xlat5.xyz = u_xlat16_11.xxx * u_xlat5.xyz + u_xlat21.xyz;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.xyz), u_xlat5.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_11.xxx + (-u_xlat16_8.xyz);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat54) + (-u_xlat5.xyz);
    u_xlat16_11.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat21.xyz;
    u_xlat16_65 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat0.xyz = vec3(u_xlat16_65) * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat9.xyz = (-u_xlat0.xyz) + u_xlat5.xyz;
    u_xlat0.xyz = abs(u_xlat16_19.xxx) * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_65 = -abs(u_xlat16_19.x) * 0.800000012 + 1.0;
    u_xlat0.x = (-u_xlat16_19.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_62;
    u_xlat0.y = u_xlat16_1.x * u_xlat16_62;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_37.x * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_9 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_9.xyz;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat9.xyz * u_xlat9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_14.y = u_xlat16_11.y;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _OcclusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati36 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati54 = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_14.xyw;
    u_xlat16_19.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_15.xyz = u_xlat16_19.xxx * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb36 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb36)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat9.x = dot(u_xlat21.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat9.x;
    u_xlat10.y = u_xlat16_37.x;
    u_xlat16_36.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat6.xw = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat6.xw = fract(u_xlat6.xw);
    u_xlat6.xw = u_xlat6.xw + vs_TEXCOORD3.zw;
    u_xlat16_28.xyz = texture(_GradientFlowMap, u_xlat6.xw).xyz;
    u_xlat16_15.xyz = u_xlat16_28.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_28.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _AlbedoColor.xyz;
    u_xlat16_15.xyz = u_xlat16_28.xyz * u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_56 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_37.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19.x = u_xlat16_37.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_36.xxx + u_xlat16_36.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat36 = dot(u_xlat16_11.xyz, u_xlat5.xyz);
    u_xlat16_19.y = u_xlat36 * 0.5;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_19.z = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_17.xyz = u_xlat16_19.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_5.w);
    u_xlat16_37.x = u_xlat16_19.x + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_5.x = u_xlat16_37.x * 16.0 + u_xlat16_5.z;
    u_xlat16_17.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_5.x = u_xlat16_19.x * 16.0 + u_xlat16_5.z;
    u_xlat16_17.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_19.x = u_xlat16_17.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_37.x = (-u_xlat16_54) + u_xlat16_36.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_37.x + u_xlat16_54;
    u_xlat16_19.x = u_xlat16_1.x * u_xlat16_19.x;
    u_xlat36 = dot(u_xlat16_11.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_37.x = dot(u_xlat16_11.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat36 = u_xlat36 * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_37.x * 0.5 + 0.5;
    u_xlat16_19.x = (-u_xlat16_37.x) + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_19.z * u_xlat16_19.x + u_xlat16_37.x;
    u_xlat16_19.x = u_xlat16_19.z * u_xlat16_19.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19.x;
    u_xlat54 = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat54 * 0.5;
    u_xlat16_19.x = (-u_xlat54) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat16_19.x + u_xlat16_1.x;
    u_xlat16_19.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_37.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37.x + u_xlat16_19.x;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat36 = min(u_xlat54, u_xlat16_6.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_6.z);
    u_xlat16_19.x = (-u_xlat16_6.y) * _MetallicMultiplier + 1.0;
    u_xlat16_19.xyz = u_xlat16_19.xxx * u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat16_8.xyz);
    u_xlat56 = dot(u_xlat2.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat0.y * u_xlat56;
    u_xlat9.z = u_xlat54 * u_xlat0.x;
    u_xlat54 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat10.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat56 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat0.x * u_xlat56;
    u_xlat16_1.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat0.y * u_xlat16_1.x;
    u_xlat6.x = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat6.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat54 = u_xlat54 * u_xlat56 + 6.10351563e-05;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat24.xyz = vec3(u_xlat56) * u_xlat7.xyz;
    u_xlat56 = dot(u_xlat4.xyz, u_xlat24.xyz);
    u_xlat4.y = u_xlat0.y * u_xlat56;
    u_xlat18 = u_xlat0.x * u_xlat0.y;
    u_xlat16_1.x = dot(u_xlat2.zxy, u_xlat24.xyz);
    u_xlat4.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_1.x) + 1.0;
    u_xlat4.z = u_xlat0.x * u_xlat18;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat54 * u_xlat0.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_8.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat18 = (-u_xlat16_1.x) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(u_xlat18);
    u_xlat18 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _DirectSpecularColor.xyz;
    u_xlat0.xyw = u_xlat6.xxx * u_xlat0.xyw;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_8.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat2.xyz * u_xlat16_8.xxx;
    u_xlat16_62 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_62));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_62);
#endif
    u_xlat16_13.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_26.x;
    u_xlat16_1.x = max(u_xlat16_13.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_26.x, u_xlat16_8.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat20.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_13.xyz * u_xlat6.xxx + u_xlat16_8.xyz;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat2.xyw * vec3(u_xlat16_62);
    u_xlat16_62 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_62));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_62);
#endif
    u_xlat16_15.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_65 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_65;
    u_xlat16_1.x = max(u_xlat16_15.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_65);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_62;
    u_xlat16_13.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.yyy * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * u_xlat2.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat36) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat36) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat36) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat36) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat36) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat36) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat0.xyw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat16_55 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_12.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_12.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz + u_xlat16_1.xyz;
    u_xlat16_26.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_26.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_8.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(9) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
ivec3 u_xlati9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec2 u_xlat16_20;
bool u_xlatb20;
vec3 u_xlat21;
vec3 u_xlat24;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
float u_xlat36;
mediump vec2 u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump vec2 u_xlat16_37;
float u_xlat54;
mediump float u_xlat16_54;
int u_xlati54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_62;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.x;
    u_xlat4.y = u_xlat3.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.5<_anisoUse2U);
#else
    u_xlatb56 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb56)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_56 = texture(_AnisotropicMap, u_xlat3.xy).x;
    u_xlat56 = u_xlat16_56 * 2.0 + -1.0;
    u_xlat56 = u_xlat56 * _SunShift + _SunShiftOffset;
    u_xlat56 = u_xlat56 + vs_TEXCOORD6;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
    u_xlat21.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat4.x = dot(u_xlat2.zxy, u_xlat21.xyz);
    u_xlat2.xyz = (-u_xlat21.yzx) * u_xlat4.xxx + u_xlat2.xyz;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xxx;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat21.xyz;
    u_xlat4.xyz = u_xlat21.zxy * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat16_1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat21.xyz + u_xlat4.zxy;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat16_6.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_6.zz);
    u_xlat16_19.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat16_19.x>=0.0);
#else
    u_xlatb56 = u_xlat16_19.x>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb56)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_37.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_8.xyz = u_xlat16_37.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_37.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.xyz = u_xlat5.xyz * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat5.zxy * u_xlat16_8.yzx + (-u_xlat9.xyz);
    u_xlat10.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat5.yzx + (-u_xlat10.xyz);
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + u_xlat5.xyz;
    u_xlat16_37.xy = u_xlat16_6.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_62 = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_62 = max(u_xlat16_62, 0.0078125);
    u_xlat16_11.x = u_xlat16_62 * 8.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_19.x) * u_xlat16_11.x;
    u_xlat5.xyz = u_xlat16_11.xxx * u_xlat5.xyz + u_xlat21.xyz;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat16_11.x = dot((-u_xlat16_8.xyz), u_xlat5.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_11.xxx + (-u_xlat16_8.xyz);
    u_xlat9.xyz = u_xlat0.xyz * vec3(u_xlat54) + (-u_xlat5.xyz);
    u_xlat16_11.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat21.xyz;
    u_xlat16_65 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat0.xyz = vec3(u_xlat16_65) * u_xlat9.xyz + u_xlat5.xyz;
    u_xlat9.xyz = (-u_xlat0.xyz) + u_xlat5.xyz;
    u_xlat0.xyz = abs(u_xlat16_19.xxx) * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_65 = -abs(u_xlat16_19.x) * 0.800000012 + 1.0;
    u_xlat0.x = (-u_xlat16_19.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_62;
    u_xlat0.y = u_xlat16_1.x * u_xlat16_62;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_37.x * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_9 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_9.www * u_xlat16_9.xyz;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat9.xyz * u_xlat9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_14.y = u_xlat16_11.y;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _OcclusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati36 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati54 = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_14.xyw;
    u_xlat16_19.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_15.xyz = u_xlat16_19.xxx * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb36 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb36)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
    u_xlat9.x = dot(u_xlat21.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat9.x;
    u_xlat10.y = u_xlat16_37.x;
    u_xlat16_36.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat6.xw = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat6.xw = fract(u_xlat6.xw);
    u_xlat6.xw = u_xlat6.xw + vs_TEXCOORD3.zw;
    u_xlat16_28.xyz = texture(_GradientFlowMap, u_xlat6.xw).xyz;
    u_xlat16_15.xyz = u_xlat16_28.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_28.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _AlbedoColor.xyz;
    u_xlat16_15.xyz = u_xlat16_28.xyz * u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_56 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_37.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19.x = u_xlat16_37.x * 1.09769487;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_36.xxx + u_xlat16_36.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat36 = dot(u_xlat16_11.xyz, u_xlat5.xyz);
    u_xlat16_19.y = u_xlat36 * 0.5;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_19.z = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_17.xyz = u_xlat16_19.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_17.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_19.x = floor(u_xlat16_5.w);
    u_xlat16_37.x = u_xlat16_19.x + 1.0;
    u_xlat16_37.x = min(u_xlat16_37.x, 15.0);
    u_xlat16_5.x = u_xlat16_37.x * 16.0 + u_xlat16_5.z;
    u_xlat16_17.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36.x = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_5.x = u_xlat16_19.x * 16.0 + u_xlat16_5.z;
    u_xlat16_17.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_17.xy = u_xlat16_17.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_17.xy).x;
    u_xlat16_19.x = u_xlat16_17.z * 15.0 + (-u_xlat16_19.x);
    u_xlat16_37.x = (-u_xlat16_54) + u_xlat16_36.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_37.x + u_xlat16_54;
    u_xlat16_19.x = u_xlat16_1.x * u_xlat16_19.x;
    u_xlat36 = dot(u_xlat16_11.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_37.x = dot(u_xlat16_11.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat36 = u_xlat36 * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_37.x * 0.5 + 0.5;
    u_xlat16_19.x = (-u_xlat16_37.x) + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_19.z * u_xlat16_19.x + u_xlat16_37.x;
    u_xlat16_19.x = u_xlat16_19.z * u_xlat16_19.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19.x;
    u_xlat54 = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat54 * 0.5;
    u_xlat16_19.x = (-u_xlat54) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat16_19.x + u_xlat16_1.x;
    u_xlat16_19.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_37.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37.x + u_xlat16_19.x;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat36 = min(u_xlat54, u_xlat16_6.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_6.z);
    u_xlat16_19.x = (-u_xlat16_6.y) * _MetallicMultiplier + 1.0;
    u_xlat16_19.xyz = u_xlat16_19.xxx * u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat16_8.xyz);
    u_xlat56 = dot(u_xlat2.zxy, u_xlat16_8.xyz);
    u_xlat9.y = u_xlat0.y * u_xlat56;
    u_xlat9.z = u_xlat54 * u_xlat0.x;
    u_xlat54 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat10.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat56 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat0.x * u_xlat56;
    u_xlat16_1.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat0.y * u_xlat16_1.x;
    u_xlat6.x = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat6.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat54 = u_xlat54 * u_xlat56 + 6.10351563e-05;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat24.xyz = vec3(u_xlat56) * u_xlat7.xyz;
    u_xlat56 = dot(u_xlat4.xyz, u_xlat24.xyz);
    u_xlat4.y = u_xlat0.y * u_xlat56;
    u_xlat18 = u_xlat0.x * u_xlat0.y;
    u_xlat16_1.x = dot(u_xlat2.zxy, u_xlat24.xyz);
    u_xlat4.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_1.x) + 1.0;
    u_xlat4.z = u_xlat0.x * u_xlat18;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat18 = u_xlat18 * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat54 * u_xlat0.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_8.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat18 = (-u_xlat16_1.x) * u_xlat2.x + 1.0;
    u_xlat2.xyz = u_xlat16_16.xyz * vec3(u_xlat18);
    u_xlat18 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _DirectSpecularColor.xyz;
    u_xlat0.xyw = u_xlat6.xxx * u_xlat0.xyw;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_8.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat2.xyz * u_xlat16_8.xxx;
    u_xlat16_62 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_62));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_62);
#endif
    u_xlat16_13.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_8.x = u_xlat16_8.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_26.x;
    u_xlat16_1.x = max(u_xlat16_13.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_26.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_8.x = max(u_xlat16_26.x, u_xlat16_8.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat20.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat2.xxx * u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_13.xyz * u_xlat6.xxx + u_xlat16_8.xyz;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_62 = inversesqrt(u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat2.xyw * vec3(u_xlat16_62);
    u_xlat16_62 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_62));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_62);
#endif
    u_xlat16_15.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat16_62 = u_xlat16_62 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_65 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_65;
    u_xlat16_1.x = max(u_xlat16_15.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_65);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_62;
    u_xlat16_13.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.yyy * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * u_xlat2.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat0.xyw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat36) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat36) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat36) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat36) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat36) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_19.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat36) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat0.xyw * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat16_55 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_12.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_12.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_26.xyz * u_xlat16_11.xyz + u_xlat16_1.xyz;
    u_xlat16_26.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_26.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_8.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec3 u_xlat21;
vec3 u_xlat24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
int u_xlati41;
bool u_xlatb41;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_55;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
float u_xlat61;
int u_xlati61;
bool u_xlatb61;
mediump float u_xlat16_62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
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
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat65 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat8.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21.x = (-u_xlat1.x) + u_xlat21.x;
    u_xlat0.z = _ShadowBias.y * u_xlat21.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat60 = u_xlat0.x + -1.0;
    u_xlat1.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat60) + vec2(1.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(_OcclusionScale) * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_6.xyz = vec3(u_xlat16_66) * u_xlat16_6.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat16_66) + u_xlat16_10.x;
    u_xlat16_30.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _OcclusionScale * u_xlat16_30.x + 1.0;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_10.x + u_xlat16_66;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_66;
    u_xlat16_10.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + -1.0;
    u_xlat16_10.x = _OcclusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_10.x;
    u_xlat1.xy = min(u_xlat1.xy, vec2(u_xlat16_66));
    u_xlat16_66 = u_xlat1.y * 0.5;
    u_xlat16_11.x = (-u_xlat1.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat41.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat41.xy = u_xlat41.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_60 = texture(_AnisotropicMap, u_xlat41.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _SunShift + _SunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD6;
    u_xlat16_31.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_31.x = inversesqrt(u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_31.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb41 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat41.x = (u_xlatb41) ? 1.0 : -1.0;
    u_xlat41.x = u_xlat41.x * vs_TEXCOORD2.w;
    u_xlat61 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat8.yzx) * vec3(u_xlat61) + u_xlat7.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat8.xyz;
    u_xlat3.xyz = u_xlat8.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_31.xyz + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat60) * u_xlat8.xyz + u_xlat3.zxy;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_51 = u_xlat16_31.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_51>=0.0);
#else
    u_xlatb60 = u_xlat16_51>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb60)) ? u_xlat4.xyz : u_xlat2.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_12.xyz = u_xlat9.xyz * vec3(u_xlat16_71);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat13.xyz = u_xlat4.xyz * u_xlat16_12.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat13.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat4.xyz;
    u_xlat16_15.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_71 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_72 = u_xlat16_71 * 8.0;
    u_xlat16_72 = min(u_xlat16_72, 1.0);
    u_xlat16_72 = abs(u_xlat16_51) * u_xlat16_72;
    u_xlat4.xyz = vec3(u_xlat16_72) * u_xlat4.xyz + u_xlat8.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_72 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_72 = u_xlat16_72 + u_xlat16_72;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_72) + (-u_xlat16_12.xyz);
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat16_30.y = u_xlat60 * 0.5;
    u_xlat16_30.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_30.xyz = u_xlat16_30.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.yzw = u_xlat16_30.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_13.w);
    u_xlat16_50 = u_xlat16_30.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_13.x = u_xlat16_50 * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_13.x = u_xlat16_30.x * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_41.x = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_30.x = u_xlat16_30.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_50 = u_xlat16_60 + (-u_xlat16_41.x);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_50 + u_xlat16_41.x;
    u_xlat16_30.x = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat60 = u_xlat60 * u_xlat16_30.x;
    u_xlat16_66 = u_xlat60 * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_30.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_50 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_50 + u_xlat16_30.x;
    u_xlat16_66 = u_xlat1.y * u_xlat16_66;
    u_xlat60 = min(u_xlat1.x, u_xlat16_7.z);
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_7.z);
    u_xlat16_30.x = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat4.xyz);
    u_xlat16_50 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat1.xyz = abs(vec3(u_xlat16_51)) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat16.y = u_xlat1.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_50 = -abs(u_xlat16_51) * 0.800000012 + 1.0;
    u_xlat1.x = (-u_xlat16_51) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_71;
    u_xlat1.y = u_xlat16_31.x * u_xlat16_71;
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_50 = u_xlat16_15.x * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_50);
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_50);
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_17.y = u_xlat16_6.y;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_6.xyz = u_xlat16_10.xxx * u_xlat16_6.xyz;
    u_xlati41 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_10.xzw = u_xlat16_6.yyy * _IrradianceACCoeffs[u_xlati41].xyz;
    u_xlati41 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati61 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_10.xzw = u_xlat16_6.xxx * _IrradianceACCoeffs[u_xlati41].xyz + u_xlat16_10.xzw;
    u_xlat16_6.xyz = u_xlat16_6.zzz * _IrradianceACCoeffs[u_xlati61].xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_6.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb41 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xzw = (bool(u_xlatb41)) ? u_xlat16_10.xzw : u_xlat16_11.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat4.x;
    u_xlat5.y = u_xlat16_15.x;
    u_xlat16_41.xy = texture(_DfgTexture, u_xlat5.xy).xy;
    u_xlat25.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat25.xy = u_xlat25.xy + vs_TEXCOORD3.zw;
    u_xlat16_25.xyz = texture(_GradientFlowMap, u_xlat25.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_25.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_25.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xzw = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_7.xyz * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_7.xyz * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _AlbedoColor.xyz;
    u_xlat16_11.xyz = u_xlat16_25.xyz * u_xlat16_11.xyz + (-u_xlat16_15.xzw);
    u_xlat16_62 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_30.xxx * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_15.yyy * u_xlat16_15.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_41.xxx + u_xlat16_41.yyy;
    u_xlat16_10.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat41.x = inversesqrt(u_xlat41.x);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat16_12.xyz);
    u_xlat41.y = dot(u_xlat2.zxy, u_xlat16_12.xyz);
    u_xlat4.yz = u_xlat41.yx * u_xlat1.yx;
    u_xlat41.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat41.x + u_xlat5.x;
    u_xlat61 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat61 * u_xlat1.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat1.y * u_xlat16_66;
    u_xlat4.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat61 = sqrt(u_xlat61);
    u_xlat41.y = u_xlat61 + u_xlat4.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y + 6.10351563e-05;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat24.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat3.xyz, u_xlat24.xyz);
    u_xlat3.y = u_xlat61 * u_xlat1.y;
    u_xlat21.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat24.xyz);
    u_xlat3.x = u_xlat1.x * u_xlat16_66;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat16_66) + 1.0;
    u_xlat3.z = u_xlat1.x * u_xlat21.x;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat21.x / u_xlat1.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat21.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat41.x * u_xlat1.x;
    u_xlat16_66 = u_xlat61 * u_xlat61;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_70 = u_xlat61 * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat61 + 1.0;
    u_xlat21.xyz = u_xlat16_15.xyz * u_xlat21.xxx;
    u_xlat2.x = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat2.xxx * vec3(u_xlat16_70) + u_xlat21.xyz;
    u_xlat1.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.xyz;
    u_xlat1.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _ShadowColor.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_6.w = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_11.w = u_xlat16_71 * u_xlat16_71;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_6.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_15.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_7.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_7.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_10.x;
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
out highp vec4 vs_TEXCOORD5;
out mediump float vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat2.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat0.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_24);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GradientFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _GradientFlowMask;
UNITY_LOCATION(11) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec3 u_xlat21;
vec3 u_xlat24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
int u_xlati41;
bool u_xlatb41;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_55;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
float u_xlat61;
int u_xlati61;
bool u_xlatb61;
mediump float u_xlat16_62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
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
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat65 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat8.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat21.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat21.x = (-u_xlat1.x) + u_xlat21.x;
    u_xlat0.z = _ShadowBias.y * u_xlat21.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat60 = u_xlat0.x + -1.0;
    u_xlat1.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat60) + vec2(1.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_6.xyz = vec3(_OcclusionScale) * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_6.xyz = vec3(u_xlat16_66) * u_xlat16_6.xyz;
    u_xlat16_66 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat16_66) + u_xlat16_10.x;
    u_xlat16_30.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_30.z = _OcclusionScale * u_xlat16_30.x + 1.0;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_10.x + u_xlat16_66;
    u_xlat16_66 = u_xlat16_30.z * u_xlat16_66;
    u_xlat16_10.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + -1.0;
    u_xlat16_10.x = _OcclusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_10.x;
    u_xlat1.xy = min(u_xlat1.xy, vec2(u_xlat16_66));
    u_xlat16_66 = u_xlat1.y * 0.5;
    u_xlat16_11.x = (-u_xlat1.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat41.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat41.xy = u_xlat41.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_60 = texture(_AnisotropicMap, u_xlat41.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _SunShift + _SunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD6;
    u_xlat16_31.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_31.x = inversesqrt(u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_31.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb41 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat41.x = (u_xlatb41) ? 1.0 : -1.0;
    u_xlat41.x = u_xlat41.x * vs_TEXCOORD2.w;
    u_xlat61 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat8.yzx) * vec3(u_xlat61) + u_xlat7.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat8.xyz;
    u_xlat3.xyz = u_xlat8.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_31.xyz + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat60) * u_xlat8.xyz + u_xlat3.zxy;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.x = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_51 = u_xlat16_31.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_51>=0.0);
#else
    u_xlatb60 = u_xlat16_51>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb60)) ? u_xlat4.xyz : u_xlat2.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_12.xyz = u_xlat9.xyz * vec3(u_xlat16_71);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat13.xyz = u_xlat4.xyz * u_xlat16_12.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat13.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat4.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat4.xyz;
    u_xlat16_15.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_71 = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_72 = u_xlat16_71 * 8.0;
    u_xlat16_72 = min(u_xlat16_72, 1.0);
    u_xlat16_72 = abs(u_xlat16_51) * u_xlat16_72;
    u_xlat4.xyz = vec3(u_xlat16_72) * u_xlat4.xyz + u_xlat8.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_72 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_72 = u_xlat16_72 + u_xlat16_72;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_72) + (-u_xlat16_12.xyz);
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat16_30.y = u_xlat60 * 0.5;
    u_xlat16_30.x = u_xlat16_15.x * 1.09769487;
    u_xlat16_30.xyz = u_xlat16_30.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
    u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.yzw = u_xlat16_30.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_13.w);
    u_xlat16_50 = u_xlat16_30.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_13.x = u_xlat16_50 * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_13.x = u_xlat16_30.x * 16.0 + u_xlat16_13.z;
    u_xlat16_55.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_55.xy = u_xlat16_55.xy * vec2(0.00390625, 0.0625);
    u_xlat16_41.x = texture(_SpecularOcclusionLut3D, u_xlat16_55.xy).x;
    u_xlat16_30.x = u_xlat16_30.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_50 = u_xlat16_60 + (-u_xlat16_41.x);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_50 + u_xlat16_41.x;
    u_xlat16_30.x = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat60 = dot(u_xlat16_6.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat60 = u_xlat60 * u_xlat16_30.x;
    u_xlat16_66 = u_xlat60 * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_30.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_50 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_50 + u_xlat16_30.x;
    u_xlat16_66 = u_xlat1.y * u_xlat16_66;
    u_xlat60 = min(u_xlat1.x, u_xlat16_7.z);
    u_xlat16_66 = min(u_xlat16_66, u_xlat16_7.z);
    u_xlat16_30.x = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat4.xyz);
    u_xlat16_50 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat1.xyz = vec3(u_xlat16_50) * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat1.xyz = abs(vec3(u_xlat16_51)) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat16.y = u_xlat1.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_50 = -abs(u_xlat16_51) * 0.800000012 + 1.0;
    u_xlat1.x = (-u_xlat16_51) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_71;
    u_xlat1.y = u_xlat16_31.x * u_xlat16_71;
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_50 = u_xlat16_15.x * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_50);
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_50);
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_6.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_6.xz);
    u_xlat16_17.y = u_xlat16_6.y;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_6.xyz = u_xlat16_10.xxx * u_xlat16_6.xyz;
    u_xlati41 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_10.xzw = u_xlat16_6.yyy * _IrradianceACCoeffs[u_xlati41].xyz;
    u_xlati41 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati61 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_10.xzw = u_xlat16_6.xxx * _IrradianceACCoeffs[u_xlati41].xyz + u_xlat16_10.xzw;
    u_xlat16_6.xyz = u_xlat16_6.zzz * _IrradianceACCoeffs[u_xlati61].xyz + u_xlat16_10.xzw;
    u_xlat16_10.x = dot(u_xlat16_6.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xzw = u_xlat16_10.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb41 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xzw = (bool(u_xlatb41)) ? u_xlat16_10.xzw : u_xlat16_11.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat4.x;
    u_xlat5.y = u_xlat16_15.x;
    u_xlat16_41.xy = texture(_DfgTexture, u_xlat5.xy).xy;
    u_xlat25.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat25.xy = u_xlat25.xy + vs_TEXCOORD3.zw;
    u_xlat16_25.xyz = texture(_GradientFlowMap, u_xlat25.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_25.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_25.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xzw = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_7.xyz * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_7.xyz * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _AlbedoColor.xyz;
    u_xlat16_11.xyz = u_xlat16_25.xyz * u_xlat16_11.xyz + (-u_xlat16_15.xzw);
    u_xlat16_62 = texture(_GradientFlowMask, vs_TEXCOORD3.zw).x;
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_30.xxx * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_15.yyy * u_xlat16_15.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_41.xxx + u_xlat16_41.yyy;
    u_xlat16_10.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat41.x = inversesqrt(u_xlat41.x);
    u_xlat3.xyz = u_xlat41.xxx * u_xlat3.xyz;
    u_xlat41.x = dot(u_xlat3.xyz, u_xlat16_12.xyz);
    u_xlat41.y = dot(u_xlat2.zxy, u_xlat16_12.xyz);
    u_xlat4.yz = u_xlat41.yx * u_xlat1.yx;
    u_xlat41.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41.x = sqrt(u_xlat41.x);
    u_xlat41.x = u_xlat41.x + u_xlat5.x;
    u_xlat61 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.z = u_xlat61 * u_xlat1.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.y = u_xlat1.y * u_xlat16_66;
    u_xlat4.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat61 = sqrt(u_xlat61);
    u_xlat41.y = u_xlat61 + u_xlat4.x;
    u_xlat41.xy = u_xlat41.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat41.x = u_xlat41.x * u_xlat41.y + 6.10351563e-05;
    u_xlat41.x = float(1.0) / u_xlat41.x;
    u_xlat61 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat24.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat61 = dot(u_xlat3.xyz, u_xlat24.xyz);
    u_xlat3.y = u_xlat61 * u_xlat1.y;
    u_xlat21.x = u_xlat1.x * u_xlat1.y;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat24.xyz);
    u_xlat3.x = u_xlat1.x * u_xlat16_66;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat16_66) + 1.0;
    u_xlat3.z = u_xlat1.x * u_xlat21.x;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 6.10351563e-05);
    u_xlat1.x = u_xlat21.x / u_xlat1.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat21.x * u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat41.x * u_xlat1.x;
    u_xlat16_66 = u_xlat61 * u_xlat61;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_70 = u_xlat61 * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat61 + 1.0;
    u_xlat21.xyz = u_xlat16_15.xyz * u_xlat21.xxx;
    u_xlat2.x = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat2.xxx * vec3(u_xlat16_70) + u_xlat21.xyz;
    u_xlat1.xyz = u_xlat21.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.xyz;
    u_xlat1.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _ShadowColor.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_6.w = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_11.w = u_xlat16_71 * u_xlat16_71;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_6.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb61 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_71 = (u_xlatb61) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + u_xlat16_17.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_66);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_18.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_71 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_18.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_71);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat20.yyy * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat60) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_15.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_7.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_7.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_30.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_10.x;
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
  GpuProgramID 110074
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_GradientFlowHair_SimpleGUI"
}