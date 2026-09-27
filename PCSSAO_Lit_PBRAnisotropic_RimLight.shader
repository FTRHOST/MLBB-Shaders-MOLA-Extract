//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PCSSAO/Lit/PBR(Anisotropic)_RimLight" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Toggle] _anisoUse2U ("各向异性使用2U", Float) = 0.0

_anisotropicMap ("各向异性贴图", 2D) = "white" { }

_sunShift ("各向异性扭曲", Float) = 1.0

_sunShiftOffset ("各向异性偏移", Float) = 1.0

_anisotropicMultiplier ("各向异性强度", Range(0, 1)) = 1.0

[Tex] _rimLightMask ("边缘光遮罩", 2D) = "white" { }

_FresnelColor ("边缘光颜色", Color) = (0,0,0,0)

_FresnelPower ("边缘光范围", Range(0, 1)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 8941
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
vec3 u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat34;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
float u_xlat48;
mediump vec2 u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_72;
int u_xlati72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
int u_xlati76;
bool u_xlatb76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
float u_xlat84;
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
    u_xlat16_25.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_25.x = (-u_xlat16_25.x) * u_xlat16_25.x + 1.0;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_49 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_25.x * u_xlat16_49;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_25.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_25.xyz = u_xlat16_2.xyz * u_xlat16_25.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_25.xyz);
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
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_26, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat6.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat72 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat72) + u_xlat5.xyz;
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat24.xxx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat24.xxx * u_xlat8.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_57;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat10.z = u_xlat24.x * u_xlat72;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat16_25.xyz);
    u_xlat24.x = u_xlat16_1.x * u_xlat16_57;
    u_xlat24.x = max(u_xlat24.x, 0.00100000005);
    u_xlat10.y = u_xlat16_81 * u_xlat24.x;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat34.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat34.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat72 * u_xlat77;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat24.x * u_xlat77;
    u_xlat77 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat12.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat76 = u_xlat77 * u_xlat76 + 6.10351563e-05;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat13.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat24.x * u_xlat78;
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat72 * u_xlat16_81;
    u_xlat78 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat80 = u_xlat72 * u_xlat24.x;
    u_xlat14.z = u_xlat78 * u_xlat80;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat80 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat60 = u_xlat80 * 0.318309873;
    u_xlat78 = u_xlat78 * u_xlat60;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat76 = u_xlat76 * u_xlat78;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat78 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat16_15.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_13.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_13.zxy * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat16_16.xyz;
    u_xlat78 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat34.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat76 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat24.x * u_xlat76;
    u_xlat16_25.x = dot(u_xlat5.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_25.x;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat76 * u_xlat80;
    u_xlat76 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat80 / u_xlat76;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = u_xlat60 * u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat72 * u_xlat84;
    u_xlat16_25.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat24.x * u_xlat16_25.x;
    u_xlat18.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat77 * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat76 = u_xlat76 * u_xlat84;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat79);
    u_xlat42.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat76) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat42.xyz * _directSpecularColor.zxy;
    u_xlat42.xyz = u_xlat18.xxx * u_xlat42.xyz;
    u_xlat16_25.xyz = u_xlat42.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_33 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat13.xyz;
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb76 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb76)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat76 = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat34.xyz = vec3(u_xlat76) * u_xlat34.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat34.xyz);
    u_xlat79 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat72 * u_xlat79;
    u_xlat13.y = u_xlat24.x * u_xlat76;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat34.xyz);
    u_xlat13.x = u_xlat72 * u_xlat16_1.x;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat72 * u_xlat80;
    u_xlat72 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat80 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat60 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat24.x * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat8.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat77 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat72;
    u_xlat16_81 = u_xlat76 * u_xlat76;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_83 = u_xlat76 * u_xlat16_81;
    u_xlat72 = (-u_xlat16_81) * u_xlat76 + 1.0;
    u_xlat32.xyz = u_xlat16_16.xyz * vec3(u_xlat72);
    u_xlat32.xyz = vec3(u_xlat78) * vec3(u_xlat16_83) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat24.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.zxy;
    u_xlat32.xyz = u_xlat8.xxx * u_xlat32.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat32.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat24.xz = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat24.xz = u_xlat24.xz * hlslcc_FragCoord.xy;
    u_xlat16_24.x = texture(_ScreenSpaceOcclusionTexture, u_xlat24.xz).x;
    u_xlat16_73 = u_xlat16_24.x * u_xlat16_3.z;
    u_xlat16_17.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat6.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_33) * u_xlat16_17.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_33 * 0.5 + 0.5;
    u_xlat16_81 = (-u_xlat16_33) + u_xlat16_81;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_81 + u_xlat16_33;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 + -1.0;
    u_xlat16_81 = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat24.x = min(u_xlat16_33, 1.0);
    u_xlat72 = min(u_xlat24.x, u_xlat16_73);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat72) + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * vec3(u_xlat72) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_81) * u_xlat16_23.xyz;
    u_xlati72 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati72].xyz;
    u_xlati72 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati76 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati72].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati76].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_33 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_15.xyz = vec3(u_xlat16_83) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb0 = u_xlat16_74>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + u_xlat5.xyz;
    u_xlat16_83 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_83 = abs(u_xlat16_74) * u_xlat16_83;
    u_xlat5.xyz = vec3(u_xlat16_83) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat16_83 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_83) + (-u_xlat16_11.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat5.xyz);
    u_xlat4.xyz = vec3(u_xlat16_57) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = abs(vec3(u_xlat16_74)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat48 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
    u_xlat16_44.y = u_xlat48 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_57;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_33) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb48)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_48.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_48.xxx + u_xlat16_48.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_3.w);
    u_xlat16_9.x = u_xlat16_74 + 1.0;
    u_xlat16_9.x = min(u_xlat16_9.x, 15.0);
    u_xlat16_3.x = u_xlat16_9.x * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = u_xlat16_74 * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_72 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_74 = u_xlat16_9.z * 15.0 + (-u_xlat16_74);
    u_xlat16_9.x = (-u_xlat16_72) + u_xlat16_48.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_9.x + u_xlat16_72;
    u_xlat16_74 = u_xlat16_81 * u_xlat16_74;
    u_xlat0.x = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = u_xlat24.x * 0.5;
    u_xlat16_9.x = (-u_xlat24.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat0.x * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_9.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_33 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_33 + u_xlat16_9.x;
    u_xlat16_74 = u_xlat24.x * u_xlat16_74;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_74);
    u_xlat16_9.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.yzx * u_xlat16_11.yzx + u_xlat16_1.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_13.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_13.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat16_4.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_2.xyz;
    u_xlat4.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_72 = texture(_GlobalEffOutlineTex, u_xlat4.xy).x;
    u_xlat72 = (-u_xlat16_72) + 1.0;
    u_xlat72 = log2(u_xlat72);
    u_xlat72 = u_xlat72 * _FresnelPower;
    u_xlat72 = exp2(u_xlat72);
    u_xlat16_4.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat72) * u_xlat16_4.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.zxy + u_xlat0.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
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
    u_xlat72 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat2.x = u_xlat72 * 0.0625 + u_xlat2.y;
    u_xlat16_24.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_24.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_24.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_25.x;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
vec3 u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat34;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
float u_xlat48;
mediump vec2 u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_72;
int u_xlati72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
int u_xlati76;
bool u_xlatb76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
float u_xlat84;
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
    u_xlat16_25.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_25.x = (-u_xlat16_25.x) * u_xlat16_25.x + 1.0;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_49 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_25.x * u_xlat16_49;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_25.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_25.xyz = u_xlat16_2.xyz * u_xlat16_25.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_25.xyz);
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
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_26, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat6.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat72 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat72) + u_xlat5.xyz;
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat24.xxx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat24.xxx * u_xlat8.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_57;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat10.z = u_xlat24.x * u_xlat72;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat16_25.xyz);
    u_xlat24.x = u_xlat16_1.x * u_xlat16_57;
    u_xlat24.x = max(u_xlat24.x, 0.00100000005);
    u_xlat10.y = u_xlat16_81 * u_xlat24.x;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat34.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat34.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat72 * u_xlat77;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat24.x * u_xlat77;
    u_xlat77 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat12.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat76 = u_xlat77 * u_xlat76 + 6.10351563e-05;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat13.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat24.x * u_xlat78;
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat72 * u_xlat16_81;
    u_xlat78 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat80 = u_xlat72 * u_xlat24.x;
    u_xlat14.z = u_xlat78 * u_xlat80;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat80 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat60 = u_xlat80 * 0.318309873;
    u_xlat78 = u_xlat78 * u_xlat60;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat76 = u_xlat76 * u_xlat78;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat78 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat16_15.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_13.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_13.zxy * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat16_16.xyz;
    u_xlat78 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat34.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat76 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat24.x * u_xlat76;
    u_xlat16_25.x = dot(u_xlat5.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_25.x;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat76 * u_xlat80;
    u_xlat76 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat80 / u_xlat76;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = u_xlat60 * u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat72 * u_xlat84;
    u_xlat16_25.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat24.x * u_xlat16_25.x;
    u_xlat18.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat77 * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat76 = u_xlat76 * u_xlat84;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat79);
    u_xlat42.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat76) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat42.xyz * _directSpecularColor.zxy;
    u_xlat42.xyz = u_xlat18.xxx * u_xlat42.xyz;
    u_xlat16_25.xyz = u_xlat42.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_33 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat13.xyz;
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb76 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb76)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat76 = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat34.xyz = vec3(u_xlat76) * u_xlat34.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat34.xyz);
    u_xlat79 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat72 * u_xlat79;
    u_xlat13.y = u_xlat24.x * u_xlat76;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat34.xyz);
    u_xlat13.x = u_xlat72 * u_xlat16_1.x;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat72 * u_xlat80;
    u_xlat72 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat80 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat60 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat24.x * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat8.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat77 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat72;
    u_xlat16_81 = u_xlat76 * u_xlat76;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_83 = u_xlat76 * u_xlat16_81;
    u_xlat72 = (-u_xlat16_81) * u_xlat76 + 1.0;
    u_xlat32.xyz = u_xlat16_16.xyz * vec3(u_xlat72);
    u_xlat32.xyz = vec3(u_xlat78) * vec3(u_xlat16_83) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat24.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.zxy;
    u_xlat32.xyz = u_xlat8.xxx * u_xlat32.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat32.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat24.xz = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat24.xz = u_xlat24.xz * hlslcc_FragCoord.xy;
    u_xlat16_24.x = texture(_ScreenSpaceOcclusionTexture, u_xlat24.xz).x;
    u_xlat16_73 = u_xlat16_24.x * u_xlat16_3.z;
    u_xlat16_17.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat6.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_33) * u_xlat16_17.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_33 * 0.5 + 0.5;
    u_xlat16_81 = (-u_xlat16_33) + u_xlat16_81;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_81 + u_xlat16_33;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 + -1.0;
    u_xlat16_81 = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat24.x = min(u_xlat16_33, 1.0);
    u_xlat72 = min(u_xlat24.x, u_xlat16_73);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat72) + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * vec3(u_xlat72) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_81) * u_xlat16_23.xyz;
    u_xlati72 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati72].xyz;
    u_xlati72 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati76 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati72].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati76].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_33 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_15.xyz = vec3(u_xlat16_83) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb0 = u_xlat16_74>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + u_xlat5.xyz;
    u_xlat16_83 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_83 = abs(u_xlat16_74) * u_xlat16_83;
    u_xlat5.xyz = vec3(u_xlat16_83) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat16_83 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_83) + (-u_xlat16_11.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat5.xyz);
    u_xlat4.xyz = vec3(u_xlat16_57) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = abs(vec3(u_xlat16_74)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat48 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
    u_xlat16_44.y = u_xlat48 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_57;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_33) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb48)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_48.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_48.xxx + u_xlat16_48.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_3.w);
    u_xlat16_9.x = u_xlat16_74 + 1.0;
    u_xlat16_9.x = min(u_xlat16_9.x, 15.0);
    u_xlat16_3.x = u_xlat16_9.x * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = u_xlat16_74 * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_72 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_74 = u_xlat16_9.z * 15.0 + (-u_xlat16_74);
    u_xlat16_9.x = (-u_xlat16_72) + u_xlat16_48.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_9.x + u_xlat16_72;
    u_xlat16_74 = u_xlat16_81 * u_xlat16_74;
    u_xlat0.x = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = u_xlat24.x * 0.5;
    u_xlat16_9.x = (-u_xlat24.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat0.x * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_9.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_33 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_33 + u_xlat16_9.x;
    u_xlat16_74 = u_xlat24.x * u_xlat16_74;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_74);
    u_xlat16_9.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.yzx * u_xlat16_11.yzx + u_xlat16_1.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_13.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_13.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat16_4.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_2.xyz;
    u_xlat4.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_72 = texture(_GlobalEffOutlineTex, u_xlat4.xy).x;
    u_xlat72 = (-u_xlat16_72) + 1.0;
    u_xlat72 = log2(u_xlat72);
    u_xlat72 = u_xlat72 * _FresnelPower;
    u_xlat72 = exp2(u_xlat72);
    u_xlat16_4.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat72) * u_xlat16_4.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.zxy + u_xlat0.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
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
    u_xlat72 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat2.x = u_xlat72 * 0.0625 + u_xlat2.y;
    u_xlat16_24.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_24.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_24.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_25.x;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
