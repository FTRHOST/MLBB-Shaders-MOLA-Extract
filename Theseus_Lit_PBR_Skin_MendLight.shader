//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_Skin_MendLight" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_zwrite ("深度写入", Float) = 1.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

_normalMap ("法线贴图", 2D) = "bump" { }

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

[Tex] _skinMap ("skinMap", 2D) = "black" { }

_sssColorBase ("sssColor0", Color) = (1,1,1,1)

_sssColorBack ("sssColor1", Color) = (1,1,1,1)

_sssColorOcc ("sssColor2", Color) = (1,1,1,1)

_sssIntensity ("sssIntensity", Range(0, 3)) = 0.0

[Tex] _MendsLightMask ("补光遮罩", 2D) = "white" { }

_MendsLightDirection ("补光方向", Vector) = (1,0,1,0)

_MendsLightColor ("补光颜色", Color) = (1,1,1,0)

_MendsLightFallOff ("补光衰减", Range(0, 1)) = 0.0

_MendsLightDirection2 ("补光2方向", Vector) = (1,0,1,0)

_MendsLightColor2 ("补光2颜色", Color) = (1,1,1,0)

_MendsLightFallOff2 ("补光2衰减", Range(0, 1)) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 7001
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
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
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
ivec3 u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_31;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump float u_xlat16_51;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat62;
float u_xlat75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat88;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat75 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat75) * u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_26.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat75 * u_xlat75;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_3.x = u_xlat75 * u_xlat16_77;
    u_xlat75 = (-u_xlat16_77) * u_xlat75 + 1.0;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_28.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_28.xyz = u_xlat16_5.zxy * u_xlat16_28.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_5.zxy;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_8.xyz;
    u_xlat75 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat79 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat82 = (-u_xlat7) * u_xlat16_26.x + u_xlat7;
    u_xlat82 = u_xlat7 * u_xlat82 + u_xlat16_26.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat7;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat12.x) * u_xlat16_26.x + u_xlat12.x;
    u_xlat84 = u_xlat12.x * u_xlat84 + u_xlat16_26.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat12.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat84;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat29 = u_xlat16_26.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat29 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_26.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat82 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat13.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat82 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat82 = u_xlat82 * u_xlat29 + 1.0;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat82 = u_xlat16_26.x / u_xlat82;
    u_xlat82 = u_xlat82 * 0.318309873;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat86 = (-u_xlat16_51) + 1.0;
    u_xlat16_51 = u_xlat86 * u_xlat86;
    u_xlat16_51 = u_xlat86 * u_xlat16_51;
    u_xlat16_51 = u_xlat86 * u_xlat16_51;
    u_xlat16_76 = u_xlat86 * u_xlat16_51;
    u_xlat86 = (-u_xlat16_51) * u_xlat86 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat86);
    u_xlat13.xyz = vec3(u_xlat75) * vec3(u_xlat16_76) + u_xlat13.xyz;
    u_xlat86 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat86) * u_xlat16_26.x + u_xlat86;
    u_xlat62 = u_xlat86 * u_xlat62 + u_xlat16_26.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat86 + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat84 * u_xlat62;
    u_xlat88 = float(1.0) / u_xlat62;
    u_xlat14.x = min(u_xlat88, 16.0);
    u_xlat82 = u_xlat82 * u_xlat14.x;
    u_xlat14.xyz = u_xlat13.xyz * vec3(u_xlat82);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat86) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_51 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_51 = max(u_xlat16_51, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_51 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_51);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat5.xyz;
    u_xlat16_51 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_51 = max(u_xlat16_51, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_51 = u_xlat16_76 * u_xlat16_51;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
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
    u_xlat0.x = u_xlat0.x * u_xlat29 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_26.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat25.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat50 * u_xlat50;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_51 = u_xlat50 * u_xlat16_1.x;
    u_xlat50 = (-u_xlat16_1.x) * u_xlat50 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat75) * vec3(u_xlat16_51) + u_xlat5.xyz;
    u_xlat50 = (-u_xlat25.x) * u_xlat16_26.x + u_xlat25.x;
    u_xlat50 = u_xlat25.x * u_xlat50 + u_xlat16_26.x;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat25.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat50 * u_xlat84;
    u_xlat0.z = float(1.0) / u_xlat50;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = u_xlat25.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_15.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_77) + u_xlat16_3.x;
    u_xlat16_31 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_31 + 1.0;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_77;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_31 = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_31;
    u_xlat16_83 = sqrt(u_xlat16_77);
    u_xlat0.x = min(u_xlat16_77, 1.0);
    u_xlat16_16.xy = u_xlat4.xz * vec2(u_xlat16_83);
    u_xlat16_18.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_50 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_77 = _sssIntensity * _sssIntensity;
    u_xlat16_77 = u_xlat16_50 * u_xlat16_77;
    u_xlat16_85 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat16_28.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = sqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_85) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_16.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-vec3(u_xlat7));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = vec3(u_xlat86) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat25.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + u_xlat25.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + (-vec3(u_xlat86));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat86);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat4.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + _sssColorOcc.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat11.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat4.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat4.xyz + _sssColorBack.zxy;
    u_xlat25.xyz = u_xlat16_16.xyz * u_xlat25.xyz;
    u_xlat16_16.xyz = u_xlat25.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_16.xyz = vec3(u_xlat16_77) * u_xlat16_16.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat25.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat25.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_31) * u_xlat16_20.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_18.xyw;
    u_xlat16_20.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat16_83) + (-u_xlat16_10.xyz);
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat25.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_56 = floor(u_xlat16_3.w);
    u_xlat16_81 = u_xlat16_56 + 1.0;
    u_xlat16_81 = min(u_xlat16_81, 15.0);
    u_xlat16_3.x = u_xlat16_81 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_56 = u_xlat16_10.z * 15.0 + (-u_xlat16_56);
    u_xlat16_81 = (-u_xlat16_54) + u_xlat16_29;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_81 + u_xlat16_54;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_56;
    u_xlat4.x = u_xlat4.x * u_xlat16_31;
    u_xlat16_31 = u_xlat0.x * 0.5;
    u_xlat16_56 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_31 = u_xlat4.x * u_xlat16_56 + u_xlat16_31;
    u_xlat16_56 = u_xlat16_31 + u_xlat16_31;
    u_xlat16_81 = (-u_xlat16_31) * 2.0 + 1.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_81 + u_xlat16_56;
    u_xlat16_31 = u_xlat0.x * u_xlat16_31;
    u_xlat16_31 = min(u_xlat16_31, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat79) + (-u_xlat25.xyz);
    u_xlat0.xyz = u_xlat16_26.xxx * u_xlat4.xyz + u_xlat25.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_26.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xzw = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_26.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_6.xzw;
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
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_51 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_6.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat16_51 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_8.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_51) + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
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
    u_xlat75 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat2.x = u_xlat75 * 0.0625 + u_xlat2.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_25.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
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
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
ivec3 u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_31;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump float u_xlat16_51;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat62;
float u_xlat75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat88;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat75 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat75) * u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_26.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat75 * u_xlat75;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_3.x = u_xlat75 * u_xlat16_77;
    u_xlat75 = (-u_xlat16_77) * u_xlat75 + 1.0;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_28.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_28.xyz = u_xlat16_5.zxy * u_xlat16_28.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_5.zxy;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_8.xyz;
    u_xlat75 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat79 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat82 = (-u_xlat7) * u_xlat16_26.x + u_xlat7;
    u_xlat82 = u_xlat7 * u_xlat82 + u_xlat16_26.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat7;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat12.x) * u_xlat16_26.x + u_xlat12.x;
    u_xlat84 = u_xlat12.x * u_xlat84 + u_xlat16_26.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat12.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat84;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat29 = u_xlat16_26.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat29 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_26.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat82 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat13.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat82 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat82 = u_xlat82 * u_xlat29 + 1.0;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat82 = u_xlat16_26.x / u_xlat82;
    u_xlat82 = u_xlat82 * 0.318309873;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat86 = (-u_xlat16_51) + 1.0;
    u_xlat16_51 = u_xlat86 * u_xlat86;
    u_xlat16_51 = u_xlat86 * u_xlat16_51;
    u_xlat16_51 = u_xlat86 * u_xlat16_51;
    u_xlat16_76 = u_xlat86 * u_xlat16_51;
    u_xlat86 = (-u_xlat16_51) * u_xlat86 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat86);
    u_xlat13.xyz = vec3(u_xlat75) * vec3(u_xlat16_76) + u_xlat13.xyz;
    u_xlat86 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat86) * u_xlat16_26.x + u_xlat86;
    u_xlat62 = u_xlat86 * u_xlat62 + u_xlat16_26.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat86 + u_xlat62;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat84 * u_xlat62;
    u_xlat88 = float(1.0) / u_xlat62;
    u_xlat14.x = min(u_xlat88, 16.0);
    u_xlat82 = u_xlat82 * u_xlat14.x;
    u_xlat14.xyz = u_xlat13.xyz * vec3(u_xlat82);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat86) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_51 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_51 = max(u_xlat16_51, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_51 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_51);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat5.xyz;
    u_xlat16_51 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_51 = max(u_xlat16_51, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_51 = u_xlat16_76 * u_xlat16_51;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
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
    u_xlat0.x = u_xlat0.x * u_xlat29 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_26.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat25.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat50 * u_xlat50;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_51 = u_xlat50 * u_xlat16_1.x;
    u_xlat50 = (-u_xlat16_1.x) * u_xlat50 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat75) * vec3(u_xlat16_51) + u_xlat5.xyz;
    u_xlat50 = (-u_xlat25.x) * u_xlat16_26.x + u_xlat25.x;
    u_xlat50 = u_xlat25.x * u_xlat50 + u_xlat16_26.x;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat25.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat50 * u_xlat84;
    u_xlat0.z = float(1.0) / u_xlat50;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.zxy;
    u_xlat0.xzw = u_xlat25.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_15.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_77) + u_xlat16_3.x;
    u_xlat16_31 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_31 + 1.0;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_77;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_31 = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_31;
    u_xlat16_83 = sqrt(u_xlat16_77);
    u_xlat0.x = min(u_xlat16_77, 1.0);
    u_xlat16_16.xy = u_xlat4.xz * vec2(u_xlat16_83);
    u_xlat16_18.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_50 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_77 = _sssIntensity * _sssIntensity;
    u_xlat16_77 = u_xlat16_50 * u_xlat16_77;
    u_xlat16_85 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat16_28.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = sqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_85) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_16.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-vec3(u_xlat7));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = vec3(u_xlat86) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat25.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + u_xlat25.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + (-vec3(u_xlat86));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat86);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat4.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + _sssColorOcc.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat11.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat4.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat4.xyz + _sssColorBack.zxy;
    u_xlat25.xyz = u_xlat16_16.xyz * u_xlat25.xyz;
    u_xlat16_16.xyz = u_xlat25.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_16.xyz = vec3(u_xlat16_77) * u_xlat16_16.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat25.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat25.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_31) * u_xlat16_20.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_18.xyw;
    u_xlat16_20.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat16_83) + (-u_xlat16_10.xyz);
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat25.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_56 = floor(u_xlat16_3.w);
    u_xlat16_81 = u_xlat16_56 + 1.0;
    u_xlat16_81 = min(u_xlat16_81, 15.0);
    u_xlat16_3.x = u_xlat16_81 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_56 = u_xlat16_10.z * 15.0 + (-u_xlat16_56);
    u_xlat16_81 = (-u_xlat16_54) + u_xlat16_29;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_81 + u_xlat16_54;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_56;
    u_xlat4.x = u_xlat4.x * u_xlat16_31;
    u_xlat16_31 = u_xlat0.x * 0.5;
    u_xlat16_56 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_31 = u_xlat4.x * u_xlat16_56 + u_xlat16_31;
    u_xlat16_56 = u_xlat16_31 + u_xlat16_31;
    u_xlat16_81 = (-u_xlat16_31) * 2.0 + 1.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_81 + u_xlat16_56;
    u_xlat16_31 = u_xlat0.x * u_xlat16_31;
    u_xlat16_31 = min(u_xlat16_31, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat79) + (-u_xlat25.xyz);
    u_xlat0.xyz = u_xlat16_26.xxx * u_xlat4.xyz + u_xlat25.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_26.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xzw = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_26.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_6.xzw;
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
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_51 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_6.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat16_51 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_8.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_51) + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
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
    u_xlat75 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat2.x = u_xlat75 * 0.0625 + u_xlat2.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_25.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
