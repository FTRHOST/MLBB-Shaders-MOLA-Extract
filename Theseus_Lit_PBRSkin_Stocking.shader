//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Skin)_Stocking" {
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

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_MatcapTex ("丝袜高光Matcap", 2D) = "white" { }

_StockingsID ("丝袜遮罩", 2D) = "white" { }

_matCapSpeEffectedByLightDir ("丝袜Matcap受灯光方向影响强弱", Range(0, 1)) = 0.20999999344348907

_customMatcapCol ("丝袜伪各项异性高光颜色", Color) = (0.5,0.5,0.5,1)

_customMatcapFresnelStrPow ("丝袜对比度", Float) = 3.0

_customMatcapFresnelStr ("丝袜边缘光强度", Float) = 18.0

_stockingFresnelCol ("丝袜边缘光颜色", Color) = (1,1,1,1)

[Tex] _skinMap ("skinMap", 2D) = "black" { }

_sssColorBase ("sssColor0", Color) = (1,1,1,1)

_sssColorBack ("sssColor1", Color) = (1,1,1,1)

_sssColorOcc ("sssColor2", Color) = (1,1,1,1)

_sssIntensity ("sssIntensity", Range(0, 3)) = 0.0

[Toggle] _Crystal_UseCustomColor ("Use Custom Color", Float) = 0.0

_Crystal_CustomColorMask ("Custom Color Mask", 2D) = "black" { }

_Crystal_CustomColor_R_Color ("R Color", Color) = (1,1,1,1)

_Crystal_CustomColor_G_Color ("G Color", Color) = (1,1,1,1)

_Crystal_CustomColor_B_Color ("B Color", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 56403
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(11) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat38;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat72;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_73 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_73<0.0);
#else
    u_xlatb24 = u_xlat16_73<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb24;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_7.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_76 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_11.xy = vec2(u_xlat16_76) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_76 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = log2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStrPow;
    u_xlat16_76 = exp2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _stockingFresnelCol.xyz;
    u_xlat16_74 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_74 * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27.x) + u_xlat16_51;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_79 * u_xlat16_27.x;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_51) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat14.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat26.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat14.xyz = u_xlat26.xxx * u_xlat14.xyz;
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat80 = u_xlat16_3.x + -1.0;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat81 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat81 = u_xlat15.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat15.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat82 = (-u_xlat74) * u_xlat16_3.x + u_xlat74;
    u_xlat82 = u_xlat74 * u_xlat82 + u_xlat16_3.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat74 + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat81 * u_xlat82;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat14.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat14.x * u_xlat14.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_78 = u_xlat14.x * u_xlat16_29.x;
    u_xlat38 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_29.x) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_78) + u_xlat14.xzw;
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_19.xyz = vec3(u_xlat74) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_29.x = sqrt(u_xlat16_27.x);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-vec3(u_xlat74));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat74);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat26.x = u_xlat26.x * u_xlat82;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat14.xzw = vec3(u_xlat74) * u_xlat14.xzw;
    u_xlat22.xyz = u_xlat14.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat74) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat14.xzw) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat22.xyz;
    u_xlat16_78 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_78));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_78);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_83) * u_xlat14.xzw;
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_83 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_84 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_84;
    u_xlat16_78 = max(u_xlat16_21.x, u_xlat16_78);
    u_xlat16_78 = u_xlat16_83 * u_xlat16_78;
    u_xlat16_21.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_12.xyz;
    u_xlat82 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat82);
    u_xlat82 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16_78 = dot(u_xlat16_12.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat82 * u_xlat82;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat74 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat74 = u_xlat2.x * u_xlat74 + u_xlat16_3.x;
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat2.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat74 * u_xlat81;
    u_xlat26.z = float(1.0) / u_xlat74;
    u_xlat26.xz = min(u_xlat26.xz, vec2(16.0, 16.0));
    u_xlat82 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat82 * u_xlat82;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_83 = u_xlat82 * u_xlat16_78;
    u_xlat82 = (-u_xlat16_78) * u_xlat82 + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_83) + u_xlat14.xzw;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_23.xy = u_xlat24.xy * u_xlat16_29.xx;
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_23.xzw + (-u_xlat2.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_51) * u_xlat16_12.xyz + u_xlat2.xxx;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat26.x = u_xlat26.z * u_xlat26.x;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat14.xzw;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_29.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = u_xlat2.xyw * vec3(u_xlat16_78);
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_23.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_19.xyz;
    u_xlat24.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyw = u_xlat24.xxx * u_xlat2.xyw;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(u_xlat16_19.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat80 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat16_3.x / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 0.318309873;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat26.x = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat26.x = u_xlat2.x * u_xlat26.x + u_xlat16_3.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat2.x;
    u_xlat26.x = u_xlat26.x + 6.10351563e-05;
    u_xlat26.x = u_xlat26.x * u_xlat81;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat74 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat74 * u_xlat74;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_29.x = u_xlat74 * u_xlat16_75;
    u_xlat74 = (-u_xlat16_75) * u_xlat74 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat38) * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_23.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + (-u_xlat2.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + u_xlat2.xxx;
    u_xlat16_16.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_21.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat24.x = u_xlat24.x * u_xlat26.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat24.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.yyy + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat24.yyy + u_xlat16_12.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat48 = dot(u_xlat16_16.xyz, u_xlat17.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_5.www * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_18.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27.x, 1.0);
    u_xlat2.x = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_79) * u_xlat16_16.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyz;
    u_xlati24 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_76 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_10.w);
    u_xlat16_29.x = u_xlat16_76 + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_53 = u_xlat16_29.z * 15.0 + (-u_xlat16_76);
    u_xlat16_10.x = u_xlat16_76 * 16.0 + u_xlat16_10.y;
    u_xlat16_7.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_7.y = u_xlat16_10.z;
    u_xlat16_29.xz = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_76 = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_76 = u_xlat16_53 * u_xlat16_76 + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_79 * u_xlat16_76;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = u_xlat48 * 0.5;
    u_xlat16_29.x = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_29.x + u_xlat16_76;
    u_xlat16_29.x = u_xlat16_76 + u_xlat16_76;
    u_xlat16_53 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_76 = u_xlat48 * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_2.z, u_xlat16_76);
    u_xlat16_29.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_29.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_29.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_29.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_73;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat72 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat72 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat24.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat24.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat24.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat24.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(11) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
vec3 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat38;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
float u_xlat72;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_73 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_73<0.0);
#else
    u_xlatb24 = u_xlat16_73<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb24;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_7.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_76 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_11.xy = vec2(u_xlat16_76) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_76 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = log2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStrPow;
    u_xlat16_76 = exp2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _stockingFresnelCol.xyz;
    u_xlat16_74 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_74 * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27.x) + u_xlat16_51;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_79 * u_xlat16_27.x;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_51) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat14.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat26.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat14.xyz = u_xlat26.xxx * u_xlat14.xyz;
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat80 = u_xlat16_3.x + -1.0;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat81 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat81 = u_xlat15.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat15.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat82 = (-u_xlat74) * u_xlat16_3.x + u_xlat74;
    u_xlat82 = u_xlat74 * u_xlat82 + u_xlat16_3.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat74 + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat81 * u_xlat82;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat14.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat14.x * u_xlat14.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_78 = u_xlat14.x * u_xlat16_29.x;
    u_xlat38 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_29.x) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_78) + u_xlat14.xzw;
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_19.xyz = vec3(u_xlat74) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_29.x = sqrt(u_xlat16_27.x);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-vec3(u_xlat74));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat74);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat26.x = u_xlat26.x * u_xlat82;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat14.xzw = vec3(u_xlat74) * u_xlat14.xzw;
    u_xlat22.xyz = u_xlat14.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat74) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat14.xzw) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat22.xyz;
    u_xlat16_78 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_78));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_78);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_83) * u_xlat14.xzw;
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_83 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_84 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_84;
    u_xlat16_78 = max(u_xlat16_21.x, u_xlat16_78);
    u_xlat16_78 = u_xlat16_83 * u_xlat16_78;
    u_xlat16_21.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_12.xyz;
    u_xlat82 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat82);
    u_xlat82 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16_78 = dot(u_xlat16_12.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat82 * u_xlat82;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat74 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat74 = u_xlat2.x * u_xlat74 + u_xlat16_3.x;
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat2.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat74 * u_xlat81;
    u_xlat26.z = float(1.0) / u_xlat74;
    u_xlat26.xz = min(u_xlat26.xz, vec2(16.0, 16.0));
    u_xlat82 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat82 * u_xlat82;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_83 = u_xlat82 * u_xlat16_78;
    u_xlat82 = (-u_xlat16_78) * u_xlat82 + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_83) + u_xlat14.xzw;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_23.xy = u_xlat24.xy * u_xlat16_29.xx;
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_23.xzw + (-u_xlat2.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_51) * u_xlat16_12.xyz + u_xlat2.xxx;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat26.x = u_xlat26.z * u_xlat26.x;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat14.xzw;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_29.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = u_xlat2.xyw * vec3(u_xlat16_78);
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_23.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_19.xyz;
    u_xlat24.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyw = u_xlat24.xxx * u_xlat2.xyw;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(u_xlat16_19.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat80 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat16_3.x / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 0.318309873;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat26.x = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat26.x = u_xlat2.x * u_xlat26.x + u_xlat16_3.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat2.x;
    u_xlat26.x = u_xlat26.x + 6.10351563e-05;
    u_xlat26.x = u_xlat26.x * u_xlat81;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat74 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat74 * u_xlat74;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_29.x = u_xlat74 * u_xlat16_75;
    u_xlat74 = (-u_xlat16_75) * u_xlat74 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat38) * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_23.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + (-u_xlat2.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + u_xlat2.xxx;
    u_xlat16_16.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_21.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat24.x = u_xlat24.x * u_xlat26.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat24.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.yyy + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat24.yyy + u_xlat16_12.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat48 = dot(u_xlat16_16.xyz, u_xlat17.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_5.www * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_18.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27.x, 1.0);
    u_xlat2.x = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_79) * u_xlat16_16.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyz;
    u_xlati24 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_76 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_10.w);
    u_xlat16_29.x = u_xlat16_76 + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_53 = u_xlat16_29.z * 15.0 + (-u_xlat16_76);
    u_xlat16_10.x = u_xlat16_76 * 16.0 + u_xlat16_10.y;
    u_xlat16_7.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_7.y = u_xlat16_10.z;
    u_xlat16_29.xz = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_76 = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_76 = u_xlat16_53 * u_xlat16_76 + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_79 * u_xlat16_76;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = u_xlat48 * 0.5;
    u_xlat16_29.x = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_29.x + u_xlat16_76;
    u_xlat16_29.x = u_xlat16_76 + u_xlat16_76;
    u_xlat16_53 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_76 = u_xlat48 * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_2.z, u_xlat16_76);
    u_xlat16_29.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_29.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_29.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_29.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_73;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat72 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat72 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat24.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat24.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat72);
    u_xlat24.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat24.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(13) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec4 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_33;
float u_xlat40;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat66;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
int u_xlati92;
float u_xlat93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_101;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_85 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_85<0.0);
#else
    u_xlatb28 = u_xlat16_85<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb28;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_87 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_87) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_87 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_7.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb28)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat28.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat12.z;
    u_xlat56 = max((-u_xlat12.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat12.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_90 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat15.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_90) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_90;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat56 = (-u_xlat28.x) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat56>=0.99000001);
#else
    u_xlatb56 = u_xlat56>=0.99000001;
#endif
    u_xlat16_90 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_17.xy = vec2(u_xlat16_91) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_56 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_91 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = log2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStrPow;
    u_xlat16_91 = exp2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStr;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_90) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_91) * _stockingFresnelCol.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_90 = _sssIntensity * _sssIntensity;
    u_xlat16_90 = u_xlat16_2.x * u_xlat16_90;
    u_xlat16_91 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_101 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_101 = inversesqrt(u_xlat16_101);
    u_xlat16_19.xyz = vec3(u_xlat16_101) * u_xlat16_19.xyz;
    u_xlat16_101 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_101 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 + -1.0;
    u_xlat16_101 = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_91);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_31 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_31 * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_31) + u_xlat16_59;
    u_xlat16_31 = u_xlat16_5.w * u_xlat16_59 + u_xlat16_31;
    u_xlat16_33.x = u_xlat16_5.w * u_xlat16_31;
    u_xlat16_33.x = u_xlat16_101 * u_xlat16_33.x;
    u_xlat16_91 = sqrt(u_xlat16_90);
    u_xlat16_20.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_91) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_87 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat92 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat12.xyz = vec3(u_xlat92) * u_xlat12.xyz;
    u_xlat92 = dot(u_xlat8.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_103 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat93 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat93 = min(max(u_xlat93, 0.0), 1.0);
#else
    u_xlat93 = clamp(u_xlat93, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat66 = u_xlat16_3.x + -1.0;
    u_xlat92 = u_xlat92 * u_xlat66 + 1.0;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat16_3.x / u_xlat92;
    u_xlat92 = u_xlat92 * 0.318309873;
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat94 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat94 = u_xlat13.x * u_xlat94 + u_xlat16_3.x;
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat13.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat95 = (-u_xlat93) * u_xlat16_3.x + u_xlat93;
    u_xlat95 = u_xlat93 * u_xlat95 + u_xlat16_3.x;
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat93 + u_xlat95;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat94 * u_xlat95;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat95 = min(u_xlat95, 16.0);
    u_xlat12.x = (-u_xlat16_103) + 1.0;
    u_xlat16_103 = u_xlat12.x * u_xlat12.x;
    u_xlat16_103 = u_xlat12.x * u_xlat16_103;
    u_xlat16_103 = u_xlat12.x * u_xlat16_103;
    u_xlat16_104 = u_xlat12.x * u_xlat16_103;
    u_xlat40 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat12.x = (-u_xlat16_103) * u_xlat12.x + 1.0;
    u_xlat12.xzw = u_xlat16_1.xyz * u_xlat12.xxx;
    u_xlat12.xzw = vec3(u_xlat40) * vec3(u_xlat16_104) + u_xlat12.xzw;
    u_xlat16_23.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_21.xyz);
    u_xlat16_24.xyz = vec3(u_xlat93) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_103 = sqrt(u_xlat16_33.x);
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(u_xlat16_103);
    u_xlat16_26.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz + (-vec3(u_xlat93));
    u_xlat16_24.xyz = vec3(u_xlat16_91) * u_xlat16_24.xyz + vec3(u_xlat93);
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz;
    u_xlat92 = u_xlat92 * u_xlat95;
    u_xlat12.xzw = u_xlat12.xzw * vec3(u_xlat92);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xzw = min(max(u_xlat12.xzw, 0.0), 1.0);
#else
    u_xlat12.xzw = clamp(u_xlat12.xzw, 0.0, 1.0);
#endif
    u_xlat12.xzw = u_xlat12.xzw * _directSpecularColor.xyz;
    u_xlat12.xzw = vec3(u_xlat93) * u_xlat12.xzw;
    u_xlat12.xzw = u_xlat12.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_23.xyz * u_xlat12.xzw;
    u_xlat16_17.xyz = vec3(u_xlat93) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = (-u_xlat12.xzw) * u_xlat16_23.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_56) * u_xlat16_17.xyz + u_xlat15.xyz;
    u_xlat16_104 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_104));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_104);