mediump float u_xlat16_20;
vec3 u_xlat25;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat38;
mediump vec2 u_xlat16_38;
bool u_xlatb38;
vec2 u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
float u_xlat60;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_66;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat38) * u_xlat3.xyz;
    u_xlat57 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat57) + u_xlat2.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat6.xyz = u_xlat19.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat7.xyz = u_xlat19.xxx * u_xlat8.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_47 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat57 = u_xlat16_58 * u_xlat16_47;
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat57 = max(u_xlat57, 0.00100000005);
    u_xlat10.y = u_xlat19.x * u_xlat57;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat19.x = (-u_xlat16_58) + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat16_47;
    u_xlat19.x = max(u_xlat19.x, 0.00100000005);
    u_xlat10.x = u_xlat16_66 * u_xlat19.x;
    u_xlat59 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_66) + 1.0;
    u_xlat61 = u_xlat19.x * u_xlat57;
    u_xlat10.z = u_xlat59 * u_xlat61;
    u_xlat59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat59 = max(u_xlat59, 6.10351563e-05);
    u_xlat59 = u_xlat61 / u_xlat59;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat61 * u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat62 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat19.x * u_xlat62;
    u_xlat7.z = u_xlat19.x * u_xlat61;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat19.x * u_xlat57;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat7.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat57 * u_xlat16_66;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat19.z = u_xlat57 + u_xlat6.x;
    u_xlat19.xz = u_xlat19.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.z + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat59;
    u_xlat16_66 = u_xlat60 * u_xlat60;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_11.x = u_xlat60 * u_xlat16_66;
    u_xlat57 = (-u_xlat16_66) * u_xlat60 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_30.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_10.zxy * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_10.zxy * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_9.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_12.xyz;
    u_xlat57 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_11.xxx + u_xlat25.xyz;
    u_xlat25.xyz = u_xlat19.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xyz = min(max(u_xlat25.xyz, 0.0), 1.0);
#else
    u_xlat25.xyz = clamp(u_xlat25.xyz, 0.0, 1.0);
#endif
    u_xlat25.xyz = u_xlat25.xyz * _directSpecularColor.zxy;
    u_xlat25.xyz = u_xlat6.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_28 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_66);
    u_xlat16_13.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat19.x = dot(u_xlat4.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x;
    u_xlat16_66 = max(u_xlat16_14.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_13.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_28 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_30.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_45.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat45.xy = u_xlat16_45.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xy = min(max(u_xlat45.xy, 0.0), 1.0);
#else
    u_xlat45.xy = clamp(u_xlat45.xy, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat45.yyy * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat8.xyw * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_15.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat57 = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_68);
    u_xlat16_68 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_66 = max(u_xlat16_15.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat45.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat57) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat6.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat25.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat4.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_14.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_28 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_28) + u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_66 + u_xlat16_28;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_28;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat19.x = min(u_xlat16_28, 1.0);
    u_xlat57 = min(u_xlat19.x, u_xlat16_8.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat57) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat57) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati59 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_28 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_68 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_13.xyz = vec3(u_xlat16_68) * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_58>=0.0);
#else
    u_xlatb0 = u_xlat16_58>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + u_xlat2.xyz;
    u_xlat16_68 = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_68 = abs(u_xlat16_58) * u_xlat16_68;
    u_xlat2.xyz = vec3(u_xlat16_68) * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_68 = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_68) + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38) + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat16_47) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_58)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_58) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
    u_xlat16_34.y = u_xlat38 * 0.5;
    u_xlat16_20 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_20;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb38)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_28 = u_xlat16_9.x + 1.0;
    u_xlat16_28 = min(u_xlat16_28, 15.0);
    u_xlat16_1.x = u_xlat16_28 * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_28 = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_28 + u_xlat16_57;
    u_xlat16_9.x = u_xlat16_66 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat19.x * 0.5;
    u_xlat16_28 = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_28 + u_xlat16_9.x;
    u_xlat16_28 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_47 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47 + u_xlat16_28;
    u_xlat16_9.x = u_xlat19.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat25.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.yzx;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_10.w * _AlbedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_19.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_28;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
mediump float u_xlat16_20;
vec3 u_xlat25;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat38;
mediump vec2 u_xlat16_38;
bool u_xlatb38;
vec2 u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
float u_xlat60;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_66;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat38) * u_xlat3.xyz;
    u_xlat57 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat57) + u_xlat2.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat6.xyz = u_xlat19.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat7.xyz = u_xlat19.xxx * u_xlat8.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_47 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat57 = u_xlat16_58 * u_xlat16_47;
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat57 = max(u_xlat57, 0.00100000005);
    u_xlat10.y = u_xlat19.x * u_xlat57;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat19.x = (-u_xlat16_58) + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat16_47;
    u_xlat19.x = max(u_xlat19.x, 0.00100000005);
    u_xlat10.x = u_xlat16_66 * u_xlat19.x;
    u_xlat59 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_66) + 1.0;
    u_xlat61 = u_xlat19.x * u_xlat57;
    u_xlat10.z = u_xlat59 * u_xlat61;
    u_xlat59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat59 = max(u_xlat59, 6.10351563e-05);
    u_xlat59 = u_xlat61 / u_xlat59;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat61 * u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat62 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat19.x * u_xlat62;
    u_xlat7.z = u_xlat19.x * u_xlat61;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat19.x * u_xlat57;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat7.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat57 * u_xlat16_66;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat19.z = u_xlat57 + u_xlat6.x;
    u_xlat19.xz = u_xlat19.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.z + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat59;
    u_xlat16_66 = u_xlat60 * u_xlat60;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_11.x = u_xlat60 * u_xlat16_66;
    u_xlat57 = (-u_xlat16_66) * u_xlat60 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_30.xyz = u_xlat16_10.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_10.zxy * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_10.zxy * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_9.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_12.xyz;
    u_xlat57 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_11.xxx + u_xlat25.xyz;
    u_xlat25.xyz = u_xlat19.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xyz = min(max(u_xlat25.xyz, 0.0), 1.0);
#else
    u_xlat25.xyz = clamp(u_xlat25.xyz, 0.0, 1.0);
#endif
    u_xlat25.xyz = u_xlat25.xyz * _directSpecularColor.zxy;
    u_xlat25.xyz = u_xlat6.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_28 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_66);
    u_xlat16_13.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat19.x = dot(u_xlat4.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x;
    u_xlat16_66 = max(u_xlat16_14.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_13.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_28 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_30.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_45.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat45.xy = u_xlat16_45.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xy = min(max(u_xlat45.xy, 0.0), 1.0);
#else
    u_xlat45.xy = clamp(u_xlat45.xy, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat45.yyy * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat8.xyw * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_15.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat57 = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_68);
    u_xlat16_68 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_66 = max(u_xlat16_15.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat45.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat57) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat6.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat25.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat4.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_14.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_28 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_28) + u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_66 + u_xlat16_28;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_28;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat19.x = min(u_xlat16_28, 1.0);
    u_xlat57 = min(u_xlat19.x, u_xlat16_8.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat57) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat57) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati59 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_28 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_68 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_13.xyz = vec3(u_xlat16_68) * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_58>=0.0);
#else
    u_xlatb0 = u_xlat16_58>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + u_xlat2.xyz;
    u_xlat16_68 = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_68 = abs(u_xlat16_58) * u_xlat16_68;
    u_xlat2.xyz = vec3(u_xlat16_68) * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_68 = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_68) + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38) + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat16_47) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_58)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_58) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
    u_xlat16_34.y = u_xlat38 * 0.5;
    u_xlat16_20 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_20;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb38)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_28 = u_xlat16_9.x + 1.0;
    u_xlat16_28 = min(u_xlat16_28, 15.0);
    u_xlat16_1.x = u_xlat16_28 * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_28 = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_28 + u_xlat16_57;
    u_xlat16_9.x = u_xlat16_66 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat19.x * 0.5;
    u_xlat16_28 = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_28 + u_xlat16_9.x;
    u_xlat16_28 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_47 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47 + u_xlat16_28;
    u_xlat16_9.x = u_xlat19.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat25.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.yzx;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_10.w * _AlbedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_19.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_28;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
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
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat21;
float u_xlat22;
vec3 u_xlat24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat60;
int u_xlati60;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_74;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_20.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _shadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_66 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_66 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_anisoUse2U);
#else
    u_xlatb20 = 0.5<_anisoUse2U;
#endif
    u_xlat20.xy = (bool(u_xlatb20)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_20.x = texture(_anisotropicMap, u_xlat20.xy).x;
    u_xlat20.x = u_xlat16_20.x * 2.0 + -1.0;
    u_xlat20.x = u_xlat20.x * _sunShift + _sunShiftOffset;
    u_xlat20.x = u_xlat20.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb40 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat40 = (u_xlatb40) ? 1.0 : -1.0;
    u_xlat40 = u_xlat40 * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat3.xyz = (-u_xlat8.yzx) * vec3(u_xlat62) + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat3.xyz = vec3(u_xlat62) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_70 = u_xlat16_66 + -1.0;
    u_xlat62 = (-u_xlat16_70) + 1.0;
    u_xlat16_13.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_71 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat2.x = u_xlat62 * u_xlat16_71;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat1.z = u_xlat40 * u_xlat2.x;
    u_xlat16_72 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat40 = u_xlat16_66 * u_xlat16_71;
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat1.y = u_xlat16_72 * u_xlat40;
    u_xlat21.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat1.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = vec3(u_xlat16_66) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
    u_xlat16.z = u_xlat41 * u_xlat2.x;
    u_xlat41 = dot(u_xlat3.zxy, u_xlat16_14.xyz);
    u_xlat16.y = u_xlat40 * u_xlat41;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat41 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat21.y = u_xlat41 + u_xlat16.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.y * u_xlat21.x + 6.10351563e-05;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat41 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat9.xyz = vec3(u_xlat41) * u_xlat9.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat40 * u_xlat41;
    u_xlat40 = u_xlat2.x * u_xlat40;
    u_xlat16_66 = dot(u_xlat3.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.x * u_xlat16_66;
    u_xlat41 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_66) + 1.0;
    u_xlat7.z = u_xlat40 * u_xlat41;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat41 = max(u_xlat41, 6.10351563e-05);
    u_xlat41 = u_xlat40 / u_xlat41;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat40 = u_xlat21.x * u_xlat40;
    u_xlat16_66 = u_xlat2.x * u_xlat2.x;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_72 = u_xlat2.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat2.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_13.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat21.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat21.xxx * vec3(u_xlat16_72) + u_xlat2.xyw;
    u_xlat2.xyw = vec3(u_xlat40) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_33.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_33.xyz = vec3(_occlusionScale) * u_xlat16_33.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat16_33.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_33.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_74 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_35.z = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_33.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_33.xz);
    u_xlat16_18.y = u_xlat16_33.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat20.xxx * u_xlat16_12.xyz + u_xlat4.xyz;
    u_xlat2.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_70>=0.0);
#else
    u_xlatb2 = u_xlat16_70>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb2)) ? u_xlat0.xyw : u_xlat3.xyz;
    u_xlat2.xyw = u_xlat16_14.xyz * u_xlat0.xyw;
    u_xlat2.xyw = u_xlat0.wxy * u_xlat16_14.yzx + (-u_xlat2.xyw);
    u_xlat3.xyz = u_xlat0.xyw * u_xlat2.xyw;
    u_xlat0.xyw = u_xlat2.wxy * u_xlat0.ywx + (-u_xlat3.xyz);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat0.xyw;
    u_xlat16_12.x = u_xlat16_71 * 8.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_70) * u_xlat16_12.x;
    u_xlat0.xyw = u_xlat16_12.xxx * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat22);
    u_xlat16_12.x = dot((-u_xlat16_14.xyz), u_xlat0.xyw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyw = (-u_xlat0.xyw) * u_xlat16_12.xxx + (-u_xlat16_14.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xyw);
    u_xlat3.xyz = vec3(u_xlat16_71) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_70)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_70 = -abs(u_xlat16_70) * 0.800000012 + 1.0;
    u_xlat16_70 = u_xlat16_13.x * u_xlat16_70;
    u_xlat16_70 = u_xlat16_70 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_33.xyz, u_xlat0.xyw);
    u_xlat16_35.y = u_xlat0.x * 0.5;
    u_xlat16_71 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_71;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_70);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_12.xyz;
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_35.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_35.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_70 = u_xlat16_66 + 1.0;
    u_xlat16_70 = min(u_xlat16_70, 15.0);
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_70 = (-u_xlat16_20.x) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70 + u_xlat16_20.x;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.z * 0.5;
    u_xlat16_70 = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_70 + u_xlat16_66;
    u_xlat16_70 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_71 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71 + u_xlat16_70;
    u_xlat16_66 = u_xlat0.z * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_2.z, u_xlat16_66);
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
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
    u_xlat16_26 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
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
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_20.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_26;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
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
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat21;
float u_xlat22;
vec3 u_xlat24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat60;
int u_xlati60;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_74;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_20.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _shadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_66 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_66 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_anisoUse2U);
#else
    u_xlatb20 = 0.5<_anisoUse2U;
#endif
    u_xlat20.xy = (bool(u_xlatb20)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_20.x = texture(_anisotropicMap, u_xlat20.xy).x;
    u_xlat20.x = u_xlat16_20.x * 2.0 + -1.0;
    u_xlat20.x = u_xlat20.x * _sunShift + _sunShiftOffset;
    u_xlat20.x = u_xlat20.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb40 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat40 = (u_xlatb40) ? 1.0 : -1.0;
    u_xlat40 = u_xlat40 * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat3.xyz = (-u_xlat8.yzx) * vec3(u_xlat62) + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat3.xyz = vec3(u_xlat62) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_70 = u_xlat16_66 + -1.0;
    u_xlat62 = (-u_xlat16_70) + 1.0;
    u_xlat16_13.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_71 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat2.x = u_xlat62 * u_xlat16_71;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat1.z = u_xlat40 * u_xlat2.x;
    u_xlat16_72 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat40 = u_xlat16_66 * u_xlat16_71;
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat1.y = u_xlat16_72 * u_xlat40;
    u_xlat21.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat1.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = vec3(u_xlat16_66) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
    u_xlat16.z = u_xlat41 * u_xlat2.x;
    u_xlat41 = dot(u_xlat3.zxy, u_xlat16_14.xyz);
    u_xlat16.y = u_xlat40 * u_xlat41;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat41 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat21.y = u_xlat41 + u_xlat16.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.y * u_xlat21.x + 6.10351563e-05;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat41 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat9.xyz = vec3(u_xlat41) * u_xlat9.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat40 * u_xlat41;
    u_xlat40 = u_xlat2.x * u_xlat40;
    u_xlat16_66 = dot(u_xlat3.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.x * u_xlat16_66;
    u_xlat41 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_66) + 1.0;
    u_xlat7.z = u_xlat40 * u_xlat41;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat41 = max(u_xlat41, 6.10351563e-05);
    u_xlat41 = u_xlat40 / u_xlat41;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat40 = u_xlat21.x * u_xlat40;
    u_xlat16_66 = u_xlat2.x * u_xlat2.x;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_72 = u_xlat2.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat2.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_13.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat21.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat21.xxx * vec3(u_xlat16_72) + u_xlat2.xyw;
    u_xlat2.xyw = vec3(u_xlat40) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_33.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_33.xyz = vec3(_occlusionScale) * u_xlat16_33.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat16_33.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_33.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_74 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_35.z = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_33.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_33.xz);
    u_xlat16_18.y = u_xlat16_33.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat20.xxx * u_xlat16_12.xyz + u_xlat4.xyz;
    u_xlat2.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_70>=0.0);