int u_xlati26;
bool u_xlatb26;
float u_xlat27;
vec3 u_xlat28;
vec2 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
mediump float u_xlat16_52;
float u_xlat53;
float u_xlat55;
mediump float u_xlat16_62;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
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
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat30.x = dot(u_xlat7.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat7.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat27 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat27 = (-u_xlat1.x) + u_xlat27;
    u_xlat0.z = _ShadowBias.y * u_xlat27 + u_xlat1.x;
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_36.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = u_xlat16_10.x * u_xlat16_36.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_11.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_11.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_10.xyz;
    u_xlat79 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat16_88 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat28.x = (-u_xlat16_88) + 1.0;
    u_xlat16_10.x = u_xlat28.x * u_xlat28.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_36.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat28.x = (-u_xlat16_10.x) * u_xlat28.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = u_xlat3.xxx * u_xlat16_36.xxx + u_xlat28.xyz;
    u_xlat16_36.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat29.x = (-u_xlat79) * u_xlat16_36.x + u_xlat79;
    u_xlat29.x = u_xlat79 * u_xlat29.x + u_xlat16_36.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat79 + u_xlat29.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat9.x) * u_xlat16_36.x + u_xlat9.x;
    u_xlat55 = u_xlat9.x * u_xlat55 + u_xlat16_36.x;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat29.y = u_xlat55 + u_xlat9.x;
    u_xlat29.xy = u_xlat29.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.x * u_xlat29.y;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat4.x = u_xlat16_36.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_36.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat29.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat28.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat16_89 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat4.x + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_36.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat29.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat29.x * u_xlat29.x;
    u_xlat16_89 = u_xlat29.x * u_xlat16_89;
    u_xlat16_89 = u_xlat29.x * u_xlat16_89;
    u_xlat16_90 = u_xlat29.x * u_xlat16_89;
    u_xlat29.x = (-u_xlat16_89) * u_xlat29.x + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat29.xxx;
    u_xlat14.xyz = u_xlat3.xxx * vec3(u_xlat16_90) + u_xlat14.xyz;
    u_xlat29.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat29.x) * u_xlat16_36.x + u_xlat29.x;
    u_xlat82 = u_xlat29.x * u_xlat82 + u_xlat16_36.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat29.x + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat29.y * u_xlat82;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat80 = u_xlat80 * u_xlat82;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat29.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_90 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_91;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_91 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_90;
    u_xlat16_17.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_36.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat53 * u_xlat53;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_89 = u_xlat53 * u_xlat16_84;
    u_xlat53 = (-u_xlat16_84) * u_xlat53 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat53);
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_89) + u_xlat2.xyz;
    u_xlat53 = (-u_xlat27) * u_xlat16_36.x + u_xlat27;
    u_xlat53 = u_xlat27 * u_xlat53 + u_xlat16_36.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 + u_xlat27;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat53 = u_xlat53 * u_xlat29.y;
    u_xlat1.z = float(1.0) / u_xlat53;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat26.yyy + u_xlat16_15.xyz;
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat7.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_84) + u_xlat16_89;
    u_xlat16_90 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_89 + u_xlat16_84;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_84;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _occlusionScale * u_xlat16_89 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat16_18.xyz = u_xlat16_6.xyz * vec3(u_xlat16_90);
    u_xlat16_19.xy = u_xlat26.xy * vec2(u_xlat16_90);
    u_xlat16_20.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_84 = _sssIntensity * _sssIntensity;
    u_xlat16_84 = u_xlat16_1.x * u_xlat16_84;
    u_xlat16_90 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_90);
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_22.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_90) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_25.xyz = u_xlat29.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_25.xyz * u_xlat16_18.xyz + (-u_xlat29.xxx);
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + u_xlat29.xxx;
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat79) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat27) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_19.xzw = u_xlat16_19.xxx * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_19.yyy * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat16_20.xyz + (-vec3(u_xlat27));
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(u_xlat27);
    u_xlat16_20.xyz = u_xlat16_10.xzw * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xzw + (-vec3(u_xlat79));
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + vec3(u_xlat79);
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat26.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_11.xyz + _sssColorOcc.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat26.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat3.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat3.xyz = u_xlat26.xxx * u_xlat3.xyz + _sssColorBack.zxy;
    u_xlat3.xyz = u_xlat16_11.xyz * u_xlat3.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_10.xzw + (-u_xlat16_10.xzw);
    u_xlat16_10.xzw = vec3(u_xlat16_84) * u_xlat16_11.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_89) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati26 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat83) + (-u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_36.xxx * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat11.y = u_xlat3.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_88 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_26.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_26.xxx + u_xlat16_26.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat3.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb26 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb26)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_84 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_84 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_84 = u_xlat16_10.z * 15.0 + (-u_xlat16_84);
    u_xlat16_10.x = (-u_xlat16_52) + u_xlat16_26.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_10.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat0.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.w * 0.5;
    u_xlat16_10.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_10.x + u_xlat16_84;
    u_xlat16_10.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_36.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_36.x + u_xlat16_10.x;
    u_xlat16_84 = u_xlat0.w * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_4.z, u_xlat16_84);
    u_xlat16_10.xyz = vec3(u_xlat16_84) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_12.yzx + u_xlat16_15.yzx;
    u_xlat16_84 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_3.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_36.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_36.x = inversesqrt(u_xlat16_36.x);
    u_xlat16_36.xyz = u_xlat16_36.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_36.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_36.x * -2.0 + 3.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_62;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_36.xyz = u_xlat16_36.xxx * u_xlat16_12.xyz;
    u_xlat16_12.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_38.x;
    u_xlat16_38.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_36.xyz = u_xlat16_38.xyz * u_xlat16_12.xxx + u_xlat16_36.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_36.xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_36.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_36.xyz = u_xlat16_3.zxy * u_xlat16_36.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_36.xyz = u_xlat16_3.zxy * u_xlat16_36.xyz;
    u_xlat0.xyz = u_xlat16_36.xyz * _emissiveColor.zxy + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_36.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_36.xyz + u_xlat16_6.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_26.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_10.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
int u_xlati26;
bool u_xlatb26;
float u_xlat27;
vec3 u_xlat28;
vec2 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
mediump float u_xlat16_52;
float u_xlat53;
float u_xlat55;
mediump float u_xlat16_62;
float u_xlat78;
float u_xlat79;
float u_xlat80;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
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
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat30.x = dot(u_xlat7.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat7.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat27 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat27 = (-u_xlat1.x) + u_xlat27;
    u_xlat0.z = _ShadowBias.y * u_xlat27 + u_xlat1.x;
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_36.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = u_xlat16_10.x * u_xlat16_36.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_11.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_11.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_10.xyz;
    u_xlat79 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat16_88 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat28.x = (-u_xlat16_88) + 1.0;
    u_xlat16_10.x = u_xlat28.x * u_xlat28.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_36.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat28.x = (-u_xlat16_10.x) * u_xlat28.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat16_12.xyz;
    u_xlat3.x = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = u_xlat3.xxx * u_xlat16_36.xxx + u_xlat28.xyz;
    u_xlat16_36.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat29.x = (-u_xlat79) * u_xlat16_36.x + u_xlat79;
    u_xlat29.x = u_xlat79 * u_xlat29.x + u_xlat16_36.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat79 + u_xlat29.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat9.x) * u_xlat16_36.x + u_xlat9.x;
    u_xlat55 = u_xlat9.x * u_xlat55 + u_xlat16_36.x;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat29.y = u_xlat55 + u_xlat9.x;
    u_xlat29.xy = u_xlat29.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.x * u_xlat29.y;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat29.x = min(u_xlat29.x, 16.0);
    u_xlat4.x = u_xlat16_36.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat4.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_36.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat29.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat28.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat16_89 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat4.x + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_36.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat29.x = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat29.x * u_xlat29.x;
    u_xlat16_89 = u_xlat29.x * u_xlat16_89;
    u_xlat16_89 = u_xlat29.x * u_xlat16_89;
    u_xlat16_90 = u_xlat29.x * u_xlat16_89;
    u_xlat29.x = (-u_xlat16_89) * u_xlat29.x + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat29.xxx;
    u_xlat14.xyz = u_xlat3.xxx * vec3(u_xlat16_90) + u_xlat14.xyz;
    u_xlat29.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat82 = (-u_xlat29.x) * u_xlat16_36.x + u_xlat29.x;
    u_xlat82 = u_xlat29.x * u_xlat82 + u_xlat16_36.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat29.x + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat29.y * u_xlat82;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat80 = u_xlat80 * u_xlat82;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat29.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_90 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_91;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_91 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_90;
    u_xlat16_17.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_36.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat53 * u_xlat53;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_89 = u_xlat53 * u_xlat16_84;
    u_xlat53 = (-u_xlat16_84) * u_xlat53 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat53);
    u_xlat2.xyz = u_xlat3.xxx * vec3(u_xlat16_89) + u_xlat2.xyz;
    u_xlat53 = (-u_xlat27) * u_xlat16_36.x + u_xlat27;
    u_xlat53 = u_xlat27 * u_xlat53 + u_xlat16_36.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 + u_xlat27;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat53 = u_xlat53 * u_xlat29.y;
    u_xlat1.z = float(1.0) / u_xlat53;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat26.yyy + u_xlat16_15.xyz;
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat7.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_84) + u_xlat16_89;
    u_xlat16_90 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_89 + u_xlat16_84;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_84;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _occlusionScale * u_xlat16_89 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat16_18.xyz = u_xlat16_6.xyz * vec3(u_xlat16_90);
    u_xlat16_19.xy = u_xlat26.xy * vec2(u_xlat16_90);
    u_xlat16_20.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_84 = _sssIntensity * _sssIntensity;
    u_xlat16_84 = u_xlat16_1.x * u_xlat16_84;
    u_xlat16_90 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_90);
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_22.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_90) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_25.xyz = u_xlat29.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_25.xyz * u_xlat16_18.xyz + (-u_xlat29.xxx);
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + u_xlat29.xxx;
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat79) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat27) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_19.xzw = u_xlat16_19.xxx * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_19.yyy * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat16_20.xyz + (-vec3(u_xlat27));
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(u_xlat27);
    u_xlat16_20.xyz = u_xlat16_10.xzw * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xzw + (-vec3(u_xlat79));
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + vec3(u_xlat79);
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat26.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_11.xyz + _sssColorOcc.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat26.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat3.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat3.xyz = u_xlat26.xxx * u_xlat3.xyz + _sssColorBack.zxy;
    u_xlat3.xyz = u_xlat16_11.xyz * u_xlat3.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_10.xzw + (-u_xlat16_10.xzw);
    u_xlat16_10.xzw = vec3(u_xlat16_84) * u_xlat16_11.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_89) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati26 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat83) + (-u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_36.xxx * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat11.y = u_xlat3.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_88 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_26.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_26.xxx + u_xlat16_26.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat3.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb26 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb26)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_84 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_84 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_84 = u_xlat16_10.z * 15.0 + (-u_xlat16_84);
    u_xlat16_10.x = (-u_xlat16_52) + u_xlat16_26.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_10.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat0.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.w * 0.5;
    u_xlat16_10.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_10.x + u_xlat16_84;
    u_xlat16_10.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_36.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_36.x + u_xlat16_10.x;
    u_xlat16_84 = u_xlat0.w * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_4.z, u_xlat16_84);
    u_xlat16_10.xyz = vec3(u_xlat16_84) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_12.yzx + u_xlat16_15.yzx;
    u_xlat16_84 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_3.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_36.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_36.x = inversesqrt(u_xlat16_36.x);
    u_xlat16_36.xyz = u_xlat16_36.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_36.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_36.x * -2.0 + 3.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_62;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_36.xyz = u_xlat16_36.xxx * u_xlat16_12.xyz;
    u_xlat16_12.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_38.x;
    u_xlat16_38.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_36.xyz = u_xlat16_38.xyz * u_xlat16_12.xxx + u_xlat16_36.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_36.xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_36.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_36.xyz = u_xlat16_3.zxy * u_xlat16_36.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_36.xyz = u_xlat16_3.zxy * u_xlat16_36.xyz;
    u_xlat0.xyz = u_xlat16_36.xyz * _emissiveColor.zxy + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_36.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_36.xyz + u_xlat16_6.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_26.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_10.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
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
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
ivec3 u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_31;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump float u_xlat16_51;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat62;
float u_xlat75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat87;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat75 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat75) * u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_26.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat75 * u_xlat75;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_3.x = u_xlat75 * u_xlat16_77;
    u_xlat75 = (-u_xlat16_77) * u_xlat75 + 1.0;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_28.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_8.xyz;
    u_xlat75 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat79 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat82 = (-u_xlat7) * u_xlat16_26.x + u_xlat7;
    u_xlat82 = u_xlat7 * u_xlat82 + u_xlat16_26.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat7;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat12.x) * u_xlat16_26.x + u_xlat12.x;
    u_xlat84 = u_xlat12.x * u_xlat84 + u_xlat16_26.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat12.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat84;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat29 = u_xlat16_26.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat29 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_26.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat82 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat13.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat29 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_26.x / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat62 = (-u_xlat16_51) + 1.0;
    u_xlat16_51 = u_xlat62 * u_xlat62;
    u_xlat16_51 = u_xlat62 * u_xlat16_51;
    u_xlat16_51 = u_xlat62 * u_xlat16_51;
    u_xlat16_76 = u_xlat62 * u_xlat16_51;
    u_xlat62 = (-u_xlat16_51) * u_xlat62 + 1.0;
    u_xlat14.xyz = u_xlat16_8.xyz * vec3(u_xlat62);
    u_xlat14.xyz = vec3(u_xlat75) * vec3(u_xlat16_76) + u_xlat14.xyz;
    u_xlat62 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat62) * u_xlat16_26.x + u_xlat62;
    u_xlat87 = u_xlat62 * u_xlat87 + u_xlat16_26.x;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat62;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat84 * u_xlat87;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat86 = u_xlat86 * u_xlat87;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat62) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_51 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_51 = max(u_xlat16_51, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_51 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_51);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat5.xyz;
    u_xlat16_51 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_51 = max(u_xlat16_51, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_51 = u_xlat16_76 * u_xlat16_51;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
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
    u_xlat0.x = u_xlat0.x * u_xlat29 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_26.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat25.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat50 * u_xlat50;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_51 = u_xlat50 * u_xlat16_1.x;
    u_xlat50 = (-u_xlat16_1.x) * u_xlat50 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat75) * vec3(u_xlat16_51) + u_xlat5.xyz;
    u_xlat50 = (-u_xlat25.x) * u_xlat16_26.x + u_xlat25.x;
    u_xlat50 = u_xlat25.x * u_xlat50 + u_xlat16_26.x;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat25.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat50 * u_xlat84;
    u_xlat0.z = float(1.0) / u_xlat50;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = u_xlat25.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_15.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_77) + u_xlat16_3.x;
    u_xlat16_31 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_31 + 1.0;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_77;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_31 = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_31;
    u_xlat16_83 = sqrt(u_xlat16_77);
    u_xlat0.x = min(u_xlat16_77, 1.0);
    u_xlat16_16.xy = u_xlat4.xz * vec2(u_xlat16_83);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_50 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_77 = _sssIntensity * _sssIntensity;
    u_xlat16_77 = u_xlat16_50 * u_xlat16_77;
    u_xlat16_85 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat16_28.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = sqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_85) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_16.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-vec3(u_xlat7));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = vec3(u_xlat62) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat25.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + u_xlat25.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + (-vec3(u_xlat62));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat62);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat4.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat11.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat4.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat4.xyz + _sssColorBack.xyz;
    u_xlat25.xyz = u_xlat16_16.xyz * u_xlat25.xyz;
    u_xlat16_16.xyz = u_xlat25.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_16.xyz = vec3(u_xlat16_77) * u_xlat16_16.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat25.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat25.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_31) * u_xlat16_20.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_18.xyw;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat16_83) + (-u_xlat16_10.xyz);
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat25.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_56 = floor(u_xlat16_3.w);
    u_xlat16_81 = u_xlat16_56 + 1.0;
    u_xlat16_81 = min(u_xlat16_81, 15.0);
    u_xlat16_3.x = u_xlat16_81 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_56 = u_xlat16_10.z * 15.0 + (-u_xlat16_56);
    u_xlat16_81 = (-u_xlat16_54) + u_xlat16_29;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_81 + u_xlat16_54;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_56;
    u_xlat4.x = u_xlat4.x * u_xlat16_31;
    u_xlat16_31 = u_xlat0.x * 0.5;
    u_xlat16_56 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_31 = u_xlat4.x * u_xlat16_56 + u_xlat16_31;
    u_xlat16_56 = u_xlat16_31 + u_xlat16_31;
    u_xlat16_81 = (-u_xlat16_31) * 2.0 + 1.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_81 + u_xlat16_56;
    u_xlat16_31 = u_xlat0.x * u_xlat16_31;
    u_xlat16_31 = min(u_xlat16_31, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat79) + (-u_xlat25.xyz);
    u_xlat0.xyz = u_xlat16_26.xxx * u_xlat4.xyz + u_xlat25.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_26.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xzw = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_26.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_6.xzw;
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
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_51 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_6.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat16_51 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_8.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_51) + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
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
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
ivec3 u_xlati25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_31;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump float u_xlat16_51;
mediump float u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat62;
float u_xlat75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
float u_xlat79;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
float u_xlat86;
float u_xlat87;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_26.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_51 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51;
    u_xlat16_26.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_26.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_26.x);