#endif
    u_xlat12.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_104 = dot(u_xlat12.xzw, u_xlat12.xzw);
    u_xlat16_104 = max(u_xlat16_104, 6.10351563e-05);
    u_xlat16_105 = inversesqrt(u_xlat16_104);
    u_xlat16_23.xyz = u_xlat12.xzw * vec3(u_xlat16_105);
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_105 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_106 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_106 = u_xlat16_106 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_106 = u_xlat16_106 * u_xlat16_106;
    u_xlat16_105 = max(u_xlat16_105, u_xlat16_106);
    u_xlat16_106 = float(1.0) / float(u_xlat16_104);
    u_xlat16_104 = u_xlat16_104 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_104 = (-u_xlat16_104) * u_xlat16_104 + 1.0;
    u_xlat16_104 = max(u_xlat16_104, 0.0);
    u_xlat16_104 = u_xlat16_104 * u_xlat16_104;
    u_xlat16_104 = u_xlat16_104 * u_xlat16_106;
    u_xlat16_104 = max(u_xlat16_25.x, u_xlat16_104);
    u_xlat16_104 = u_xlat16_105 * u_xlat16_104;
    u_xlat16_25.xyz = vec3(u_xlat16_104) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat12.xzw = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat56 = dot(u_xlat12.xzw, u_xlat12.xzw);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xzw = vec3(u_xlat56) * u_xlat12.xzw;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_104 = dot(u_xlat16_23.xyz, u_xlat12.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_104 = min(max(u_xlat16_104, 0.0), 1.0);
#else
    u_xlat16_104 = clamp(u_xlat16_104, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat66 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat93 = (-u_xlat92) * u_xlat16_3.x + u_xlat92;
    u_xlat93 = u_xlat92 * u_xlat93 + u_xlat16_3.x;
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat92 + u_xlat93;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat93 * u_xlat94;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat93 = min(u_xlat93, 16.0);
    u_xlat95 = (-u_xlat16_104) + 1.0;
    u_xlat16_104 = u_xlat95 * u_xlat95;
    u_xlat16_104 = u_xlat95 * u_xlat16_104;
    u_xlat16_104 = u_xlat95 * u_xlat16_104;
    u_xlat16_105 = u_xlat95 * u_xlat16_104;
    u_xlat95 = (-u_xlat16_104) * u_xlat95 + 1.0;
    u_xlat12.xzw = u_xlat16_1.xyz * vec3(u_xlat95);
    u_xlat12.xzw = vec3(u_xlat40) * vec3(u_xlat16_105) + u_xlat12.xzw;
    u_xlat16_23.xyz = vec3(u_xlat92) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_27.xy = u_xlat10.xy * vec2(u_xlat16_103);
    u_xlat16_27.xzw = u_xlat16_27.xxx * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_27.xzw + (-vec3(u_xlat92));
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + vec3(u_xlat92);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat12.xzw = u_xlat12.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xzw = min(max(u_xlat12.xzw, 0.0), 1.0);
#else
    u_xlat12.xzw = clamp(u_xlat12.xzw, 0.0, 1.0);
#endif
    u_xlat12.xzw = u_xlat12.xzw * _directSpecularColor.xyz;
    u_xlat12.xzw = vec3(u_xlat92) * u_xlat12.xzw;
    u_xlat12.xzw = u_xlat16_25.xyz * u_xlat12.xzw;
    u_xlat16_17.xyz = u_xlat12.xzw * u_xlat10.xxx + u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_103 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_103));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_103);
#endif
    u_xlat12.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_103 = dot(u_xlat12.xzw, u_xlat12.xzw);
    u_xlat16_103 = max(u_xlat16_103, 6.10351563e-05);
    u_xlat16_104 = inversesqrt(u_xlat16_103);
    u_xlat16_24.xyz = u_xlat12.xzw * vec3(u_xlat16_104);
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_27.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_104 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_105 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_105 = u_xlat16_105 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_105 = min(max(u_xlat16_105, 0.0), 1.0);
#else
    u_xlat16_105 = clamp(u_xlat16_105, 0.0, 1.0);
#endif
    u_xlat16_105 = u_xlat16_105 * u_xlat16_105;
    u_xlat16_104 = max(u_xlat16_104, u_xlat16_105);
    u_xlat16_105 = float(1.0) / float(u_xlat16_103);
    u_xlat16_103 = u_xlat16_103 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_103 = (-u_xlat16_103) * u_xlat16_103 + 1.0;
    u_xlat16_103 = max(u_xlat16_103, 0.0);
    u_xlat16_103 = u_xlat16_103 * u_xlat16_103;
    u_xlat16_103 = u_xlat16_103 * u_xlat16_105;
    u_xlat16_103 = max(u_xlat16_25.x, u_xlat16_103);
    u_xlat16_103 = u_xlat16_104 * u_xlat16_103;
    u_xlat16_25.xyz = vec3(u_xlat16_103) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat66 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat93 = (-u_xlat92) * u_xlat16_3.x + u_xlat92;
    u_xlat93 = u_xlat92 * u_xlat93 + u_xlat16_3.x;
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat92 + u_xlat93;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat93 * u_xlat94;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat93 = min(u_xlat93, 16.0);
    u_xlat10.x = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat10.x * u_xlat10.x;
    u_xlat16_88 = u_xlat10.x * u_xlat16_88;
    u_xlat16_88 = u_xlat10.x * u_xlat16_88;
    u_xlat16_103 = u_xlat10.x * u_xlat16_88;
    u_xlat10.x = (-u_xlat16_88) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat40) * vec3(u_xlat16_103) + u_xlat10.xzw;
    u_xlat16_20.xyz = vec3(u_xlat92) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_27.yyy * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-vec3(u_xlat92));
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz + vec3(u_xlat92);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_25.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = vec3(u_xlat92) * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat10.yyy + u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati92 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat22.y = u_xlat8.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat93 = dot(u_xlat16_21.xyz, u_xlat22.xyz);
    u_xlat93 = max(u_xlat93, 0.0);
    u_xlat11.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat11.xyz = vec3(u_xlat93) * u_xlat11.xyz + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.www * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + u_xlat16_4.xyz;
    u_xlat28.xy = min(u_xlat16_33.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat28.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat28.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_101) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati92].xyz + u_xlat16_24.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_24.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_88 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_88) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_88 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_19.xyz, u_xlat10.xyz);
    u_xlat16_33.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_3.w);
    u_xlat16_61 = u_xlat16_33.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_89 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_3.x = u_xlat16_33.x * 16.0 + u_xlat16_3.y;
    u_xlat16_7.x = u_xlat16_61 * 16.0 + u_xlat16_3.y;
    u_xlat16_33.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_7.y = u_xlat16_3.z;
    u_xlat16_33.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_101 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat28.y * 0.5;
    u_xlat16_61 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_61 + u_xlat16_33.x;
    u_xlat16_61 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_89 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_89 + u_xlat16_61;
    u_xlat16_33.x = u_xlat28.y * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_7.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_19.xyz : u_xlat16_7.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_17.xyz;
    u_xlat16_88 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_88 : u_xlat16_85;
    u_xlat16_7.xyz = u_xlat16_17.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_8.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(13) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec4 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
mediump float u_xlat16_31;
mediump vec3 u_xlat16_33;
float u_xlat40;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat66;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
int u_xlati92;
float u_xlat93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_101;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_85 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_85<0.0);
#else
    u_xlatb28 = u_xlat16_85<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb28;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_87 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_87) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_87 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_7.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb28)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat28.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat12.z;
    u_xlat56 = max((-u_xlat12.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat12.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_90 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat15.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_90) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_90;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat56 = (-u_xlat28.x) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat56>=0.99000001);
#else
    u_xlatb56 = u_xlat56>=0.99000001;
#endif
    u_xlat16_90 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_17.xy = vec2(u_xlat16_91) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_56 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_91 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = log2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStrPow;
    u_xlat16_91 = exp2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStr;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_90) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_91) * _stockingFresnelCol.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_90 = _sssIntensity * _sssIntensity;
    u_xlat16_90 = u_xlat16_2.x * u_xlat16_90;
    u_xlat16_91 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_101 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_101 = inversesqrt(u_xlat16_101);
    u_xlat16_19.xyz = vec3(u_xlat16_101) * u_xlat16_19.xyz;
    u_xlat16_101 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_101 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 + -1.0;
    u_xlat16_101 = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_91);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_31 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_31 * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_31) + u_xlat16_59;
    u_xlat16_31 = u_xlat16_5.w * u_xlat16_59 + u_xlat16_31;
    u_xlat16_33.x = u_xlat16_5.w * u_xlat16_31;
    u_xlat16_33.x = u_xlat16_101 * u_xlat16_33.x;
    u_xlat16_91 = sqrt(u_xlat16_90);
    u_xlat16_20.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_91) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_87 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat92 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat12.xyz = vec3(u_xlat92) * u_xlat12.xyz;
    u_xlat92 = dot(u_xlat8.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_103 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat93 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat93 = min(max(u_xlat93, 0.0), 1.0);
#else
    u_xlat93 = clamp(u_xlat93, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat66 = u_xlat16_3.x + -1.0;
    u_xlat92 = u_xlat92 * u_xlat66 + 1.0;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat16_3.x / u_xlat92;
    u_xlat92 = u_xlat92 * 0.318309873;
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat94 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat94 = u_xlat13.x * u_xlat94 + u_xlat16_3.x;
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat13.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat95 = (-u_xlat93) * u_xlat16_3.x + u_xlat93;
    u_xlat95 = u_xlat93 * u_xlat95 + u_xlat16_3.x;
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat93 + u_xlat95;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat95 = u_xlat94 * u_xlat95;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat95 = min(u_xlat95, 16.0);
    u_xlat12.x = (-u_xlat16_103) + 1.0;
    u_xlat16_103 = u_xlat12.x * u_xlat12.x;
    u_xlat16_103 = u_xlat12.x * u_xlat16_103;
    u_xlat16_103 = u_xlat12.x * u_xlat16_103;
    u_xlat16_104 = u_xlat12.x * u_xlat16_103;
    u_xlat40 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat12.x = (-u_xlat16_103) * u_xlat12.x + 1.0;
    u_xlat12.xzw = u_xlat16_1.xyz * u_xlat12.xxx;
    u_xlat12.xzw = vec3(u_xlat40) * vec3(u_xlat16_104) + u_xlat12.xzw;
    u_xlat16_23.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_21.xyz);
    u_xlat16_24.xyz = vec3(u_xlat93) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_103 = sqrt(u_xlat16_33.x);
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(u_xlat16_103);
    u_xlat16_26.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz + (-vec3(u_xlat93));
    u_xlat16_24.xyz = vec3(u_xlat16_91) * u_xlat16_24.xyz + vec3(u_xlat93);
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz;
    u_xlat92 = u_xlat92 * u_xlat95;
    u_xlat12.xzw = u_xlat12.xzw * vec3(u_xlat92);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xzw = min(max(u_xlat12.xzw, 0.0), 1.0);
#else
    u_xlat12.xzw = clamp(u_xlat12.xzw, 0.0, 1.0);
#endif
    u_xlat12.xzw = u_xlat12.xzw * _directSpecularColor.xyz;
    u_xlat12.xzw = vec3(u_xlat93) * u_xlat12.xzw;
    u_xlat12.xzw = u_xlat12.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_23.xyz * u_xlat12.xzw;
    u_xlat16_17.xyz = vec3(u_xlat93) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = (-u_xlat12.xzw) * u_xlat16_23.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_56) * u_xlat16_17.xyz + u_xlat15.xyz;
    u_xlat16_104 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_104));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_104);
#endif
    u_xlat12.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_104 = dot(u_xlat12.xzw, u_xlat12.xzw);
    u_xlat16_104 = max(u_xlat16_104, 6.10351563e-05);
    u_xlat16_105 = inversesqrt(u_xlat16_104);
    u_xlat16_23.xyz = u_xlat12.xzw * vec3(u_xlat16_105);
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_25.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_105 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_106 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
    u_xlat16_106 = u_xlat16_106 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_106 = u_xlat16_106 * u_xlat16_106;
    u_xlat16_105 = max(u_xlat16_105, u_xlat16_106);
    u_xlat16_106 = float(1.0) / float(u_xlat16_104);
    u_xlat16_104 = u_xlat16_104 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_104 = (-u_xlat16_104) * u_xlat16_104 + 1.0;
    u_xlat16_104 = max(u_xlat16_104, 0.0);
    u_xlat16_104 = u_xlat16_104 * u_xlat16_104;
    u_xlat16_104 = u_xlat16_104 * u_xlat16_106;
    u_xlat16_104 = max(u_xlat16_25.x, u_xlat16_104);
    u_xlat16_104 = u_xlat16_105 * u_xlat16_104;
    u_xlat16_25.xyz = vec3(u_xlat16_104) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat12.xzw = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_23.xyz;
    u_xlat56 = dot(u_xlat12.xzw, u_xlat12.xzw);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xzw = vec3(u_xlat56) * u_xlat12.xzw;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_104 = dot(u_xlat16_23.xyz, u_xlat12.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_104 = min(max(u_xlat16_104, 0.0), 1.0);
#else
    u_xlat16_104 = clamp(u_xlat16_104, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat66 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat93 = (-u_xlat92) * u_xlat16_3.x + u_xlat92;
    u_xlat93 = u_xlat92 * u_xlat93 + u_xlat16_3.x;
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat92 + u_xlat93;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat93 * u_xlat94;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat93 = min(u_xlat93, 16.0);
    u_xlat95 = (-u_xlat16_104) + 1.0;
    u_xlat16_104 = u_xlat95 * u_xlat95;
    u_xlat16_104 = u_xlat95 * u_xlat16_104;
    u_xlat16_104 = u_xlat95 * u_xlat16_104;
    u_xlat16_105 = u_xlat95 * u_xlat16_104;
    u_xlat95 = (-u_xlat16_104) * u_xlat95 + 1.0;
    u_xlat12.xzw = u_xlat16_1.xyz * vec3(u_xlat95);
    u_xlat12.xzw = vec3(u_xlat40) * vec3(u_xlat16_105) + u_xlat12.xzw;
    u_xlat16_23.xyz = vec3(u_xlat92) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_27.xy = u_xlat10.xy * vec2(u_xlat16_103);
    u_xlat16_27.xzw = u_xlat16_27.xxx * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_27.xzw + (-vec3(u_xlat92));
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + vec3(u_xlat92);
    u_xlat16_23.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_25.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_23.xyz = u_xlat10.xxx * u_xlat16_23.xyz;
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat12.xzw = u_xlat12.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xzw = min(max(u_xlat12.xzw, 0.0), 1.0);
#else
    u_xlat12.xzw = clamp(u_xlat12.xzw, 0.0, 1.0);
#endif
    u_xlat12.xzw = u_xlat12.xzw * _directSpecularColor.xyz;
    u_xlat12.xzw = vec3(u_xlat92) * u_xlat12.xzw;
    u_xlat12.xzw = u_xlat16_25.xyz * u_xlat12.xzw;
    u_xlat16_17.xyz = u_xlat12.xzw * u_xlat10.xxx + u_xlat16_17.xyz;
    u_xlat16_23.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_23.xyz;
    u_xlat16_103 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_103));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_103);
#endif
    u_xlat12.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_103 = dot(u_xlat12.xzw, u_xlat12.xzw);
    u_xlat16_103 = max(u_xlat16_103, 6.10351563e-05);
    u_xlat16_104 = inversesqrt(u_xlat16_103);
    u_xlat16_24.xyz = u_xlat12.xzw * vec3(u_xlat16_104);
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_27.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_104 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_105 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_105 = u_xlat16_105 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_105 = min(max(u_xlat16_105, 0.0), 1.0);
#else
    u_xlat16_105 = clamp(u_xlat16_105, 0.0, 1.0);