#else
    u_xlatb2 = u_xlat16_70>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb2)) ? u_xlat0.xyw : u_xlat3.xyz;
    u_xlat2.xyw = u_xlat16_14.xyz * u_xlat0.xyw;
    u_xlat2.xyw = u_xlat0.wxy * u_xlat16_14.yzx + (-u_xlat2.xyw);
    u_xlat3.xyz = u_xlat0.xyw * u_xlat2.xyw;
    u_xlat0.xyw = u_xlat2.wxy * u_xlat0.ywx + (-u_xlat3.xyz);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat0.xyw;
    u_xlat16_12.x = u_xlat16_71 * 8.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_70) * u_xlat16_12.x;
    u_xlat0.xyw = u_xlat16_12.xxx * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat22);
    u_xlat16_12.x = dot((-u_xlat16_14.xyz), u_xlat0.xyw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyw = (-u_xlat0.xyw) * u_xlat16_12.xxx + (-u_xlat16_14.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xyw);
    u_xlat3.xyz = vec3(u_xlat16_71) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_70)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_70 = -abs(u_xlat16_70) * 0.800000012 + 1.0;
    u_xlat16_70 = u_xlat16_13.x * u_xlat16_70;
    u_xlat16_70 = u_xlat16_70 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_33.xyz, u_xlat0.xyw);
    u_xlat16_35.y = u_xlat0.x * 0.5;
    u_xlat16_71 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_71;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_70);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_12.xyz;
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_35.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_35.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_70 = u_xlat16_66 + 1.0;
    u_xlat16_70 = min(u_xlat16_70, 15.0);
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_70 = (-u_xlat16_20.x) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70 + u_xlat16_20.x;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.z * 0.5;
    u_xlat16_70 = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_70 + u_xlat16_66;
    u_xlat16_70 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_71 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71 + u_xlat16_70;
    u_xlat16_66 = u_xlat0.z * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_2.z, u_xlat16_66);
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
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
    u_xlat16_26 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
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
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_20.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_26;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(10) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
vec3 u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat34;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
float u_xlat48;
mediump vec2 u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_72;
int u_xlati72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
int u_xlati76;
bool u_xlatb76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
float u_xlat84;
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
    u_xlat16_25.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_25.x = (-u_xlat16_25.x) * u_xlat16_25.x + 1.0;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_49 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_25.x * u_xlat16_49;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_25.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_25.xyz = u_xlat16_2.xyz * u_xlat16_25.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_25.xyz);
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
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_26, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat6.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat72 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat72) + u_xlat5.xyz;
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat24.xxx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat24.xxx * u_xlat8.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_57;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat10.z = u_xlat24.x * u_xlat72;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat16_25.xyz);
    u_xlat24.x = u_xlat16_1.x * u_xlat16_57;
    u_xlat24.x = max(u_xlat24.x, 0.00100000005);
    u_xlat10.y = u_xlat16_81 * u_xlat24.x;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat34.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat34.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat72 * u_xlat77;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat24.x * u_xlat77;
    u_xlat77 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat12.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat76 = u_xlat77 * u_xlat76 + 6.10351563e-05;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat13.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat24.x * u_xlat78;
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat72 * u_xlat16_81;
    u_xlat78 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat80 = u_xlat72 * u_xlat24.x;
    u_xlat14.z = u_xlat78 * u_xlat80;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat80 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat60 = u_xlat80 * 0.318309873;
    u_xlat78 = u_xlat78 * u_xlat60;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat76 = u_xlat76 * u_xlat78;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat78 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat16_15.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat16_16.xyz;
    u_xlat78 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat34.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat76 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat24.x * u_xlat76;
    u_xlat16_25.x = dot(u_xlat5.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_25.x;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat76 * u_xlat80;
    u_xlat76 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat80 / u_xlat76;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = u_xlat60 * u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat72 * u_xlat84;
    u_xlat16_25.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat24.x * u_xlat16_25.x;
    u_xlat18.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat77 * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat76 = u_xlat76 * u_xlat84;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat79);
    u_xlat42.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat76) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat42.xyz * _directSpecularColor.xyz;
    u_xlat42.xyz = u_xlat18.xxx * u_xlat42.xyz;
    u_xlat16_25.xyz = u_xlat42.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_33 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat13.xyz;
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb76 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb76)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat76 = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat34.xyz = vec3(u_xlat76) * u_xlat34.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat34.xyz);
    u_xlat79 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat72 * u_xlat79;
    u_xlat13.y = u_xlat24.x * u_xlat76;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat34.xyz);
    u_xlat13.x = u_xlat72 * u_xlat16_1.x;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat72 * u_xlat80;
    u_xlat72 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat80 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat60 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat24.x * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat8.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat77 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat72;
    u_xlat16_81 = u_xlat76 * u_xlat76;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_83 = u_xlat76 * u_xlat16_81;
    u_xlat72 = (-u_xlat16_81) * u_xlat76 + 1.0;
    u_xlat32.xyz = u_xlat16_16.xyz * vec3(u_xlat72);
    u_xlat32.xyz = vec3(u_xlat78) * vec3(u_xlat16_83) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat24.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.xyz;
    u_xlat32.xyz = u_xlat8.xxx * u_xlat32.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat32.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat24.xz = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat24.xz = u_xlat24.xz * hlslcc_FragCoord.xy;
    u_xlat16_24 = texture(_ScreenSpaceOcclusionTexture, u_xlat24.xz).x;
    u_xlat16_73 = u_xlat16_24 * u_xlat16_3.z;
    u_xlat16_17.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat6.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_33) * u_xlat16_17.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_33 * 0.5 + 0.5;
    u_xlat16_81 = (-u_xlat16_33) + u_xlat16_81;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_81 + u_xlat16_33;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 + -1.0;
    u_xlat16_81 = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat24.x = min(u_xlat16_33, 1.0);
    u_xlat72 = min(u_xlat24.x, u_xlat16_73);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat72) + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * vec3(u_xlat72) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_81) * u_xlat16_23.xyz;
    u_xlati72 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati72].xyz;
    u_xlati72 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati76 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati72].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati76].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_33 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_15.xyz = vec3(u_xlat16_83) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb0 = u_xlat16_74>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + u_xlat5.xyz;
    u_xlat16_83 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_83 = abs(u_xlat16_74) * u_xlat16_83;
    u_xlat5.xyz = vec3(u_xlat16_83) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat16_83 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_83) + (-u_xlat16_11.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat5.xyz);
    u_xlat4.xyz = vec3(u_xlat16_57) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = abs(vec3(u_xlat16_74)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat48 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
    u_xlat16_44.y = u_xlat48 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_57;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_33) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb48)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_48.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_48.xxx + u_xlat16_48.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_3.w);
    u_xlat16_9.x = u_xlat16_74 + 1.0;
    u_xlat16_9.x = min(u_xlat16_9.x, 15.0);
    u_xlat16_3.x = u_xlat16_9.x * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = u_xlat16_74 * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_72 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_74 = u_xlat16_9.z * 15.0 + (-u_xlat16_74);
    u_xlat16_9.x = (-u_xlat16_72) + u_xlat16_48.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_9.x + u_xlat16_72;
    u_xlat16_74 = u_xlat16_81 * u_xlat16_74;
    u_xlat0.x = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = u_xlat24.x * 0.5;
    u_xlat16_9.x = (-u_xlat24.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat0.x * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_9.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_33 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_33 + u_xlat16_9.x;
    u_xlat16_74 = u_xlat24.x * u_xlat16_74;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_74);
    u_xlat16_9.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_13.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_13.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat4.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_72 = texture(_GlobalEffOutlineTex, u_xlat4.xy).x;
    u_xlat72 = (-u_xlat16_72) + 1.0;
    u_xlat72 = log2(u_xlat72);
    u_xlat72 = u_xlat72 * _FresnelPower;
    u_xlat72 = exp2(u_xlat72);
    u_xlat16_4.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat72) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_25.x;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(10) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
vec3 u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat34;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
float u_xlat48;
mediump vec2 u_xlat16_48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_72;
int u_xlati72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
int u_xlati76;
bool u_xlatb76;
float u_xlat77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_83;
float u_xlat84;
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
    u_xlat16_25.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_25.x = (-u_xlat16_25.x) * u_xlat16_25.x + 1.0;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_49 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_25.x * u_xlat16_49;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_25.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_25.xyz = u_xlat16_2.xyz * u_xlat16_25.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_25.xyz);
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
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_26, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat5.xyz = vec3(u_xlat48) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = u_xlat5.z;
    u_xlat16_7.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat6.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat72 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat72) + u_xlat5.xyz;
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat24.xxx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat24.xxx * u_xlat8.xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat72 = u_xlat72 * u_xlat16_57;
    u_xlat72 = max(u_xlat72, 0.00100000005);
    u_xlat10.z = u_xlat24.x * u_xlat72;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat16_25.xyz);
    u_xlat24.x = u_xlat16_1.x * u_xlat16_57;
    u_xlat24.x = max(u_xlat24.x, 0.00100000005);
    u_xlat10.y = u_xlat16_81 * u_xlat24.x;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat10.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat34.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat34.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat72 * u_xlat77;
    u_xlat12.x = dot(u_xlat6.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat5.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat24.x * u_xlat77;
    u_xlat77 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat12.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat76 = u_xlat77 * u_xlat76 + 6.10351563e-05;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat13.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat24.x * u_xlat78;
    u_xlat16_81 = dot(u_xlat5.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat72 * u_xlat16_81;
    u_xlat78 = dot(u_xlat6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat80 = u_xlat72 * u_xlat24.x;
    u_xlat14.z = u_xlat78 * u_xlat80;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat80 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat60 = u_xlat80 * 0.318309873;
    u_xlat78 = u_xlat78 * u_xlat60;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat76 = u_xlat76 * u_xlat78;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat78 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat16_15.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat16_16.xyz;
    u_xlat78 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat10.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat34.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat76 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat24.x * u_xlat76;
    u_xlat16_25.x = dot(u_xlat5.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat72 * u_xlat16_25.x;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat76 * u_xlat80;
    u_xlat76 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat80 / u_xlat76;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = u_xlat60 * u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat72 * u_xlat84;
    u_xlat16_25.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat24.x * u_xlat16_25.x;
    u_xlat18.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat77 * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat76 = u_xlat76 * u_xlat84;
    u_xlat16_25.x = u_xlat79 * u_xlat79;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat79 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat79 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat79 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat79);
    u_xlat42.xyz = vec3(u_xlat78) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = vec3(u_xlat76) * u_xlat42.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat42.xyz = min(max(u_xlat42.xyz, 0.0), 1.0);
#else
    u_xlat42.xyz = clamp(u_xlat42.xyz, 0.0, 1.0);
#endif
    u_xlat42.xyz = u_xlat42.xyz * _directSpecularColor.xyz;
    u_xlat42.xyz = u_xlat18.xxx * u_xlat42.xyz;
    u_xlat16_25.xyz = u_xlat42.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat13.xyz;
    u_xlat13.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_33 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat16_33 = max(u_xlat16_33, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat13.xyz;
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb76 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb76)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat34.xyz = u_xlat34.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat76 = dot(u_xlat34.xyz, u_xlat34.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat34.xyz = vec3(u_xlat76) * u_xlat34.xyz;
    u_xlat76 = dot(u_xlat8.xyz, u_xlat34.xyz);
    u_xlat79 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat72 * u_xlat79;
    u_xlat13.y = u_xlat24.x * u_xlat76;
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat34.xyz);
    u_xlat13.x = u_xlat72 * u_xlat16_1.x;
    u_xlat72 = dot(u_xlat6.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat76 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat72 * u_xlat80;
    u_xlat72 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat80 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat60 * u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat16_1.x = dot(u_xlat5.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat24.x * u_xlat16_1.x;
    u_xlat8.x = dot(u_xlat6.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x + u_xlat8.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = u_xlat77 * u_xlat24.x + 6.10351563e-05;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat72;
    u_xlat16_81 = u_xlat76 * u_xlat76;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_81 = u_xlat76 * u_xlat16_81;
    u_xlat16_83 = u_xlat76 * u_xlat16_81;
    u_xlat72 = (-u_xlat16_81) * u_xlat76 + 1.0;
    u_xlat32.xyz = u_xlat16_16.xyz * vec3(u_xlat72);
    u_xlat32.xyz = vec3(u_xlat78) * vec3(u_xlat16_83) + u_xlat32.xyz;
    u_xlat32.xyz = u_xlat24.xxx * u_xlat32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xyz = min(max(u_xlat32.xyz, 0.0), 1.0);
#else
    u_xlat32.xyz = clamp(u_xlat32.xyz, 0.0, 1.0);
#endif
    u_xlat32.xyz = u_xlat32.xyz * _directSpecularColor.xyz;
    u_xlat32.xyz = u_xlat8.xxx * u_xlat32.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat32.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat24.xz = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat24.xz = u_xlat24.xz * hlslcc_FragCoord.xy;
    u_xlat16_24 = texture(_ScreenSpaceOcclusionTexture, u_xlat24.xz).x;
    u_xlat16_73 = u_xlat16_24 * u_xlat16_3.z;
    u_xlat16_17.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat6.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_33 = inversesqrt(u_xlat16_33);
    u_xlat16_17.xyz = vec3(u_xlat16_33) * u_xlat16_17.xyz;
    u_xlat16_33 = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_33 * 0.5 + 0.5;
    u_xlat16_81 = (-u_xlat16_33) + u_xlat16_81;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_81 + u_xlat16_33;
    u_xlat16_33 = u_xlat16_44.z * u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 + -1.0;
    u_xlat16_81 = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat24.x = min(u_xlat16_33, 1.0);
    u_xlat72 = min(u_xlat24.x, u_xlat16_73);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat72) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat72) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat72) + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * vec3(u_xlat72) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_81) * u_xlat16_23.xyz;
    u_xlati72 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati72].xyz;
    u_xlati72 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati76 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati72].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati76].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_33 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_83 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_15.xyz = vec3(u_xlat16_83) * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb0 = u_xlat16_74>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_11.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_11.yzx + (-u_xlat7.xyz);
    u_xlat8.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + u_xlat5.xyz;
    u_xlat16_83 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_83 = abs(u_xlat16_74) * u_xlat16_83;
    u_xlat5.xyz = vec3(u_xlat16_83) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat5.xyz;
    u_xlat16_83 = dot((-u_xlat16_11.xyz), u_xlat5.xyz);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_83) + (-u_xlat16_11.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat5.xyz);
    u_xlat4.xyz = vec3(u_xlat16_57) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = abs(vec3(u_xlat16_74)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat48 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
    u_xlat16_44.y = u_xlat48 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_57;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_33) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb48 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb48)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_48.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_48.xxx + u_xlat16_48.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_74 = floor(u_xlat16_3.w);
    u_xlat16_9.x = u_xlat16_74 + 1.0;
    u_xlat16_9.x = min(u_xlat16_9.x, 15.0);
    u_xlat16_3.x = u_xlat16_9.x * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_3.x = u_xlat16_74 * 16.0 + u_xlat16_3.z;
    u_xlat16_9.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_72 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_74 = u_xlat16_9.z * 15.0 + (-u_xlat16_74);
    u_xlat16_9.x = (-u_xlat16_72) + u_xlat16_48.x;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_9.x + u_xlat16_72;
    u_xlat16_74 = u_xlat16_81 * u_xlat16_74;
    u_xlat0.x = u_xlat0.x * u_xlat16_74;
    u_xlat16_74 = u_xlat24.x * 0.5;
    u_xlat16_9.x = (-u_xlat24.x) * 0.5 + 1.0;
    u_xlat16_74 = u_xlat0.x * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_9.x = u_xlat16_74 + u_xlat16_74;
    u_xlat16_33 = (-u_xlat16_74) * 2.0 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_33 + u_xlat16_9.x;
    u_xlat16_74 = u_xlat24.x * u_xlat16_74;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_74);
    u_xlat16_9.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_13.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_13.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat4.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_72 = texture(_GlobalEffOutlineTex, u_xlat4.xy).x;
    u_xlat72 = (-u_xlat16_72) + 1.0;
    u_xlat72 = log2(u_xlat72);
    u_xlat72 = u_xlat72 * _FresnelPower;
    u_xlat72 = exp2(u_xlat72);
    u_xlat16_4.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat72) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_25.x;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(13) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(16) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