#endif
    u_xlat16_26.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_26.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_26.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_26.xyz);
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
    u_xlat16_27 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_27, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_26.xyz;
    u_xlat75 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat4.xyz = vec3(u_xlat75) * u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_26.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_77) + 1.0;
    u_xlat16_77 = u_xlat75 * u_xlat75;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_77 = u_xlat75 * u_xlat16_77;
    u_xlat16_3.x = u_xlat75 * u_xlat16_77;
    u_xlat75 = (-u_xlat16_77) * u_xlat75 + 1.0;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_28.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_28.xyz = u_xlat16_28.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_8.xyz;
    u_xlat75 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat79 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = max(u_xlat79, 1.17549435e-38);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat11.xyz = vec3(u_xlat79) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0078125);
    u_xlat82 = (-u_xlat7) * u_xlat16_26.x + u_xlat7;
    u_xlat82 = u_xlat7 * u_xlat82 + u_xlat16_26.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat7;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat12.x) * u_xlat16_26.x + u_xlat12.x;
    u_xlat84 = u_xlat12.x * u_xlat84 + u_xlat16_26.x;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat12.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat84;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat29 = u_xlat16_26.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat29 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_26.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat82 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat13.xyz = vec3(u_xlat82) * u_xlat13.xyz;
    u_xlat16_51 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat29 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_26.x / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat62 = (-u_xlat16_51) + 1.0;
    u_xlat16_51 = u_xlat62 * u_xlat62;
    u_xlat16_51 = u_xlat62 * u_xlat16_51;
    u_xlat16_51 = u_xlat62 * u_xlat16_51;
    u_xlat16_76 = u_xlat62 * u_xlat16_51;
    u_xlat62 = (-u_xlat16_51) * u_xlat62 + 1.0;
    u_xlat14.xyz = u_xlat16_8.xyz * vec3(u_xlat62);
    u_xlat14.xyz = vec3(u_xlat75) * vec3(u_xlat16_76) + u_xlat14.xyz;
    u_xlat62 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat62) * u_xlat16_26.x + u_xlat62;
    u_xlat87 = u_xlat62 * u_xlat87 + u_xlat16_26.x;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat62;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat84 * u_xlat87;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat86 = u_xlat86 * u_xlat87;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat62) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_51 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_51 = max(u_xlat16_51, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_51 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_51);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat5.xyz;
    u_xlat16_51 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_51 = max(u_xlat16_51, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_51 = u_xlat16_76 * u_xlat16_51;
    u_xlat16_17.xyz = vec3(u_xlat16_51) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
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
    u_xlat0.x = u_xlat0.x * u_xlat29 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_26.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat25.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat50 * u_xlat50;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat50 * u_xlat16_1.x;
    u_xlat16_51 = u_xlat50 * u_xlat16_1.x;
    u_xlat50 = (-u_xlat16_1.x) * u_xlat50 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat75) * vec3(u_xlat16_51) + u_xlat5.xyz;
    u_xlat50 = (-u_xlat25.x) * u_xlat16_26.x + u_xlat25.x;
    u_xlat50 = u_xlat25.x * u_xlat50 + u_xlat16_26.x;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat25.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat50 * u_xlat84;
    u_xlat0.z = float(1.0) / u_xlat50;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _directSpecularColor.xyz;
    u_xlat0.xzw = u_xlat25.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat79) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_15.xyz;
    u_xlat16_77 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_77) + u_xlat16_3.x;
    u_xlat16_31 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_31 + 1.0;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_77 = u_xlat16_6.w * u_xlat16_77;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_31 = _occlusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_31;
    u_xlat16_83 = sqrt(u_xlat16_77);
    u_xlat0.x = min(u_xlat16_77, 1.0);
    u_xlat16_16.xy = u_xlat4.xz * vec2(u_xlat16_83);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_50 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_77 = _sssIntensity * _sssIntensity;
    u_xlat16_77 = u_xlat16_50 * u_xlat16_77;
    u_xlat16_85 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat16_28.xyz * vec3(u_xlat16_85);
    u_xlat16_85 = sqrt(u_xlat16_77);
    u_xlat16_18.xyz = vec3(u_xlat16_85) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_16.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_85) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat16_16.xzw + (-vec3(u_xlat7));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = vec3(u_xlat62) * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat25.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz + u_xlat25.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_18.xyz + (-vec3(u_xlat62));
    u_xlat16_16.xyz = vec3(u_xlat16_85) * u_xlat16_16.xyz + vec3(u_xlat62);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat4.zzz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_6.www * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat11.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat11.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat4.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat4.xyz + _sssColorBack.xyz;
    u_xlat25.xyz = u_xlat16_16.xyz * u_xlat25.xyz;
    u_xlat16_16.xyz = u_xlat25.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_16.xyz = vec3(u_xlat16_77) * u_xlat16_16.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat25.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat25.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat25.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_31) * u_xlat16_20.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_18.xyw;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_77 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat16_83) + (-u_xlat16_10.xyz);
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat25.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_56 = floor(u_xlat16_3.w);
    u_xlat16_81 = u_xlat16_56 + 1.0;
    u_xlat16_81 = min(u_xlat16_81, 15.0);
    u_xlat16_3.x = u_xlat16_81 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_56 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_56 = u_xlat16_10.z * 15.0 + (-u_xlat16_56);
    u_xlat16_81 = (-u_xlat16_54) + u_xlat16_29;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_81 + u_xlat16_54;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_56;
    u_xlat4.x = u_xlat4.x * u_xlat16_31;
    u_xlat16_31 = u_xlat0.x * 0.5;
    u_xlat16_56 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_31 = u_xlat4.x * u_xlat16_56 + u_xlat16_31;
    u_xlat16_56 = u_xlat16_31 + u_xlat16_31;
    u_xlat16_81 = (-u_xlat16_31) * 2.0 + 1.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_81 + u_xlat16_56;
    u_xlat16_31 = u_xlat0.x * u_xlat16_31;
    u_xlat16_31 = min(u_xlat16_31, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat79) + (-u_xlat25.xyz);
    u_xlat0.xyz = u_xlat16_26.xxx * u_xlat4.xyz + u_xlat25.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_26.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xzw = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_26.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_77) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * u_xlat16_8.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_6.xzw;
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
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat16_51 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_6.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat16_6.xyz;
    u_xlat16_51 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_51 = float(1.0) / _MendsLightFallOff;
    u_xlat16_51 = u_xlat0.x * u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_76;
    u_xlat16_8.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_51) + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_26.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
int u_xlati26;
bool u_xlatb26;
float u_xlat27;
vec3 u_xlat28;
vec3 u_xlat30;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
mediump float u_xlat16_52;
float u_xlat53;
float u_xlat61;
mediump float u_xlat16_62;
float u_xlat79;
float u_xlat80;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat87;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
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
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat30.x = dot(u_xlat7.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat7.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat27 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat27 = (-u_xlat1.x) + u_xlat27;
    u_xlat0.z = _ShadowBias.y * u_xlat27 + u_xlat1.x;
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_36.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = u_xlat16_10.x * u_xlat16_36.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_11.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_11.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_10.xyz;
    u_xlat79 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat16_88 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat28.x = (-u_xlat16_88) + 1.0;
    u_xlat16_10.x = u_xlat28.x * u_xlat28.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_36.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat28.x = (-u_xlat16_10.x) * u_xlat28.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat16_12.xyz;
    u_xlat4.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = u_xlat4.xxx * u_xlat16_36.xxx + u_xlat28.xyz;
    u_xlat16_36.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat82 = (-u_xlat79) * u_xlat16_36.x + u_xlat79;
    u_xlat82 = u_xlat79 * u_xlat82 + u_xlat16_36.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat79 + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat9.x) * u_xlat16_36.x + u_xlat9.x;
    u_xlat85 = u_xlat9.x * u_xlat85 + u_xlat16_36.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat9.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat85;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat61 = u_xlat16_36.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat61 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_36.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat82 * u_xlat2.x;
    u_xlat2.xyz = u_xlat28.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat16_89 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat61 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_36.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat82 = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat82 * u_xlat82;
    u_xlat16_89 = u_xlat82 * u_xlat16_89;
    u_xlat16_89 = u_xlat82 * u_xlat16_89;
    u_xlat16_90 = u_xlat82 * u_xlat16_89;
    u_xlat82 = (-u_xlat16_89) * u_xlat82 + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * vec3(u_xlat82);
    u_xlat14.xyz = u_xlat4.xxx * vec3(u_xlat16_90) + u_xlat14.xyz;
    u_xlat82 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat82) * u_xlat16_36.x + u_xlat82;
    u_xlat87 = u_xlat82 * u_xlat87 + u_xlat16_36.x;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat82 + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat85 * u_xlat87;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat80 = u_xlat80 * u_xlat87;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat82) * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_90 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_91;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_91 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_90;
    u_xlat16_17.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat61 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_36.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat53 * u_xlat53;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_89 = u_xlat53 * u_xlat16_84;
    u_xlat53 = (-u_xlat16_84) * u_xlat53 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat53);
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_89) + u_xlat2.xyz;
    u_xlat53 = (-u_xlat27) * u_xlat16_36.x + u_xlat27;
    u_xlat53 = u_xlat27 * u_xlat53 + u_xlat16_36.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 + u_xlat27;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat53 = u_xlat53 * u_xlat85;
    u_xlat1.z = float(1.0) / u_xlat53;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat26.yyy + u_xlat16_15.xyz;
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat7.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_84) + u_xlat16_89;
    u_xlat16_90 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_89 + u_xlat16_84;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_84;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _occlusionScale * u_xlat16_89 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat16_18.xyz = u_xlat16_6.xyz * vec3(u_xlat16_90);
    u_xlat16_19.xy = u_xlat26.xy * vec2(u_xlat16_90);
    u_xlat16_20.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_84 = _sssIntensity * _sssIntensity;
    u_xlat16_84 = u_xlat16_1.x * u_xlat16_84;
    u_xlat16_90 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_90);
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_22.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_90) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_25.xyz = vec3(u_xlat82) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_25.xyz * u_xlat16_18.xyz + (-vec3(u_xlat82));
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + vec3(u_xlat82);
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat79) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat27) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_19.xzw = u_xlat16_19.xxx * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_19.yyy * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat16_20.xyz + (-vec3(u_xlat27));
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(u_xlat27);
    u_xlat16_20.xyz = u_xlat16_10.xzw * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xzw + (-vec3(u_xlat79));
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + vec3(u_xlat79);
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat26.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_11.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat26.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat1.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat1.xyz = u_xlat26.xxx * u_xlat1.xyz + _sssColorBack.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xzw + (-u_xlat16_10.xzw);
    u_xlat16_10.xzw = vec3(u_xlat16_84) * u_xlat16_11.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_89) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati26 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat83) + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat16_36.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_88 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_26.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_26.xxx + u_xlat16_26.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb26 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb26)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_84 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_84 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_84 = u_xlat16_10.z * 15.0 + (-u_xlat16_84);
    u_xlat16_10.x = (-u_xlat16_52) + u_xlat16_26.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_10.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat0.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.w * 0.5;
    u_xlat16_10.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_10.x + u_xlat16_84;
    u_xlat16_10.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_36.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_36.x + u_xlat16_10.x;
    u_xlat16_84 = u_xlat0.w * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_4.z, u_xlat16_84);
    u_xlat16_10.xyz = vec3(u_xlat16_84) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_3.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_36.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_36.x = inversesqrt(u_xlat16_36.x);
    u_xlat16_36.xyz = u_xlat16_36.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_36.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_36.x * -2.0 + 3.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_62;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_36.xyz = u_xlat16_36.xxx * u_xlat16_12.xyz;
    u_xlat16_12.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_38.x;
    u_xlat16_38.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_36.xyz = u_xlat16_38.xyz * u_xlat16_12.xxx + u_xlat16_36.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_36.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_36.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_36.xyz = u_xlat16_2.xyz * u_xlat16_36.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_36.xyz = u_xlat16_2.xyz * u_xlat16_36.xyz;
    u_xlat0.xyz = u_xlat16_36.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_36.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_36.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_10.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