#endif
    u_xlat16_105 = u_xlat16_105 * u_xlat16_105;
    u_xlat16_104 = max(u_xlat16_104, u_xlat16_105);
    u_xlat16_105 = float(1.0) / float(u_xlat16_103);
    u_xlat16_103 = u_xlat16_103 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_103 = (-u_xlat16_103) * u_xlat16_103 + 1.0;
    u_xlat16_103 = max(u_xlat16_103, 0.0);
    u_xlat16_103 = u_xlat16_103 * u_xlat16_103;
    u_xlat16_103 = u_xlat16_103 * u_xlat16_105;
    u_xlat16_103 = max(u_xlat16_25.x, u_xlat16_103);
    u_xlat16_103 = u_xlat16_104 * u_xlat16_103;
    u_xlat16_25.xyz = vec3(u_xlat16_103) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat66 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat93 = (-u_xlat92) * u_xlat16_3.x + u_xlat92;
    u_xlat93 = u_xlat92 * u_xlat93 + u_xlat16_3.x;
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat92 + u_xlat93;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat93 * u_xlat94;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat93 = min(u_xlat93, 16.0);
    u_xlat10.x = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat10.x * u_xlat10.x;
    u_xlat16_88 = u_xlat10.x * u_xlat16_88;
    u_xlat16_88 = u_xlat10.x * u_xlat16_88;
    u_xlat16_103 = u_xlat10.x * u_xlat16_88;
    u_xlat10.x = (-u_xlat16_88) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat40) * vec3(u_xlat16_103) + u_xlat10.xzw;
    u_xlat16_20.xyz = vec3(u_xlat92) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_27.yyy * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-vec3(u_xlat92));
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz + vec3(u_xlat92);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_25.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat93;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat10.xzw = vec3(u_xlat92) * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_25.xyz * u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat10.yyy + u_xlat16_23.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_21.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati92 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat22.y = u_xlat8.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat93 = dot(u_xlat16_21.xyz, u_xlat22.xyz);
    u_xlat93 = max(u_xlat93, 0.0);
    u_xlat11.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat11.xyz = vec3(u_xlat93) * u_xlat11.xyz + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.www * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + u_xlat16_4.xyz;
    u_xlat28.xy = min(u_xlat16_33.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat28.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat28.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_101) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati92].xyz + u_xlat16_24.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_24.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_88 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_88) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_88 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_19.xyz, u_xlat10.xyz);
    u_xlat16_33.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_3.w);
    u_xlat16_61 = u_xlat16_33.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_89 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_3.x = u_xlat16_33.x * 16.0 + u_xlat16_3.y;
    u_xlat16_7.x = u_xlat16_61 * 16.0 + u_xlat16_3.y;
    u_xlat16_33.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_7.y = u_xlat16_3.z;
    u_xlat16_33.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_101 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat28.y * 0.5;
    u_xlat16_61 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_61 + u_xlat16_33.x;
    u_xlat16_61 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_89 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_89 + u_xlat16_61;
    u_xlat16_33.x = u_xlat28.y * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_7.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_19.xyz = vec3(u_xlat16_88) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_19.xyz : u_xlat16_7.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_17.xyz;
    u_xlat16_88 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_88 : u_xlat16_85;
    u_xlat16_7.xyz = u_xlat16_17.xyz + u_xlat16_20.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.zxy;
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_8.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat38;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_73 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_73<0.0);
#else
    u_xlatb24 = u_xlat16_73<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb24;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_7.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_76 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_11.xy = vec2(u_xlat16_76) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_76 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = log2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStrPow;
    u_xlat16_76 = exp2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _stockingFresnelCol.xyz;
    u_xlat16_74 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_74 * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27.x) + u_xlat16_51;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_79 * u_xlat16_27.x;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_51) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat14.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat26.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat14.xyz = u_xlat26.xxx * u_xlat14.xyz;
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat80 = u_xlat16_3.x + -1.0;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat81 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat81 = u_xlat15.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat15.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat82 = (-u_xlat74) * u_xlat16_3.x + u_xlat74;
    u_xlat82 = u_xlat74 * u_xlat82 + u_xlat16_3.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat74 + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat81 * u_xlat82;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat14.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat14.x * u_xlat14.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_78 = u_xlat14.x * u_xlat16_29.x;
    u_xlat38 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_29.x) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_78) + u_xlat14.xzw;
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_19.xyz = vec3(u_xlat74) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_29.x = sqrt(u_xlat16_27.x);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-vec3(u_xlat74));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat74);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat26.x = u_xlat26.x * u_xlat82;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat14.xzw = vec3(u_xlat74) * u_xlat14.xzw;
    u_xlat22.xyz = u_xlat14.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat74) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat14.xzw) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat22.xyz;
    u_xlat16_78 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_78));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_78);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_83) * u_xlat14.xzw;
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_83 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_84 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_84;
    u_xlat16_78 = max(u_xlat16_21.x, u_xlat16_78);
    u_xlat16_78 = u_xlat16_83 * u_xlat16_78;
    u_xlat16_21.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_12.xyz;
    u_xlat82 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat82);
    u_xlat82 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16_78 = dot(u_xlat16_12.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat82 * u_xlat82;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat74 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat74 = u_xlat2.x * u_xlat74 + u_xlat16_3.x;
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat2.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat74 * u_xlat81;
    u_xlat26.z = float(1.0) / u_xlat74;
    u_xlat26.xz = min(u_xlat26.xz, vec2(16.0, 16.0));
    u_xlat82 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat82 * u_xlat82;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_83 = u_xlat82 * u_xlat16_78;
    u_xlat82 = (-u_xlat16_78) * u_xlat82 + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_83) + u_xlat14.xzw;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_23.xy = u_xlat24.xy * u_xlat16_29.xx;
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_23.xzw + (-u_xlat2.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_51) * u_xlat16_12.xyz + u_xlat2.xxx;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat26.x = u_xlat26.z * u_xlat26.x;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat14.xzw;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_29.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = u_xlat2.xyw * vec3(u_xlat16_78);
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_23.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_19.xyz;
    u_xlat24.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyw = u_xlat24.xxx * u_xlat2.xyw;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(u_xlat16_19.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat80 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat16_3.x / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 0.318309873;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat26.x = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat26.x = u_xlat2.x * u_xlat26.x + u_xlat16_3.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat2.x;
    u_xlat26.x = u_xlat26.x + 6.10351563e-05;
    u_xlat26.x = u_xlat26.x * u_xlat81;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat74 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat74 * u_xlat74;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_29.x = u_xlat74 * u_xlat16_75;
    u_xlat74 = (-u_xlat16_75) * u_xlat74 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat38) * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_23.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + (-u_xlat2.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + u_xlat2.xxx;
    u_xlat16_16.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_21.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat24.x = u_xlat24.x * u_xlat26.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat24.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.yyy + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat24.yyy + u_xlat16_12.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat48 = dot(u_xlat16_16.xyz, u_xlat17.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_5.www * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_18.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27.x, 1.0);
    u_xlat2.x = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_79) * u_xlat16_16.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyz;
    u_xlati24 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_76 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_10.w);
    u_xlat16_29.x = u_xlat16_76 + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_53 = u_xlat16_29.z * 15.0 + (-u_xlat16_76);
    u_xlat16_10.x = u_xlat16_76 * 16.0 + u_xlat16_10.y;
    u_xlat16_7.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_7.y = u_xlat16_10.z;
    u_xlat16_29.xz = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_76 = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_76 = u_xlat16_53 * u_xlat16_76 + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_79 * u_xlat16_76;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = u_xlat48 * 0.5;
    u_xlat16_29.x = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_29.x + u_xlat16_76;
    u_xlat16_29.x = u_xlat16_76 + u_xlat16_76;
    u_xlat16_53 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_76 = u_xlat48 * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_2.z, u_xlat16_76);
    u_xlat16_29.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_29.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_29.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_29.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_73;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec4 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec4 u_xlat16_23;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_29;
float u_xlat38;
float u_xlat48;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_73 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_73<0.0);
#else
    u_xlatb24 = u_xlat16_73<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb24;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_7.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_76 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_11.xy = vec2(u_xlat16_76) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_76 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = log2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStrPow;
    u_xlat16_76 = exp2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _stockingFresnelCol.xyz;
    u_xlat16_74 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_76 = _sssIntensity * _sssIntensity;
    u_xlat16_76 = u_xlat16_74 * u_xlat16_76;
    u_xlat16_78 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_79 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_13.xyz = vec3(u_xlat16_79) * u_xlat16_13.xyz;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_78);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27.x * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27.x) + u_xlat16_51;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_5.w * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_79 * u_xlat16_27.x;
    u_xlat16_51 = sqrt(u_xlat16_76);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_51) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_51) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat14.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat26.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat14.xyz = u_xlat26.xxx * u_xlat14.xyz;
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat80 = u_xlat16_3.x + -1.0;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat81 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat81 = u_xlat15.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat15.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat82 = (-u_xlat74) * u_xlat16_3.x + u_xlat74;
    u_xlat82 = u_xlat74 * u_xlat82 + u_xlat16_3.x;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat74 + u_xlat82;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat82 = u_xlat81 * u_xlat82;
    u_xlat82 = float(1.0) / u_xlat82;
    u_xlat82 = min(u_xlat82, 16.0);
    u_xlat14.x = (-u_xlat16_29.x) + 1.0;
    u_xlat16_29.x = u_xlat14.x * u_xlat14.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat14.x * u_xlat16_29.x;
    u_xlat16_78 = u_xlat14.x * u_xlat16_29.x;
    u_xlat38 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat16_29.x) * u_xlat14.x + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * u_xlat14.xxx;
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_78) + u_xlat14.xzw;
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_19.xyz = vec3(u_xlat74) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_29.x = sqrt(u_xlat16_27.x);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_29.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-vec3(u_xlat74));
    u_xlat16_19.xyz = vec3(u_xlat16_51) * u_xlat16_19.xyz + vec3(u_xlat74);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat26.x = u_xlat26.x * u_xlat82;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat14.xzw = vec3(u_xlat74) * u_xlat14.xzw;
    u_xlat22.xyz = u_xlat14.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat74) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat14.xzw) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat22.xyz;
    u_xlat16_78 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_78));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_78);
#endif
    u_xlat14.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat14.xzw, u_xlat14.xzw);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_83 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_83) * u_xlat14.xzw;
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_83 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_84 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_84);
    u_xlat16_84 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_84;
    u_xlat16_78 = max(u_xlat16_21.x, u_xlat16_78);
    u_xlat16_78 = u_xlat16_83 * u_xlat16_78;
    u_xlat16_21.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_12.xyz;
    u_xlat82 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat82);
    u_xlat82 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16_78 = dot(u_xlat16_12.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat82 * u_xlat82;
    u_xlat26.x = u_xlat26.x * u_xlat80 + 1.0;
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat26.x = u_xlat16_3.x / u_xlat26.x;
    u_xlat26.x = u_xlat26.x * 0.318309873;
    u_xlat74 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat74 = u_xlat2.x * u_xlat74 + u_xlat16_3.x;
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat2.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat74 * u_xlat81;
    u_xlat26.z = float(1.0) / u_xlat74;
    u_xlat26.xz = min(u_xlat26.xz, vec2(16.0, 16.0));
    u_xlat82 = (-u_xlat16_78) + 1.0;
    u_xlat16_78 = u_xlat82 * u_xlat82;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_78 = u_xlat82 * u_xlat16_78;
    u_xlat16_83 = u_xlat82 * u_xlat16_78;
    u_xlat82 = (-u_xlat16_78) * u_xlat82 + 1.0;
    u_xlat14.xzw = u_xlat16_1.xyz * vec3(u_xlat82);
    u_xlat14.xzw = vec3(u_xlat38) * vec3(u_xlat16_83) + u_xlat14.xzw;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_23.xy = u_xlat24.xy * u_xlat16_29.xx;
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_23.xzw + (-u_xlat2.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_51) * u_xlat16_12.xyz + u_xlat2.xxx;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat26.x = u_xlat26.z * u_xlat26.x;
    u_xlat14.xzw = u_xlat14.xzw * u_xlat26.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xzw = min(max(u_xlat14.xzw, 0.0), 1.0);
#else
    u_xlat14.xzw = clamp(u_xlat14.xzw, 0.0, 1.0);
#endif
    u_xlat14.xzw = u_xlat14.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat14.xzw;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_29.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_29.x = max(u_xlat16_29.x, 6.10351563e-05);
    u_xlat16_78 = inversesqrt(u_xlat16_29.x);
    u_xlat16_19.xyz = u_xlat2.xyw * vec3(u_xlat16_78);
    u_xlat16_21.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_23.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_83 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_83);
    u_xlat16_83 = float(1.0) / float(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_29.x = (-u_xlat16_29.x) * u_xlat16_29.x + 1.0;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_83;
    u_xlat16_29.x = max(u_xlat16_21.x, u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_78 * u_xlat16_29.x;
    u_xlat16_21.xyz = u_xlat16_29.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyw = u_xlat10.xyz * vec3(u_xlat16_75) + u_xlat16_19.xyz;
    u_xlat24.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyw = u_xlat24.xxx * u_xlat2.xyw;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_75 = dot(u_xlat16_19.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat80 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat16_3.x / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 0.318309873;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat26.x = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat26.x = u_xlat2.x * u_xlat26.x + u_xlat16_3.x;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x + u_xlat2.x;
    u_xlat26.x = u_xlat26.x + 6.10351563e-05;
    u_xlat26.x = u_xlat26.x * u_xlat81;
    u_xlat26.x = float(1.0) / u_xlat26.x;
    u_xlat26.x = min(u_xlat26.x, 16.0);
    u_xlat74 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat74 * u_xlat74;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_75 = u_xlat74 * u_xlat16_75;
    u_xlat16_29.x = u_xlat74 * u_xlat16_75;
    u_xlat74 = (-u_xlat16_75) * u_xlat74 + 1.0;
    u_xlat10.xyz = u_xlat16_1.xyz * vec3(u_xlat74);
    u_xlat10.xyz = vec3(u_xlat38) * u_xlat16_29.xxx + u_xlat10.xyz;
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_23.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + (-u_xlat2.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_51) * u_xlat16_16.xyz + u_xlat2.xxx;
    u_xlat16_16.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_21.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat24.x = u_xlat24.x * u_xlat26.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat24.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * u_xlat2.xyw;
    u_xlat16_11.xyz = u_xlat2.xyw * u_xlat24.yyy + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat24.yyy + u_xlat16_12.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat48 = dot(u_xlat16_16.xyz, u_xlat17.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_5.www * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_76) * u_xlat16_18.xyz + u_xlat16_4.xyz;
    u_xlat48 = min(u_xlat16_27.x, 1.0);
    u_xlat2.x = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat2.xxx * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_79) * u_xlat16_16.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_18.xyz;
    u_xlati24 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_76 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_76) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_29.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_10.w);
    u_xlat16_29.x = u_xlat16_76 + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_53 = u_xlat16_29.z * 15.0 + (-u_xlat16_76);
    u_xlat16_10.x = u_xlat16_76 * 16.0 + u_xlat16_10.y;
    u_xlat16_7.x = u_xlat16_29.x * 16.0 + u_xlat16_10.y;
    u_xlat16_29.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_7.y = u_xlat16_10.z;
    u_xlat16_29.xz = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_29.xz = u_xlat16_29.xz * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_29.xz).x;
    u_xlat16_76 = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_76 = u_xlat16_53 * u_xlat16_76 + u_xlat16_0.x;
    u_xlat16_76 = u_xlat16_79 * u_xlat16_76;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = u_xlat48 * 0.5;
    u_xlat16_29.x = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat0.x * u_xlat16_29.x + u_xlat16_76;
    u_xlat16_29.x = u_xlat16_76 + u_xlat16_76;
    u_xlat16_53 = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_53 + u_xlat16_29.x;
    u_xlat16_76 = u_xlat48 * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_2.z, u_xlat16_76);
    u_xlat16_29.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_29.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_29.xyz;
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_29.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_29.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_73;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(12) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec2 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
float u_xlat30;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_46;
mediump vec2 u_xlat16_47;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_61;
float u_xlat66;
mediump float u_xlat16_75;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
float u_xlat93;
float u_xlat94;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_85 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_85<0.0);
#else
    u_xlatb28 = u_xlat16_85<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb28;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_87 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_87) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_87 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_7.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb28)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat28.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat12.z;
    u_xlat56 = max((-u_xlat12.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat12.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_90 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat15.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_90) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_90;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat56 = (-u_xlat28.x) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat56>=0.99000001);
#else
    u_xlatb56 = u_xlat56>=0.99000001;
#endif
    u_xlat16_90 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_17.xy = vec2(u_xlat16_91) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_56 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_91 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = log2(u_xlat16_91);
    u_xlat16_17.x = u_xlat16_91 * _customMatcapFresnelStrPow;
    u_xlat16_18.x = exp2(u_xlat16_17.x);
    u_xlat16_18.x = u_xlat16_18.x * _customMatcapFresnelStr;
    u_xlat16_46.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_46.xyz = vec3(u_xlat16_90) * u_xlat16_46.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xxx * _stockingFresnelCol.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_90 = _sssIntensity * _sssIntensity;
    u_xlat16_90 = u_xlat16_2.x * u_xlat16_90;
    u_xlat16_18.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat8.xyz;
    u_xlat16_103 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_20.xyz = vec3(u_xlat16_103) * u_xlat16_20.xyz;
    u_xlat16_103 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_33.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_33.x * 0.5 + 0.5;
    u_xlat16_18.x = (-u_xlat16_33.x) + u_xlat16_18.x;
    u_xlat16_33.x = u_xlat16_5.w * u_xlat16_18.x + u_xlat16_33.x;
    u_xlat16_33.x = u_xlat16_5.w * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat16_103 * u_xlat16_33.x;
    u_xlat16_18.x = sqrt(u_xlat16_90);
    u_xlat16_21.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_18.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_18.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = u_xlat16_18.xxx * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_87 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat92 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat92);
    u_xlat92 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_104 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_104 = min(max(u_xlat16_104, 0.0), 1.0);