int u_xlati10;
bool u_xlatb10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
bvec4 u_xlatb21;
vec3 u_xlat22;
bvec4 u_xlatb22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_29;
vec3 u_xlat31;
mediump float u_xlat16_31;
ivec3 u_xlati31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
float u_xlat34;
mediump float u_xlat16_34;
mediump vec3 u_xlat16_45;
float u_xlat46;
vec2 u_xlat47;
bvec2 u_xlatb47;
bvec2 u_xlatb48;
mediump float u_xlat16_52;
vec2 u_xlat58;
vec2 u_xlat60;
int u_xlati60;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
vec2 u_xlat68;
ivec2 u_xlati68;
bool u_xlatb68;
float u_xlat75;
float u_xlat87;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
mediump float u_xlat16_89;
int u_xlati89;
bool u_xlatb89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_95;
bool u_xlatb95;
float u_xlat96;
mediump float u_xlat10_96;
int u_xlati96;
bool u_xlatb96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
float u_xlat100;
mediump float u_xlat16_101;
float u_xlat104;
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
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_88 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_90 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_90) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_90 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_91 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_12.xyz = vec3(u_xlat16_91) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb89 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat89 = (u_xlatb89) ? 1.0 : -1.0;
    u_xlat89 = u_xlat89 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(0.5<_anisoUse2U);
#else
    u_xlatb95 = 0.5<_anisoUse2U;
#endif
    u_xlat68.xy = (bool(u_xlatb95)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat68.xy = u_xlat68.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_95 = texture(_anisotropicMap, u_xlat68.xy).x;
    u_xlat95 = u_xlat16_95 * 2.0 + -1.0;
    u_xlat16_63 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_92 = u_xlat16_63 + -1.0;
    u_xlat95 = u_xlat95 * _sunShift + _sunShiftOffset;
    u_xlat95 = u_xlat95 + vs_TEXCOORD6;
    u_xlat96 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat96) + u_xlat0.xyz;
    u_xlat96 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat96 = inversesqrt(u_xlat96);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat96);
    u_xlat13.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat89) * u_xlat13.xyz;
    u_xlat16_93 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_14.xyz = vec3(u_xlat16_93) * vs_TEXCOORD1.yzx;
    u_xlat68.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat68.xy = u_xlat68.xy * hlslcc_FragCoord.xy;
    u_xlat16_89 = texture(_ScreenSpaceOcclusionTexture, u_xlat68.xy).x;
    u_xlat16_93 = u_xlat16_89 * u_xlat16_2.z;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_occlusionScale) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_94 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_15.xyz = vec3(u_xlat16_94) * u_xlat16_15.xyz;
    u_xlat16_94 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_94 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 + -1.0;
    u_xlat16_94 = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_99 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_99);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_61 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_34 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_34 = (-u_xlat16_61) + u_xlat16_34;
    u_xlat16_61 = u_xlat16_45.z * u_xlat16_34 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_45.z * u_xlat16_61;
    u_xlat16_61 = u_xlat16_94 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb31 = _ShadowBias.z!=0.0;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat60.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat60.x = inversesqrt(u_xlat60.x);
    u_xlat17.xyz = u_xlat60.xxx * u_xlat17.xyz;
    u_xlat60.x = dot(u_xlat8.xyz, u_xlat17.xyz);
    u_xlat60.x = (-u_xlat60.x) * u_xlat60.x + 1.0;
    u_xlat60.x = sqrt(u_xlat60.x);
    u_xlat60.x = u_xlat60.x * _ShadowBias.z;
    u_xlat17.xyz = (-u_xlat8.xyz) * u_xlat60.xxx + vs_TEXCOORD0.xyz;
    u_xlat31.xyz = (bool(u_xlatb31)) ? u_xlat17.xyz : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat31.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat31.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat31.zzzz + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat31.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat31.x = (-u_xlat31.x) + u_xlat17.z;
    u_xlat60.x = max((-u_xlat17.w), u_xlat31.x);
    u_xlat60.x = (-u_xlat31.x) + u_xlat60.x;
    u_xlat17.z = _ShadowBias.y * u_xlat60.x + u_xlat31.x;
    u_xlat31.xyz = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat31.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb31 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb31){
        u_xlat16_34 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat17.w<1.0);
#else
        u_xlatb31 = u_xlat17.w<1.0;
#endif
        if(u_xlatb31){
            u_xlat31.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat31.x = max(u_xlat31.x, 2.0);
            u_xlat31.x = min(u_xlat31.x, 30.0);
            u_xlat31.x = u_xlat31.x * _ShadowMapTexture_TexelSize.x;
            u_xlat68.xy = u_xlat17.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat89 = dot(u_xlat68.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat89 = fract(u_xlat89);
            u_xlat89 = u_xlat89 * 52.9829178;
            u_xlat89 = fract(u_xlat89);
            u_xlat89 = u_xlat89 * 6.28318548;
            u_xlat18.x = sin(u_xlat89);
            u_xlat19.x = cos(u_xlat89);
            u_xlat20 = u_xlat18.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.399062157, -0.768907249) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat47.y = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat89 = u_xlat17.w * 0.00200000009;
                u_xlat89 = max(u_xlat89, 0.000500000024);
                u_xlat89 = (-u_xlat89) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb89 = !!(u_xlat47.y<u_xlat89);
#else
                u_xlatb89 = u_xlat47.y<u_xlat89;
#endif
                u_xlat47.x = 1.0;
                u_xlat47.xy = bool(u_xlatb89) ? u_xlat47.xy : vec2(0.0, 0.0);
            } else {
                u_xlat47.x = float(0.0);
                u_xlat47.y = float(0.0);
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.929388702, 0.293877602) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.457714319, -0.879124641) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.276768446, 0.756483793) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat21.xy = u_xlat19.xx * vec2(0.443233252, 0.53742981) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.975115538, -0.4737342) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.418930233, 0.190901875) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.997065067, 0.914375901) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat21.xy = u_xlat19.xx * vec2(0.199841261, 0.143831611) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.78641367, -0.1410079) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati31.xz = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati31.xz = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati31.xz));
            u_xlati31.xz = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati31.xz));
            if(u_xlati31.x != 0) {
                u_xlat31.x = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat31.x<u_xlat96);
#else
                u_xlatb96 = u_xlat31.x<u_xlat96;
#endif
                u_xlat20.y = u_xlat31.x + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati31.z != 0) {
                u_xlat31.x = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat89 = u_xlat17.w * 0.00200000009;
                u_xlat89 = max(u_xlat89, 0.000500000024);
                u_xlat89 = (-u_xlat89) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb89 = !!(u_xlat31.x<u_xlat89);
#else
                u_xlatb89 = u_xlat31.x<u_xlat89;
#endif
                u_xlat20.y = u_xlat31.x + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb89)) ? u_xlat20.xy : u_xlat47.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb31 = !!(0.0<u_xlat47.x);
#else
            u_xlatb31 = 0.0<u_xlat47.x;
#endif
            u_xlat89 = u_xlat47.y / u_xlat47.x;
            u_xlat89 = u_xlatb31 ? u_xlat89 : float(0.0);
            u_xlat89 = (-u_xlat89) + u_xlat17.w;
            u_xlat89 = u_xlat89 * _PCSSLightSize;
            u_xlat60.x = max(u_xlat31.y, u_xlat89);
            u_xlat60.x = max(u_xlat60.x, 1.0);
            u_xlat60.x = min(u_xlat60.x, 20.0);
            u_xlat31.x = (u_xlatb31) ? u_xlat60.x : 1.0;
            u_xlat31.x = u_xlat31.x * _ShadowMapTexture_TexelSize.x;
            u_xlati60 = max(_PCSSSampleCount, 4);
            u_xlati60 = min(u_xlati60, 16);
            u_xlat16_23.x = float(0.0);
            u_xlat16_52 = float(0.0);
            u_xlati89 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlati89>=16);
#else
                u_xlatb96 = u_xlati89>=16;
#endif
                if(u_xlatb96){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlati89<u_xlati60);
#else
                u_xlatb96 = u_xlati89<u_xlati60;
#endif
                if(u_xlatb96){
                    u_xlat68.xy = u_xlat18.xx * ImmCB_0[u_xlati89].yx;
                    u_xlat20.x = ImmCB_0[u_xlati89].x * u_xlat19.x + (-u_xlat68.x);
                    u_xlat20.y = ImmCB_0[u_xlati89].y * u_xlat19.x + u_xlat68.y;
                    u_xlat68.xy = u_xlat20.xy * u_xlat31.xx + u_xlat17.xy;
                    u_xlatb47.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat68.xyxx).xy;
                    u_xlatb48.xy = lessThan(u_xlat68.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb96 = u_xlatb47.x && u_xlatb48.x;
                    u_xlatb96 = u_xlatb47.y && u_xlatb96;
                    u_xlatb96 = u_xlatb48.y && u_xlatb96;
                    if(!u_xlatb96){
                        u_xlati96 = u_xlati89 + 1;
                        u_xlati89 = u_xlati96;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat68.xy,u_xlat17.w);
                    u_xlat10_96 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_23.x = u_xlat10_96 + u_xlat16_23.x;
                    u_xlat16_52 = u_xlat16_52 + 1.0;
                }
                u_xlati89 = u_xlati89 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb31 = !!(0.0<u_xlat16_52);
#else
            u_xlatb31 = 0.0<u_xlat16_52;
#endif
            u_xlat16_99 = u_xlat16_23.x / u_xlat16_52;
            u_xlat60.xy = (-u_xlat17.xy) + vec2(1.0, 1.0);
            u_xlat60.xy = min(u_xlat60.xy, u_xlat17.xy);
            u_xlat60.x = min(u_xlat60.y, u_xlat60.x);
            u_xlat60.x = u_xlat60.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat60.x = min(max(u_xlat60.x, 0.0), 1.0);
#else
            u_xlat60.x = clamp(u_xlat60.x, 0.0, 1.0);
#endif
            u_xlat89 = u_xlat16_99 + -1.0;
            u_xlat31.x = u_xlatb31 ? u_xlat89 : float(0.0);
            u_xlat31.x = u_xlat60.x * u_xlat31.x + 1.0;
            u_xlat16_31 = u_xlat31.x;
        } else {
            u_xlat16_31 = 1.0;
        }
        u_xlat16_99 = (-u_xlat16_34) + 1.0;
        u_xlat16_34 = u_xlat16_31 * u_xlat16_99 + u_xlat16_34;
        u_xlat34 = u_xlat16_34;
    } else {
        u_xlat16_99 = (-_ShadowBias.w) + 1.0;
        u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat18.z = 0.0;
        u_xlat18.xyz = u_xlat17.xyw + u_xlat18.xyz;
        vec3 txVec1 = vec3(u_xlat18.xy,u_xlat18.z);
        u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat19.z = 0.0;
        u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
        vec3 txVec2 = vec3(u_xlat19.xy,u_xlat19.z);
        u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat19.z = 0.0;
        u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
        vec3 txVec3 = vec3(u_xlat19.xy,u_xlat19.z);
        u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat19.z = 0.0;
        u_xlat17.xyz = u_xlat17.xyw + u_xlat19.xyz;
        vec3 txVec4 = vec3(u_xlat17.xy,u_xlat17.z);
        u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat96 = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat68.x = (-u_xlat16_99) + 1.0;
        u_xlat34 = u_xlat96 * u_xlat68.x + u_xlat16_99;
    }
    u_xlat96 = (-u_xlat34) + 1.0;
    u_xlat96 = (-u_xlat96) * u_xlat16_90 + 1.0;
    u_xlat96 = max(u_xlat96, 0.0);
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_91) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat68.x = inversesqrt(u_xlat68.x);
    u_xlat17.xyz = u_xlat68.xxx * u_xlat17.xyz;
    u_xlat68.x = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68.x = min(max(u_xlat68.x, 0.0), 1.0);