int u_xlati26;
bool u_xlatb26;
float u_xlat27;
vec3 u_xlat28;
vec3 u_xlat30;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
mediump float u_xlat16_52;
float u_xlat53;
float u_xlat61;
mediump float u_xlat16_62;
float u_xlat79;
float u_xlat80;
float u_xlat82;
float u_xlat83;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat87;
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
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat30.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat83 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat16_6.xyz;
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
    u_xlat83 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat83 = max(u_xlat83, 1.17549435e-38);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat7.xyz = vec3(u_xlat83) * u_xlat5.xyz;
    u_xlat30.x = dot(u_xlat7.xyz, u_xlat30.xyz);
    u_xlat30.x = (-u_xlat30.x) * u_xlat30.x + 1.0;
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x * _ShadowBias.z;
    u_xlat30.xyz = (-u_xlat7.xyz) * u_xlat30.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat30.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat27 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat27 = (-u_xlat1.x) + u_xlat27;
    u_xlat0.z = _ShadowBias.y * u_xlat27 + u_xlat1.x;
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
    u_xlat26.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat26.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_26.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_26.z * _shadowStrength;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_84 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_36.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = u_xlat16_10.x * u_xlat16_36.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_11.x);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_11.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_10.xyz;
    u_xlat79 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat16_88 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat28.x = (-u_xlat16_88) + 1.0;
    u_xlat16_10.x = u_xlat28.x * u_xlat28.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat16_36.x = u_xlat28.x * u_xlat16_10.x;
    u_xlat28.x = (-u_xlat16_10.x) * u_xlat28.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_3.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_4.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat16_12.xyz;
    u_xlat4.x = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28.xyz = u_xlat4.xxx * u_xlat16_36.xxx + u_xlat28.xyz;
    u_xlat16_36.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat82 = (-u_xlat79) * u_xlat16_36.x + u_xlat79;
    u_xlat82 = u_xlat79 * u_xlat82 + u_xlat16_36.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat79 + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_84);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat9.x) * u_xlat16_36.x + u_xlat9.x;
    u_xlat85 = u_xlat9.x * u_xlat85 + u_xlat16_36.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat9.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat82 = u_xlat82 * u_xlat85;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat61 = u_xlat16_36.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat61 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_36.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat82 * u_xlat2.x;
    u_xlat2.xyz = u_xlat28.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat79) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat80 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat16_89 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat80 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat80 * u_xlat61 + 1.0;
    u_xlat80 = u_xlat80 * u_xlat80;
    u_xlat80 = u_xlat16_36.x / u_xlat80;
    u_xlat80 = u_xlat80 * 0.318309873;
    u_xlat80 = min(u_xlat80, 16.0);
    u_xlat82 = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat82 * u_xlat82;
    u_xlat16_89 = u_xlat82 * u_xlat16_89;
    u_xlat16_89 = u_xlat82 * u_xlat16_89;
    u_xlat16_90 = u_xlat82 * u_xlat16_89;
    u_xlat82 = (-u_xlat16_89) * u_xlat82 + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * vec3(u_xlat82);
    u_xlat14.xyz = u_xlat4.xxx * vec3(u_xlat16_90) + u_xlat14.xyz;
    u_xlat82 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat82) * u_xlat16_36.x + u_xlat82;
    u_xlat87 = u_xlat82 * u_xlat87 + u_xlat16_36.x;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat82 + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat85 * u_xlat87;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat80 = u_xlat80 * u_xlat87;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat82) * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_90 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_91;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat16_17.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_90 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_91 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_90;
    u_xlat16_17.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_84) + u_xlat16_16.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat61 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_36.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat53 * u_xlat53;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_84 = u_xlat53 * u_xlat16_84;
    u_xlat16_89 = u_xlat53 * u_xlat16_84;
    u_xlat53 = (-u_xlat16_84) * u_xlat53 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat53);
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_89) + u_xlat2.xyz;
    u_xlat53 = (-u_xlat27) * u_xlat16_36.x + u_xlat27;
    u_xlat53 = u_xlat27 * u_xlat53 + u_xlat16_36.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 + u_xlat27;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat53 = u_xlat53 * u_xlat85;
    u_xlat1.z = float(1.0) / u_xlat53;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_17.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat26.yyy + u_xlat16_15.xyz;
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat83) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat7.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_84 * 0.5 + 0.5;
    u_xlat16_89 = (-u_xlat16_84) + u_xlat16_89;
    u_xlat16_90 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_89 + u_xlat16_84;
    u_xlat16_84 = u_xlat16_8.w * u_xlat16_84;
    u_xlat16_89 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 + -1.0;
    u_xlat16_89 = _occlusionScale * u_xlat16_89 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_89;
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_84));
    u_xlat16_18.xyz = u_xlat16_6.xyz * vec3(u_xlat16_90);
    u_xlat16_19.xy = u_xlat26.xy * vec2(u_xlat16_90);
    u_xlat16_20.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_84 = _sssIntensity * _sssIntensity;
    u_xlat16_84 = u_xlat16_1.x * u_xlat16_84;
    u_xlat16_90 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(u_xlat16_90);
    u_xlat16_90 = sqrt(u_xlat16_84);
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_22.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_90) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_25.xyz = vec3(u_xlat82) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_25.xyz * u_xlat16_18.xyz + (-vec3(u_xlat82));
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + vec3(u_xlat82);
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat79) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat27) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_19.xzw = u_xlat16_19.xxx * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_19.yyy * u_xlat16_21.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat16_20.xyz + (-vec3(u_xlat27));
    u_xlat16_20.xyz = vec3(u_xlat16_90) * u_xlat16_20.xyz + vec3(u_xlat27);
    u_xlat16_20.xyz = u_xlat16_10.xzw * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xzw + (-vec3(u_xlat79));
    u_xlat16_18.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz + vec3(u_xlat79);
    u_xlat16_18.xyz = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat26.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat26.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_11.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat26.x = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat1.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat1.xyz = u_xlat26.xxx * u_xlat1.xyz + _sssColorBack.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_10.xzw + (-u_xlat16_10.xzw);
    u_xlat16_10.xzw = vec3(u_xlat16_84) * u_xlat16_11.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_11.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_89) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati26 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_84 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xyz = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat83) + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat16_36.xxx * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_88 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_26.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_26.xxx + u_xlat16_26.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb26 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb26)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_84 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_84 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_26.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_84 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_84 = u_xlat16_10.z * 15.0 + (-u_xlat16_84);
    u_xlat16_10.x = (-u_xlat16_52) + u_xlat16_26.x;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_10.x + u_xlat16_52;
    u_xlat16_84 = u_xlat16_89 * u_xlat16_84;
    u_xlat0.x = u_xlat0.x * u_xlat16_84;
    u_xlat16_84 = u_xlat0.w * 0.5;
    u_xlat16_10.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_84 = u_xlat0.x * u_xlat16_10.x + u_xlat16_84;
    u_xlat16_10.x = u_xlat16_84 + u_xlat16_84;
    u_xlat16_36.x = (-u_xlat16_84) * 2.0 + 1.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_36.x + u_xlat16_10.x;
    u_xlat16_84 = u_xlat0.w * u_xlat16_84;
    u_xlat16_84 = min(u_xlat16_4.z, u_xlat16_84);
    u_xlat16_10.xyz = vec3(u_xlat16_84) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_84 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_3.w * _albedoColor.w + u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _albedoColor.w;
    u_xlat16_36.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_36.x = inversesqrt(u_xlat16_36.x);
    u_xlat16_36.xyz = u_xlat16_36.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_36.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_36.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_36.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.x = min(max(u_xlat16_36.x, 0.0), 1.0);
#else
    u_xlat16_36.x = clamp(u_xlat16_36.x, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_36.x * -2.0 + 3.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_62;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_36.xyz = u_xlat16_36.xxx * u_xlat16_12.xyz;
    u_xlat16_12.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_38.x;
    u_xlat16_38.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_36.xyz = u_xlat16_38.xyz * u_xlat16_12.xxx + u_xlat16_36.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_36.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_36.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_36.xyz = u_xlat16_2.xyz * u_xlat16_36.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_36.xyz = u_xlat16_2.xyz * u_xlat16_36.xyz;
    u_xlat0.xyz = u_xlat16_36.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_36.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_36.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_84 : u_xlat16_10.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MendsLightMask;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec2 u_xlat18;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
mediump vec2 u_xlat16_26;
bool u_xlatb26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump float u_xlat16_31;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat46;
mediump vec2 u_xlat16_50;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat64;
int u_xlati64;
float u_xlat66;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 6.10351563e-05);
    u_xlat16_41.x = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_41.xxx;
    u_xlat16_41.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_41.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_41.x);