#else
    u_xlat16_104 = clamp(u_xlat16_104, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat30 = u_xlat92 * u_xlat92;
    u_xlat86 = u_xlat16_3.x + -1.0;
    u_xlat30 = u_xlat30 * u_xlat86 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat16_3.x / u_xlat30;
    u_xlat30 = u_xlat30 * 0.318309873;
    u_xlat30 = min(u_xlat30, 16.0);
    u_xlat92 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat92 = u_xlat13.x * u_xlat92 + u_xlat16_3.x;
    u_xlat92 = sqrt(u_xlat92);
    u_xlat92 = u_xlat92 + u_xlat13.x;
    u_xlat92 = u_xlat92 + 6.10351563e-05;
    u_xlat93 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat93 = u_xlat2.x * u_xlat93 + u_xlat16_3.x;
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat2.x + u_xlat93;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat92 * u_xlat93;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat93 = min(u_xlat93, 16.0);
    u_xlat66 = (-u_xlat16_104) + 1.0;
    u_xlat16_104 = u_xlat66 * u_xlat66;
    u_xlat16_104 = u_xlat66 * u_xlat16_104;
    u_xlat16_104 = u_xlat66 * u_xlat16_104;
    u_xlat16_105 = u_xlat66 * u_xlat16_104;
    u_xlat94 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat94 = min(max(u_xlat94, 0.0), 1.0);
#else
    u_xlat94 = clamp(u_xlat94, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_104) * u_xlat66 + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat66);
    u_xlat12.xyz = vec3(u_xlat94) * vec3(u_xlat16_105) + u_xlat12.xyz;
    u_xlat16_24.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz + _shadowColor.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz + (-u_xlat16_22.xyz);
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_104 = sqrt(u_xlat16_33.x);
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(u_xlat16_104);
    u_xlat16_27.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-u_xlat2.xxx);
    u_xlat16_25.xyz = u_xlat16_18.xxx * u_xlat16_25.xyz + u_xlat2.xxx;
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat30 = u_xlat30 * u_xlat93;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat30);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_24.xyz * u_xlat12.xyz;
    u_xlat16_46.xyz = u_xlat2.xxx * u_xlat16_46.xyz;
    u_xlat16_46.xyz = u_xlat16_46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_46.xyz = u_xlat16_46.xyz * u_xlat16_24.xyz + u_xlat16_19.xyz;
    u_xlat16_46.xyz = (-u_xlat12.xyz) * u_xlat16_24.xyz + u_xlat16_46.xyz;
    u_xlat16_46.xyz = vec3(u_xlat16_56) * u_xlat16_46.xyz + u_xlat15.xyz;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_19.x = max(u_xlat16_19.x, 6.10351563e-05);
    u_xlat16_47.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_24.xyz = u_xlat12.xyz * u_xlat16_47.xxx;
    u_xlat16_47.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_47.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_47.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_105 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
    u_xlat16_105 = u_xlat16_105 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_105 = min(max(u_xlat16_105, 0.0), 1.0);
#else
    u_xlat16_105 = clamp(u_xlat16_105, 0.0, 1.0);
#endif
    u_xlat16_105 = u_xlat16_105 * u_xlat16_105;
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_105);
    u_xlat16_105 = float(1.0) / float(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_105;
    u_xlat16_19.x = max(u_xlat16_47.x, u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_75 * u_xlat16_19.x;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_105 = dot(u_xlat16_24.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_105 = min(max(u_xlat16_105, 0.0), 1.0);
#else
    u_xlat16_105 = clamp(u_xlat16_105, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat86 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat30 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat30 = u_xlat2.x * u_xlat30 + u_xlat16_3.x;
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = u_xlat30 + u_xlat2.x;
    u_xlat30 = u_xlat30 + 6.10351563e-05;
    u_xlat30 = u_xlat30 * u_xlat92;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat30 = min(u_xlat30, 16.0);
    u_xlat93 = (-u_xlat16_105) + 1.0;
    u_xlat16_105 = u_xlat93 * u_xlat93;
    u_xlat16_105 = u_xlat93 * u_xlat16_105;
    u_xlat16_105 = u_xlat93 * u_xlat16_105;
    u_xlat16_106 = u_xlat93 * u_xlat16_105;
    u_xlat93 = (-u_xlat16_105) * u_xlat93 + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat93);
    u_xlat12.xyz = vec3(u_xlat94) * vec3(u_xlat16_106) + u_xlat12.xyz;
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_26.xy = u_xlat10.xy * vec2(u_xlat16_104);
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_26.xzw + (-u_xlat2.xxx);
    u_xlat16_24.xyz = u_xlat16_18.xxx * u_xlat16_24.xyz + u_xlat2.xxx;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_19.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.xxx * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat30;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_19.xyz * u_xlat12.xyz;
    u_xlat16_46.xyz = u_xlat12.xyz * u_xlat10.xxx + u_xlat16_46.xyz;
    u_xlat16_19.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_24.xyz;
    u_xlat16_104 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_104));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_104);
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_104 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_104 = max(u_xlat16_104, 6.10351563e-05);
    u_xlat16_105 = inversesqrt(u_xlat16_104);
    u_xlat16_24.xyz = u_xlat12.xyz * vec3(u_xlat16_105);
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_105 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_106 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_106 = u_xlat16_106 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_106 = u_xlat16_106 * u_xlat16_106;
    u_xlat16_105 = max(u_xlat16_105, u_xlat16_106);
    u_xlat16_106 = float(1.0) / float(u_xlat16_104);
    u_xlat16_104 = u_xlat16_104 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_104 = (-u_xlat16_104) * u_xlat16_104 + 1.0;
    u_xlat16_104 = max(u_xlat16_104, 0.0);
    u_xlat16_104 = u_xlat16_104 * u_xlat16_104;
    u_xlat16_104 = u_xlat16_104 * u_xlat16_106;
    u_xlat16_104 = max(u_xlat16_25.x, u_xlat16_104);
    u_xlat16_104 = u_xlat16_105 * u_xlat16_104;
    u_xlat16_25.xyz = vec3(u_xlat16_104) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat86 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat30 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat30 = u_xlat2.x * u_xlat30 + u_xlat16_3.x;
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = u_xlat30 + u_xlat2.x;
    u_xlat30 = u_xlat30 + 6.10351563e-05;
    u_xlat30 = u_xlat30 * u_xlat92;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat30 = min(u_xlat30, 16.0);
    u_xlat86 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat86 * u_xlat86;
    u_xlat16_88 = u_xlat86 * u_xlat16_88;
    u_xlat16_88 = u_xlat86 * u_xlat16_88;
    u_xlat16_104 = u_xlat86 * u_xlat16_88;
    u_xlat86 = (-u_xlat16_88) * u_xlat86 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat86);
    u_xlat10.xzw = vec3(u_xlat94) * vec3(u_xlat16_104) + u_xlat11.xyz;
    u_xlat16_21.xyz = u_xlat2.xxx * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_26.yyy * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-u_xlat2.xxx);
    u_xlat16_21.xyz = u_xlat16_18.xxx * u_xlat16_21.xyz + u_xlat2.xxx;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat30;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xzw;
    u_xlat2.xyw = u_xlat16_25.xyz * u_xlat2.xyw;
    u_xlat16_18.xyz = u_xlat2.xyw * u_xlat10.yyy + u_xlat16_46.xyz;
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat10.yyy + u_xlat16_19.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_21.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat22.y = u_xlat8.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat92 = dot(u_xlat16_21.xyz, u_xlat22.xyz);
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.www * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + u_xlat16_4.xyz;
    u_xlat28.xy = min(u_xlat16_33.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat28.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat28.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_103) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_24.xyz;
    u_xlati28 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_24.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_88 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_88) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_88 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_20.xyz, u_xlat2.xyw);
    u_xlat16_33.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_3.w);
    u_xlat16_61 = u_xlat16_33.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_89 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_3.x = u_xlat16_33.x * 16.0 + u_xlat16_3.y;
    u_xlat16_24.x = u_xlat16_61 * 16.0 + u_xlat16_3.y;
    u_xlat16_33.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_24.y = u_xlat16_3.z;
    u_xlat16_33.xy = u_xlat16_24.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_103 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat28.y * 0.5;
    u_xlat16_61 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_61 + u_xlat16_33.x;
    u_xlat16_61 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_89 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_89 + u_xlat16_61;
    u_xlat16_33.x = u_xlat28.y * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_20.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_21.xyz = vec3(u_xlat16_88) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_20.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_18.xyz;
    u_xlat16_88 = dot(u_xlat16_20.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_88 : u_xlat16_85;
    u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_18.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(12) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec2 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
float u_xlat30;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_46;
mediump vec2 u_xlat16_47;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_61;
float u_xlat66;
mediump float u_xlat16_75;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
float u_xlat93;
float u_xlat94;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_85 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_85<0.0);
#else
    u_xlatb28 = u_xlat16_85<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb28;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_87 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_87) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_87 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_7.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb28)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat28.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat12.z;
    u_xlat56 = max((-u_xlat12.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat12.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_90 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat15.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec2 = vec3(u_xlat15.xy,u_xlat15.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat15.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat15.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat15.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_90) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_90;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat56 = (-u_xlat28.x) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat56>=0.99000001);
#else
    u_xlatb56 = u_xlat56>=0.99000001;
#endif
    u_xlat16_90 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_17.xy = vec2(u_xlat16_91) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_56 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_91 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = log2(u_xlat16_91);
    u_xlat16_17.x = u_xlat16_91 * _customMatcapFresnelStrPow;
    u_xlat16_18.x = exp2(u_xlat16_17.x);
    u_xlat16_18.x = u_xlat16_18.x * _customMatcapFresnelStr;
    u_xlat16_46.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_46.xyz = vec3(u_xlat16_90) * u_xlat16_46.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xxx * _stockingFresnelCol.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_90 = _sssIntensity * _sssIntensity;
    u_xlat16_90 = u_xlat16_2.x * u_xlat16_90;
    u_xlat16_18.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat8.xyz;
    u_xlat16_103 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_20.xyz = vec3(u_xlat16_103) * u_xlat16_20.xyz;
    u_xlat16_103 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_33.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_33.x * 0.5 + 0.5;
    u_xlat16_18.x = (-u_xlat16_33.x) + u_xlat16_18.x;
    u_xlat16_33.x = u_xlat16_5.w * u_xlat16_18.x + u_xlat16_33.x;
    u_xlat16_33.x = u_xlat16_5.w * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat16_103 * u_xlat16_33.x;
    u_xlat16_18.x = sqrt(u_xlat16_90);
    u_xlat16_21.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = u_xlat16_18.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = u_xlat16_18.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = u_xlat16_18.xxx * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_87 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat92 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat92);
    u_xlat92 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_104 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_104 = min(max(u_xlat16_104, 0.0), 1.0);
#else
    u_xlat16_104 = clamp(u_xlat16_104, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat30 = u_xlat92 * u_xlat92;
    u_xlat86 = u_xlat16_3.x + -1.0;
    u_xlat30 = u_xlat30 * u_xlat86 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat16_3.x / u_xlat30;
    u_xlat30 = u_xlat30 * 0.318309873;
    u_xlat30 = min(u_xlat30, 16.0);
    u_xlat92 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat92 = u_xlat13.x * u_xlat92 + u_xlat16_3.x;
    u_xlat92 = sqrt(u_xlat92);
    u_xlat92 = u_xlat92 + u_xlat13.x;
    u_xlat92 = u_xlat92 + 6.10351563e-05;
    u_xlat93 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat93 = u_xlat2.x * u_xlat93 + u_xlat16_3.x;
    u_xlat93 = sqrt(u_xlat93);
    u_xlat93 = u_xlat2.x + u_xlat93;
    u_xlat93 = u_xlat93 + 6.10351563e-05;
    u_xlat93 = u_xlat92 * u_xlat93;
    u_xlat93 = float(1.0) / u_xlat93;
    u_xlat93 = min(u_xlat93, 16.0);
    u_xlat66 = (-u_xlat16_104) + 1.0;
    u_xlat16_104 = u_xlat66 * u_xlat66;
    u_xlat16_104 = u_xlat66 * u_xlat16_104;
    u_xlat16_104 = u_xlat66 * u_xlat16_104;
    u_xlat16_105 = u_xlat66 * u_xlat16_104;
    u_xlat94 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat94 = min(max(u_xlat94, 0.0), 1.0);
#else
    u_xlat94 = clamp(u_xlat94, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_104) * u_xlat66 + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat66);
    u_xlat12.xyz = vec3(u_xlat94) * vec3(u_xlat16_105) + u_xlat12.xyz;
    u_xlat16_24.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz + _shadowColor.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz + (-u_xlat16_22.xyz);
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_104 = sqrt(u_xlat16_33.x);
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(u_xlat16_104);
    u_xlat16_27.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-u_xlat2.xxx);
    u_xlat16_25.xyz = u_xlat16_18.xxx * u_xlat16_25.xyz + u_xlat2.xxx;
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat30 = u_xlat30 * u_xlat93;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat30);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_24.xyz * u_xlat12.xyz;
    u_xlat16_46.xyz = u_xlat2.xxx * u_xlat16_46.xyz;
    u_xlat16_46.xyz = u_xlat16_46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_46.xyz = u_xlat16_46.xyz * u_xlat16_24.xyz + u_xlat16_19.xyz;
    u_xlat16_46.xyz = (-u_xlat12.xyz) * u_xlat16_24.xyz + u_xlat16_46.xyz;
    u_xlat16_46.xyz = vec3(u_xlat16_56) * u_xlat16_46.xyz + u_xlat15.xyz;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_19.x = max(u_xlat16_19.x, 6.10351563e-05);
    u_xlat16_47.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_24.xyz = u_xlat12.xyz * u_xlat16_47.xxx;
    u_xlat16_47.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_47.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_47.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_105 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_24.xyz);
    u_xlat16_105 = u_xlat16_105 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_105 = min(max(u_xlat16_105, 0.0), 1.0);
#else
    u_xlat16_105 = clamp(u_xlat16_105, 0.0, 1.0);
#endif
    u_xlat16_105 = u_xlat16_105 * u_xlat16_105;
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_105);
    u_xlat16_105 = float(1.0) / float(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_105;
    u_xlat16_19.x = max(u_xlat16_47.x, u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_75 * u_xlat16_19.x;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_105 = dot(u_xlat16_24.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_105 = min(max(u_xlat16_105, 0.0), 1.0);
#else
    u_xlat16_105 = clamp(u_xlat16_105, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat86 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat30 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat30 = u_xlat2.x * u_xlat30 + u_xlat16_3.x;
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = u_xlat30 + u_xlat2.x;
    u_xlat30 = u_xlat30 + 6.10351563e-05;
    u_xlat30 = u_xlat30 * u_xlat92;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat30 = min(u_xlat30, 16.0);
    u_xlat93 = (-u_xlat16_105) + 1.0;
    u_xlat16_105 = u_xlat93 * u_xlat93;
    u_xlat16_105 = u_xlat93 * u_xlat16_105;
    u_xlat16_105 = u_xlat93 * u_xlat16_105;
    u_xlat16_106 = u_xlat93 * u_xlat16_105;
    u_xlat93 = (-u_xlat16_105) * u_xlat93 + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat93);
    u_xlat12.xyz = vec3(u_xlat94) * vec3(u_xlat16_106) + u_xlat12.xyz;
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_26.xy = u_xlat10.xy * vec2(u_xlat16_104);
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_26.xzw + (-u_xlat2.xxx);
    u_xlat16_24.xyz = u_xlat16_18.xxx * u_xlat16_24.xyz + u_xlat2.xxx;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_19.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat10.xxx * u_xlat16_24.xyz;
    u_xlat56 = u_xlat56 * u_xlat30;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_19.xyz * u_xlat12.xyz;
    u_xlat16_46.xyz = u_xlat12.xyz * u_xlat10.xxx + u_xlat16_46.xyz;
    u_xlat16_19.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_24.xyz;
    u_xlat16_104 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_104));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_104);
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_104 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_104 = max(u_xlat16_104, 6.10351563e-05);
    u_xlat16_105 = inversesqrt(u_xlat16_104);
    u_xlat16_24.xyz = u_xlat12.xyz * vec3(u_xlat16_105);
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_105 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_106 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_106 = u_xlat16_106 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_106 = min(max(u_xlat16_106, 0.0), 1.0);
#else
    u_xlat16_106 = clamp(u_xlat16_106, 0.0, 1.0);