#else
    u_xlat68.x = clamp(u_xlat68.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat95) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = inversesqrt(u_xlat97);
    u_xlat20.xyz = vec3(u_xlat97) * u_xlat20.xyz;
    u_xlat97 = u_xlat16_63 * u_xlat16_3.x;
    u_xlat97 = max(u_xlat97, 0.00100000005);
    u_xlat98 = (-u_xlat16_92) + 1.0;
    u_xlat98 = u_xlat16_3.x * u_xlat98;
    u_xlat98 = max(u_xlat98, 0.00100000005);
    u_xlat16_99 = dot(u_xlat0.zxy, u_xlat17.xyz);
    u_xlat100 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_101 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat46 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat75 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat104 = u_xlat97 * u_xlat98;
    u_xlat21.x = u_xlat98 * u_xlat16_99;
    u_xlat21.y = u_xlat97 * u_xlat17.x;
    u_xlat21.z = u_xlat68.x * u_xlat104;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = max(u_xlat68.x, 6.10351563e-05);
    u_xlat17.x = u_xlat104 * 0.318309873;
    u_xlat68.x = u_xlat104 / u_xlat68.x;
    u_xlat68.x = u_xlat68.x * u_xlat68.x;
    u_xlat68.x = u_xlat17.x * u_xlat68.x;
    u_xlat68.x = min(u_xlat68.x, 16.0);
    u_xlat19.y = u_xlat97 * u_xlat100;
    u_xlat19.z = u_xlat98 * u_xlat46;
    u_xlat100 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat19.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat18.y = u_xlat97 * u_xlat16_101;
    u_xlat18.z = u_xlat98 * u_xlat75;
    u_xlat46 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat18.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat100 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat75 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat75 * u_xlat75;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_99 = u_xlat75 * u_xlat16_90;
    u_xlat47.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.x = min(max(u_xlat47.x, 0.0), 1.0);
#else
    u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_90) * u_xlat75 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat75);
    u_xlat21.xyz = u_xlat47.xxx * vec3(u_xlat16_99) + u_xlat21.xyz;
    u_xlat16_23.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = vec3(u_xlat96) * u_xlat16_23.xyz + _shadowColor.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat68.x = u_xlat68.x * u_xlat46;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat68.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat18.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.z = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_32.xz = max(u_xlat16_32.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_99 = inversesqrt(u_xlat16_32.z);
    u_xlat16_25.xyz = vec3(u_xlat16_99) * u_xlat22.xyz;
    u_xlat16_26.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_99 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat16_101 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_25.xyz);
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 * u_xlat16_101;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_101);
    u_xlat16_101 = float(1.0) / float(u_xlat16_32.z);
    u_xlat16_90 = u_xlat16_32.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_101;
    u_xlat16_90 = max(u_xlat16_26.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_99 * u_xlat16_90;
    u_xlat16_26.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat11.xyz * vec3(u_xlat16_91) + u_xlat16_25.xyz;
    u_xlat68.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat68.x = inversesqrt(u_xlat68.x);
    u_xlat22.xyz = u_xlat68.xxx * u_xlat22.xyz;
    u_xlat68.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68.x = min(max(u_xlat68.x, 0.0), 1.0);
#else
    u_xlat68.x = clamp(u_xlat68.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_25.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_99 = dot(u_xlat0.zxy, u_xlat22.xyz);
    u_xlat16_101 = dot(u_xlat0.zxy, u_xlat16_25.xyz);
    u_xlat46 = dot(u_xlat20.xyz, u_xlat22.xyz);
    u_xlat75 = dot(u_xlat20.xyz, u_xlat16_25.xyz);
    u_xlat22.x = u_xlat98 * u_xlat16_99;
    u_xlat22.y = u_xlat97 * u_xlat46;
    u_xlat22.z = u_xlat68.x * u_xlat104;
    u_xlat68.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat68.x = max(u_xlat68.x, 6.10351563e-05);
    u_xlat68.x = u_xlat104 / u_xlat68.x;
    u_xlat68.x = u_xlat68.x * u_xlat68.x;
    u_xlat68.x = u_xlat17.x * u_xlat68.x;
    u_xlat68.x = min(u_xlat68.x, 16.0);
    u_xlat28.y = u_xlat97 * u_xlat16_101;
    u_xlat28.z = u_xlat98 * u_xlat75;
    u_xlat46 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat28.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat100 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat75 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat75 * u_xlat75;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_99 = u_xlat75 * u_xlat16_90;
    u_xlat75 = (-u_xlat16_90) * u_xlat75 + 1.0;
    u_xlat22.xyz = u_xlat16_1.xyz * vec3(u_xlat75);
    u_xlat22.xyz = u_xlat47.xxx * vec3(u_xlat16_99) + u_xlat22.xyz;
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat68.x = u_xlat68.x * u_xlat46;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat68.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xyz = min(max(u_xlat22.xyz, 0.0), 1.0);
#else
    u_xlat22.xyz = clamp(u_xlat22.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = u_xlat28.xxx * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_26.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat10.xxx * u_xlat22.xyz;
    u_xlat16_23.xyz = u_xlat21.xyz * u_xlat16_23.xyz + u_xlat22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat18.xxx + u_xlat16_25.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb10 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat18.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat18.xzw, u_xlat18.xzw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_99 = inversesqrt(u_xlat16_90);
    u_xlat16_25.xyz = vec3(u_xlat16_99) * u_xlat18.xzw;
    u_xlat16_26.xy = (bool(u_xlatb10)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb10 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_99 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_101 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 * u_xlat16_101;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_101);
    u_xlat16_101 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_101;
    u_xlat16_90 = max(u_xlat16_26.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_99 * u_xlat16_90;
    u_xlat16_26.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_91) + u_xlat16_25.xyz;
    u_xlat10.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_25.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_99 = dot(u_xlat0.zxy, u_xlat16_25.xyz);
    u_xlat68.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_25.xyz);
    u_xlat20.x = u_xlat16_91 * u_xlat98;
    u_xlat20.y = u_xlat68.x * u_xlat97;
    u_xlat20.z = u_xlat10.x * u_xlat104;
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat104 / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat17.x * u_xlat10.x;
    u_xlat10.x = min(u_xlat10.x, 16.0);
    u_xlat21.y = u_xlat97 * u_xlat16_99;
    u_xlat21.z = u_xlat11.x * u_xlat98;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = sqrt(u_xlat68.x);
    u_xlat68.x = u_xlat68.x + u_xlat21.x;
    u_xlat68.x = u_xlat68.x + 6.10351563e-05;
    u_xlat68.x = u_xlat100 * u_xlat68.x + 6.10351563e-05;
    u_xlat68.x = float(1.0) / u_xlat68.x;
    u_xlat97 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat97 * u_xlat97;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_91 = u_xlat97 * u_xlat16_90;
    u_xlat97 = (-u_xlat16_90) * u_xlat97 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat11.xyz = u_xlat47.xxx * vec3(u_xlat16_91) + u_xlat11.xyz;
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.yyy * u_xlat16_25.xyz;
    u_xlat10.x = u_xlat68.x * u_xlat10.x;
    u_xlat10.xzw = u_xlat11.xyz * u_xlat10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_26.xyz * u_xlat10.xzw;
    u_xlat16_23.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_25.xyz * u_xlat21.xxx + u_xlat16_24.xyz;
    u_xlat96 = u_xlat96 + -1.0;
    u_xlat10.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat96) + vec2(1.0, 1.0);
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_25.y = u_xlat16_15.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati96 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat10.xy = min(vec2(u_xlat16_61), u_xlat10.xy);
    u_xlat10.x = min(u_xlat16_93, u_xlat10.x);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat10.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat10.xxx * u_xlat16_26.xyz;
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = u_xlat10.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat10.xxx * u_xlat16_27.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat10.xxx + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_27.xyz * u_xlat10.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_94) * u_xlat16_25.xyz;
    u_xlati10 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_27.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati10].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati96].xyz + u_xlat16_27.xyz;
    u_xlati96 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati96].xyz + u_xlat16_25.xyw;
    u_xlat16_27.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat10.xzw = vec3(u_xlat95) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat95 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat10.xzw = vec3(u_xlat95) * u_xlat10.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(u_xlat16_92>=0.0);
#else
    u_xlatb95 = u_xlat16_92>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb95)) ? u_xlat10.xzw : u_xlat0.xyz;
    u_xlat10.xzw = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xzw = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xzw);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xzw;
    u_xlat0.xyz = u_xlat10.wxz * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(u_xlat16_92);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat95 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat95);
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_32.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xzw = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_92)) * u_xlat10.xzw + u_xlat9.xyz;
    u_xlat16_3.x = -abs(u_xlat16_92) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_45.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_2.w);
    u_xlat16_61 = u_xlat16_32.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_90 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.y;
    u_xlat16_12.x = u_xlat16_61 * 16.0 + u_xlat16_2.y;
    u_xlat16_32.xy = u_xlat16_2.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_2.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_29;
    u_xlat16_32.x = u_xlat16_90 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_94 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat10.y * 0.5;
    u_xlat16_61 = (-u_xlat10.y) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_61 + u_xlat16_32.x;
    u_xlat16_61 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_90 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_90 + u_xlat16_61;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat10.y;
    u_xlat16_32.x = min(u_xlat16_32.x, u_xlat16_93);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_91 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_91);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat19.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_23.xyz;
    u_xlat16_90 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_90 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_90 : u_xlat16_88;
    u_xlat16_12.xyz = u_xlat16_23.xyz + u_xlat16_24.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat58.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat58.xy = u_xlat58.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_2 = texture(_FlowLightTex, u_xlat58.xy);
    u_xlat16_0.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_9.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_87 = texture(_GlobalEffOutlineTex, u_xlat8.xy).x;
    u_xlat87 = (-u_xlat16_87) + 1.0;
    u_xlat87 = log2(u_xlat87);
    u_xlat87 = u_xlat87 * _FresnelPower;
    u_xlat87 = exp2(u_xlat87);
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(u_xlat87);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(13) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(16) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
int u_xlati10;
bool u_xlatb10;
vec3 u_xlat11;
ivec3 u_xlati11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec4 u_xlat17;
vec4 u_xlat18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
bvec4 u_xlatb21;
vec3 u_xlat22;
bvec4 u_xlatb22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_29;
vec3 u_xlat31;
mediump float u_xlat16_31;
ivec3 u_xlati31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
float u_xlat34;
mediump float u_xlat16_34;
mediump vec3 u_xlat16_45;
float u_xlat46;
vec2 u_xlat47;
bvec2 u_xlatb47;
bvec2 u_xlatb48;
mediump float u_xlat16_52;
vec2 u_xlat58;
vec2 u_xlat60;
int u_xlati60;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
vec2 u_xlat68;
ivec2 u_xlati68;
bool u_xlatb68;
float u_xlat75;
float u_xlat87;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
mediump float u_xlat16_89;
int u_xlati89;
bool u_xlatb89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_95;
bool u_xlatb95;
float u_xlat96;
mediump float u_xlat10_96;
int u_xlati96;
bool u_xlatb96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
float u_xlat100;
mediump float u_xlat16_101;
float u_xlat104;
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
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_88 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_90 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_90) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_90 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_91 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_12.xyz = vec3(u_xlat16_91) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb89 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat89 = (u_xlatb89) ? 1.0 : -1.0;
    u_xlat89 = u_xlat89 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(0.5<_anisoUse2U);
#else
    u_xlatb95 = 0.5<_anisoUse2U;
#endif
    u_xlat68.xy = (bool(u_xlatb95)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat68.xy = u_xlat68.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_95 = texture(_anisotropicMap, u_xlat68.xy).x;
    u_xlat95 = u_xlat16_95 * 2.0 + -1.0;
    u_xlat16_63 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_92 = u_xlat16_63 + -1.0;
    u_xlat95 = u_xlat95 * _sunShift + _sunShiftOffset;
    u_xlat95 = u_xlat95 + vs_TEXCOORD6;
    u_xlat96 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat96) + u_xlat0.xyz;
    u_xlat96 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat96 = inversesqrt(u_xlat96);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat96);
    u_xlat13.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat13.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat89) * u_xlat13.xyz;
    u_xlat16_93 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_93 = inversesqrt(u_xlat16_93);
    u_xlat16_14.xyz = vec3(u_xlat16_93) * vs_TEXCOORD1.yzx;
    u_xlat68.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat68.xy = u_xlat68.xy * hlslcc_FragCoord.xy;
    u_xlat16_89 = texture(_ScreenSpaceOcclusionTexture, u_xlat68.xy).x;
    u_xlat16_93 = u_xlat16_89 * u_xlat16_2.z;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_occlusionScale) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_94 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_15.xyz = vec3(u_xlat16_94) * u_xlat16_15.xyz;
    u_xlat16_94 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_94 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 + -1.0;
    u_xlat16_94 = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_99 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_99);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_61 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_34 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_34 = (-u_xlat16_61) + u_xlat16_34;
    u_xlat16_61 = u_xlat16_45.z * u_xlat16_34 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_45.z * u_xlat16_61;
    u_xlat16_61 = u_xlat16_94 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb31 = _ShadowBias.z!=0.0;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat60.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat60.x = inversesqrt(u_xlat60.x);
    u_xlat17.xyz = u_xlat60.xxx * u_xlat17.xyz;
    u_xlat60.x = dot(u_xlat8.xyz, u_xlat17.xyz);
    u_xlat60.x = (-u_xlat60.x) * u_xlat60.x + 1.0;
    u_xlat60.x = sqrt(u_xlat60.x);
    u_xlat60.x = u_xlat60.x * _ShadowBias.z;
    u_xlat17.xyz = (-u_xlat8.xyz) * u_xlat60.xxx + vs_TEXCOORD0.xyz;
    u_xlat31.xyz = (bool(u_xlatb31)) ? u_xlat17.xyz : vs_TEXCOORD0.xyz;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat17;
    u_xlat17 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat17;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat18;
    u_xlat18 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat18;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat19;
    u_xlat19 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat19;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat20;
    u_xlat18 = u_xlat31.yyyy * u_xlat18;
    u_xlat17 = u_xlat17 * u_xlat31.xxxx + u_xlat18;
    u_xlat17 = u_xlat19 * u_xlat31.zzzz + u_xlat17;
    u_xlat17 = u_xlat20 + u_xlat17;
    u_xlat31.x = _ShadowBias.x / u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat31.x = (-u_xlat31.x) + u_xlat17.z;
    u_xlat60.x = max((-u_xlat17.w), u_xlat31.x);
    u_xlat60.x = (-u_xlat31.x) + u_xlat60.x;
    u_xlat17.z = _ShadowBias.y * u_xlat60.x + u_xlat31.x;
    u_xlat31.xyz = u_xlat17.xyz / u_xlat17.www;
    u_xlat17.xyz = u_xlat31.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat17.w = max(u_xlat17.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb31 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb31){
        u_xlat16_34 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat17.w<1.0);