#endif
    u_xlat16_41.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_41.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_41.yyy + u_xlat16_3.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_21 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = float(1.0) / float(u_xlat16_21);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_21 = u_xlat16_61 * u_xlat16_21;
    u_xlat16_21 = max(u_xlat16_41.x, u_xlat16_21);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_61 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_61) + vs_TEXCOORD2.yzx;
    u_xlat60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat64 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_61 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_5.x * u_xlat16_61;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_62 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_61);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_27.xyz = u_xlat16_7.xxx * u_xlat16_27.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_27.xyz);
    u_xlat16_8.xyz = vec3(u_xlat64) * u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_9.xyz = vec3(u_xlat16_68) * u_xlat16_9.xyz;
    u_xlat16_68 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_68) + u_xlat16_69;
    u_xlat16_10.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_68 = u_xlat16_5.w * u_xlat16_69 + u_xlat16_68;
    u_xlat16_69 = u_xlat16_5.w * u_xlat16_68;
    u_xlat16_10.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + -1.0;
    u_xlat16_10.x = _occlusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_10.x;
    u_xlat16_30.x = sqrt(u_xlat16_69);
    u_xlat6 = min(u_xlat16_69, 1.0);
    u_xlat16_26.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat16_50.xy = u_xlat26.xy * u_xlat16_30.xx;
    u_xlat16_11.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_50.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_50.yyy * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz + (-vec3(u_xlat64));
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz + vec3(u_xlat64);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_8.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_8.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat26.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat64) * u_xlat16_1.xyz;
    u_xlat64 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat16_30.xyz = u_xlat16_11.xyz * u_xlat16_30.xyz + (-vec3(u_xlat64));
    u_xlat16_30.xyz = u_xlat16_7.xxx * u_xlat16_30.xyz + vec3(u_xlat64);
    u_xlat16_30.xyz = u_xlat16_13.xyz * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb26 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_69);
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16.xyz;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb26 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb26)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_11.yyy + u_xlat16_15.xyz;
    u_xlat16_31 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_31 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_30.x;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_69;
    u_xlat16_30.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat26.xxx * u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + (-u_xlat26.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat26.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_30.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat26.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat26.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat26.x = (-u_xlat64) * u_xlat16_2.x + u_xlat64;
    u_xlat26.x = u_xlat64 * u_xlat26.x + u_xlat16_2.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat64 + u_xlat26.x;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_22.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_7.xyz = u_xlat16_22.xxx * u_xlat16.xyz;
    u_xlat17.xyz = u_xlat16.xyz * u_xlat16_22.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat18.x = dot(u_xlat4.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat18.x) * u_xlat16_2.x + u_xlat18.x;
    u_xlat46 = u_xlat18.x * u_xlat46 + u_xlat16_2.x;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat26.y = u_xlat46 + u_xlat18.x;
    u_xlat26.xy = u_xlat26.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat46 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat17.xyz = vec3(u_xlat46) * u_xlat17.xyz;
    u_xlat46 = dot(u_xlat4.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_22.x) + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat16_2.x + -1.0;
    u_xlat46 = u_xlat46 * u_xlat17.x + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_2.x / u_xlat46;
    u_xlat26.y = u_xlat46 * 0.318309873;
    u_xlat26.xy = min(u_xlat26.xy, vec2(16.0, 16.0));
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat16_22.x = u_xlat66 * u_xlat66;
    u_xlat16_22.x = u_xlat66 * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat66 * u_xlat16_22.x;
    u_xlat16_42 = u_xlat66 * u_xlat16_22.x;
    u_xlat46 = (-u_xlat16_22.x) * u_xlat66 + 1.0;
    u_xlat16_30.xyz = u_xlat16_5.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = vec3(u_xlat46) * u_xlat16_30.xyz;
    u_xlat46 = u_xlat16_30.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat46) * vec3(u_xlat16_42) + u_xlat17.xyz;
    u_xlat26.xyz = u_xlat26.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat26.xyz = vec3(u_xlat64) * u_xlat26.xyz;
    u_xlat16_1.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.zxy;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat11.y = u_xlat4.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_12.y = u_xlat16_9.y;
    u_xlat64 = dot(u_xlat16_12.xyz, u_xlat11.xyz);
    u_xlat64 = max(u_xlat64, 0.0);
    u_xlat17.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat17.xyz = vec3(u_xlat64) * u_xlat17.xyz + _sssColorBack.zxy;
    u_xlat17.xyz = u_xlat16_22.xyz * u_xlat17.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_22.xyz = vec3(u_xlat16_61) * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_22.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat64 = min(u_xlat16_3.z, u_xlat6);
    u_xlat16_14.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat64) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat64) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat64) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = u_xlat16_10.xxx * u_xlat16_15.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati17.x = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati17.x].xyz + u_xlat16_12.xyw;
    u_xlat16_15.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_14.xyz + u_xlat16_1.xyz;
    u_xlat16_22.x = dot((-u_xlat16_7.xyz), u_xlat4.xyz);
    u_xlat16_22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat17.xyz = (-u_xlat4.xyz) * u_xlat16_22.xxx + (-u_xlat16_7.xyz);
    u_xlat16_5.z = dot(u_xlat16_9.xyz, u_xlat17.xyz);
    u_xlat64 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_22.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_22.x = floor(u_xlat16_7.w);
    u_xlat16_42 = u_xlat16_22.x + 1.0;
    u_xlat16_42 = min(u_xlat16_42, 15.0);
    u_xlat16_7.x = u_xlat16_42 * 16.0 + u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_77 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_7.x = u_xlat16_22.x * 16.0 + u_xlat16_7.z;
    u_xlat16_7.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_22.x = u_xlat16_22.z * 15.0 + (-u_xlat16_22.x);
    u_xlat16_42 = u_xlat16_77 + (-u_xlat16_19);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_42 + u_xlat16_19;
    u_xlat16_22.x = u_xlat16_10.x * u_xlat16_22.x;
    u_xlat64 = u_xlat64 * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat6 * 0.5;
    u_xlat16_42 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_22.x = u_xlat64 * u_xlat16_42 + u_xlat16_22.x;
    u_xlat16_42 = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat16_62 = (-u_xlat16_22.x) * 2.0 + 1.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_62 + u_xlat16_42;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat6;
    u_xlat16_22.x = min(u_xlat16_22.x, u_xlat16_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60) + (-u_xlat17.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat18.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_9.xyz = u_xlat16_30.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_22.xxx * u_xlat16_2.xzw;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat26.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_61 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_8.w * _albedoColor.w + u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _albedoColor.w;
    u_xlat16_22.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_22.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_22.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_22.x = u_xlat0.x * u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_42;
    u_xlat16_9.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_9.xyz;
    u_xlat16_9.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_29.x;
    u_xlat16_29.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_22.xyz = u_xlat16_29.xyz * u_xlat16_9.xxx + u_xlat16_22.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_4.zxy * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_4.zxy;
    u_xlat0.xyz = u_xlat16_22.xyz * _emissiveColor.zxy + u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_22.xyz + u_xlat16_1.xyz;
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
    u_xlat60 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat3.x = u_xlat60 * 0.0625 + u_xlat3.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_61 : u_xlat16_2.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MendsLightMask;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec2 u_xlat18;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
mediump vec2 u_xlat16_26;
bool u_xlatb26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump float u_xlat16_31;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
float u_xlat46;
mediump vec2 u_xlat16_50;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat64;
int u_xlati64;
float u_xlat66;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 6.10351563e-05);
    u_xlat16_41.x = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_41.xxx;
    u_xlat16_41.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_41.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_41.x);
#endif
    u_xlat16_41.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_41.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_41.yyy + u_xlat16_3.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_21 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = float(1.0) / float(u_xlat16_21);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_21 = u_xlat16_61 * u_xlat16_21;
    u_xlat16_21 = max(u_xlat16_41.x, u_xlat16_21);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_61 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_61) + vs_TEXCOORD2.yzx;
    u_xlat60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = max(u_xlat60, 1.17549435e-38);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat64 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_61 = _sssIntensity * _sssIntensity;
    u_xlat16_61 = u_xlat16_5.x * u_xlat16_61;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_62 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_61);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_27.xyz = u_xlat16_7.xxx * u_xlat16_27.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_27.xyz);
    u_xlat16_8.xyz = vec3(u_xlat64) * u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat4.xyz;
    u_xlat16_68 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_9.xyz = vec3(u_xlat16_68) * u_xlat16_9.xyz;
    u_xlat16_68 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_68) + u_xlat16_69;
    u_xlat16_10.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_68 = u_xlat16_5.w * u_xlat16_69 + u_xlat16_68;
    u_xlat16_69 = u_xlat16_5.w * u_xlat16_68;
    u_xlat16_10.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + -1.0;
    u_xlat16_10.x = _occlusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_10.x;
    u_xlat16_30.x = sqrt(u_xlat16_69);
    u_xlat6 = min(u_xlat16_69, 1.0);
    u_xlat16_26.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat26.xy = u_xlat16_26.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xy = min(max(u_xlat26.xy, 0.0), 1.0);
#else
    u_xlat26.xy = clamp(u_xlat26.xy, 0.0, 1.0);
#endif
    u_xlat16_50.xy = u_xlat26.xy * u_xlat16_30.xx;
    u_xlat16_11.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_50.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = u_xlat16_50.yyy * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz + (-vec3(u_xlat64));
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz + vec3(u_xlat64);
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_8.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_8.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_15.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat26.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat64) * u_xlat16_1.xyz;
    u_xlat64 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = vec3(u_xlat64) * u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat16_30.xyz = u_xlat16_11.xyz * u_xlat16_30.xyz + (-vec3(u_xlat64));
    u_xlat16_30.xyz = u_xlat16_7.xxx * u_xlat16_30.xyz + vec3(u_xlat64);
    u_xlat16_30.xyz = u_xlat16_13.xyz * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb26 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_69);
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16.xyz;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb26 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb26)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_11.yyy + u_xlat16_15.xyz;
    u_xlat16_31 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_31 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_30.x);
    u_xlat16_30.x = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_30.x;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_69;
    u_xlat16_30.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat26.xxx * u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz + (-u_xlat26.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat26.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_2.xyz = u_xlat16_30.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat26.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat26.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat26.x = (-u_xlat64) * u_xlat16_2.x + u_xlat64;
    u_xlat26.x = u_xlat64 * u_xlat26.x + u_xlat16_2.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat64 + u_xlat26.x;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_22.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_7.xyz = u_xlat16_22.xxx * u_xlat16.xyz;
    u_xlat17.xyz = u_xlat16.xyz * u_xlat16_22.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat18.x = dot(u_xlat4.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat18.x) * u_xlat16_2.x + u_xlat18.x;
    u_xlat46 = u_xlat18.x * u_xlat46 + u_xlat16_2.x;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat26.y = u_xlat46 + u_xlat18.x;
    u_xlat26.xy = u_xlat26.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat46 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat17.xyz = vec3(u_xlat46) * u_xlat17.xyz;
    u_xlat46 = dot(u_xlat4.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_22.x) + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat16_2.x + -1.0;
    u_xlat46 = u_xlat46 * u_xlat17.x + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_2.x / u_xlat46;
    u_xlat26.y = u_xlat46 * 0.318309873;
    u_xlat26.xy = min(u_xlat26.xy, vec2(16.0, 16.0));
    u_xlat26.x = u_xlat26.x * u_xlat26.y;
    u_xlat16_22.x = u_xlat66 * u_xlat66;
    u_xlat16_22.x = u_xlat66 * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat66 * u_xlat16_22.x;
    u_xlat16_42 = u_xlat66 * u_xlat16_22.x;
    u_xlat46 = (-u_xlat16_22.x) * u_xlat66 + 1.0;
    u_xlat16_30.xyz = u_xlat16_5.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = vec3(u_xlat46) * u_xlat16_30.xyz;
    u_xlat46 = u_xlat16_30.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat46) * vec3(u_xlat16_42) + u_xlat17.xyz;
    u_xlat26.xyz = u_xlat26.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat26.xyz = vec3(u_xlat64) * u_xlat26.xyz;
    u_xlat16_1.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.zxy;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat11.y = u_xlat4.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_12.y = u_xlat16_9.y;
    u_xlat64 = dot(u_xlat16_12.xyz, u_xlat11.xyz);
    u_xlat64 = max(u_xlat64, 0.0);
    u_xlat17.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat17.xyz = vec3(u_xlat64) * u_xlat17.xyz + _sssColorBack.zxy;
    u_xlat17.xyz = u_xlat16_22.xyz * u_xlat17.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_22.xyz = vec3(u_xlat16_61) * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_22.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat64 = min(u_xlat16_3.z, u_xlat6);
    u_xlat16_14.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat64) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat64) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat64) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat64) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = u_xlat16_10.xxx * u_xlat16_15.xyz;
    u_xlati64 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati64].xyz;
    u_xlati64 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati17.x = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati64].xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati17.x].xyz + u_xlat16_12.xyw;
    u_xlat16_15.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_14.xyz + u_xlat16_1.xyz;
    u_xlat16_22.x = dot((-u_xlat16_7.xyz), u_xlat4.xyz);
    u_xlat16_22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat17.xyz = (-u_xlat4.xyz) * u_xlat16_22.xxx + (-u_xlat16_7.xyz);
    u_xlat16_5.z = dot(u_xlat16_9.xyz, u_xlat17.xyz);
    u_xlat64 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_22.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_22.x = floor(u_xlat16_7.w);
    u_xlat16_42 = u_xlat16_22.x + 1.0;
    u_xlat16_42 = min(u_xlat16_42, 15.0);
    u_xlat16_7.x = u_xlat16_42 * 16.0 + u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_77 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_7.x = u_xlat16_22.x * 16.0 + u_xlat16_7.z;
    u_xlat16_7.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_22.x = u_xlat16_22.z * 15.0 + (-u_xlat16_22.x);
    u_xlat16_42 = u_xlat16_77 + (-u_xlat16_19);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_42 + u_xlat16_19;
    u_xlat16_22.x = u_xlat16_10.x * u_xlat16_22.x;
    u_xlat64 = u_xlat64 * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat6 * 0.5;
    u_xlat16_42 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_22.x = u_xlat64 * u_xlat16_42 + u_xlat16_22.x;
    u_xlat16_42 = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat16_62 = (-u_xlat16_22.x) * 2.0 + 1.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_62 + u_xlat16_42;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat6;
    u_xlat16_22.x = min(u_xlat16_22.x, u_xlat16_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60) + (-u_xlat17.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat18.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat18.xy).xy;
    u_xlat16_9.xyz = u_xlat16_30.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_22.xxx * u_xlat16_2.xzw;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat26.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_61 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_8.w * _albedoColor.w + u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _albedoColor.w;
    u_xlat16_22.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_22.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_22.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_22.x = u_xlat0.x * u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_42;
    u_xlat16_9.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_9.xyz;
    u_xlat16_9.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_29.x;
    u_xlat16_29.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_22.xyz = u_xlat16_29.xyz * u_xlat16_9.xxx + u_xlat16_22.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_22.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_4.zxy * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_4.zxy;
    u_xlat0.xyz = u_xlat16_22.xyz * _emissiveColor.zxy + u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_22.xyz + u_xlat16_1.xyz;
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
    u_xlat60 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat3.x = u_xlat60 * 0.0625 + u_xlat3.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_61 : u_xlat16_2.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat47;