#endif
    u_xlat16_106 = u_xlat16_106 * u_xlat16_106;
    u_xlat16_105 = max(u_xlat16_105, u_xlat16_106);
    u_xlat16_106 = float(1.0) / float(u_xlat16_104);
    u_xlat16_104 = u_xlat16_104 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_104 = (-u_xlat16_104) * u_xlat16_104 + 1.0;
    u_xlat16_104 = max(u_xlat16_104, 0.0);
    u_xlat16_104 = u_xlat16_104 * u_xlat16_104;
    u_xlat16_104 = u_xlat16_104 * u_xlat16_106;
    u_xlat16_104 = max(u_xlat16_25.x, u_xlat16_104);
    u_xlat16_104 = u_xlat16_105 * u_xlat16_104;
    u_xlat16_25.xyz = vec3(u_xlat16_104) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat56 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat11.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat86 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_3.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat30 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat30 = u_xlat2.x * u_xlat30 + u_xlat16_3.x;
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = u_xlat30 + u_xlat2.x;
    u_xlat30 = u_xlat30 + 6.10351563e-05;
    u_xlat30 = u_xlat30 * u_xlat92;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat30 = min(u_xlat30, 16.0);
    u_xlat86 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat86 * u_xlat86;
    u_xlat16_88 = u_xlat86 * u_xlat16_88;
    u_xlat16_88 = u_xlat86 * u_xlat16_88;
    u_xlat16_104 = u_xlat86 * u_xlat16_88;
    u_xlat86 = (-u_xlat16_88) * u_xlat86 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat86);
    u_xlat10.xzw = vec3(u_xlat94) * vec3(u_xlat16_104) + u_xlat11.xyz;
    u_xlat16_21.xyz = u_xlat2.xxx * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_26.yyy * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-u_xlat2.xxx);
    u_xlat16_21.xyz = u_xlat16_18.xxx * u_xlat16_21.xyz + u_xlat2.xxx;
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat56 = u_xlat56 * u_xlat30;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat10.xzw * _directSpecularColor.xyz;
    u_xlat2.xyw = u_xlat2.xxx * u_xlat10.xzw;
    u_xlat2.xyw = u_xlat16_25.xyz * u_xlat2.xyw;
    u_xlat16_18.xyz = u_xlat2.xyw * u_xlat10.yyy + u_xlat16_46.xyz;
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat10.yyy + u_xlat16_19.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_21.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat22.y = u_xlat8.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat92 = dot(u_xlat16_21.xyz, u_xlat22.xyz);
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat92) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.www * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + u_xlat16_4.xyz;
    u_xlat28.xy = min(u_xlat16_33.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.z);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat28.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat28.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_103) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_24.xyz;
    u_xlati28 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_24.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_88 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_88) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_88 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_20.xyz, u_xlat2.xyw);
    u_xlat16_33.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_3.w);
    u_xlat16_61 = u_xlat16_33.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_89 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_3.x = u_xlat16_33.x * 16.0 + u_xlat16_3.y;
    u_xlat16_24.x = u_xlat16_61 * 16.0 + u_xlat16_3.y;
    u_xlat16_33.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_24.y = u_xlat16_3.z;
    u_xlat16_33.xy = u_xlat16_24.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_103 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat28.y * 0.5;
    u_xlat16_61 = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_61 + u_xlat16_33.x;
    u_xlat16_61 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_89 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_89 + u_xlat16_61;
    u_xlat16_33.x = u_xlat28.y * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_20.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_21.xyz = vec3(u_xlat16_88) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_20.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_18.xyz;
    u_xlat16_88 = dot(u_xlat16_20.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_88 : u_xlat16_85;
    u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz + u_xlat16_18.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_1.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(11) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
vec3 u_xlat23;
mediump vec2 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
float u_xlat25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat33;
float u_xlat46;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_70 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_70<0.0);
#else
    u_xlatb23 = u_xlat16_70<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb23;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_23.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_72 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat10.xyz;
    u_xlat16_73 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_11.xy = vec2(u_xlat16_73) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_73 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = log2(u_xlat16_73);
    u_xlat16_73 = u_xlat16_73 * _customMatcapFresnelStrPow;
    u_xlat16_73 = exp2(u_xlat16_73);
    u_xlat16_73 = u_xlat16_73 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_73) * _stockingFresnelCol.xyz;
    u_xlat16_71 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_73 = _sssIntensity * _sssIntensity;
    u_xlat16_73 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_75 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_75;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_76 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_13.xyz = vec3(u_xlat16_76) * u_xlat16_13.xyz;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_75);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_26.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_26.x * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_26.x) + u_xlat16_49;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_49 + u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_76 * u_xlat16_26.x;
    u_xlat16_49 = sqrt(u_xlat16_73);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_49) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_49) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_49) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_72) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat25 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat10.xyz = vec3(u_xlat25) * u_xlat10.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat77 = u_xlat16_3.x + -1.0;
    u_xlat25 = u_xlat25 * u_xlat77 + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat16_3.x / u_xlat25;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat77 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat77 = u_xlat15.x * u_xlat77 + u_xlat16_3.x;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat15.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat78 = (-u_xlat71) * u_xlat16_3.x + u_xlat71;
    u_xlat78 = u_xlat71 * u_xlat78 + u_xlat16_3.x;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat71 + u_xlat78;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat77 = u_xlat77 * u_xlat78;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat78 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat78 * u_xlat78;
    u_xlat16_72 = u_xlat78 * u_xlat16_72;
    u_xlat16_72 = u_xlat78 * u_xlat16_72;
    u_xlat16_28.x = u_xlat78 * u_xlat16_72;
    u_xlat10.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_72) * u_xlat78 + 1.0;
    u_xlat33.xyz = u_xlat16_1.xyz * vec3(u_xlat78);
    u_xlat10.xyz = u_xlat10.xxx * u_xlat16_28.xxx + u_xlat33.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_19.xyz = vec3(u_xlat71) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_72 = sqrt(u_xlat16_26.x);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_72) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-vec3(u_xlat71));
    u_xlat16_19.xyz = vec3(u_xlat16_49) * u_xlat16_19.xyz + vec3(u_xlat71);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat25 = u_xlat25 * u_xlat77;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat25);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat71) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat10.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat14.xyz;
    u_xlat16_28.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_28.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_28.x);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_28.x = max(u_xlat16_28.x, 6.10351563e-05);
    u_xlat16_75 = inversesqrt(u_xlat16_28.x);
    u_xlat16_12.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_80);
    u_xlat16_80 = float(1.0) / float(u_xlat16_28.x);
    u_xlat16_28.x = u_xlat16_28.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_28.x = (-u_xlat16_28.x) * u_xlat16_28.x + 1.0;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_80;
    u_xlat16_28.x = max(u_xlat16_21.x, u_xlat16_28.x);
    u_xlat16_28.x = u_xlat16_75 * u_xlat16_28.x;
    u_xlat16_21.xyz = u_xlat16_28.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_22.xy = u_xlat23.xy * vec2(u_xlat16_72);
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_22.xzw + (-u_xlat2.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_49) * u_xlat16_12.xyz + u_xlat2.xxx;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_28.x = inversesqrt(u_xlat16_72);
    u_xlat16_19.xyz = u_xlat2.xyw * u_xlat16_28.xxx;
    u_xlat16_21.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_28.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_75 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_75 = u_xlat16_75 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_28.x = max(u_xlat16_28.x, u_xlat16_75);
    u_xlat16_75 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_75;
    u_xlat16_72 = max(u_xlat16_21.x, u_xlat16_72);
    u_xlat16_72 = u_xlat16_28.x * u_xlat16_72;
    u_xlat16_21.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat23.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_22.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + (-u_xlat23.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_49) * u_xlat16_16.xyz + u_xlat23.xxx;
    u_xlat16_16.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_21.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat23.yyy * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat23.xxx + u_xlat16_12.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati23 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat46 = dot(u_xlat16_16.xyz, u_xlat17.xyz);
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat46) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_5.www * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz + u_xlat16_4.xyz;
    u_xlat46 = min(u_xlat16_26.x, 1.0);
    u_xlat2.x = min(u_xlat46, u_xlat16_2.z);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_76) * u_xlat16_16.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_18.xyz;
    u_xlati23 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_73 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_73) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_28.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_28.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_10.w);
    u_xlat16_28.x = u_xlat16_73 + 1.0;
    u_xlat16_28.x = min(u_xlat16_28.x, 15.0);
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_73);
    u_xlat16_10.x = u_xlat16_73 * 16.0 + u_xlat16_10.y;
    u_xlat16_7.x = u_xlat16_28.x * 16.0 + u_xlat16_10.y;
    u_xlat16_28.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_7.y = u_xlat16_10.z;
    u_xlat16_28.xz = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_73 = (-u_xlat16_0.x) + u_xlat16_23.x;
    u_xlat16_73 = u_xlat16_51 * u_xlat16_73 + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_76 * u_xlat16_73;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_73;
    u_xlat16_73 = u_xlat46 * 0.5;
    u_xlat16_28.x = (-u_xlat46) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_28.x + u_xlat16_73;
    u_xlat16_28.x = u_xlat16_73 + u_xlat16_73;
    u_xlat16_51 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_51 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat46 * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_2.z, u_xlat16_73);
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_28.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_28.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_73) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_70;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_70 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat23.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat23.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat23.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(11) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
vec3 u_xlat23;
mediump vec2 u_xlat16_23;
int u_xlati23;
bool u_xlatb23;
float u_xlat25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat33;
float u_xlat46;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_70 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_70<0.0);
#else
    u_xlatb23 = u_xlat16_70<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb23;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_72 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_72) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_23.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_72 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat10.xyz;
    u_xlat16_73 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_11.xy = vec2(u_xlat16_73) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_73 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = log2(u_xlat16_73);
    u_xlat16_73 = u_xlat16_73 * _customMatcapFresnelStrPow;
    u_xlat16_73 = exp2(u_xlat16_73);
    u_xlat16_73 = u_xlat16_73 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_73) * _stockingFresnelCol.xyz;
    u_xlat16_71 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_73 = _sssIntensity * _sssIntensity;
    u_xlat16_73 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_75 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_75;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_76 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_13.xyz = vec3(u_xlat16_76) * u_xlat16_13.xyz;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_75);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_26.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_26.x * 0.5 + 0.5;
    u_xlat16_49 = (-u_xlat16_26.x) + u_xlat16_49;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_49 + u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_5.w * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_76 * u_xlat16_26.x;
    u_xlat16_49 = sqrt(u_xlat16_73);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_49) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_49) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_49) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_72) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat25 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat10.xyz = vec3(u_xlat25) * u_xlat10.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat77 = u_xlat16_3.x + -1.0;
    u_xlat25 = u_xlat25 * u_xlat77 + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat16_3.x / u_xlat25;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat77 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat77 = u_xlat15.x * u_xlat77 + u_xlat16_3.x;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat15.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat78 = (-u_xlat71) * u_xlat16_3.x + u_xlat71;
    u_xlat78 = u_xlat71 * u_xlat78 + u_xlat16_3.x;
    u_xlat78 = sqrt(u_xlat78);
    u_xlat78 = u_xlat71 + u_xlat78;
    u_xlat78 = u_xlat78 + 6.10351563e-05;
    u_xlat77 = u_xlat77 * u_xlat78;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat78 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat78 * u_xlat78;
    u_xlat16_72 = u_xlat78 * u_xlat16_72;
    u_xlat16_72 = u_xlat78 * u_xlat16_72;
    u_xlat16_28.x = u_xlat78 * u_xlat16_72;
    u_xlat10.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_72) * u_xlat78 + 1.0;
    u_xlat33.xyz = u_xlat16_1.xyz * vec3(u_xlat78);
    u_xlat10.xyz = u_xlat10.xxx * u_xlat16_28.xxx + u_xlat33.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_17.xyz);
    u_xlat16_19.xyz = vec3(u_xlat71) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_72 = sqrt(u_xlat16_26.x);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_72) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xyz + (-vec3(u_xlat71));
    u_xlat16_19.xyz = vec3(u_xlat16_49) * u_xlat16_19.xyz + vec3(u_xlat71);
    u_xlat16_19.xyz = u_xlat16_4.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat25 = u_xlat25 * u_xlat77;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat25);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat71) * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat71) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat10.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat14.xyz;
    u_xlat16_28.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_28.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_28.x);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_28.x = max(u_xlat16_28.x, 6.10351563e-05);
    u_xlat16_75 = inversesqrt(u_xlat16_28.x);
    u_xlat16_12.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_21.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_80 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat16_80 = u_xlat16_80 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_80);
    u_xlat16_80 = float(1.0) / float(u_xlat16_28.x);
    u_xlat16_28.x = u_xlat16_28.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_28.x = (-u_xlat16_28.x) * u_xlat16_28.x + 1.0;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_80;
    u_xlat16_28.x = max(u_xlat16_21.x, u_xlat16_28.x);
    u_xlat16_28.x = u_xlat16_75 * u_xlat16_28.x;
    u_xlat16_21.xyz = u_xlat16_28.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_22.xy = u_xlat23.xy * vec2(u_xlat16_72);
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_22.xzw + (-u_xlat2.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_49) * u_xlat16_12.xyz + u_xlat2.xxx;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_21.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat23.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb23 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_28.x = inversesqrt(u_xlat16_72);
    u_xlat16_19.xyz = u_xlat2.xyw * u_xlat16_28.xxx;
    u_xlat16_21.xy = (bool(u_xlatb23)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb23 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_28.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_75 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_75 = u_xlat16_75 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_28.x = max(u_xlat16_28.x, u_xlat16_75);
    u_xlat16_75 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_75;
    u_xlat16_72 = max(u_xlat16_21.x, u_xlat16_72);
    u_xlat16_72 = u_xlat16_28.x * u_xlat16_72;
    u_xlat16_21.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat23.xxx * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_22.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + (-u_xlat23.xxx);
    u_xlat16_16.xyz = vec3(u_xlat16_49) * u_xlat16_16.xyz + u_xlat23.xxx;
    u_xlat16_16.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_21.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat23.yyy * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_16.xyz * u_xlat23.xxx + u_xlat16_12.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati23 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat46 = dot(u_xlat16_16.xyz, u_xlat17.xyz);
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat46) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_18.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_5.www * u_xlat16_18.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz + u_xlat16_4.xyz;
    u_xlat46 = min(u_xlat16_26.x, 1.0);
    u_xlat2.x = min(u_xlat46, u_xlat16_2.z);
    u_xlat16_26.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat2.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_76) * u_xlat16_16.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_18.xyz;
    u_xlati23 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_73 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_73) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_28.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_28.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_10.w);
    u_xlat16_28.x = u_xlat16_73 + 1.0;
    u_xlat16_28.x = min(u_xlat16_28.x, 15.0);
    u_xlat16_51 = u_xlat16_28.z * 15.0 + (-u_xlat16_73);
    u_xlat16_10.x = u_xlat16_73 * 16.0 + u_xlat16_10.y;
    u_xlat16_7.x = u_xlat16_28.x * 16.0 + u_xlat16_10.y;
    u_xlat16_28.xz = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_7.y = u_xlat16_10.z;
    u_xlat16_28.xz = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_28.xz = u_xlat16_28.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23.x = texture(_SpecularOcclusionLut3D, u_xlat16_28.xz).x;
    u_xlat16_73 = (-u_xlat16_0.x) + u_xlat16_23.x;
    u_xlat16_73 = u_xlat16_51 * u_xlat16_73 + u_xlat16_0.x;
    u_xlat16_73 = u_xlat16_76 * u_xlat16_73;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_73;
    u_xlat16_73 = u_xlat46 * 0.5;
    u_xlat16_28.x = (-u_xlat46) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat0.x * u_xlat16_28.x + u_xlat16_73;
    u_xlat16_28.x = u_xlat16_73 + u_xlat16_73;
    u_xlat16_51 = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_51 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat46 * u_xlat16_73;
    u_xlat16_73 = min(u_xlat16_2.z, u_xlat16_73);
    u_xlat16_28.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_28.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_28.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_28.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_73) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_70;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_26.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_70 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_70) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat1.x = u_xlat69 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat23.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat23.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat69);
    u_xlat23.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat23.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(13) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