#else
        u_xlatb31 = u_xlat17.w<1.0;
#endif
        if(u_xlatb31){
            u_xlat31.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat31.x = max(u_xlat31.x, 2.0);
            u_xlat31.x = min(u_xlat31.x, 30.0);
            u_xlat31.x = u_xlat31.x * _ShadowMapTexture_TexelSize.x;
            u_xlat68.xy = u_xlat17.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat89 = dot(u_xlat68.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat89 = fract(u_xlat89);
            u_xlat89 = u_xlat89 * 52.9829178;
            u_xlat89 = fract(u_xlat89);
            u_xlat89 = u_xlat89 * 6.28318548;
            u_xlat18.x = sin(u_xlat89);
            u_xlat19.x = cos(u_xlat89);
            u_xlat20 = u_xlat18.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.399062157, -0.768907249) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat47.y = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat89 = u_xlat17.w * 0.00200000009;
                u_xlat89 = max(u_xlat89, 0.000500000024);
                u_xlat89 = (-u_xlat89) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb89 = !!(u_xlat47.y<u_xlat89);
#else
                u_xlatb89 = u_xlat47.y<u_xlat89;
#endif
                u_xlat47.x = 1.0;
                u_xlat47.xy = bool(u_xlatb89) ? u_xlat47.xy : vec2(0.0, 0.0);
            } else {
                u_xlat47.x = float(0.0);
                u_xlat47.y = float(0.0);
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.929388702, 0.293877602) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.457714319, -0.879124641) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.276768446, 0.756483793) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat21.xy = u_xlat19.xx * vec2(0.443233252, 0.53742981) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.975115538, -0.4737342) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(-0.418930233, 0.190901875) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat21.xy = u_xlat19.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.997065067, 0.914375901) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati68.xy = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati68.xy = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            u_xlati68.xy = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati68.xy));
            if(u_xlati68.x != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati68.y != 0) {
                u_xlat89 = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat89<u_xlat96);
#else
                u_xlatb96 = u_xlat89<u_xlat96;
#endif
                u_xlat20.y = u_xlat89 + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            u_xlat20 = u_xlat18.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat21.xy = u_xlat19.xx * vec2(0.199841261, 0.143831611) + (-u_xlat20.xz);
            u_xlat21.zw = u_xlat19.xx * vec2(0.78641367, -0.1410079) + u_xlat20.yw;
            u_xlat20 = u_xlat21.xzyw * u_xlat31.xxxx + u_xlat17.xyxy;
            u_xlatb21 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat20);
            u_xlatb22 = lessThan(u_xlat20, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati31.xz = ivec2(uvec2((uint(u_xlatb21.x) * 0xffffffffu) & (uint(u_xlatb22.x) * 0xffffffffu), (uint(u_xlatb21.z) * 0xffffffffu) & (uint(u_xlatb22.z) * 0xffffffffu)));
            u_xlati31.xz = ivec2((uvec2(u_xlatb21.yw) * 0xFFFFFFFFu) & uvec2(u_xlati31.xz));
            u_xlati31.xz = ivec2((uvec2(u_xlatb22.yw) * 0xFFFFFFFFu) & uvec2(u_xlati31.xz));
            if(u_xlati31.x != 0) {
                u_xlat31.x = texture(_ShadowMapDepth, u_xlat20.xy).x;
                u_xlat96 = u_xlat17.w * 0.00200000009;
                u_xlat96 = max(u_xlat96, 0.000500000024);
                u_xlat96 = (-u_xlat96) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlat31.x<u_xlat96);
#else
                u_xlatb96 = u_xlat31.x<u_xlat96;
#endif
                u_xlat20.y = u_xlat31.x + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb96)) ? u_xlat20.xy : u_xlat47.xy;
            }
            if(u_xlati31.z != 0) {
                u_xlat31.x = texture(_ShadowMapDepth, u_xlat20.zw).x;
                u_xlat89 = u_xlat17.w * 0.00200000009;
                u_xlat89 = max(u_xlat89, 0.000500000024);
                u_xlat89 = (-u_xlat89) + u_xlat17.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb89 = !!(u_xlat31.x<u_xlat89);
#else
                u_xlatb89 = u_xlat31.x<u_xlat89;
#endif
                u_xlat20.y = u_xlat31.x + u_xlat47.y;
                u_xlat20.x = u_xlat47.x + 1.0;
                u_xlat47.xy = (bool(u_xlatb89)) ? u_xlat20.xy : u_xlat47.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb31 = !!(0.0<u_xlat47.x);
#else
            u_xlatb31 = 0.0<u_xlat47.x;
#endif
            u_xlat89 = u_xlat47.y / u_xlat47.x;
            u_xlat89 = u_xlatb31 ? u_xlat89 : float(0.0);
            u_xlat89 = (-u_xlat89) + u_xlat17.w;
            u_xlat89 = u_xlat89 * _PCSSLightSize;
            u_xlat60.x = max(u_xlat31.y, u_xlat89);
            u_xlat60.x = max(u_xlat60.x, 1.0);
            u_xlat60.x = min(u_xlat60.x, 20.0);
            u_xlat31.x = (u_xlatb31) ? u_xlat60.x : 1.0;
            u_xlat31.x = u_xlat31.x * _ShadowMapTexture_TexelSize.x;
            u_xlati60 = max(_PCSSSampleCount, 4);
            u_xlati60 = min(u_xlati60, 16);
            u_xlat16_23.x = float(0.0);
            u_xlat16_52 = float(0.0);
            u_xlati89 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlati89>=16);
#else
                u_xlatb96 = u_xlati89>=16;