mediump float u_xlat16_47;
mediump float u_xlat16_52;
mediump float u_xlat16_58;
float u_xlat70;
float u_xlat71;
bool u_xlatb71;
float u_xlat74;
mediump float u_xlat16_75;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat16_6.xyz;
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
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat27.x = dot(u_xlat7.xyz, u_xlat27.xyz);
    u_xlat27.x = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _ShadowBias.z;
    u_xlat27.xyz = (-u_xlat7.xyz) * u_xlat27.xxx + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat27.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat8.yyyy;
    u_xlat2 = u_xlat2 * u_xlat8.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat8.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat24.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat24.x = (-u_xlat1.x) + u_xlat24.x;
    u_xlat0.z = _ShadowBias.y * u_xlat24.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat24.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat24.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_10.xyz = vec3(u_xlat16_75) * u_xlat16_10.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_79 = (-u_xlat16_75) + u_xlat16_79;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_75 = u_xlat16_0.w * u_xlat16_79 + u_xlat16_75;
    u_xlat16_75 = u_xlat16_0.w * u_xlat16_75;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_75);
    u_xlat1.xw = min(u_xlat1.xw, vec2(u_xlat16_75));
    u_xlat16_34.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat24.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_75 = _sssIntensity * _sssIntensity;
    u_xlat16_75 = u_xlat16_2.x * u_xlat16_75;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_58 = sqrt(u_xlat16_75);
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = (-u_xlat16_14.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_18.xyz * u_xlat16_34.xyz + (-u_xlat3.xxx);
    u_xlat16_34.xyz = vec3(u_xlat16_58) * u_xlat16_34.xyz + u_xlat3.xxx;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_4.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_4.zxy * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_2.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_19.xyz = u_xlat16_11.xxx * u_xlat16_20.xyz;
    u_xlat16_11.xyz = u_xlat16_34.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_81);
    u_xlat16_20.xyz = u_xlat26.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb71 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat16_21.xy = (bool(u_xlatb71)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat71 = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_83);
    u_xlat16_83 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = float(1.0) / float(u_xlat16_81);
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_83;
    u_xlat16_81 = max(u_xlat16_21.x, u_xlat16_81);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_81;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_21.xyz = vec3(u_xlat71) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xxx * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-vec3(u_xlat71));
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz + vec3(u_xlat71);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat24.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat71) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_37.xyz = u_xlat26.xyz * u_xlat16_37.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_38 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_37.xyz);
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat16_37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_38 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_37.x);
    u_xlat16_37.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_14.x = u_xlat16_37.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_15.x, u_xlat16_14.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_15.xyz = u_xlat24.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_12.xyw = u_xlat16_15.xyz * u_xlat16_12.xyw + (-u_xlat24.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_58) * u_xlat16_12.xyw + u_xlat24.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_0.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat24.x = (-u_xlat3.x) * u_xlat16_80 + u_xlat3.x;
    u_xlat24.x = u_xlat3.x * u_xlat24.x + u_xlat16_80;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat3.x;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_35.xyz = u_xlat2.xyw * u_xlat16_12.xxx;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat8.x) * u_xlat16_80 + u_xlat8.x;
    u_xlat47 = u_xlat8.x * u_xlat47 + u_xlat16_80;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat24.y = u_xlat47 + u_xlat8.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat47 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat2.xyw = vec3(u_xlat47) * u_xlat2.xyw;
    u_xlat47 = dot(u_xlat7.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_12.x) + 1.0;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat25 = u_xlat16_80 + -1.0;
    u_xlat47 = u_xlat47 * u_xlat25 + 1.0;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat47 = u_xlat16_80 / u_xlat47;
    u_xlat24.y = u_xlat47 * 0.318309873;
    u_xlat24.xy = min(u_xlat24.xy, vec2(16.0, 16.0));
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat16_12.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_14.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat47 = (-u_xlat16_12.x) * u_xlat2.x + 1.0;
    u_xlat16_37.xyz = u_xlat16_0.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = vec3(u_xlat47) * u_xlat16_37.xyz;
    u_xlat47 = u_xlat16_37.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat2.xyw = vec3(u_xlat47) * u_xlat16_14.xxx + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat24.xxx * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.zxy;
    u_xlat2.xyw = u_xlat3.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_15.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_15.xyz + _sssColorOcc.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat7.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat24.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat24.x = max(u_xlat24.x, 0.0);
    u_xlat3.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat3.xyz = u_xlat24.xxx * u_xlat3.xyz + _sssColorBack.zxy;
    u_xlat3.xyz = u_xlat16_15.xyz * u_xlat3.xyz;
    u_xlat16_15.xyz = u_xlat3.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat1.x = min(u_xlat1.x, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati24 = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_35.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_35.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat74) + (-u_xlat1.xyz);
    u_xlat3.xyz = vec3(u_xlat16_80) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_0.z = dot(u_xlat16_10.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat15.y = u_xlat3.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_80 = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat8.y = u_xlat16_0.x;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_80);
    u_xlat16_17.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat3.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_75) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb24 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb24)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz;
    u_xlat16_0.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_75 = floor(u_xlat16_0.w);
    u_xlat16_80 = u_xlat16_75 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_0.x = u_xlat16_80 * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_0.x = u_xlat16_75 * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_47 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_75 = u_xlat16_12.z * 15.0 + (-u_xlat16_75);
    u_xlat16_80 = (-u_xlat16_47) + u_xlat16_24.x;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_80 + u_xlat16_47;
    u_xlat16_75 = u_xlat16_79 * u_xlat16_75;
    u_xlat1.x = u_xlat1.x * u_xlat16_75;
    u_xlat16_75 = u_xlat1.w * 0.5;
    u_xlat16_80 = (-u_xlat1.w) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat1.x * u_xlat16_80 + u_xlat16_75;
    u_xlat16_80 = u_xlat16_75 + u_xlat16_75;
    u_xlat16_12.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_12.x + u_xlat16_80;
    u_xlat16_75 = u_xlat1.w * u_xlat16_75;
    u_xlat16_75 = min(u_xlat16_2.z, u_xlat16_75);
    u_xlat16_12.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.ywx * u_xlat16_6.yzx + u_xlat16_12.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_52 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _MendsLightDirection2.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * u_xlat16_12.xyz;
    u_xlat16_52 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_14.xyz = vec3(u_xlat16_52) * _MendsLightDirection.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_14.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_12.xyz = u_xlat16_14.xyz * vec3(u_xlat16_52) + u_xlat16_12.xyz;
    u_xlat16_1 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat1.xyz = vec3(u_xlat16_1) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_2.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_2.zxy * u_xlat16_12.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * _emissiveColor.zxy + u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat70 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat70);
    u_xlat0.x = u_xlat70 * 0.0625 + u_xlat0.y;
    u_xlat16_24.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_24.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_24.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_6.x : u_xlat16_29;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat47;
mediump float u_xlat16_47;
mediump float u_xlat16_52;
mediump float u_xlat16_58;
float u_xlat70;
float u_xlat71;
bool u_xlatb71;
float u_xlat74;
mediump float u_xlat16_75;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat16_6.xyz;
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
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat27.x = dot(u_xlat7.xyz, u_xlat27.xyz);
    u_xlat27.x = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _ShadowBias.z;
    u_xlat27.xyz = (-u_xlat7.xyz) * u_xlat27.xxx + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat27.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat8.yyyy;
    u_xlat2 = u_xlat2 * u_xlat8.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat8.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat24.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat24.x = (-u_xlat1.x) + u_xlat24.x;
    u_xlat0.z = _ShadowBias.y * u_xlat24.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat24.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat24.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_10.xyz = vec3(u_xlat16_75) * u_xlat16_10.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_79 = (-u_xlat16_75) + u_xlat16_79;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_75 = u_xlat16_0.w * u_xlat16_79 + u_xlat16_75;
    u_xlat16_75 = u_xlat16_0.w * u_xlat16_75;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_75);
    u_xlat1.xw = min(u_xlat1.xw, vec2(u_xlat16_75));
    u_xlat16_34.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat24.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_75 = _sssIntensity * _sssIntensity;
    u_xlat16_75 = u_xlat16_2.x * u_xlat16_75;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_58 = sqrt(u_xlat16_75);
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = (-u_xlat16_14.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_18.xyz * u_xlat16_34.xyz + (-u_xlat3.xxx);
    u_xlat16_34.xyz = vec3(u_xlat16_58) * u_xlat16_34.xyz + u_xlat3.xxx;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_4.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_4.zxy * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_2.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_19.xyz = u_xlat16_11.xxx * u_xlat16_20.xyz;
    u_xlat16_11.xyz = u_xlat16_34.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_81);
    u_xlat16_20.xyz = u_xlat26.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb71 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat16_21.xy = (bool(u_xlatb71)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat71 = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_83);
    u_xlat16_83 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = float(1.0) / float(u_xlat16_81);
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_83;
    u_xlat16_81 = max(u_xlat16_21.x, u_xlat16_81);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_81;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_21.xyz = vec3(u_xlat71) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xxx * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-vec3(u_xlat71));
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz + vec3(u_xlat71);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat24.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat71) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_37.xyz = u_xlat26.xyz * u_xlat16_37.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_38 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_37.xyz);
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat16_37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_38 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_37.x);
    u_xlat16_37.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_14.x = u_xlat16_37.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_15.x, u_xlat16_14.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_15.xyz = u_xlat24.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_12.xyw = u_xlat16_15.xyz * u_xlat16_12.xyw + (-u_xlat24.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_58) * u_xlat16_12.xyw + u_xlat24.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_0.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat24.x = (-u_xlat3.x) * u_xlat16_80 + u_xlat3.x;
    u_xlat24.x = u_xlat3.x * u_xlat24.x + u_xlat16_80;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat3.x;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_35.xyz = u_xlat2.xyw * u_xlat16_12.xxx;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat8.x) * u_xlat16_80 + u_xlat8.x;
    u_xlat47 = u_xlat8.x * u_xlat47 + u_xlat16_80;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat24.y = u_xlat47 + u_xlat8.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat47 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat47 = inversesqrt(u_xlat47);
    u_xlat2.xyw = vec3(u_xlat47) * u_xlat2.xyw;
    u_xlat47 = dot(u_xlat7.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_12.x) + 1.0;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat25 = u_xlat16_80 + -1.0;
    u_xlat47 = u_xlat47 * u_xlat25 + 1.0;
    u_xlat47 = u_xlat47 * u_xlat47;
    u_xlat47 = u_xlat16_80 / u_xlat47;
    u_xlat24.y = u_xlat47 * 0.318309873;
    u_xlat24.xy = min(u_xlat24.xy, vec2(16.0, 16.0));
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat16_12.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_14.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat47 = (-u_xlat16_12.x) * u_xlat2.x + 1.0;
    u_xlat16_37.xyz = u_xlat16_0.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = vec3(u_xlat47) * u_xlat16_37.xyz;
    u_xlat47 = u_xlat16_37.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat2.xyw = vec3(u_xlat47) * u_xlat16_14.xxx + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat24.xxx * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.zxy;
    u_xlat2.xyw = u_xlat3.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_15.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_15.xyz + _sssColorOcc.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat7.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat24.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat24.x = max(u_xlat24.x, 0.0);
    u_xlat3.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat3.xyz = u_xlat24.xxx * u_xlat3.xyz + _sssColorBack.zxy;
    u_xlat3.xyz = u_xlat16_15.xyz * u_xlat3.xyz;
    u_xlat16_15.xyz = u_xlat3.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat1.x = min(u_xlat1.x, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat1.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat1.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat1.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat1.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati1.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati24 = (u_xlati1.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_35.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat1.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_35.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat74) + (-u_xlat1.xyz);
    u_xlat3.xyz = vec3(u_xlat16_80) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_0.z = dot(u_xlat16_10.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat15.y = u_xlat3.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_80 = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat8.y = u_xlat16_0.x;
    u_xlat16_24.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_24.xxx + u_xlat16_24.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_80);
    u_xlat16_17.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat3.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_75) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb24 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb24)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz;
    u_xlat16_0.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_75 = floor(u_xlat16_0.w);
    u_xlat16_80 = u_xlat16_75 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_0.x = u_xlat16_80 * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_0.x = u_xlat16_75 * 16.0 + u_xlat16_0.z;
    u_xlat16_12.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_47 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_75 = u_xlat16_12.z * 15.0 + (-u_xlat16_75);
    u_xlat16_80 = (-u_xlat16_47) + u_xlat16_24.x;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_80 + u_xlat16_47;
    u_xlat16_75 = u_xlat16_79 * u_xlat16_75;
    u_xlat1.x = u_xlat1.x * u_xlat16_75;
    u_xlat16_75 = u_xlat1.w * 0.5;
    u_xlat16_80 = (-u_xlat1.w) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat1.x * u_xlat16_80 + u_xlat16_75;
    u_xlat16_80 = u_xlat16_75 + u_xlat16_75;
    u_xlat16_12.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_12.x + u_xlat16_80;
    u_xlat16_75 = u_xlat1.w * u_xlat16_75;
    u_xlat16_75 = min(u_xlat16_2.z, u_xlat16_75);
    u_xlat16_12.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.ywx * u_xlat16_6.yzx + u_xlat16_12.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_52 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _MendsLightDirection2.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * u_xlat16_12.xyz;
    u_xlat16_52 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_14.xyz = vec3(u_xlat16_52) * _MendsLightDirection.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff;
    u_xlat16_52 = u_xlat1.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_14.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_12.xyz = u_xlat16_14.xyz * vec3(u_xlat16_52) + u_xlat16_12.xyz;
    u_xlat16_1 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat1.xyz = vec3(u_xlat16_1) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_2.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_2.zxy * u_xlat16_12.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * _emissiveColor.zxy + u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat70 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat70);
    u_xlat0.x = u_xlat70 * 0.0625 + u_xlat0.y;
    u_xlat16_24.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_24.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_24.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_6.x : u_xlat16_29;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