vec3 u_xlat39;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
vec2 u_xlat66;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
int u_xlati92;
float u_xlat93;
float u_xlat94;
mediump float u_xlat16_101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_85 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_85<0.0);
#else
    u_xlatb28 = u_xlat16_85<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb28;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_87 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_87) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_87 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_7.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb28)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat28.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat12.z;
    u_xlat56 = max((-u_xlat12.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat12.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_90 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec2 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_90) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_90;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat56 = (-u_xlat28.x) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat56>=0.99000001);
#else
    u_xlatb56 = u_xlat56>=0.99000001;
#endif
    u_xlat16_90 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_17.xy = vec2(u_xlat16_91) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat66.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat66.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_56 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_91 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = log2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStrPow;
    u_xlat16_91 = exp2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStr;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_90) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_91) * _stockingFresnelCol.xyz;
    u_xlat16_92 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_90 = _sssIntensity * _sssIntensity;
    u_xlat16_90 = u_xlat16_92 * u_xlat16_90;
    u_xlat16_91 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_101 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_101 = inversesqrt(u_xlat16_101);
    u_xlat16_20.xyz = vec3(u_xlat16_101) * u_xlat16_19.xyz;
    u_xlat16_101 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_101 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 + -1.0;
    u_xlat16_101 = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_91);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_31.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.x = min(max(u_xlat16_31.x, 0.0), 1.0);
#else
    u_xlat16_31.x = clamp(u_xlat16_31.x, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_31.x * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_31.x) + u_xlat16_59;
    u_xlat16_31.x = u_xlat16_5.w * u_xlat16_59 + u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_5.w * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_101 * u_xlat16_31.x;
    u_xlat16_59 = sqrt(u_xlat16_90);
    u_xlat16_21.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_59) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_87 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat92 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat11.xyz = vec3(u_xlat92) * u_xlat11.xyz;
    u_xlat92 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat93 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat93 = min(max(u_xlat93, 0.0), 1.0);
#else
    u_xlat93 = clamp(u_xlat93, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat66.x = u_xlat16_3.x + -1.0;
    u_xlat92 = u_xlat92 * u_xlat66.x + 1.0;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat16_3.x / u_xlat92;
    u_xlat92 = u_xlat92 * 0.318309873;
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat66.x = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat66.x = u_xlat13.x * u_xlat66.x + u_xlat16_3.x;
    u_xlat66.x = sqrt(u_xlat66.x);
    u_xlat66.x = u_xlat66.x + u_xlat13.x;
    u_xlat94 = (-u_xlat93) * u_xlat16_3.x + u_xlat93;
    u_xlat94 = u_xlat93 * u_xlat94 + u_xlat16_3.x;
    u_xlat94 = sqrt(u_xlat94);
    u_xlat66.y = u_xlat93 + u_xlat94;
    u_xlat66.xy = u_xlat66.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat66.x = u_xlat66.y * u_xlat66.x;
    u_xlat66.x = float(1.0) / u_xlat66.x;
    u_xlat66.x = min(u_xlat66.x, 16.0);
    u_xlat94 = (-u_xlat16_87) + 1.0;
    u_xlat16_87 = u_xlat94 * u_xlat94;
    u_xlat16_87 = u_xlat94 * u_xlat16_87;
    u_xlat16_87 = u_xlat94 * u_xlat16_87;
    u_xlat16_88 = u_xlat94 * u_xlat16_87;
    u_xlat11.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat94 = (-u_xlat16_87) * u_xlat94 + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * vec3(u_xlat94);
    u_xlat11.xyz = u_xlat11.xxx * vec3(u_xlat16_88) + u_xlat39.xyz;
    u_xlat16_24.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz + _shadowColor.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz + (-u_xlat16_22.xyz);
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_87 = sqrt(u_xlat16_31.x);
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(u_xlat16_87);
    u_xlat16_27.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-vec3(u_xlat93));
    u_xlat16_25.xyz = vec3(u_xlat16_59) * u_xlat16_25.xyz + vec3(u_xlat93);
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat92 = u_xlat92 * u_xlat66.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat92);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = vec3(u_xlat93) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_24.xyz * u_xlat11.xyz;
    u_xlat16_17.xyz = vec3(u_xlat93) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_24.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = (-u_xlat11.xyz) * u_xlat16_24.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_56) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_88);
    u_xlat16_18.xyz = u_xlat16_33.xxx * u_xlat11.xyz;
    u_xlat16_24.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_24.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_33.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_33.x = max(u_xlat16_33.x, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_91;
    u_xlat16_88 = max(u_xlat16_24.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_33.x * u_xlat16_88;
    u_xlat16_24.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = vec3(u_xlat56) * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_87) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xzw + (-vec3(u_xlat56));
    u_xlat16_18.xyz = vec3(u_xlat16_59) * u_xlat16_18.xyz + vec3(u_xlat56);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_24.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat56) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_18.xyz;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_87 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_87 = max(u_xlat16_87, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_87);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat10.xzw;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_33.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_33.x = u_xlat16_33.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_33.x);
    u_xlat16_33.x = float(1.0) / float(u_xlat16_87);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_33.x;
    u_xlat16_87 = max(u_xlat16_25.x, u_xlat16_87);
    u_xlat16_87 = u_xlat16_88 * u_xlat16_87;
    u_xlat16_25.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = vec3(u_xlat56) * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_26.yyy * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-vec3(u_xlat56));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_21.xyz + vec3(u_xlat56);
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.yyy * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_21.xyz * vec3(u_xlat56) + u_xlat16_18.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati92 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat22.y = u_xlat8.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat93 = dot(u_xlat16_21.xyz, u_xlat22.xyz);
    u_xlat93 = max(u_xlat93, 0.0);
    u_xlat11.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat11.xyz = vec3(u_xlat93) * u_xlat11.xyz + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.www * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + u_xlat16_4.xyz;
    u_xlat28.xy = min(u_xlat16_31.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.z);
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_31.xyz = u_xlat28.xxx * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat28.xxx * u_xlat16_31.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat28.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_31.xyz = u_xlat16_23.xyz * u_xlat28.xxx + u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_101) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati92].xyz + u_xlat16_23.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_88 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_88) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_20.xyz, u_xlat10.xyz);
    u_xlat16_33.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_88 = floor(u_xlat16_7.w);
    u_xlat16_33.x = u_xlat16_88 + 1.0;
    u_xlat16_33.x = min(u_xlat16_33.x, 15.0);
    u_xlat16_61 = u_xlat16_33.z * 15.0 + (-u_xlat16_88);
    u_xlat16_7.x = u_xlat16_88 * 16.0 + u_xlat16_7.y;
    u_xlat16_23.x = u_xlat16_33.x * 16.0 + u_xlat16_7.y;
    u_xlat16_33.xz = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_23.y = u_xlat16_7.z;
    u_xlat16_33.xz = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_88 = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_88 = u_xlat16_61 * u_xlat16_88 + u_xlat16_0.x;
    u_xlat16_88 = u_xlat16_101 * u_xlat16_88;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_88;
    u_xlat16_88 = u_xlat28.y * 0.5;
    u_xlat16_33.x = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_88 = u_xlat0.x * u_xlat16_33.x + u_xlat16_88;
    u_xlat16_33.x = u_xlat16_88 + u_xlat16_88;
    u_xlat16_61 = (-u_xlat16_88) * 2.0 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_61 + u_xlat16_33.x;
    u_xlat16_88 = u_xlat28.y * u_xlat16_88;
    u_xlat16_88 = min(u_xlat16_2.z, u_xlat16_88);
    u_xlat16_33.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_33.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_33.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_33.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_33.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_33.xyz = u_xlat16_33.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz;
    u_xlat16_33.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_33.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_33.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_88) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_17.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_85;
    u_xlat16_7.xyz = u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(13) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec4 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
bool u_xlatb28;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
vec3 u_xlat39;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
vec2 u_xlat66;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_92;
int u_xlati92;
float u_xlat93;
float u_xlat94;
mediump float u_xlat16_101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_85 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat16_85<0.0);
#else
    u_xlatb28 = u_xlat16_85<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb28;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_85 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_87 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_87) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_87 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_7.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb28 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat12.xyz = vec3(u_xlat56) * u_xlat12.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat56 = (-u_xlat56) * u_xlat56 + 1.0;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat56) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb28)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat28.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat28.x) + u_xlat12.z;
    u_xlat56 = max((-u_xlat12.w), u_xlat28.x);
    u_xlat56 = (-u_xlat28.x) + u_xlat56;
    u_xlat12.z = _ShadowBias.y * u_xlat56 + u_xlat28.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_90 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec2 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat28.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat56 = (-u_xlat16_90) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat56 + u_xlat16_90;
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat56 = (-u_xlat28.x) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat56>=0.99000001);
#else
    u_xlatb56 = u_xlat56>=0.99000001;
#endif
    u_xlat16_90 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_17.xy = vec2(u_xlat16_91) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat66.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat66.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_56 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_91 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = log2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStrPow;
    u_xlat16_91 = exp2(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _customMatcapFresnelStr;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_90) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_91) * _stockingFresnelCol.xyz;
    u_xlat16_92 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_90 = _sssIntensity * _sssIntensity;
    u_xlat16_90 = u_xlat16_92 * u_xlat16_90;
    u_xlat16_91 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_101 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_101 = inversesqrt(u_xlat16_101);
    u_xlat16_20.xyz = vec3(u_xlat16_101) * u_xlat16_19.xyz;
    u_xlat16_101 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_101 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_101 = u_xlat16_101 + -1.0;
    u_xlat16_101 = _occlusionScale * u_xlat16_101 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_91);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_31.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.x = min(max(u_xlat16_31.x, 0.0), 1.0);
#else
    u_xlat16_31.x = clamp(u_xlat16_31.x, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_31.x * 0.5 + 0.5;
    u_xlat16_59 = (-u_xlat16_31.x) + u_xlat16_59;
    u_xlat16_31.x = u_xlat16_5.w * u_xlat16_59 + u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_5.w * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_101 * u_xlat16_31.x;
    u_xlat16_59 = sqrt(u_xlat16_90);
    u_xlat16_21.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_59) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat28.x = (-u_xlat28.x) * u_xlat16_87 + 1.0;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat92 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat11.xyz = vec3(u_xlat92) * u_xlat11.xyz;
    u_xlat92 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat93 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat93 = min(max(u_xlat93, 0.0), 1.0);
#else
    u_xlat93 = clamp(u_xlat93, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat66.x = u_xlat16_3.x + -1.0;
    u_xlat92 = u_xlat92 * u_xlat66.x + 1.0;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat16_3.x / u_xlat92;
    u_xlat92 = u_xlat92 * 0.318309873;
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat66.x = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat66.x = u_xlat13.x * u_xlat66.x + u_xlat16_3.x;
    u_xlat66.x = sqrt(u_xlat66.x);
    u_xlat66.x = u_xlat66.x + u_xlat13.x;
    u_xlat94 = (-u_xlat93) * u_xlat16_3.x + u_xlat93;
    u_xlat94 = u_xlat93 * u_xlat94 + u_xlat16_3.x;
    u_xlat94 = sqrt(u_xlat94);
    u_xlat66.y = u_xlat93 + u_xlat94;
    u_xlat66.xy = u_xlat66.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat66.x = u_xlat66.y * u_xlat66.x;
    u_xlat66.x = float(1.0) / u_xlat66.x;
    u_xlat66.x = min(u_xlat66.x, 16.0);
    u_xlat94 = (-u_xlat16_87) + 1.0;
    u_xlat16_87 = u_xlat94 * u_xlat94;
    u_xlat16_87 = u_xlat94 * u_xlat16_87;
    u_xlat16_87 = u_xlat94 * u_xlat16_87;
    u_xlat16_88 = u_xlat94 * u_xlat16_87;
    u_xlat11.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat94 = (-u_xlat16_87) * u_xlat94 + 1.0;
    u_xlat39.xyz = u_xlat16_1.xyz * vec3(u_xlat94);
    u_xlat11.xyz = u_xlat11.xxx * vec3(u_xlat16_88) + u_xlat39.xyz;
    u_xlat16_24.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat28.xxx * u_xlat16_24.xyz + _shadowColor.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz + (-u_xlat16_22.xyz);
    u_xlat16_25.xyz = vec3(u_xlat93) * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_87 = sqrt(u_xlat16_31.x);
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(u_xlat16_87);
    u_xlat16_27.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-vec3(u_xlat93));
    u_xlat16_25.xyz = vec3(u_xlat16_59) * u_xlat16_25.xyz + vec3(u_xlat93);
    u_xlat16_25.xyz = u_xlat16_4.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat92 = u_xlat92 * u_xlat66.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat92);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = vec3(u_xlat93) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_24.xyz * u_xlat11.xyz;
    u_xlat16_17.xyz = vec3(u_xlat93) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_24.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = (-u_xlat11.xyz) * u_xlat16_24.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_56) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_88);
    u_xlat16_18.xyz = u_xlat16_33.xxx * u_xlat11.xyz;
    u_xlat16_24.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_24.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_33.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_33.x = max(u_xlat16_33.x, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_91;
    u_xlat16_88 = max(u_xlat16_24.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_33.x * u_xlat16_88;
    u_xlat16_24.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = vec3(u_xlat56) * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_26.xy = vec2(u_xlat16_87) * u_xlat10.xy;
    u_xlat16_26.xzw = u_xlat16_26.xxx * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xzw + (-vec3(u_xlat56));
    u_xlat16_18.xyz = vec3(u_xlat16_59) * u_xlat16_18.xyz + vec3(u_xlat56);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_24.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat56) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_18.xyz;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_87 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_87 = max(u_xlat16_87, 6.10351563e-05);
    u_xlat16_88 = inversesqrt(u_xlat16_87);
    u_xlat16_24.xyz = vec3(u_xlat16_88) * u_xlat10.xzw;
    u_xlat16_25.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xzw = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.yyy + u_xlat16_26.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_88 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_33.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_33.x = u_xlat16_33.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_33.x);
    u_xlat16_33.x = float(1.0) / float(u_xlat16_87);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_33.x;
    u_xlat16_87 = max(u_xlat16_25.x, u_xlat16_87);
    u_xlat16_87 = u_xlat16_88 * u_xlat16_87;
    u_xlat16_25.xyz = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = vec3(u_xlat56) * u_xlat16_21.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_26.yyy * u_xlat16_27.xyz + u_xlat16_23.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz + (-vec3(u_xlat56));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_21.xyz + vec3(u_xlat56);
    u_xlat16_21.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_21.xyz = u_xlat10.yyy * u_xlat16_21.xyz;
    u_xlat16_18.xyz = u_xlat16_21.xyz * vec3(u_xlat56) + u_xlat16_18.xyz;
    u_xlat28.x = u_xlat28.x + -1.0;
    u_xlat28.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat28.xx + vec2(1.0, 1.0);
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati92 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat22.y = u_xlat8.y;
    u_xlat22.xz = u_xlat16_22.xz;
    u_xlat93 = dot(u_xlat16_21.xyz, u_xlat22.xyz);
    u_xlat93 = max(u_xlat93, 0.0);
    u_xlat11.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat11.xyz = vec3(u_xlat93) * u_xlat11.xyz + _sssColorBack.xyz;
    u_xlat16_23.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.www * u_xlat16_23.xyz + _sssColorOcc.xyz;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat11.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_90) * u_xlat16_23.xyz + u_xlat16_4.xyz;
    u_xlat28.xy = min(u_xlat16_31.xx, u_xlat28.xy);
    u_xlat28.x = min(u_xlat28.x, u_xlat16_2.z);
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_31.xyz = u_xlat28.xxx * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat28.xxx * u_xlat16_31.xyz;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat28.xxx * u_xlat16_23.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat28.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_31.xyz = u_xlat16_23.xyz * u_xlat28.xxx + u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat16_101) * u_xlat16_21.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati92].xyz + u_xlat16_23.xyz;
    u_xlati28 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_23.xyz = u_xlat16_21.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_23.xyz;
    u_xlat16_88 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat10.xyz = (-u_xlat8.xyz) * vec3(u_xlat16_88) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat10.xyz);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_20.xyz, u_xlat10.xyz);
    u_xlat16_33.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_88 = floor(u_xlat16_7.w);
    u_xlat16_33.x = u_xlat16_88 + 1.0;
    u_xlat16_33.x = min(u_xlat16_33.x, 15.0);
    u_xlat16_61 = u_xlat16_33.z * 15.0 + (-u_xlat16_88);
    u_xlat16_7.x = u_xlat16_88 * 16.0 + u_xlat16_7.y;
    u_xlat16_23.x = u_xlat16_33.x * 16.0 + u_xlat16_7.y;
    u_xlat16_33.xz = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_23.y = u_xlat16_7.z;
    u_xlat16_33.xz = u_xlat16_23.xy + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_88 = (-u_xlat16_0.x) + u_xlat16_28;
    u_xlat16_88 = u_xlat16_61 * u_xlat16_88 + u_xlat16_0.x;
    u_xlat16_88 = u_xlat16_101 * u_xlat16_88;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_88;
    u_xlat16_88 = u_xlat28.y * 0.5;
    u_xlat16_33.x = (-u_xlat28.y) * 0.5 + 1.0;
    u_xlat16_88 = u_xlat0.x * u_xlat16_33.x + u_xlat16_88;
    u_xlat16_33.x = u_xlat16_88 + u_xlat16_88;
    u_xlat16_61 = (-u_xlat16_88) * 2.0 + 1.0;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_61 + u_xlat16_33.x;
    u_xlat16_88 = u_xlat28.y * u_xlat16_88;
    u_xlat16_88 = min(u_xlat16_2.z, u_xlat16_88);
    u_xlat16_33.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_33.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_33.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_33.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_33.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_33.xyz = u_xlat16_33.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz;
    u_xlat16_33.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_33.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_33.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_88) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_17.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_85;
    u_xlat16_7.xyz = u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_85 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_85) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat84 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat84 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat28.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat28.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat84);
    u_xlat28.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat28.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_27;