#endif
                if(u_xlatb96){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb96 = !!(u_xlati89<u_xlati60);
#else
                u_xlatb96 = u_xlati89<u_xlati60;
#endif
                if(u_xlatb96){
                    u_xlat68.xy = u_xlat18.xx * ImmCB_0[u_xlati89].yx;
                    u_xlat20.x = ImmCB_0[u_xlati89].x * u_xlat19.x + (-u_xlat68.x);
                    u_xlat20.y = ImmCB_0[u_xlati89].y * u_xlat19.x + u_xlat68.y;
                    u_xlat68.xy = u_xlat20.xy * u_xlat31.xx + u_xlat17.xy;
                    u_xlatb47.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat68.xyxx).xy;
                    u_xlatb48.xy = lessThan(u_xlat68.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb96 = u_xlatb47.x && u_xlatb48.x;
                    u_xlatb96 = u_xlatb47.y && u_xlatb96;
                    u_xlatb96 = u_xlatb48.y && u_xlatb96;
                    if(!u_xlatb96){
                        u_xlati96 = u_xlati89 + 1;
                        u_xlati89 = u_xlati96;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat68.xy,u_xlat17.w);
                    u_xlat10_96 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_23.x = u_xlat10_96 + u_xlat16_23.x;
                    u_xlat16_52 = u_xlat16_52 + 1.0;
                }
                u_xlati89 = u_xlati89 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb31 = !!(0.0<u_xlat16_52);
#else
            u_xlatb31 = 0.0<u_xlat16_52;
#endif
            u_xlat16_99 = u_xlat16_23.x / u_xlat16_52;
            u_xlat60.xy = (-u_xlat17.xy) + vec2(1.0, 1.0);
            u_xlat60.xy = min(u_xlat60.xy, u_xlat17.xy);
            u_xlat60.x = min(u_xlat60.y, u_xlat60.x);
            u_xlat60.x = u_xlat60.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat60.x = min(max(u_xlat60.x, 0.0), 1.0);
#else
            u_xlat60.x = clamp(u_xlat60.x, 0.0, 1.0);
#endif
            u_xlat89 = u_xlat16_99 + -1.0;
            u_xlat31.x = u_xlatb31 ? u_xlat89 : float(0.0);
            u_xlat31.x = u_xlat60.x * u_xlat31.x + 1.0;
            u_xlat16_31 = u_xlat31.x;
        } else {
            u_xlat16_31 = 1.0;
        }
        u_xlat16_99 = (-u_xlat16_34) + 1.0;
        u_xlat16_34 = u_xlat16_31 * u_xlat16_99 + u_xlat16_34;
        u_xlat34 = u_xlat16_34;
    } else {
        u_xlat16_99 = (-_ShadowBias.w) + 1.0;
        u_xlat18.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat18.z = 0.0;
        u_xlat18.xyz = u_xlat17.xyw + u_xlat18.xyz;
        vec3 txVec1 = vec3(u_xlat18.xy,u_xlat18.z);
        u_xlat18.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat19.z = 0.0;
        u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
        vec3 txVec2 = vec3(u_xlat19.xy,u_xlat19.z);
        u_xlat18.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat19.z = 0.0;
        u_xlat19.xyz = u_xlat17.xyw + u_xlat19.xyz;
        vec3 txVec3 = vec3(u_xlat19.xy,u_xlat19.z);
        u_xlat18.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat19.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat19.z = 0.0;
        u_xlat17.xyz = u_xlat17.xyw + u_xlat19.xyz;
        vec3 txVec4 = vec3(u_xlat17.xy,u_xlat17.z);
        u_xlat18.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat96 = dot(u_xlat18, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat68.x = (-u_xlat16_99) + 1.0;
        u_xlat34 = u_xlat96 * u_xlat68.x + u_xlat16_99;
    }
    u_xlat96 = (-u_xlat34) + 1.0;
    u_xlat96 = (-u_xlat96) * u_xlat16_90 + 1.0;
    u_xlat96 = max(u_xlat96, 0.0);
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_91) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat68.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat68.x = inversesqrt(u_xlat68.x);
    u_xlat17.xyz = u_xlat68.xxx * u_xlat17.xyz;
    u_xlat68.x = dot(u_xlat8.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68.x = min(max(u_xlat68.x, 0.0), 1.0);
#else
    u_xlat68.x = clamp(u_xlat68.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.xyz = vec3(u_xlat95) * u_xlat8.xyz + u_xlat13.zxy;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = inversesqrt(u_xlat97);
    u_xlat20.xyz = vec3(u_xlat97) * u_xlat20.xyz;
    u_xlat97 = u_xlat16_63 * u_xlat16_3.x;
    u_xlat97 = max(u_xlat97, 0.00100000005);
    u_xlat98 = (-u_xlat16_92) + 1.0;
    u_xlat98 = u_xlat16_3.x * u_xlat98;
    u_xlat98 = max(u_xlat98, 0.00100000005);
    u_xlat16_99 = dot(u_xlat0.zxy, u_xlat17.xyz);
    u_xlat100 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_101 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat17.x = dot(u_xlat20.xyz, u_xlat17.xyz);
    u_xlat46 = dot(u_xlat20.xyz, u_xlat16_12.xyz);
    u_xlat75 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat104 = u_xlat97 * u_xlat98;
    u_xlat21.x = u_xlat98 * u_xlat16_99;
    u_xlat21.y = u_xlat97 * u_xlat17.x;
    u_xlat21.z = u_xlat68.x * u_xlat104;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = max(u_xlat68.x, 6.10351563e-05);
    u_xlat17.x = u_xlat104 * 0.318309873;
    u_xlat68.x = u_xlat104 / u_xlat68.x;
    u_xlat68.x = u_xlat68.x * u_xlat68.x;
    u_xlat68.x = u_xlat17.x * u_xlat68.x;
    u_xlat68.x = min(u_xlat68.x, 16.0);
    u_xlat19.y = u_xlat97 * u_xlat100;
    u_xlat19.z = u_xlat98 * u_xlat46;
    u_xlat100 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat19.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat18.y = u_xlat97 * u_xlat16_101;
    u_xlat18.z = u_xlat98 * u_xlat75;
    u_xlat46 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat18.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat100 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat75 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat75 * u_xlat75;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_99 = u_xlat75 * u_xlat16_90;
    u_xlat47.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.x = min(max(u_xlat47.x, 0.0), 1.0);
#else
    u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_90) * u_xlat75 + 1.0;
    u_xlat21.xyz = u_xlat16_1.xyz * vec3(u_xlat75);
    u_xlat21.xyz = u_xlat47.xxx * vec3(u_xlat16_99) + u_xlat21.xyz;
    u_xlat16_23.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = vec3(u_xlat96) * u_xlat16_23.xyz + _shadowColor.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat68.x = u_xlat68.x * u_xlat46;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat68.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat18.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb68 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.z = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_32.xz = max(u_xlat16_32.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_99 = inversesqrt(u_xlat16_32.z);
    u_xlat16_25.xyz = vec3(u_xlat16_99) * u_xlat22.xyz;
    u_xlat16_26.xy = (bool(u_xlatb68)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb68 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_99 = (u_xlatb68) ? 1.0 : 0.0;
    u_xlat16_101 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_25.xyz);
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 * u_xlat16_101;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_101);
    u_xlat16_101 = float(1.0) / float(u_xlat16_32.z);
    u_xlat16_90 = u_xlat16_32.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_101;
    u_xlat16_90 = max(u_xlat16_26.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_99 * u_xlat16_90;
    u_xlat16_26.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat11.xyz * vec3(u_xlat16_91) + u_xlat16_25.xyz;
    u_xlat68.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat68.x = inversesqrt(u_xlat68.x);
    u_xlat22.xyz = u_xlat68.xxx * u_xlat22.xyz;
    u_xlat68.x = dot(u_xlat8.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68.x = min(max(u_xlat68.x, 0.0), 1.0);
#else
    u_xlat68.x = clamp(u_xlat68.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_25.xyz, u_xlat22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_99 = dot(u_xlat0.zxy, u_xlat22.xyz);
    u_xlat16_101 = dot(u_xlat0.zxy, u_xlat16_25.xyz);
    u_xlat46 = dot(u_xlat20.xyz, u_xlat22.xyz);
    u_xlat75 = dot(u_xlat20.xyz, u_xlat16_25.xyz);
    u_xlat22.x = u_xlat98 * u_xlat16_99;
    u_xlat22.y = u_xlat97 * u_xlat46;
    u_xlat22.z = u_xlat68.x * u_xlat104;
    u_xlat68.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat68.x = max(u_xlat68.x, 6.10351563e-05);
    u_xlat68.x = u_xlat104 / u_xlat68.x;
    u_xlat68.x = u_xlat68.x * u_xlat68.x;
    u_xlat68.x = u_xlat17.x * u_xlat68.x;
    u_xlat68.x = min(u_xlat68.x, 16.0);
    u_xlat28.y = u_xlat97 * u_xlat16_101;
    u_xlat28.z = u_xlat98 * u_xlat75;
    u_xlat46 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat46 = sqrt(u_xlat46);
    u_xlat46 = u_xlat46 + u_xlat28.x;
    u_xlat46 = u_xlat46 + 6.10351563e-05;
    u_xlat46 = u_xlat100 * u_xlat46 + 6.10351563e-05;
    u_xlat46 = float(1.0) / u_xlat46;
    u_xlat75 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat75 * u_xlat75;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_90 = u_xlat75 * u_xlat16_90;
    u_xlat16_99 = u_xlat75 * u_xlat16_90;
    u_xlat75 = (-u_xlat16_90) * u_xlat75 + 1.0;
    u_xlat22.xyz = u_xlat16_1.xyz * vec3(u_xlat75);
    u_xlat22.xyz = u_xlat47.xxx * vec3(u_xlat16_99) + u_xlat22.xyz;
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat28.xxx * u_xlat16_25.xyz;
    u_xlat68.x = u_xlat68.x * u_xlat46;
    u_xlat22.xyz = u_xlat22.xyz * u_xlat68.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xyz = min(max(u_xlat22.xyz, 0.0), 1.0);
#else
    u_xlat22.xyz = clamp(u_xlat22.xyz, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat22.xyz * _directSpecularColor.xyz;
    u_xlat22.xyz = u_xlat28.xxx * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_26.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat10.xxx * u_xlat22.xyz;
    u_xlat16_23.xyz = u_xlat21.xyz * u_xlat16_23.xyz + u_xlat22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat18.xxx + u_xlat16_25.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb10 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat18.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat18.xzw, u_xlat18.xzw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_99 = inversesqrt(u_xlat16_90);
    u_xlat16_25.xyz = vec3(u_xlat16_99) * u_xlat18.xzw;
    u_xlat16_26.xy = (bool(u_xlatb10)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb10 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_99 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_101 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_101 = u_xlat16_101 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 * u_xlat16_101;
    u_xlat16_99 = max(u_xlat16_99, u_xlat16_101);
    u_xlat16_101 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_101;
    u_xlat16_90 = max(u_xlat16_26.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_99 * u_xlat16_90;
    u_xlat16_26.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_91) + u_xlat16_25.xyz;
    u_xlat10.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat11.xyz = u_xlat10.xxx * u_xlat11.xyz;
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_25.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_99 = dot(u_xlat0.zxy, u_xlat16_25.xyz);
    u_xlat68.x = dot(u_xlat20.xyz, u_xlat11.xyz);
    u_xlat11.x = dot(u_xlat20.xyz, u_xlat16_25.xyz);
    u_xlat20.x = u_xlat16_91 * u_xlat98;
    u_xlat20.y = u_xlat68.x * u_xlat97;
    u_xlat20.z = u_xlat10.x * u_xlat104;
    u_xlat10.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat10.x = max(u_xlat10.x, 6.10351563e-05);
    u_xlat10.x = u_xlat104 / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat17.x * u_xlat10.x;
    u_xlat10.x = min(u_xlat10.x, 16.0);
    u_xlat21.y = u_xlat97 * u_xlat16_99;
    u_xlat21.z = u_xlat11.x * u_xlat98;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = sqrt(u_xlat68.x);
    u_xlat68.x = u_xlat68.x + u_xlat21.x;
    u_xlat68.x = u_xlat68.x + 6.10351563e-05;
    u_xlat68.x = u_xlat100 * u_xlat68.x + 6.10351563e-05;
    u_xlat68.x = float(1.0) / u_xlat68.x;
    u_xlat97 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat97 * u_xlat97;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_91 = u_xlat97 * u_xlat16_90;
    u_xlat97 = (-u_xlat16_90) * u_xlat97 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat11.xyz = u_xlat47.xxx * vec3(u_xlat16_91) + u_xlat11.xyz;
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.yyy * u_xlat16_25.xyz;
    u_xlat10.x = u_xlat68.x * u_xlat10.x;
    u_xlat10.xzw = u_xlat11.xyz * u_xlat10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_26.xyz * u_xlat10.xzw;
    u_xlat16_23.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_25.xyz * u_xlat21.xxx + u_xlat16_24.xyz;
    u_xlat96 = u_xlat96 + -1.0;
    u_xlat10.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat96) + vec2(1.0, 1.0);
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_25.y = u_xlat16_15.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati96 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat10.xy = min(vec2(u_xlat16_61), u_xlat10.xy);
    u_xlat10.x = min(u_xlat16_93, u_xlat10.x);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat10.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat10.xxx * u_xlat16_26.xyz;
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = u_xlat10.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat10.xxx * u_xlat16_27.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat10.xxx + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_27.xyz * u_xlat10.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_94) * u_xlat16_25.xyz;
    u_xlati10 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_27.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati10].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati96].xyz + u_xlat16_27.xyz;
    u_xlati96 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati96].xyz + u_xlat16_25.xyw;
    u_xlat16_27.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat10.xzw = vec3(u_xlat95) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat95 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat10.xzw = vec3(u_xlat95) * u_xlat10.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(u_xlat16_92>=0.0);
#else
    u_xlatb95 = u_xlat16_92>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb95)) ? u_xlat10.xzw : u_xlat0.xyz;
    u_xlat10.xzw = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xzw = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xzw);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xzw;
    u_xlat0.xyz = u_xlat10.wxz * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(u_xlat16_92);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat95 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat95);
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_32.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xzw = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_92)) * u_xlat10.xzw + u_xlat9.xyz;
    u_xlat16_3.x = -abs(u_xlat16_92) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_45.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_2.w);
    u_xlat16_61 = u_xlat16_32.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_90 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_2.x = u_xlat16_32.x * 16.0 + u_xlat16_2.y;
    u_xlat16_12.x = u_xlat16_61 * 16.0 + u_xlat16_2.y;
    u_xlat16_32.xy = u_xlat16_2.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_2.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_29;
    u_xlat16_32.x = u_xlat16_90 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_94 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat10.y * 0.5;
    u_xlat16_61 = (-u_xlat10.y) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_61 + u_xlat16_32.x;
    u_xlat16_61 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_90 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_90 + u_xlat16_61;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat10.y;
    u_xlat16_32.x = min(u_xlat16_32.x, u_xlat16_93);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_91 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_91);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat19.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat19.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_23.xyz;
    u_xlat16_90 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_90 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_90 : u_xlat16_88;
    u_xlat16_12.xyz = u_xlat16_23.xyz + u_xlat16_24.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_12.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat58.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat58.xy = u_xlat58.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_2 = texture(_FlowLightTex, u_xlat58.xy);
    u_xlat16_0.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_9.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_87 = texture(_GlobalEffOutlineTex, u_xlat8.xy).x;
    u_xlat87 = (-u_xlat16_87) + 1.0;
    u_xlat87 = log2(u_xlat87);
    u_xlat87 = u_xlat87 * _FresnelPower;
    u_xlat87 = exp2(u_xlat87);
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(u_xlat87);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_20;
vec3 u_xlat25;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat38;
mediump vec2 u_xlat16_38;
bool u_xlatb38;
vec2 u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
float u_xlat60;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_66;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat38) * u_xlat3.xyz;
    u_xlat57 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat57) + u_xlat2.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat6.xyz = u_xlat19.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat7.xyz = u_xlat19.xxx * u_xlat8.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_47 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat57 = u_xlat16_58 * u_xlat16_47;
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat57 = max(u_xlat57, 0.00100000005);
    u_xlat10.y = u_xlat19.x * u_xlat57;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat19.x = (-u_xlat16_58) + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat16_47;
    u_xlat19.x = max(u_xlat19.x, 0.00100000005);
    u_xlat10.x = u_xlat16_66 * u_xlat19.x;
    u_xlat59 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_66) + 1.0;
    u_xlat61 = u_xlat19.x * u_xlat57;
    u_xlat10.z = u_xlat59 * u_xlat61;
    u_xlat59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat59 = max(u_xlat59, 6.10351563e-05);
    u_xlat59 = u_xlat61 / u_xlat59;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat61 * u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat62 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat19.x * u_xlat62;
    u_xlat7.z = u_xlat19.x * u_xlat61;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat19.x * u_xlat57;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat7.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat57 * u_xlat16_66;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat19.z = u_xlat57 + u_xlat6.x;
    u_xlat19.xz = u_xlat19.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.z + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat59;
    u_xlat16_66 = u_xlat60 * u_xlat60;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_11.x = u_xlat60 * u_xlat16_66;
    u_xlat57 = (-u_xlat16_66) * u_xlat60 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_30.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_9.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_12.xyz;
    u_xlat57 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_11.xxx + u_xlat25.xyz;
    u_xlat25.xyz = u_xlat19.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xyz = min(max(u_xlat25.xyz, 0.0), 1.0);
#else
    u_xlat25.xyz = clamp(u_xlat25.xyz, 0.0, 1.0);
#endif
    u_xlat25.xyz = u_xlat25.xyz * _directSpecularColor.xyz;
    u_xlat25.xyz = u_xlat6.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_28 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_66);
    u_xlat16_13.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat19.x = dot(u_xlat4.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x;
    u_xlat16_66 = max(u_xlat16_14.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_13.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_28 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_30.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_45.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat45.xy = u_xlat16_45.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xy = min(max(u_xlat45.xy, 0.0), 1.0);
#else
    u_xlat45.xy = clamp(u_xlat45.xy, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat45.yyy * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat8.xyw * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_15.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat57 = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_68);
    u_xlat16_68 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_66 = max(u_xlat16_15.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat45.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat57) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat6.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat25.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat4.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_14.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_28 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_28) + u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_66 + u_xlat16_28;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_28;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat19.x = min(u_xlat16_28, 1.0);
    u_xlat57 = min(u_xlat19.x, u_xlat16_8.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat57) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat57) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati59 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_28 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_68 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_13.xyz = vec3(u_xlat16_68) * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_58>=0.0);
#else
    u_xlatb0 = u_xlat16_58>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + u_xlat2.xyz;
    u_xlat16_68 = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_68 = abs(u_xlat16_58) * u_xlat16_68;
    u_xlat2.xyz = vec3(u_xlat16_68) * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_68 = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_68) + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38) + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat16_47) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_58)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_58) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
    u_xlat16_34.y = u_xlat38 * 0.5;
    u_xlat16_20 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_20;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb38)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_28 = u_xlat16_9.x + 1.0;
    u_xlat16_28 = min(u_xlat16_28, 15.0);
    u_xlat16_1.x = u_xlat16_28 * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_28 = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_28 + u_xlat16_57;
    u_xlat16_9.x = u_xlat16_66 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat19.x * 0.5;
    u_xlat16_28 = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_28 + u_xlat16_9.x;
    u_xlat16_28 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_47 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47 + u_xlat16_28;
    u_xlat16_9.x = u_xlat19.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat25.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_10.w * _AlbedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_28;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
ivec4 u_xlati8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_20;
vec3 u_xlat25;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat38;
mediump vec2 u_xlat16_38;
bool u_xlatb38;
vec2 u_xlat45;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat57;
mediump float u_xlat16_57;
int u_xlati57;
bool u_xlatb57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
float u_xlat60;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_66;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_1.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat4.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat2.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat5.x = u_xlat2.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat2.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat38 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat38) * u_xlat3.xyz;
    u_xlat57 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat57) + u_xlat2.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat6.xyz = u_xlat19.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat19.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat7.xyz = u_xlat19.xxx * u_xlat8.xyz;
    u_xlat19.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_58 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_47 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat57 = u_xlat16_58 * u_xlat16_47;
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat57 = max(u_xlat57, 0.00100000005);
    u_xlat10.y = u_xlat19.x * u_xlat57;
    u_xlat16_66 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat19.x = (-u_xlat16_58) + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat16_47;
    u_xlat19.x = max(u_xlat19.x, 0.00100000005);
    u_xlat10.x = u_xlat16_66 * u_xlat19.x;
    u_xlat59 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_66) + 1.0;
    u_xlat61 = u_xlat19.x * u_xlat57;
    u_xlat10.z = u_xlat59 * u_xlat61;
    u_xlat59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat59 = max(u_xlat59, 6.10351563e-05);
    u_xlat59 = u_xlat61 / u_xlat59;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat61 * u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat61 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat62 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat19.x * u_xlat62;
    u_xlat7.z = u_xlat19.x * u_xlat61;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat19.x * u_xlat57;
    u_xlat19.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat7.x;
    u_xlat16_66 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat57 * u_xlat16_66;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat57 = sqrt(u_xlat57);
    u_xlat19.z = u_xlat57 + u_xlat6.x;
    u_xlat19.xz = u_xlat19.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.z + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat59;
    u_xlat16_66 = u_xlat60 * u_xlat60;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_66 = u_xlat60 * u_xlat16_66;
    u_xlat16_11.x = u_xlat60 * u_xlat16_66;
    u_xlat57 = (-u_xlat16_66) * u_xlat60 + 1.0;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_30.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_8.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_9.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_12.xyz;
    u_xlat57 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat25.xyz = vec3(u_xlat57) * u_xlat16_11.xxx + u_xlat25.xyz;
    u_xlat25.xyz = u_xlat19.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xyz = min(max(u_xlat25.xyz, 0.0), 1.0);