vec2 u_xlat17;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat42;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat58;
int u_xlati58;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_55 = _sssIntensity * _sssIntensity;
    u_xlat16_55 = u_xlat16_5.x * u_xlat16_55;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_55);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = u_xlat16_7.xxx * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_25.xyz);
    u_xlat16_8.xyz = vec3(u_xlat58) * u_xlat16_2.xyz + u_xlat16_25.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_9.xyz = vec3(u_xlat16_62) * u_xlat16_9.xyz;
    u_xlat16_62 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_62) + u_xlat16_63;
    u_xlat16_10.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_62 = u_xlat16_5.w * u_xlat16_63 + u_xlat16_62;
    u_xlat16_62 = u_xlat16_5.w * u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_10.x = sqrt(u_xlat16_62);
    u_xlat6 = min(u_xlat16_62, 1.0);
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = u_xlat24.xy * u_xlat16_10.xx;
    u_xlat16_11.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_28.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.yyy * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz + (-vec3(u_xlat58));
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(u_xlat58);
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat24.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat58) * u_xlat16_1.xyz;
    u_xlat58 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat58) * u_xlat16_2.xyz + u_xlat16_25.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + (-vec3(u_xlat58));
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(u_xlat58);
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_8.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_8.x = max(u_xlat16_8.x, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_11.yyy + u_xlat16_15.xyz;
    u_xlat16_10.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_26.xyz);
    u_xlat24.x = dot(u_xlat4.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_10.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_26.x);
    u_xlat16_26.x = u_xlat16_8.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_8.x = float(1.0) / float(u_xlat16_8.x);
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_8.x = u_xlat16_26.x * u_xlat16_8.x;
    u_xlat16_8.x = max(u_xlat16_11.x, u_xlat16_8.x);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_8.x;
    u_xlat16_8.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat24.xxx * u_xlat16_2.xyz + u_xlat16_25.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_28.xyz + (-u_xlat24.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat24.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat24.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat24.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat24.x = (-u_xlat58) * u_xlat16_2.x + u_xlat58;
    u_xlat24.x = u_xlat58 * u_xlat24.x + u_xlat16_2.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat58 + u_xlat24.x;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_20.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_20.x = inversesqrt(u_xlat16_20.x);
    u_xlat16_7.xyz = u_xlat16_20.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16_20.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat17.x = dot(u_xlat4.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat17.x) * u_xlat16_2.x + u_xlat17.x;
    u_xlat42 = u_xlat17.x * u_xlat42 + u_xlat16_2.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat24.y = u_xlat42 + u_xlat17.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat42 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat16.xyz = vec3(u_xlat42) * u_xlat16.xyz;
    u_xlat42 = dot(u_xlat4.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16_20.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_20.x) + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat16.x = u_xlat16_2.x + -1.0;
    u_xlat42 = u_xlat42 * u_xlat16.x + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_2.x / u_xlat42;
    u_xlat24.y = u_xlat42 * 0.318309873;
    u_xlat24.xy = min(u_xlat24.xy, vec2(16.0, 16.0));
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat16_20.x = u_xlat60 * u_xlat60;
    u_xlat16_20.x = u_xlat60 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat60 * u_xlat16_20.x;
    u_xlat16_38 = u_xlat60 * u_xlat16_20.x;
    u_xlat42 = (-u_xlat16_20.x) * u_xlat60 + 1.0;
    u_xlat16_8.xyz = u_xlat16_5.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = vec3(u_xlat42) * u_xlat16_8.xyz;
    u_xlat42 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat42) * vec3(u_xlat16_38) + u_xlat16.xyz;
    u_xlat24.xyz = u_xlat24.xxx * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat24.xyz;
    u_xlat16_1.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_20.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_5.www * u_xlat16_20.xyz + _sssColorOcc.xyz;
    u_xlat16_10.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_10.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat10.y = u_xlat4.y;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_11.y = u_xlat16_9.y;
    u_xlat58 = dot(u_xlat16_11.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 0.0);
    u_xlat16.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat16.xyz = vec3(u_xlat58) * u_xlat16.xyz + _sssColorBack.xyz;
    u_xlat16.xyz = u_xlat16_20.xyz * u_xlat16.xyz;
    u_xlat16_20.xyz = u_xlat16.xyz * u_xlat16_14.xyz + (-u_xlat16_14.xyz);
    u_xlat16_20.xyz = vec3(u_xlat16_55) * u_xlat16_20.xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat58 = min(u_xlat16_3.z, u_xlat6);
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat58) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_11.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_11.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati16.x = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_11.xyw = u_xlat16_11.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.zzz * _IrradianceACCoeffs[u_xlati16.x].xyz + u_xlat16_11.xyw;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_55 = dot(u_xlat16_11.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_20.x = dot((-u_xlat16_7.xyz), u_xlat4.xyz);
    u_xlat16_20.x = u_xlat16_20.x + u_xlat16_20.x;
    u_xlat16.xyz = (-u_xlat4.xyz) * u_xlat16_20.xxx + (-u_xlat16_7.xyz);
    u_xlat16_5.z = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat58 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.xyz = min(max(u_xlat16_20.xyz, 0.0), 1.0);
#else
    u_xlat16_20.xyz = clamp(u_xlat16_20.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_20.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_7.w);
    u_xlat16_38 = u_xlat16_20.x + 1.0;
    u_xlat16_38 = min(u_xlat16_38, 15.0);
    u_xlat16_7.x = u_xlat16_38 * 16.0 + u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_7.x = u_xlat16_20.x * 16.0 + u_xlat16_7.z;
    u_xlat16_7.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_53 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_20.x = u_xlat16_20.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_38 = u_xlat16_70 + (-u_xlat16_53);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_38 + u_xlat16_53;
    u_xlat16_20.x = u_xlat16_63 * u_xlat16_20.x;
    u_xlat58 = u_xlat58 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat6 * 0.5;
    u_xlat16_38 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_20.x = u_xlat58 * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_38 = u_xlat16_20.x + u_xlat16_20.x;
    u_xlat16_56 = (-u_xlat16_20.x) * 2.0 + 1.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_56 + u_xlat16_38;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat6;
    u_xlat16_20.x = min(u_xlat16_20.x, u_xlat16_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54) + (-u_xlat16.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat17.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = vec3(u_xlat16_55) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xxx * u_xlat16_2.xzw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_12.w * _albedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat16_20.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_20.x = inversesqrt(u_xlat16_20.x);
    u_xlat16_20.xyz = u_xlat16_20.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_20.x = u_xlat0.x * u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_20.x * -2.0 + 3.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_38;
    u_xlat16_8.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_8.xyz;
    u_xlat16_8.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_8.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_26.x;
    u_xlat16_26.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_20.xyz = u_xlat16_26.xyz * u_xlat16_8.xxx + u_xlat16_20.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_20.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat16_20.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_2.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
vec2 u_xlat17;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat42;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat58;
int u_xlati58;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_55 = _sssIntensity * _sssIntensity;
    u_xlat16_55 = u_xlat16_5.x * u_xlat16_55;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_56 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_55);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = u_xlat16_7.xxx * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_25.xyz);
    u_xlat16_8.xyz = vec3(u_xlat58) * u_xlat16_2.xyz + u_xlat16_25.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_9.xyz = vec3(u_xlat16_62) * u_xlat16_9.xyz;
    u_xlat16_62 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_62) + u_xlat16_63;
    u_xlat16_10.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_10.x + 1.0;
    u_xlat16_62 = u_xlat16_5.w * u_xlat16_63 + u_xlat16_62;
    u_xlat16_62 = u_xlat16_5.w * u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_10.x = sqrt(u_xlat16_62);
    u_xlat6 = min(u_xlat16_62, 1.0);
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = u_xlat24.xy * u_xlat16_10.xx;
    u_xlat16_11.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_28.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_28.xyz = u_xlat16_28.yyy * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xxx * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz + (-vec3(u_xlat58));
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(u_xlat58);
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat24.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat58) * u_xlat16_1.xyz;
    u_xlat58 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat58) * u_xlat16_2.xyz + u_xlat16_25.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_11.xyz + (-vec3(u_xlat58));
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(u_xlat58);
    u_xlat16_8.xyz = u_xlat16_14.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_8.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_8.x = max(u_xlat16_8.x, 6.10351563e-05);
    u_xlat16_26.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16.xyz;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_11.yyy + u_xlat16_15.xyz;
    u_xlat16_10.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_26.xyz);
    u_xlat24.x = dot(u_xlat4.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_10.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_26.x);
    u_xlat16_26.x = u_xlat16_8.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_8.x = float(1.0) / float(u_xlat16_8.x);
    u_xlat16_26.x = (-u_xlat16_26.x) * u_xlat16_26.x + 1.0;
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_8.x = u_xlat16_26.x * u_xlat16_8.x;
    u_xlat16_8.x = max(u_xlat16_11.x, u_xlat16_8.x);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_8.x;
    u_xlat16_8.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat24.xxx * u_xlat16_2.xyz + u_xlat16_25.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_28.xyz + (-u_xlat24.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat24.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat24.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat24.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat24.x = (-u_xlat58) * u_xlat16_2.x + u_xlat58;
    u_xlat24.x = u_xlat58 * u_xlat24.x + u_xlat16_2.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat58 + u_xlat24.x;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_20.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_20.x = inversesqrt(u_xlat16_20.x);
    u_xlat16_7.xyz = u_xlat16_20.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16_20.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat17.x = dot(u_xlat4.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat17.x) * u_xlat16_2.x + u_xlat17.x;
    u_xlat42 = u_xlat17.x * u_xlat42 + u_xlat16_2.x;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat24.y = u_xlat42 + u_xlat17.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat42 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat16.xyz = vec3(u_xlat42) * u_xlat16.xyz;
    u_xlat42 = dot(u_xlat4.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16_20.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_20.x) + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat16.x = u_xlat16_2.x + -1.0;
    u_xlat42 = u_xlat42 * u_xlat16.x + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_2.x / u_xlat42;
    u_xlat24.y = u_xlat42 * 0.318309873;
    u_xlat24.xy = min(u_xlat24.xy, vec2(16.0, 16.0));
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat16_20.x = u_xlat60 * u_xlat60;
    u_xlat16_20.x = u_xlat60 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat60 * u_xlat16_20.x;
    u_xlat16_38 = u_xlat60 * u_xlat16_20.x;
    u_xlat42 = (-u_xlat16_20.x) * u_xlat60 + 1.0;
    u_xlat16_8.xyz = u_xlat16_5.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = vec3(u_xlat42) * u_xlat16_8.xyz;
    u_xlat42 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat42) * vec3(u_xlat16_38) + u_xlat16.xyz;
    u_xlat24.xyz = u_xlat24.xxx * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat24.xyz;
    u_xlat16_1.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_20.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_5.www * u_xlat16_20.xyz + _sssColorOcc.xyz;
    u_xlat16_10.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_10.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat10.y = u_xlat4.y;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_11.y = u_xlat16_9.y;
    u_xlat58 = dot(u_xlat16_11.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 0.0);
    u_xlat16.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat16.xyz = vec3(u_xlat58) * u_xlat16.xyz + _sssColorBack.xyz;
    u_xlat16.xyz = u_xlat16_20.xyz * u_xlat16.xyz;
    u_xlat16_20.xyz = u_xlat16.xyz * u_xlat16_14.xyz + (-u_xlat16_14.xyz);
    u_xlat16_20.xyz = vec3(u_xlat16_55) * u_xlat16_20.xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat58 = min(u_xlat16_3.z, u_xlat6);
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat58) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_11.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_11.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_11.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati16.x = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_11.xyw = u_xlat16_11.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.zzz * _IrradianceACCoeffs[u_xlati16.x].xyz + u_xlat16_11.xyw;
    u_xlat16_14.xyz = u_xlat16_11.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_55 = dot(u_xlat16_11.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_20.x = dot((-u_xlat16_7.xyz), u_xlat4.xyz);
    u_xlat16_20.x = u_xlat16_20.x + u_xlat16_20.x;
    u_xlat16.xyz = (-u_xlat4.xyz) * u_xlat16_20.xxx + (-u_xlat16_7.xyz);
    u_xlat16_5.z = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat58 = dot(u_xlat16_9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.xyz = min(max(u_xlat16_20.xyz, 0.0), 1.0);
#else
    u_xlat16_20.xyz = clamp(u_xlat16_20.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_20.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_7.w);
    u_xlat16_38 = u_xlat16_20.x + 1.0;
    u_xlat16_38 = min(u_xlat16_38, 15.0);
    u_xlat16_7.x = u_xlat16_38 * 16.0 + u_xlat16_7.z;
    u_xlat16_9.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_7.x = u_xlat16_20.x * 16.0 + u_xlat16_7.z;
    u_xlat16_7.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_53 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_20.x = u_xlat16_20.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_38 = u_xlat16_70 + (-u_xlat16_53);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_38 + u_xlat16_53;
    u_xlat16_20.x = u_xlat16_63 * u_xlat16_20.x;
    u_xlat58 = u_xlat58 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat6 * 0.5;
    u_xlat16_38 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_20.x = u_xlat58 * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_38 = u_xlat16_20.x + u_xlat16_20.x;
    u_xlat16_56 = (-u_xlat16_20.x) * 2.0 + 1.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_56 + u_xlat16_38;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat6;
    u_xlat16_20.x = min(u_xlat16_20.x, u_xlat16_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54) + (-u_xlat16.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat16_7.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat7.y = u_xlat0.y;
    u_xlat16_7.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat7.xz = u_xlat16_7.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat17.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat7.xyz, u_xlat16_2.x);
    u_xlat16_2.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = vec3(u_xlat16_55) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xxx * u_xlat16_2.xzw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_12.w * _albedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat16_20.x = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_20.x = inversesqrt(u_xlat16_20.x);
    u_xlat16_20.xyz = u_xlat16_20.xxx * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_20.x = u_xlat0.x * u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_20.x * -2.0 + 3.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_38;
    u_xlat16_8.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_8.xyz;
    u_xlat16_8.x = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_8.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = float(1.0) / _MendsLightFallOff;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_26.x;
    u_xlat16_26.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_20.xyz = u_xlat16_26.xyz * u_xlat16_8.xxx + u_xlat16_20.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_20.xyz;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat16_20.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_2.x;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump vec3 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat46;
mediump float u_xlat16_46;
mediump float u_xlat16_52;
mediump float u_xlat16_58;
float u_xlat71;
bool u_xlatb71;
float u_xlat74;
mediump float u_xlat16_75;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat16_6.xyz;
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
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat27.x = dot(u_xlat7.xyz, u_xlat27.xyz);
    u_xlat27.x = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _ShadowBias.z;
    u_xlat27.xyz = (-u_xlat7.xyz) * u_xlat27.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat27.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat25 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat25 = (-u_xlat2.x) + u_xlat25;
    u_xlat0.z = _ShadowBias.y * u_xlat25 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
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
    u_xlat23.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_23.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_23.z * _shadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_10.xyz = vec3(u_xlat16_75) * u_xlat16_10.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_79 = (-u_xlat16_75) + u_xlat16_79;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_75 = u_xlat16_1.w * u_xlat16_79 + u_xlat16_75;
    u_xlat16_75 = u_xlat16_1.w * u_xlat16_75;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_75);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_75));
    u_xlat16_34.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat23.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_75 = _sssIntensity * _sssIntensity;
    u_xlat16_75 = u_xlat16_2.x * u_xlat16_75;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_58 = sqrt(u_xlat16_75);
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = (-u_xlat16_14.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_18.xyz * u_xlat16_34.xyz + (-u_xlat3.xxx);
    u_xlat16_34.xyz = vec3(u_xlat16_58) * u_xlat16_34.xyz + u_xlat3.xxx;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_2.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_19.xyz = u_xlat16_11.xxx * u_xlat16_20.xyz;
    u_xlat16_11.xyz = u_xlat16_34.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_81);
    u_xlat16_20.xyz = u_xlat26.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb71 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat16_21.xy = (bool(u_xlatb71)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat71 = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_83);
    u_xlat16_83 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = float(1.0) / float(u_xlat16_81);
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_83;
    u_xlat16_81 = max(u_xlat16_21.x, u_xlat16_81);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_81;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_21.xyz = vec3(u_xlat71) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xxx * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-vec3(u_xlat71));
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz + vec3(u_xlat71);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat71) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_37.xyz = u_xlat26.xyz * u_xlat16_37.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_38 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_37.xyz);
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat16_37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_38 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_37.x);
    u_xlat16_37.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_14.x = u_xlat16_37.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_15.x, u_xlat16_14.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_15.xyz = u_xlat23.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_12.xyw = u_xlat16_15.xyz * u_xlat16_12.xyw + (-u_xlat23.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_58) * u_xlat16_12.xyw + u_xlat23.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat23.xxx + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat23.x = (-u_xlat3.x) * u_xlat16_80 + u_xlat3.x;
    u_xlat23.x = u_xlat3.x * u_xlat23.x + u_xlat16_80;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat3.x;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_35.xyz = u_xlat2.xyw * u_xlat16_12.xxx;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat4.x) * u_xlat16_80 + u_xlat4.x;
    u_xlat46 = u_xlat4.x * u_xlat46 + u_xlat16_80;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat23.y = u_xlat46 + u_xlat4.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat7.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_12.x) + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat25 = u_xlat16_80 + -1.0;
    u_xlat46 = u_xlat46 * u_xlat25 + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_80 / u_xlat46;
    u_xlat23.y = u_xlat46 * 0.318309873;
    u_xlat23.xy = min(u_xlat23.xy, vec2(16.0, 16.0));
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat16_12.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_14.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat46 = (-u_xlat16_12.x) * u_xlat2.x + 1.0;
    u_xlat16_37.xyz = u_xlat16_1.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat16_37.xyz;
    u_xlat46 = u_xlat16_37.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat16_14.xxx + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat23.xxx * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat3.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_15.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_15.xyz + _sssColorOcc.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat7.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat23.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat3.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat3.xyz = u_xlat23.xxx * u_xlat3.xyz + _sssColorBack.xyz;
    u_xlat3.xyz = u_xlat16_15.xyz * u_xlat3.xyz;
    u_xlat16_15.xyz = u_xlat3.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati23 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_35.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_35.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat74) + (-u_xlat0.xyz);
    u_xlat3.xyz = vec3(u_xlat16_80) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_1.z = dot(u_xlat16_10.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat15.y = u_xlat3.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_80 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat4.y = u_xlat16_1.x;
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_80);
    u_xlat16_17.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_75) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb23 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb23)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz;
    u_xlat16_1.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_75 = floor(u_xlat16_1.w);
    u_xlat16_80 = u_xlat16_75 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_1.x = u_xlat16_80 * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_1.x = u_xlat16_75 * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_75 = u_xlat16_12.z * 15.0 + (-u_xlat16_75);
    u_xlat16_80 = (-u_xlat16_46) + u_xlat16_23.x;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_80 + u_xlat16_46;
    u_xlat16_75 = u_xlat16_79 * u_xlat16_75;
    u_xlat0.x = u_xlat0.x * u_xlat16_75;
    u_xlat16_75 = u_xlat0.w * 0.5;
    u_xlat16_80 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat0.x * u_xlat16_80 + u_xlat16_75;
    u_xlat16_80 = u_xlat16_75 + u_xlat16_75;
    u_xlat16_12.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_12.x + u_xlat16_80;
    u_xlat16_75 = u_xlat0.w * u_xlat16_75;
    u_xlat16_75 = min(u_xlat16_2.z, u_xlat16_75);
    u_xlat16_12.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_52 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_52 = u_xlat0.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * u_xlat16_12.xyz;
    u_xlat16_52 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_14.xyz = vec3(u_xlat16_52) * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff;
    u_xlat16_52 = u_xlat0.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_14.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * vec3(u_xlat16_52) + u_xlat16_12.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_29;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat23;