mediump float u_xlat16_29;
float u_xlat34;
mediump vec2 u_xlat16_36;
float u_xlat48;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_53;
mediump float u_xlat16_60;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_88;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_73 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_73<0.0);
#else
    u_xlatb24 = u_xlat16_73<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb24;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_7.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_76 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_11.xy = vec2(u_xlat16_76) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_76 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = log2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStrPow;
    u_xlat16_76 = exp2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _stockingFresnelCol.xyz;
    u_xlat16_74 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = _sssIntensity * _sssIntensity;
    u_xlat16_78 = u_xlat16_74 * u_xlat16_78;
    u_xlat16_79 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_83 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_13.xyz = vec3(u_xlat16_83) * u_xlat16_13.xyz;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(u_xlat16_79);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_29 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_29 = u_xlat16_83 * u_xlat16_29;
    u_xlat16_79 = sqrt(u_xlat16_78);
    u_xlat16_17.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_79) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat26 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat10.xyz = vec3(u_xlat26) * u_xlat10.xyz;
    u_xlat26 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat80 = u_xlat16_3.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat80 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_3.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat81 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat81 = u_xlat15.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat15.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat10.x = (-u_xlat74) * u_xlat16_3.x + u_xlat74;
    u_xlat10.x = u_xlat74 * u_xlat10.x + u_xlat16_3.x;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat74 + u_xlat10.x;
    u_xlat10.x = u_xlat10.x + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat10.x;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat10.x = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat10.x * u_xlat10.x;
    u_xlat16_84 = u_xlat10.x * u_xlat16_84;
    u_xlat16_84 = u_xlat10.x * u_xlat16_84;
    u_xlat16_85 = u_xlat10.x * u_xlat16_84;
    u_xlat34 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_84) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xyz = vec3(u_xlat34) * vec3(u_xlat16_85) + u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_20.xyz = vec3(u_xlat74) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_84 = sqrt(u_xlat16_29);
    u_xlat16_21.xyz = (-u_xlat16_19.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.xyz + (-vec3(u_xlat74));
    u_xlat16_20.xyz = vec3(u_xlat16_79) * u_xlat16_20.xyz + vec3(u_xlat74);
    u_xlat16_20.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat26 = u_xlat26 * u_xlat81;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat26);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat74) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat10.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat14.xyz;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_36.xxx;
    u_xlat16_36.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_36.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_36.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_85);
    u_xlat16_85 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_85;
    u_xlat16_12.x = max(u_xlat16_36.x, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_60 * u_xlat16_12.x;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_23.xy = u_xlat24.xy * vec2(u_xlat16_84);
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xzw + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_79) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_16.xyz * u_xlat16_22.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_22.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_20.xyz = u_xlat2.xyw * vec3(u_xlat16_85);
    u_xlat16_22.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xzw = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.yyy + u_xlat16_23.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_84 = max(u_xlat16_22.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_22.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_23.yyy * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + (-u_xlat24.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + u_xlat24.xxx;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_22.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat24.yyy * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_17.xyz * u_xlat24.xxx + u_xlat16_12.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat18.y = u_xlat8.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat48 = dot(u_xlat16_17.xyz, u_xlat18.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_19.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_5.www * u_xlat16_19.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = vec3(u_xlat16_78) * u_xlat16_19.xyz + u_xlat16_16.xyz;
    u_xlat48 = min(u_xlat16_29, 1.0);
    u_xlat2.x = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat2.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat2.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat2.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat2.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_83) * u_xlat16_17.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_20.xyz;
    u_xlati24 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_29 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_29) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_29 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_7.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_7.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_53.x = floor(u_xlat16_3.w);
    u_xlat16_77 = u_xlat16_53.x + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_78 = u_xlat16_7.z * 15.0 + (-u_xlat16_53.x);
    u_xlat16_3.x = u_xlat16_53.x * 16.0 + u_xlat16_3.y;
    u_xlat16_7.x = u_xlat16_77 * 16.0 + u_xlat16_3.y;
    u_xlat16_53.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_53.xy = u_xlat16_53.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_53.xy).x;
    u_xlat16_7.y = u_xlat16_3.z;
    u_xlat16_53.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_53.xy = u_xlat16_53.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_53.xy).x;
    u_xlat16_53.x = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_53.x = u_xlat16_78 * u_xlat16_53.x + u_xlat16_0.x;
    u_xlat16_53.x = u_xlat16_83 * u_xlat16_53.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_53.x;
    u_xlat16_53.x = u_xlat48 * 0.5;
    u_xlat16_77 = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_77 + u_xlat16_53.x;
    u_xlat16_77 = u_xlat16_53.x + u_xlat16_53.x;
    u_xlat16_78 = (-u_xlat16_53.x) * 2.0 + 1.0;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_78 + u_xlat16_77;
    u_xlat16_53.x = u_xlat48 * u_xlat16_53.x;
    u_xlat16_53.x = min(u_xlat16_2.z, u_xlat16_53.x);
    u_xlat16_77 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_77;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_29);
    u_xlat16_7.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_7.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_53.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_77 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_77 = u_xlat16_0.w * _albedoColor.w + u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_77 : u_xlat16_73;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_5.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_5.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    }
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(10) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
int u_xlati24;
bool u_xlatb24;
float u_xlat26;
mediump float u_xlat16_27;
mediump float u_xlat16_29;
float u_xlat34;
mediump vec2 u_xlat16_36;
float u_xlat48;
mediump float u_xlat16_51;
mediump vec2 u_xlat16_53;
mediump float u_xlat16_60;
mediump float u_xlat16_73;
float u_xlat74;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_88;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_73 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_73<0.0);
#else
    u_xlatb24 = u_xlat16_73<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb24;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_73 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_75 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_75) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_24.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_7.xyz = vec3(u_xlat16_75) * u_xlat10.xyz;
    u_xlat16_76 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_11.xy = vec2(u_xlat16_76) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_12.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_13.xy + u_xlat16_12.xy;
    u_xlat16_14.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_2.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat15.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_76 = (-u_xlat15.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = log2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStrPow;
    u_xlat16_76 = exp2(u_xlat16_76);
    u_xlat16_76 = u_xlat16_76 * _customMatcapFresnelStr;
    u_xlat16_11.xyz = u_xlat16_14.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_76) * _stockingFresnelCol.xyz;
    u_xlat16_74 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = _sssIntensity * _sssIntensity;
    u_xlat16_78 = u_xlat16_74 * u_xlat16_78;
    u_xlat16_79 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat16_83 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_13.xyz = vec3(u_xlat16_83) * u_xlat16_13.xyz;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(u_xlat16_79);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_27 = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_27) + u_xlat16_51;
    u_xlat16_27 = u_xlat16_5.w * u_xlat16_51 + u_xlat16_27;
    u_xlat16_29 = u_xlat16_5.w * u_xlat16_27;
    u_xlat16_29 = u_xlat16_83 * u_xlat16_29;
    u_xlat16_79 = sqrt(u_xlat16_78);
    u_xlat16_17.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_79) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat26 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat10.xyz = vec3(u_xlat26) * u_xlat10.xyz;
    u_xlat26 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat74 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat80 = u_xlat16_3.x + -1.0;
    u_xlat26 = u_xlat26 * u_xlat80 + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat16_3.x / u_xlat26;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat81 = (-u_xlat15.x) * u_xlat16_3.x + u_xlat15.x;
    u_xlat81 = u_xlat15.x * u_xlat81 + u_xlat16_3.x;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat15.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat10.x = (-u_xlat74) * u_xlat16_3.x + u_xlat74;
    u_xlat10.x = u_xlat74 * u_xlat10.x + u_xlat16_3.x;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat74 + u_xlat10.x;
    u_xlat10.x = u_xlat10.x + 6.10351563e-05;
    u_xlat81 = u_xlat81 * u_xlat10.x;
    u_xlat81 = float(1.0) / u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat10.x = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat10.x * u_xlat10.x;
    u_xlat16_84 = u_xlat10.x * u_xlat16_84;
    u_xlat16_84 = u_xlat10.x * u_xlat16_84;
    u_xlat16_85 = u_xlat10.x * u_xlat16_84;
    u_xlat34 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_84) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xyz = vec3(u_xlat34) * vec3(u_xlat16_85) + u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat16_17.xyz + (-u_xlat16_18.xyz);
    u_xlat16_20.xyz = vec3(u_xlat74) * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_84 = sqrt(u_xlat16_29);
    u_xlat16_21.xyz = (-u_xlat16_19.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.xyz + (-vec3(u_xlat74));
    u_xlat16_20.xyz = vec3(u_xlat16_79) * u_xlat16_20.xyz + vec3(u_xlat74);
    u_xlat16_20.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat26 = u_xlat26 * u_xlat81;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat26);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat74) * u_xlat10.xyz;
    u_xlat14.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = vec3(u_xlat74) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = (-u_xlat10.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + u_xlat14.xyz;
    u_xlat16_12.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_12.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_12.x);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_12.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_36.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_36.xxx;
    u_xlat16_36.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_36.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_36.yyy + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_85);
    u_xlat16_85 = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_85;
    u_xlat16_12.x = max(u_xlat16_36.x, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_60 * u_xlat16_12.x;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat2.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_23.xy = u_xlat24.xy * vec2(u_xlat16_84);
    u_xlat16_23.xzw = u_xlat16_23.xxx * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xzw + (-u_xlat2.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_79) * u_xlat16_22.xyz + u_xlat2.xxx;
    u_xlat16_22.xyz = u_xlat16_16.xyz * u_xlat16_22.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_22.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_20.xyz = u_xlat2.xyw * vec3(u_xlat16_85);
    u_xlat16_22.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xzw = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.yyy + u_xlat16_23.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_88;
    u_xlat16_84 = max(u_xlat16_22.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_22.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat24.x = dot(u_xlat8.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_23.yyy * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + (-u_xlat24.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz + u_xlat24.xxx;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_22.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat24.yyy * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_17.xyz * u_xlat24.xxx + u_xlat16_12.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_17.y = u_xlat16_13.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_17.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati24 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat18.y = u_xlat8.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat48 = dot(u_xlat16_17.xyz, u_xlat18.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_19.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_5.www * u_xlat16_19.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat10.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = vec3(u_xlat16_78) * u_xlat16_19.xyz + u_xlat16_16.xyz;
    u_xlat48 = min(u_xlat16_29, 1.0);
    u_xlat2.x = min(u_xlat48, u_xlat16_2.z);
    u_xlat16_19.xyz = u_xlat16_16.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat2.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat2.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat2.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat2.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_16.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat2.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_83) * u_xlat16_17.xyz;
    u_xlati2.x = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati2.x].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_20.xyz;
    u_xlati24 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati24].xyz + u_xlat16_17.xyw;
    u_xlat16_20.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_29 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_29) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_29 = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_13.xyz, u_xlat2.xyw);
    u_xlat16_7.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_7.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_53.x = floor(u_xlat16_3.w);
    u_xlat16_77 = u_xlat16_53.x + 1.0;
    u_xlat16_77 = min(u_xlat16_77, 15.0);
    u_xlat16_78 = u_xlat16_7.z * 15.0 + (-u_xlat16_53.x);
    u_xlat16_3.x = u_xlat16_53.x * 16.0 + u_xlat16_3.y;
    u_xlat16_7.x = u_xlat16_77 * 16.0 + u_xlat16_3.y;
    u_xlat16_53.xy = u_xlat16_3.xz + vec2(0.5, 0.5);
    u_xlat16_53.xy = u_xlat16_53.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_53.xy).x;
    u_xlat16_7.y = u_xlat16_3.z;
    u_xlat16_53.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_53.xy = u_xlat16_53.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24.x = texture(_SpecularOcclusionLut3D, u_xlat16_53.xy).x;
    u_xlat16_53.x = (-u_xlat16_0.x) + u_xlat16_24.x;
    u_xlat16_53.x = u_xlat16_78 * u_xlat16_53.x + u_xlat16_0.x;
    u_xlat16_53.x = u_xlat16_83 * u_xlat16_53.x;
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_53.x;
    u_xlat16_53.x = u_xlat48 * 0.5;
    u_xlat16_77 = (-u_xlat48) * 0.5 + 1.0;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_77 + u_xlat16_53.x;
    u_xlat16_77 = u_xlat16_53.x + u_xlat16_53.x;
    u_xlat16_78 = (-u_xlat16_53.x) * 2.0 + 1.0;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_78 + u_xlat16_77;
    u_xlat16_53.x = u_xlat48 * u_xlat16_53.x;
    u_xlat16_53.x = min(u_xlat16_2.z, u_xlat16_53.x);
    u_xlat16_77 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_77;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_29);
    u_xlat16_7.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = vec3(u_xlat16_29) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_7.xyz;
    u_xlat15.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat15.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_53.xxx * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_11.xyz;
    u_xlat16_77 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_77 = u_xlat16_0.w * _albedoColor.w + u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_77 : u_xlat16_73;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_73 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_5.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_5.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_73) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    }
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(12) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec2 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
vec3 u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
mediump float u_xlat16_98;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_82 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_82<0.0);
#else
    u_xlatb27 = u_xlat16_82<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb27;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_7.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat12.xyz = vec3(u_xlat54) * u_xlat12.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb27)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat27.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat12.z;
    u_xlat54 = max((-u_xlat12.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat12.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_87 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec2 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_87) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_87;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat54 = (-u_xlat27.x) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat54>=0.99000001);
#else
    u_xlatb54 = u_xlat54>=0.99000001;