#else
    u_xlat25.xyz = clamp(u_xlat25.xyz, 0.0, 1.0);
#endif
    u_xlat25.xyz = u_xlat25.xyz * _directSpecularColor.xyz;
    u_xlat25.xyz = u_xlat6.xxx * u_xlat25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_28 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_66);
    u_xlat16_13.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat19.x = dot(u_xlat4.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x;
    u_xlat16_66 = max(u_xlat16_14.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_13.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_28 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_30.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_45.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat45.xy = u_xlat16_45.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xy = min(max(u_xlat45.xy, 0.0), 1.0);
#else
    u_xlat45.xy = clamp(u_xlat45.xy, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat45.yyy * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat8.xyw * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_15.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_68 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat57 = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_28 = max(u_xlat16_28, u_xlat16_68);
    u_xlat16_68 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_68;
    u_xlat16_66 = max(u_xlat16_15.x, u_xlat16_66);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_28) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat45.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat57) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat6.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat25.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat4.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_14.xyz;
    u_xlat16_28 = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_28 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_28) + u_xlat16_66;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_66 + u_xlat16_28;
    u_xlat16_28 = u_xlat16_34.z * u_xlat16_28;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat19.x = min(u_xlat16_28, 1.0);
    u_xlat57 = min(u_xlat19.x, u_xlat16_8.z);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat57) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat57) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat57) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat57) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati57 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati57].xyz;
    u_xlati57 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati59 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_28 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_68 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_13.xyz = vec3(u_xlat16_68) * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_58>=0.0);
#else
    u_xlatb0 = u_xlat16_58>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat38) + u_xlat2.xyz;
    u_xlat16_68 = u_xlat16_47 * 8.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_47 = max(u_xlat16_47, 0.0078125);
    u_xlat16_68 = min(u_xlat16_68, 1.0);
    u_xlat16_68 = abs(u_xlat16_58) * u_xlat16_68;
    u_xlat2.xyz = vec3(u_xlat16_68) * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_68 = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_68) + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38) + (-u_xlat2.xyz);
    u_xlat3.xyz = vec3(u_xlat16_47) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_58)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_58) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat38 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
    u_xlat16_34.y = u_xlat38 * 0.5;
    u_xlat16_20 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_20;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_28) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb38 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb38)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_34.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_38.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_38.xxx + u_xlat16_38.yyy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_28 = u_xlat16_9.x + 1.0;
    u_xlat16_28 = min(u_xlat16_28, 15.0);
    u_xlat16_1.x = u_xlat16_28 * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_13.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_28 = (-u_xlat16_57) + u_xlat16_38.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_28 + u_xlat16_57;
    u_xlat16_9.x = u_xlat16_66 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat19.x * 0.5;
    u_xlat16_28 = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_28 + u_xlat16_9.x;
    u_xlat16_28 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_47 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_47 + u_xlat16_28;
    u_xlat16_9.x = u_xlat19.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat25.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
    u_xlat16_9.x = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_10.w * _AlbedoColor.w + u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_28;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat21;
float u_xlat22;
vec3 u_xlat24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
int u_xlati60;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_74;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_20.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _shadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_66 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_66 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_anisoUse2U);
#else
    u_xlatb20 = 0.5<_anisoUse2U;
#endif
    u_xlat20.xy = (bool(u_xlatb20)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_20.x = texture(_anisotropicMap, u_xlat20.xy).x;
    u_xlat20.x = u_xlat16_20.x * 2.0 + -1.0;
    u_xlat20.x = u_xlat20.x * _sunShift + _sunShiftOffset;
    u_xlat20.x = u_xlat20.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb40 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat40 = (u_xlatb40) ? 1.0 : -1.0;
    u_xlat40 = u_xlat40 * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat3.xyz = (-u_xlat8.yzx) * vec3(u_xlat62) + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat3.xyz = vec3(u_xlat62) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_70 = u_xlat16_66 + -1.0;
    u_xlat62 = (-u_xlat16_70) + 1.0;
    u_xlat16_13.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_71 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat2.x = u_xlat62 * u_xlat16_71;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat1.z = u_xlat40 * u_xlat2.x;
    u_xlat16_72 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat40 = u_xlat16_66 * u_xlat16_71;
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat1.y = u_xlat16_72 * u_xlat40;
    u_xlat21.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat1.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = vec3(u_xlat16_66) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
    u_xlat16.z = u_xlat41 * u_xlat2.x;
    u_xlat41 = dot(u_xlat3.zxy, u_xlat16_14.xyz);
    u_xlat16.y = u_xlat40 * u_xlat41;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat41 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat21.y = u_xlat41 + u_xlat16.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.y * u_xlat21.x + 6.10351563e-05;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat41 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat9.xyz = vec3(u_xlat41) * u_xlat9.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat40 * u_xlat41;
    u_xlat40 = u_xlat2.x * u_xlat40;
    u_xlat16_66 = dot(u_xlat3.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.x * u_xlat16_66;
    u_xlat41 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_66) + 1.0;
    u_xlat7.z = u_xlat40 * u_xlat41;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat41 = max(u_xlat41, 6.10351563e-05);
    u_xlat41 = u_xlat40 / u_xlat41;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat40 = u_xlat21.x * u_xlat40;
    u_xlat16_66 = u_xlat2.x * u_xlat2.x;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_72 = u_xlat2.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat2.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_13.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat21.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat21.xxx * vec3(u_xlat16_72) + u_xlat2.xyw;
    u_xlat2.xyw = vec3(u_xlat40) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_33.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_33.xyz = vec3(_occlusionScale) * u_xlat16_33.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat16_33.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_33.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_74 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_35.z = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_33.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_33.xz);
    u_xlat16_18.y = u_xlat16_33.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat20.xxx * u_xlat16_12.xyz + u_xlat4.xyz;
    u_xlat2.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_70>=0.0);
#else
    u_xlatb2 = u_xlat16_70>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb2)) ? u_xlat0.xyw : u_xlat3.xyz;
    u_xlat2.xyw = u_xlat16_14.xyz * u_xlat0.xyw;
    u_xlat2.xyw = u_xlat0.wxy * u_xlat16_14.yzx + (-u_xlat2.xyw);
    u_xlat3.xyz = u_xlat0.xyw * u_xlat2.xyw;
    u_xlat0.xyw = u_xlat2.wxy * u_xlat0.ywx + (-u_xlat3.xyz);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat0.xyw;
    u_xlat16_12.x = u_xlat16_71 * 8.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_70) * u_xlat16_12.x;
    u_xlat0.xyw = u_xlat16_12.xxx * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat22);
    u_xlat16_12.x = dot((-u_xlat16_14.xyz), u_xlat0.xyw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyw = (-u_xlat0.xyw) * u_xlat16_12.xxx + (-u_xlat16_14.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xyw);
    u_xlat3.xyz = vec3(u_xlat16_71) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_70)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_70 = -abs(u_xlat16_70) * 0.800000012 + 1.0;
    u_xlat16_70 = u_xlat16_13.x * u_xlat16_70;
    u_xlat16_70 = u_xlat16_70 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_33.xyz, u_xlat0.xyw);
    u_xlat16_35.y = u_xlat0.x * 0.5;
    u_xlat16_71 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_71;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_70);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xyw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_12.xyz;
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_35.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_35.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_70 = u_xlat16_66 + 1.0;
    u_xlat16_70 = min(u_xlat16_70, 15.0);
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_70 = (-u_xlat16_20.x) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70 + u_xlat16_20.x;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.z * 0.5;
    u_xlat16_70 = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_70 + u_xlat16_66;
    u_xlat16_70 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_71 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71 + u_xlat16_70;
    u_xlat16_66 = u_xlat0.z * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_2.z, u_xlat16_66);
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
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
    u_xlat16_26 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_26;
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
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat21;
float u_xlat22;
vec3 u_xlat24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
int u_xlati60;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_66;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_74;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_20.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _shadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_66 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_66 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat1.xxx * u_xlat16_13.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_71 = inversesqrt(u_xlat16_70);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_14.xy = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_71 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
    u_xlat16_70 = max(u_xlat16_14.x, u_xlat16_70);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_13.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat20.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_anisoUse2U);
#else
    u_xlatb20 = 0.5<_anisoUse2U;
#endif
    u_xlat20.xy = (bool(u_xlatb20)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_20.x = texture(_anisotropicMap, u_xlat20.xy).x;
    u_xlat20.x = u_xlat16_20.x * 2.0 + -1.0;
    u_xlat20.x = u_xlat20.x * _sunShift + _sunShiftOffset;
    u_xlat20.x = u_xlat20.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb40 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat40 = (u_xlatb40) ? 1.0 : -1.0;
    u_xlat40 = u_xlat40 * vs_TEXCOORD2.w;
    u_xlat62 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat3.xyz = (-u_xlat8.yzx) * vec3(u_xlat62) + u_xlat7.xyz;
    u_xlat62 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat3.xyz = vec3(u_xlat62) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_66 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_70 = u_xlat16_66 + -1.0;
    u_xlat62 = (-u_xlat16_70) + 1.0;
    u_xlat16_13.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_71 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat2.x = u_xlat62 * u_xlat16_71;
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat1.z = u_xlat40 * u_xlat2.x;
    u_xlat16_72 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat40 = u_xlat16_66 * u_xlat16_71;
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat1.y = u_xlat16_72 * u_xlat40;
    u_xlat21.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat1.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = vec3(u_xlat16_66) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
    u_xlat16.z = u_xlat41 * u_xlat2.x;
    u_xlat41 = dot(u_xlat3.zxy, u_xlat16_14.xyz);
    u_xlat16.y = u_xlat40 * u_xlat41;
    u_xlat16.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat41 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat21.y = u_xlat41 + u_xlat16.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.y * u_xlat21.x + 6.10351563e-05;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat41 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat9.xyz = vec3(u_xlat41) * u_xlat9.xyz;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat40 * u_xlat41;
    u_xlat40 = u_xlat2.x * u_xlat40;
    u_xlat16_66 = dot(u_xlat3.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.x * u_xlat16_66;
    u_xlat41 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat16_66) + 1.0;
    u_xlat7.z = u_xlat40 * u_xlat41;
    u_xlat41 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat41 = max(u_xlat41, 6.10351563e-05);
    u_xlat41 = u_xlat40 / u_xlat41;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat40 = u_xlat21.x * u_xlat40;
    u_xlat16_66 = u_xlat2.x * u_xlat2.x;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat2.x * u_xlat16_66;
    u_xlat16_72 = u_xlat2.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat2.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_13.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyw = u_xlat21.xxx * u_xlat16_10.xyz;
    u_xlat21.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat21.xxx * vec3(u_xlat16_72) + u_xlat2.xyw;
    u_xlat2.xyw = vec3(u_xlat40) * u_xlat2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyw = min(max(u_xlat2.xyw, 0.0), 1.0);
#else
    u_xlat2.xyw = clamp(u_xlat2.xyw, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat2.xyw * _directSpecularColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyw;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_33.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_33.xyz = vec3(_occlusionScale) * u_xlat16_33.xyz + u_xlat8.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat16_33.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_33.xyz;
    u_xlat16_66 = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_74 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_35.z = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_35.z * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_33.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_33.xz);
    u_xlat16_18.y = u_xlat16_33.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat20.xxx * u_xlat16_12.xyz + u_xlat4.xyz;
    u_xlat2.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_70>=0.0);
#else
    u_xlatb2 = u_xlat16_70>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb2)) ? u_xlat0.xyw : u_xlat3.xyz;
    u_xlat2.xyw = u_xlat16_14.xyz * u_xlat0.xyw;
    u_xlat2.xyw = u_xlat0.wxy * u_xlat16_14.yzx + (-u_xlat2.xyw);
    u_xlat3.xyz = u_xlat0.xyw * u_xlat2.xyw;
    u_xlat0.xyw = u_xlat2.wxy * u_xlat0.ywx + (-u_xlat3.xyz);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat65) + u_xlat0.xyw;
    u_xlat16_12.x = u_xlat16_71 * 8.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_70) * u_xlat16_12.x;
    u_xlat0.xyw = u_xlat16_12.xxx * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat16_33.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat22);
    u_xlat16_12.x = dot((-u_xlat16_14.xyz), u_xlat0.xyw);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyw = (-u_xlat0.xyw) * u_xlat16_12.xxx + (-u_xlat16_14.xyz);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xyw);
    u_xlat3.xyz = vec3(u_xlat16_71) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_70)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_70 = -abs(u_xlat16_70) * 0.800000012 + 1.0;
    u_xlat16_70 = u_xlat16_13.x * u_xlat16_70;
    u_xlat16_70 = u_xlat16_70 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_70);
    u_xlat0.x = dot(u_xlat16_33.xyz, u_xlat0.xyw);
    u_xlat16_35.y = u_xlat0.x * 0.5;
    u_xlat16_71 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_71;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_70);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xyw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_33.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_12.xyz;
    u_xlat16.y = u_xlat16_13.x;
    u_xlat16_35.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_13.xyz = u_xlat16_35.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz;
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_3.w);
    u_xlat16_70 = u_xlat16_66 + 1.0;
    u_xlat16_70 = min(u_xlat16_70, 15.0);
    u_xlat16_3.x = u_xlat16_70 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_3.x = u_xlat16_66 * 16.0 + u_xlat16_3.z;
    u_xlat16_12.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_66 = u_xlat16_13.z * 15.0 + (-u_xlat16_66);
    u_xlat16_70 = (-u_xlat16_20.x) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70 + u_xlat16_20.x;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat2.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.z * 0.5;
    u_xlat16_70 = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_70 + u_xlat16_66;
    u_xlat16_70 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_71 = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71 + u_xlat16_70;
    u_xlat16_66 = u_xlat0.z * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_2.z, u_xlat16_66);
    u_xlat16_10.xyz = vec3(u_xlat16_66) * u_xlat16_10.xyz;
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
    u_xlat16_26 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_26;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
  GpuProgramID 86329
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_RimLightGUI"
}