mediump vec3 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat46;
mediump float u_xlat16_46;
mediump float u_xlat16_52;
mediump float u_xlat16_58;
float u_xlat71;
bool u_xlatb71;
float u_xlat74;
mediump float u_xlat16_75;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
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
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat16_6.xyz;
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
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat27.x = dot(u_xlat7.xyz, u_xlat27.xyz);
    u_xlat27.x = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _ShadowBias.z;
    u_xlat27.xyz = (-u_xlat7.xyz) * u_xlat27.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat27.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat25 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat25 = (-u_xlat2.x) + u_xlat25;
    u_xlat0.z = _ShadowBias.y * u_xlat25 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
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
    u_xlat23.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_23.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_23.z * _shadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_10.xyz = vec3(u_xlat16_75) * u_xlat16_10.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_75 * 0.5 + 0.5;
    u_xlat16_79 = (-u_xlat16_75) + u_xlat16_79;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_75 = u_xlat16_1.w * u_xlat16_79 + u_xlat16_75;
    u_xlat16_75 = u_xlat16_1.w * u_xlat16_75;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_75);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_75));
    u_xlat16_34.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat23.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_75 = _sssIntensity * _sssIntensity;
    u_xlat16_75 = u_xlat16_2.x * u_xlat16_75;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_58 = sqrt(u_xlat16_75);
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = (-u_xlat16_14.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_18.xyz = u_xlat3.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_18.xyz * u_xlat16_34.xyz + (-u_xlat3.xxx);
    u_xlat16_34.xyz = vec3(u_xlat16_58) * u_xlat16_34.xyz + u_xlat3.xxx;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_2.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_19.xyz = u_xlat16_11.xxx * u_xlat16_20.xyz;
    u_xlat16_11.xyz = u_xlat16_34.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb71 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb71) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_81);
    u_xlat16_20.xyz = u_xlat26.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb71 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat16_21.xy = (bool(u_xlatb71)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat71 = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_83);
    u_xlat16_83 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = float(1.0) / float(u_xlat16_81);
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_83;
    u_xlat16_81 = max(u_xlat16_21.x, u_xlat16_81);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_81;
    u_xlat16_20.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_21.xyz = vec3(u_xlat71) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xxx * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-vec3(u_xlat71));
    u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz + vec3(u_xlat71);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat23.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat71) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_37.xyz = u_xlat26.xyz * u_xlat16_37.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_37.xyz = u_xlat16_37.xyz * u_xlat16_15.yyy + u_xlat16_20.xyz;
    u_xlat16_38 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_37.xyz);
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat16_37.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_38 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_37.x);
    u_xlat16_37.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_37.x = (-u_xlat16_37.x) * u_xlat16_37.x + 1.0;
    u_xlat16_37.x = max(u_xlat16_37.x, 0.0);
    u_xlat16_37.x = u_xlat16_37.x * u_xlat16_37.x;
    u_xlat16_14.x = u_xlat16_37.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_15.x, u_xlat16_14.x);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_15.xyz = u_xlat23.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_12.xyw = u_xlat16_15.xyz * u_xlat16_12.xyw + (-u_xlat23.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_58) * u_xlat16_12.xyw + u_xlat23.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat23.xxx + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat23.x = (-u_xlat3.x) * u_xlat16_80 + u_xlat3.x;
    u_xlat23.x = u_xlat3.x * u_xlat23.x + u_xlat16_80;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat3.x;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_35.xyz = u_xlat2.xyw * u_xlat16_12.xxx;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat4.x) * u_xlat16_80 + u_xlat4.x;
    u_xlat46 = u_xlat4.x * u_xlat46 + u_xlat16_80;
    u_xlat46 = sqrt(u_xlat46);
    u_xlat23.y = u_xlat46 + u_xlat4.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat46 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat46 = inversesqrt(u_xlat46);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat2.xyw;
    u_xlat46 = dot(u_xlat7.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_12.x) + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat25 = u_xlat16_80 + -1.0;
    u_xlat46 = u_xlat46 * u_xlat25 + 1.0;
    u_xlat46 = u_xlat46 * u_xlat46;
    u_xlat46 = u_xlat16_80 / u_xlat46;
    u_xlat23.y = u_xlat46 * 0.318309873;
    u_xlat23.xy = min(u_xlat23.xy, vec2(16.0, 16.0));
    u_xlat23.x = u_xlat23.x * u_xlat23.y;
    u_xlat16_12.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat16_14.x = u_xlat2.x * u_xlat16_12.x;
    u_xlat46 = (-u_xlat16_12.x) * u_xlat2.x + 1.0;
    u_xlat16_37.xyz = u_xlat16_1.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat16_37.xyz;
    u_xlat46 = u_xlat16_37.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat2.xyw = vec3(u_xlat46) * u_xlat16_14.xxx + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat23.xxx * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat3.xxx * u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_15.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_15.xyz + _sssColorOcc.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat7.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat23.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat3.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat3.xyz = u_xlat23.xxx * u_xlat3.xyz + _sssColorBack.xyz;
    u_xlat3.xyz = u_xlat16_15.xyz * u_xlat3.xyz;
    u_xlat16_15.xyz = u_xlat3.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati23 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_75 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_35.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_35.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat74) + (-u_xlat0.xyz);
    u_xlat3.xyz = vec3(u_xlat16_80) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_1.z = dot(u_xlat16_10.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat15.y = u_xlat3.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_80 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat4.y = u_xlat16_1.x;
    u_xlat16_23.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_37.xyz * u_xlat16_23.xxx + u_xlat16_23.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_80);
    u_xlat16_17.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_75) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb23 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb23)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz;
    u_xlat16_1.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_75 = floor(u_xlat16_1.w);
    u_xlat16_80 = u_xlat16_75 + 1.0;
    u_xlat16_80 = min(u_xlat16_80, 15.0);
    u_xlat16_1.x = u_xlat16_80 * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_1.x = u_xlat16_75 * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_75 = u_xlat16_12.z * 15.0 + (-u_xlat16_75);
    u_xlat16_80 = (-u_xlat16_46) + u_xlat16_23.x;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_80 + u_xlat16_46;
    u_xlat16_75 = u_xlat16_79 * u_xlat16_75;
    u_xlat0.x = u_xlat0.x * u_xlat16_75;
    u_xlat16_75 = u_xlat0.w * 0.5;
    u_xlat16_80 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat0.x * u_xlat16_80 + u_xlat16_75;
    u_xlat16_80 = u_xlat16_75 + u_xlat16_75;
    u_xlat16_12.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_12.x + u_xlat16_80;
    u_xlat16_75 = u_xlat0.w * u_xlat16_75;
    u_xlat16_75 = min(u_xlat16_2.z, u_xlat16_75);
    u_xlat16_12.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_52 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _MendsLightDirection2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff2;
    u_xlat16_52 = u_xlat0.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * u_xlat16_12.xyz;
    u_xlat16_52 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_52 = inversesqrt(u_xlat16_52);
    u_xlat16_14.xyz = vec3(u_xlat16_52) * _MendsLightDirection.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_52 = float(1.0) / _MendsLightFallOff;
    u_xlat16_52 = u_xlat0.x * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_75;
    u_xlat16_14.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * vec3(u_xlat16_52) + u_xlat16_12.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_12.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * _emissiveColor.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_29;
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
  GpuProgramID 88180
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Skin_MendLightGUI"
}