#endif
    u_xlat16_87 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_17.xy = vec2(u_xlat16_88) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_54 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_88 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _customMatcapFresnelStrPow;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _customMatcapFresnelStr;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_88) * _stockingFresnelCol.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_2.x * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_98 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_98 = inversesqrt(u_xlat16_98);
    u_xlat16_19.xyz = vec3(u_xlat16_98) * u_xlat16_19.xyz;
    u_xlat16_98 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_98 + 1.0;
    u_xlat16_98 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_98 = u_xlat16_98 + -1.0;
    u_xlat16_98 = _occlusionScale * u_xlat16_98 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_98 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_20.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_57) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_57) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat89 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat89);
    u_xlat89 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat29.x = u_xlat89 * u_xlat89;
    u_xlat83 = u_xlat16_3.x + -1.0;
    u_xlat29.x = u_xlat29.x * u_xlat83 + 1.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat16_3.x / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * 0.318309873;
    u_xlat83 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat83 = u_xlat13.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat13.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat83 = u_xlat83 * u_xlat89;
    u_xlat29.z = float(1.0) / u_xlat83;
    u_xlat29.xz = min(u_xlat29.xz, vec2(16.0, 16.0));
    u_xlat89 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat89 * u_xlat89;
    u_xlat16_84 = u_xlat89 * u_xlat16_84;
    u_xlat16_84 = u_xlat89 * u_xlat16_84;
    u_xlat16_85 = u_xlat89 * u_xlat16_84;
    u_xlat90 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_84) * u_xlat89 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat89);
    u_xlat11.xyz = vec3(u_xlat90) * vec3(u_xlat16_85) + u_xlat11.xyz;
    u_xlat16_23.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_21.xyz);
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(u_xlat16_84);
    u_xlat16_26.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz + (-u_xlat2.xxx);
    u_xlat16_24.xyz = vec3(u_xlat16_57) * u_xlat16_24.xyz + u_xlat2.xxx;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz;
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat29.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_23.xyz * u_xlat11.xyz;
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = (-u_xlat11.xyz) * u_xlat16_23.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_54) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_85);
    u_xlat16_18.xyz = u_xlat2.xyw * u_xlat16_32.xxx;
    u_xlat16_23.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_23.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_23.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_32.x * u_xlat16_85;
    u_xlat16_23.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = vec3(u_xlat54) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_25.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_25.xzw = u_xlat16_25.xxx * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_25.xzw + (-vec3(u_xlat54));
    u_xlat16_18.xyz = vec3(u_xlat16_57) * u_xlat16_18.xyz + vec3(u_xlat54);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat54) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_18.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = u_xlat2.xyw * vec3(u_xlat16_85);
    u_xlat16_24.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xzw = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_32.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_32.x);
    u_xlat16_32.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_32.x;
    u_xlat16_84 = max(u_xlat16_24.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_24.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = vec3(u_xlat54) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_25.yyy * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-vec3(u_xlat54));
    u_xlat16_20.xyz = vec3(u_xlat16_57) * u_xlat16_20.xyz + vec3(u_xlat54);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_24.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat10.yyy * u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_20.xyz * vec3(u_xlat54) + u_xlat16_18.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat89 = dot(u_xlat16_20.xyz, u_xlat21.xyz);
    u_xlat89 = max(u_xlat89, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_98) * u_xlat16_20.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_20.xyw;
    u_xlat16_22.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_19.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_7.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_7.x = u_xlat16_85 * 16.0 + u_xlat16_7.y;
    u_xlat16_22.x = u_xlat16_32.x * 16.0 + u_xlat16_7.y;
    u_xlat16_32.xz = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_22.y = u_xlat16_7.z;
    u_xlat16_32.xz = u_xlat16_22.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_98 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_32.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_17.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_7.xyz = u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
out mediump vec3 vs_TEXCOORD5;
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
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
UNITY_LOCATION(12) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
vec4 u_xlat14;
vec4 u_xlat15;
vec4 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec2 u_xlat27;
mediump float u_xlat16_27;
int u_xlati27;
bool u_xlatb27;
vec3 u_xlat29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_32;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
mediump float u_xlat16_82;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
float u_xlat89;
float u_xlat90;
mediump float u_xlat16_98;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_82 = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_82<0.0);
#else
    u_xlatb27 = u_xlat16_82<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb27;
    if(u_xlatb0){discard;}
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_82 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_84 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_84) + vs_TEXCOORD2.yzx;
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
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_84 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_7.xyz = vec3(u_xlat16_85) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat54 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat12.xyz = vec3(u_xlat54) * u_xlat12.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat12.xyz);
    u_xlat54 = (-u_xlat54) * u_xlat54 + 1.0;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat8.xyz) * vec3(u_xlat54) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb27)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat15;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat16;
    u_xlat16 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat16;
    u_xlat14 = u_xlat12.yyyy * u_xlat14;
    u_xlat13 = u_xlat13 * u_xlat12.xxxx + u_xlat14;
    u_xlat12 = u_xlat15 * u_xlat12.zzzz + u_xlat13;
    u_xlat12 = u_xlat16 + u_xlat12;
    u_xlat27.x = _ShadowBias.x / u_xlat12.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat27.x) + u_xlat12.z;
    u_xlat54 = max((-u_xlat12.w), u_xlat27.x);
    u_xlat54 = (-u_xlat27.x) + u_xlat54;
    u_xlat12.z = _ShadowBias.y * u_xlat54 + u_xlat27.x;
    u_xlat12.xyz = u_xlat12.xyz / u_xlat12.www;
    u_xlat12.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat12.w = max(u_xlat12.z, 9.99999975e-05);
    u_xlat16_87 = (-_ShadowBias.w) + 1.0;
    u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat13.z = 0.0;
    u_xlat13.xyz = u_xlat12.xyw + u_xlat13.xyz;
    vec3 txVec0 = vec3(u_xlat13.xy,u_xlat13.z);
    u_xlat13.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec1 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat14.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec2 = vec3(u_xlat14.xy,u_xlat14.z);
    u_xlat13.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat14.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat14.z = 0.0;
    u_xlat12.xyz = u_xlat12.xyw + u_xlat14.xyz;
    vec3 txVec3 = vec3(u_xlat12.xy,u_xlat12.z);
    u_xlat13.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat27.x = dot(u_xlat13, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat54 = (-u_xlat16_87) + 1.0;
    u_xlat27.x = u_xlat27.x * u_xlat54 + u_xlat16_87;
    u_xlat27.x = (-u_xlat27.x) + 1.0;
    u_xlat54 = (-u_xlat27.x) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat54>=0.99000001);
#else
    u_xlatb54 = u_xlat54>=0.99000001;
#endif
    u_xlat16_87 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_17.xy = vec2(u_xlat16_88) * vs_TEXCOORD5.xy;
    u_xlat2.xw = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat2.xw;
    u_xlat2.xw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat2.xw;
    u_xlat16_18.xy = u_xlat2.xw * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_19.y = u_xlat16_17.y * _matCapSpeEffectedByLightDir;
    u_xlat16_17.z = 0.100000001;
    u_xlat16_19.x = _matCapSpeEffectedByLightDir;
    u_xlat16_17.xy = (-u_xlat16_17.xz) * u_xlat16_19.xy + u_xlat16_18.xy;
    u_xlat16_12.xyz = texture(_MatcapTex, u_xlat16_17.xy).xyz;
    u_xlat16_54 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat13.x = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat16_88 = (-u_xlat13.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _customMatcapFresnelStrPow;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _customMatcapFresnelStr;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _customMatcapCol.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_88) * _stockingFresnelCol.xyz;
    u_xlat16_2.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_87 = _sssIntensity * _sssIntensity;
    u_xlat16_87 = u_xlat16_2.x * u_xlat16_87;
    u_xlat16_88 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_98 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_98 = inversesqrt(u_xlat16_98);
    u_xlat16_19.xyz = vec3(u_xlat16_98) * u_xlat16_19.xyz;
    u_xlat16_98 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_98 + 1.0;
    u_xlat16_98 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_98 = u_xlat16_98 + -1.0;
    u_xlat16_98 = _occlusionScale * u_xlat16_98 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_88);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_30.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_30.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_30.x) + u_xlat16_57;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_57 + u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_5.w * u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_98 * u_xlat16_30.x;
    u_xlat16_57 = sqrt(u_xlat16_87);
    u_xlat16_20.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_57) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21.xyz = vec3(u_xlat16_57) * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_57) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat27.x = (-u_xlat27.x) * u_xlat16_84 + 1.0;
    u_xlat27.x = max(u_xlat27.x, 0.0);
    u_xlat2.xyw = u_xlat11.xyz * vec3(u_xlat16_85) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat89 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat89);
    u_xlat89 = dot(u_xlat8.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat29.x = u_xlat89 * u_xlat89;
    u_xlat83 = u_xlat16_3.x + -1.0;
    u_xlat29.x = u_xlat29.x * u_xlat83 + 1.0;
    u_xlat29.x = u_xlat29.x * u_xlat29.x;
    u_xlat29.x = u_xlat16_3.x / u_xlat29.x;
    u_xlat29.x = u_xlat29.x * 0.318309873;
    u_xlat83 = (-u_xlat13.x) * u_xlat16_3.x + u_xlat13.x;
    u_xlat83 = u_xlat13.x * u_xlat83 + u_xlat16_3.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat13.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat89 = (-u_xlat2.x) * u_xlat16_3.x + u_xlat2.x;
    u_xlat89 = u_xlat2.x * u_xlat89 + u_xlat16_3.x;
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat2.x + u_xlat89;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat83 = u_xlat83 * u_xlat89;
    u_xlat29.z = float(1.0) / u_xlat83;
    u_xlat29.xz = min(u_xlat29.xz, vec2(16.0, 16.0));
    u_xlat89 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat89 * u_xlat89;
    u_xlat16_84 = u_xlat89 * u_xlat16_84;
    u_xlat16_84 = u_xlat89 * u_xlat16_84;
    u_xlat16_85 = u_xlat89 * u_xlat16_84;
    u_xlat90 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_84) * u_xlat89 + 1.0;
    u_xlat11.xyz = u_xlat16_1.xyz * vec3(u_xlat89);
    u_xlat11.xyz = vec3(u_xlat90) * vec3(u_xlat16_85) + u_xlat11.xyz;
    u_xlat16_23.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat27.xxx * u_xlat16_23.xyz + _shadowColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_21.xyz);
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_84 = sqrt(u_xlat16_30.x);
    u_xlat16_25.xyz = u_xlat16_23.xyz * vec3(u_xlat16_84);
    u_xlat16_26.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz + (-u_xlat2.xxx);
    u_xlat16_24.xyz = vec3(u_xlat16_57) * u_xlat16_24.xyz + u_xlat2.xxx;
    u_xlat16_24.xyz = u_xlat16_4.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_24.xyz;
    u_xlat29.x = u_xlat29.z * u_xlat29.x;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat29.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_23.xyz * u_xlat11.xyz;
    u_xlat16_17.xyz = u_xlat2.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = (-u_xlat11.xyz) * u_xlat16_23.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_54) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_85 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_32.x = inversesqrt(u_xlat16_85);
    u_xlat16_18.xyz = u_xlat2.xyw * u_xlat16_32.xxx;
    u_xlat16_23.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_23.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_32.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_32.x = max(u_xlat16_32.x, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_88;
    u_xlat16_85 = max(u_xlat16_23.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_32.x * u_xlat16_85;
    u_xlat16_23.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = vec3(u_xlat54) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_25.xy = vec2(u_xlat16_84) * u_xlat10.xy;
    u_xlat16_25.xzw = u_xlat16_25.xxx * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_25.xzw + (-vec3(u_xlat54));
    u_xlat16_18.xyz = vec3(u_xlat16_57) * u_xlat16_18.xyz + vec3(u_xlat54);
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat54) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_18.xyz;
    u_xlat16_84 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_84));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_84);
#endif
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = inversesqrt(u_xlat16_84);
    u_xlat16_23.xyz = u_xlat2.xyw * vec3(u_xlat16_85);
    u_xlat16_24.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xzw = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_85 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_32.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_32.x = u_xlat16_32.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_32.x);
    u_xlat16_32.x = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_84 = (-u_xlat16_84) * u_xlat16_84 + 1.0;
    u_xlat16_84 = max(u_xlat16_84, 0.0);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_32.x;
    u_xlat16_84 = max(u_xlat16_24.x, u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_84;
    u_xlat16_24.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = vec3(u_xlat54) * u_xlat16_20.xyz + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_25.yyy * u_xlat16_26.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-vec3(u_xlat54));
    u_xlat16_20.xyz = vec3(u_xlat16_57) * u_xlat16_20.xyz + vec3(u_xlat54);
    u_xlat16_20.xyz = u_xlat16_4.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_24.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat10.yyy * u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_20.xyz * vec3(u_xlat54) + u_xlat16_18.xyz;
    u_xlat27.x = u_xlat27.x + -1.0;
    u_xlat27.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat27.xx + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_20.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat8.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat8.xz);
    u_xlat21.y = u_xlat8.y;
    u_xlat21.xz = u_xlat16_21.xz;
    u_xlat89 = dot(u_xlat16_20.xyz, u_xlat21.xyz);
    u_xlat89 = max(u_xlat89, 0.0);
    u_xlat10.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat10.xyz + _sssColorBack.xyz;
    u_xlat16_22.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_5.www * u_xlat16_22.xyz + _sssColorOcc.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat10.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + u_xlat16_4.xyz;
    u_xlat27.xy = min(u_xlat16_30.xx, u_xlat27.xy);
    u_xlat27.x = min(u_xlat27.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat27.xxx * u_xlat16_30.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat27.xxx * u_xlat16_22.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat27.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_22.xyz * u_xlat27.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_98) * u_xlat16_20.xyz;
    u_xlati27 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati27].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_22.xyz;
    u_xlati27 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati27].xyz + u_xlat16_20.xyw;
    u_xlat16_22.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_22.xyz;
    u_xlat16_85 = dot((-u_xlat16_7.xyz), u_xlat8.xyz);
    u_xlat16_85 = u_xlat16_85 + u_xlat16_85;
    u_xlat2.xyw = (-u_xlat8.xyz) * vec3(u_xlat16_85) + (-u_xlat16_7.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat2.xyw);
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat9.xyz + u_xlat2.xyw;
    u_xlat16_3.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat16_5.z = dot(u_xlat16_19.xyz, u_xlat2.xyw);
    u_xlat16_32.xyz = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_85 = floor(u_xlat16_7.w);
    u_xlat16_32.x = u_xlat16_85 + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_59 = u_xlat16_32.z * 15.0 + (-u_xlat16_85);
    u_xlat16_7.x = u_xlat16_85 * 16.0 + u_xlat16_7.y;
    u_xlat16_22.x = u_xlat16_32.x * 16.0 + u_xlat16_7.y;
    u_xlat16_32.xz = u_xlat16_7.xz + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_22.y = u_xlat16_7.z;
    u_xlat16_32.xz = u_xlat16_22.xy + vec2(0.5, 0.5);
    u_xlat16_32.xz = u_xlat16_32.xz * vec2(0.00390625, 0.0625);
    u_xlat16_27 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xz).x;
    u_xlat16_85 = (-u_xlat16_0.x) + u_xlat16_27;
    u_xlat16_85 = u_xlat16_59 * u_xlat16_85 + u_xlat16_0.x;
    u_xlat16_85 = u_xlat16_98 * u_xlat16_85;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_85;
    u_xlat16_85 = u_xlat27.y * 0.5;
    u_xlat16_32.x = (-u_xlat27.y) * 0.5 + 1.0;
    u_xlat16_85 = u_xlat0.x * u_xlat16_32.x + u_xlat16_85;
    u_xlat16_32.x = u_xlat16_85 + u_xlat16_85;
    u_xlat16_59 = (-u_xlat16_85) * 2.0 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_59 + u_xlat16_32.x;
    u_xlat16_85 = u_xlat27.y * u_xlat16_85;
    u_xlat16_85 = min(u_xlat16_2.z, u_xlat16_85);
    u_xlat16_32.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_32.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_32.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_32.xyz;
    u_xlat13.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_32.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_85) * u_xlat16_1.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_17.xyz;
    u_xlat16_3.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_82;
    u_xlat16_7.xyz = u_xlat16_17.xyz + u_xlat16_18.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_82 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_82) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
  GpuProgramID 115011
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Skin_StockingGUI"
}