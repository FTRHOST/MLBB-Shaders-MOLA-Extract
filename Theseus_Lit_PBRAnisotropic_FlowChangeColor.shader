//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_FlowChangeColor" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

_normalMap ("法线贴图", 2D) = "bump" { }

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Toggle] _anisoUse2U ("各向异性使用2U", Float) = 0.0

_anisotropicMap ("各向异性贴图", 2D) = "white" { }

_sunShift ("各向异性扭曲", Float) = 1.0

_sunShiftOffset ("各向异性偏移", Float) = 1.0

_anisotropicMultiplier ("各向异性强度", Range(0, 1)) = 1.0

_UseFlowChangeColor2U ("流动换色使用2U", Float) = 0.0

_FlowChangeColorDirSpeed ("流动换色方向速度", Vector) = (1,0,0,0)

_FlowChangeColorMap ("流动换色纹理", 2D) = "white" { }

_FlowChangeColorMask ("流动换色遮罩", 2D) = "black" { }

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMask ("R:流光图案遮罩;G:流光渐变遮罩", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "white" { }

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
  GpuProgramID 63916
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
ivec3 u_xlati25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec2 u_xlat16_28;
float u_xlat29;
mediump vec3 u_xlat16_33;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump vec2 u_xlat16_51;
float u_xlat54;
float u_xlat75;
bool u_xlatb75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
bool u_xlatb80;
mediump float u_xlat16_82;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
float u_xlat89;
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
    u_xlat16_51.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51.x;
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
    u_xlat5.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat16_77 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_28.xy = vec2(u_xlat16_77) * vs_TEXCOORD3.xy;
    u_xlat16_28.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_28.xy;
    u_xlat5.xy = u_xlat5.xy + u_xlat16_28.xy;
    u_xlat16_6.xy = u_xlat5.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_79 = texture(_FlowChangeColorMask, u_xlat16_6.xy).x;
    u_xlat16_5.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy + (-u_xlat16_6.zxy);
    u_xlat16_7.xyz = vec3(u_xlat16_79) * u_xlat16_7.xyz + u_xlat16_6.zxy;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_5.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_33.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_33.xyz;
    u_xlat75 = u_xlat16_33.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_anisoUse2U);
#else
    u_xlatb5 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb5)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_5.x = texture(_anisotropicMap, u_xlat5.xw).x;
    u_xlat5.x = u_xlat16_5.x * 2.0 + -1.0;
    u_xlat5.x = u_xlat5.x * _sunShift + _sunShiftOffset;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb80 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat80 = (u_xlatb80) ? 1.0 : -1.0;
    u_xlat80 = u_xlat80 * vs_TEXCOORD2.w;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat12.xyz = u_xlat16_9.xyz * vec3(u_xlat85);
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat13.x;
    u_xlat11.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat12.x;
    u_xlat14.y = u_xlat13.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_9.xyz, u_xlat14.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat13.xyz = vec3(u_xlat85) * u_xlat11.xyz;
    u_xlat86 = dot(u_xlat12.zxy, u_xlat13.xyz);
    u_xlat12.xyz = (-u_xlat13.yzx) * vec3(u_xlat86) + u_xlat12.xyz;
    u_xlat86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat12.xyz = vec3(u_xlat86) * u_xlat12.xyz;
    u_xlat14.xyz = u_xlat12.yzx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat13.zxy * u_xlat12.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat13.xyz + u_xlat14.zxy;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat16_77 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_77 + -1.0;
    u_xlat86 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_78 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat86 = u_xlat86 * u_xlat16_78;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat16.z = u_xlat80 * u_xlat86;
    u_xlat16.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat80 = u_xlat16_77 * u_xlat16_78;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat16.y = u_xlat16_26.x * u_xlat80;
    u_xlat87 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat16.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_26.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat17.z = u_xlat86 * u_xlat88;
    u_xlat17.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat88 = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat17.y = u_xlat80 * u_xlat88;
    u_xlat88 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat17.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat87 = u_xlat88 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat89 = dot(u_xlat15.xyz, u_xlat4.xyz);
    u_xlat18.y = u_xlat80 * u_xlat89;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat16_77 * u_xlat86;
    u_xlat29 = u_xlat86 * u_xlat80;
    u_xlat18.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat29 * 0.318309873;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat87 * u_xlat4.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat16.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_41.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat41.xy = u_xlat16_41.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xy = min(max(u_xlat41.xy, 0.0), 1.0);
#else
    u_xlat41.xy = clamp(u_xlat41.xy, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * u_xlat41.xxx;
    u_xlat18.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat18.xyz = u_xlat4.xxx * u_xlat18.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat80;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_77 * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat16_77) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat89 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat86 * u_xlat89;
    u_xlat18.x = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(u_xlat12.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_77 * u_xlat80;
    u_xlat89 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat89 + u_xlat18.x;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat88 * u_xlat89 + 6.10351563e-05;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat4.x = u_xlat4.x * u_xlat89;
    u_xlat16_77 = u_xlat87 * u_xlat87;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_82 = u_xlat87 * u_xlat16_77;
    u_xlat87 = (-u_xlat16_77) * u_xlat87 + 1.0;
    u_xlat43.xyz = u_xlat16_33.xyz * vec3(u_xlat87);
    u_xlat43.xyz = vec3(u_xlat75) * vec3(u_xlat16_82) + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat4.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat43.xyz * _directSpecularColor.zxy;
    u_xlat43.xyz = u_xlat18.xxx * u_xlat43.xyz;
    u_xlat16_9.xyz = u_xlat43.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_77);
    u_xlat16_20.xyz = vec3(u_xlat16_82) * u_xlat10.xyz;
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat10.z = u_xlat10.x * u_xlat86;
    u_xlat15.y = u_xlat4.x * u_xlat80;
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat0.xyz);
    u_xlat15.x = u_xlat16_1.x * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat15.z = u_xlat4.x * u_xlat29;
    u_xlat25.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat25.x = max(u_xlat25.x, 6.10351563e-05);
    u_xlat25.x = u_xlat29 / u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat54 * u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat16_20.xyz);
    u_xlat10.y = u_xlat16_1.x * u_xlat80;
    u_xlat10.x = dot(u_xlat13.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat88 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25.x = u_xlat50 * u_xlat25.x;
    u_xlat16_82 = u_xlat0.x * u_xlat0.x;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_84 = u_xlat0.x * u_xlat16_82;
    u_xlat0.x = (-u_xlat16_82) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_33.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat75) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_82 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_82;
    u_xlat16_77 = max(u_xlat16_21.x, u_xlat16_77);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_82 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_82);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat16_20.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat41.yyy + u_xlat16_9.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat41.yyy * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat41.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat10.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat13.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_21.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_77 = (-u_xlat16_1.x) + u_xlat16_77;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_77 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_1.x;
    u_xlat16_77 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat16_77 = _occlusionScale * u_xlat16_77 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat25.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat25.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_77) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_24.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz + u_xlat16_2.xyz;
    u_xlat16_7.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_7.xyz = u_xlat16_7.xxx * vs_TEXCOORD1.yzx;
    u_xlat25.xyz = u_xlat5.xxx * u_xlat16_7.xyz + u_xlat14.xyz;
    u_xlat4.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat25.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : u_xlat12.xyz;
    u_xlat4.xyz = u_xlat16_26.xyz * u_xlat25.xyz;
    u_xlat4.xyz = u_xlat25.zxy * u_xlat16_26.yzx + (-u_xlat4.xyz);
    u_xlat5.xyw = u_xlat25.xyz * u_xlat4.xyz;
    u_xlat25.xyz = u_xlat4.zxy * u_xlat25.yzx + (-u_xlat5.xyw);
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + u_xlat25.xyz;
    u_xlat16_7.x = u_xlat16_78 * 8.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
    u_xlat25.xyz = u_xlat16_7.xxx * u_xlat25.xyz + u_xlat13.xyz;
    u_xlat4.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat29);
    u_xlat16_7.x = dot((-u_xlat16_26.xyz), u_xlat25.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat25.xyz = (-u_xlat25.xyz) * u_xlat16_7.xxx + (-u_xlat16_26.xyz);
    u_xlat5.xyw = u_xlat11.xyz * vec3(u_xlat85) + (-u_xlat25.xyz);
    u_xlat5.xyw = vec3(u_xlat16_78) * u_xlat5.xyw + u_xlat25.xyz;
    u_xlat10.xyz = u_xlat25.xyz + (-u_xlat5.xyw);
    u_xlat5.xyw = abs(u_xlat16_3.xxx) * u_xlat10.xyz + u_xlat5.xyw;
    u_xlat16_26.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_26.x = u_xlat16_8.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat25.x = dot(u_xlat16_21.xyz, u_xlat25.xyz);
    u_xlat16_47.y = u_xlat25.x * 0.5;
    u_xlat16_51.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xw);
    u_xlat5.w = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xw);
    u_xlat5.x = u_xlat16_51.x;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat5.xyw, u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_7.www * u_xlat16_7.zxy;
    u_xlat25.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat25.xyz * u_xlat25.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb25 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb25)) ? u_xlat16_20.xyz : u_xlat16_26.xyz;
    u_xlat17.y = u_xlat16_8.x;
    u_xlat16_47.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_20.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.xyz = min(max(u_xlat16_20.xyz, 0.0), 1.0);
#else
    u_xlat16_20.xyz = clamp(u_xlat16_20.xyz, 0.0, 1.0);
#endif
    u_xlat16_25.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_8.xyz = u_xlat16_33.xyz * u_xlat16_25.xxx + u_xlat16_25.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_7.yzw = u_xlat16_20.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_7.w);
    u_xlat16_3.x = u_xlat16_76 + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_7.x = u_xlat16_76 * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_76 = u_xlat16_20.z * 15.0 + (-u_xlat16_76);
    u_xlat16_3.x = (-u_xlat16_50) + u_xlat16_25.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_50;
    u_xlat16_76 = u_xlat16_77 * u_xlat16_76;
    u_xlat25.x = u_xlat4.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.x * 0.5;
    u_xlat16_77 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat25.x * u_xlat16_77 + u_xlat16_76;
    u_xlat16_77 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_3.x = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_76 = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_76, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_8.yzx + u_xlat16_9.yzx;
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
    u_xlat16_26.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(u_xlat16_79);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _emissiveColor.zxy;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat50 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_28.xy;
    u_xlat16_51.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_51.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * abs(vec3(u_xlat50)) + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
ivec3 u_xlati25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec2 u_xlat16_28;
float u_xlat29;
mediump vec3 u_xlat16_33;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump vec2 u_xlat16_51;
float u_xlat54;
float u_xlat75;
bool u_xlatb75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
bool u_xlatb80;
mediump float u_xlat16_82;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
float u_xlat89;
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
    u_xlat16_51.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51.x;
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
    u_xlat5.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat16_77 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_28.xy = vec2(u_xlat16_77) * vs_TEXCOORD3.xy;
    u_xlat16_28.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_28.xy;
    u_xlat5.xy = u_xlat5.xy + u_xlat16_28.xy;
    u_xlat16_6.xy = u_xlat5.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_79 = texture(_FlowChangeColorMask, u_xlat16_6.xy).x;
    u_xlat16_5.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy + (-u_xlat16_6.zxy);
    u_xlat16_7.xyz = vec3(u_xlat16_79) * u_xlat16_7.xyz + u_xlat16_6.zxy;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_5.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_33.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_33.xyz;
    u_xlat75 = u_xlat16_33.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_anisoUse2U);
#else
    u_xlatb5 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb5)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_5.x = texture(_anisotropicMap, u_xlat5.xw).x;
    u_xlat5.x = u_xlat16_5.x * 2.0 + -1.0;
    u_xlat5.x = u_xlat5.x * _sunShift + _sunShiftOffset;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb80 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat80 = (u_xlatb80) ? 1.0 : -1.0;
    u_xlat80 = u_xlat80 * vs_TEXCOORD2.w;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat12.xyz = u_xlat16_9.xyz * vec3(u_xlat85);
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat13.x;
    u_xlat11.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat12.x;
    u_xlat14.y = u_xlat13.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_9.xyz, u_xlat14.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat13.xyz = vec3(u_xlat85) * u_xlat11.xyz;
    u_xlat86 = dot(u_xlat12.zxy, u_xlat13.xyz);
    u_xlat12.xyz = (-u_xlat13.yzx) * vec3(u_xlat86) + u_xlat12.xyz;
    u_xlat86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat12.xyz = vec3(u_xlat86) * u_xlat12.xyz;
    u_xlat14.xyz = u_xlat12.yzx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat13.zxy * u_xlat12.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat13.xyz + u_xlat14.zxy;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat16_77 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_77 + -1.0;
    u_xlat86 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_78 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat86 = u_xlat86 * u_xlat16_78;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat16.z = u_xlat80 * u_xlat86;
    u_xlat16.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat80 = u_xlat16_77 * u_xlat16_78;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat16.y = u_xlat16_26.x * u_xlat80;
    u_xlat87 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat16.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_26.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat17.z = u_xlat86 * u_xlat88;
    u_xlat17.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat88 = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat17.y = u_xlat80 * u_xlat88;
    u_xlat88 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat17.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat87 = u_xlat88 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat89 = dot(u_xlat15.xyz, u_xlat4.xyz);
    u_xlat18.y = u_xlat80 * u_xlat89;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat16_77 * u_xlat86;
    u_xlat29 = u_xlat86 * u_xlat80;
    u_xlat18.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat29 * 0.318309873;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat87 * u_xlat4.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat16.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_41.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat41.xy = u_xlat16_41.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xy = min(max(u_xlat41.xy, 0.0), 1.0);
#else
    u_xlat41.xy = clamp(u_xlat41.xy, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * u_xlat41.xxx;
    u_xlat18.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat18.xyz = u_xlat4.xxx * u_xlat18.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat80;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_77 * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat16_77) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat89 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat86 * u_xlat89;
    u_xlat18.x = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(u_xlat12.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_77 * u_xlat80;
    u_xlat89 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat89 + u_xlat18.x;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat88 * u_xlat89 + 6.10351563e-05;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat4.x = u_xlat4.x * u_xlat89;
    u_xlat16_77 = u_xlat87 * u_xlat87;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_82 = u_xlat87 * u_xlat16_77;
    u_xlat87 = (-u_xlat16_77) * u_xlat87 + 1.0;
    u_xlat43.xyz = u_xlat16_33.xyz * vec3(u_xlat87);
    u_xlat43.xyz = vec3(u_xlat75) * vec3(u_xlat16_82) + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat4.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat43.xyz * _directSpecularColor.zxy;
    u_xlat43.xyz = u_xlat18.xxx * u_xlat43.xyz;
    u_xlat16_9.xyz = u_xlat43.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_77);
    u_xlat16_20.xyz = vec3(u_xlat16_82) * u_xlat10.xyz;
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat10.z = u_xlat10.x * u_xlat86;
    u_xlat15.y = u_xlat4.x * u_xlat80;
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat0.xyz);
    u_xlat15.x = u_xlat16_1.x * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat15.z = u_xlat4.x * u_xlat29;
    u_xlat25.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat25.x = max(u_xlat25.x, 6.10351563e-05);
    u_xlat25.x = u_xlat29 / u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat54 * u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat16_20.xyz);
    u_xlat10.y = u_xlat16_1.x * u_xlat80;
    u_xlat10.x = dot(u_xlat13.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat88 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25.x = u_xlat50 * u_xlat25.x;
    u_xlat16_82 = u_xlat0.x * u_xlat0.x;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_84 = u_xlat0.x * u_xlat16_82;
    u_xlat0.x = (-u_xlat16_82) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_33.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat75) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_82 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_82;
    u_xlat16_77 = max(u_xlat16_21.x, u_xlat16_77);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_82 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_82);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat16_20.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat41.yyy + u_xlat16_9.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat41.yyy * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat41.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat10.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat13.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_21.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_77 = (-u_xlat16_1.x) + u_xlat16_77;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_77 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_1.x;
    u_xlat16_77 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat16_77 = _occlusionScale * u_xlat16_77 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat25.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat25.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_77) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_24.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz + u_xlat16_2.xyz;
    u_xlat16_7.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_7.xyz = u_xlat16_7.xxx * vs_TEXCOORD1.yzx;
    u_xlat25.xyz = u_xlat5.xxx * u_xlat16_7.xyz + u_xlat14.xyz;
    u_xlat4.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat25.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : u_xlat12.xyz;
    u_xlat4.xyz = u_xlat16_26.xyz * u_xlat25.xyz;
    u_xlat4.xyz = u_xlat25.zxy * u_xlat16_26.yzx + (-u_xlat4.xyz);
    u_xlat5.xyw = u_xlat25.xyz * u_xlat4.xyz;
    u_xlat25.xyz = u_xlat4.zxy * u_xlat25.yzx + (-u_xlat5.xyw);
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + u_xlat25.xyz;
    u_xlat16_7.x = u_xlat16_78 * 8.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
    u_xlat25.xyz = u_xlat16_7.xxx * u_xlat25.xyz + u_xlat13.xyz;
    u_xlat4.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat29);
    u_xlat16_7.x = dot((-u_xlat16_26.xyz), u_xlat25.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat25.xyz = (-u_xlat25.xyz) * u_xlat16_7.xxx + (-u_xlat16_26.xyz);
    u_xlat5.xyw = u_xlat11.xyz * vec3(u_xlat85) + (-u_xlat25.xyz);
    u_xlat5.xyw = vec3(u_xlat16_78) * u_xlat5.xyw + u_xlat25.xyz;
    u_xlat10.xyz = u_xlat25.xyz + (-u_xlat5.xyw);
    u_xlat5.xyw = abs(u_xlat16_3.xxx) * u_xlat10.xyz + u_xlat5.xyw;
    u_xlat16_26.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_26.x = u_xlat16_8.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat25.x = dot(u_xlat16_21.xyz, u_xlat25.xyz);
    u_xlat16_47.y = u_xlat25.x * 0.5;
    u_xlat16_51.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xw);
    u_xlat5.w = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xw);
    u_xlat5.x = u_xlat16_51.x;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat5.xyw, u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_7.www * u_xlat16_7.zxy;
    u_xlat25.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat25.xyz * u_xlat25.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb25 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb25)) ? u_xlat16_20.xyz : u_xlat16_26.xyz;
    u_xlat17.y = u_xlat16_8.x;
    u_xlat16_47.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_20.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.xyz = min(max(u_xlat16_20.xyz, 0.0), 1.0);
#else
    u_xlat16_20.xyz = clamp(u_xlat16_20.xyz, 0.0, 1.0);
#endif
    u_xlat16_25.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_8.xyz = u_xlat16_33.xyz * u_xlat16_25.xxx + u_xlat16_25.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_7.yzw = u_xlat16_20.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_7.w);
    u_xlat16_3.x = u_xlat16_76 + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_7.x = u_xlat16_76 * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_76 = u_xlat16_20.z * 15.0 + (-u_xlat16_76);
    u_xlat16_3.x = (-u_xlat16_50) + u_xlat16_25.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_50;
    u_xlat16_76 = u_xlat16_77 * u_xlat16_76;
    u_xlat25.x = u_xlat4.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.x * 0.5;
    u_xlat16_77 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat25.x * u_xlat16_77 + u_xlat16_76;
    u_xlat16_77 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_3.x = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_76 = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_76, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_8.yzx + u_xlat16_9.yzx;
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
    u_xlat16_26.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(u_xlat16_79);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _emissiveColor.zxy;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat50 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_28.xy;
    u_xlat16_51.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_51.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * abs(vec3(u_xlat50)) + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
bool u_xlatb25;
vec3 u_xlat27;
float u_xlat29;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
float u_xlat53;
vec2 u_xlat58;
mediump vec2 u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_89;
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
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25.x = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25.x = u_xlat25.x * vs_TEXCOORD2.w;
    u_xlat49 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat49) + u_xlat8.xyz;
    u_xlat49 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat25.zxy;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat74) * u_xlat3.xyz;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_79 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_83 = u_xlat16_79 + -1.0;
    u_xlat75 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_84 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_84;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat5.z = u_xlat74 * u_xlat75;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat74 = u_xlat16_79 * u_xlat16_84;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat5.y = u_xlat16_61.x * u_xlat74;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat8.xyz;
    u_xlat29 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat75 * u_xlat29;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat74 * u_xlat29;
    u_xlat29 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat10.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat4.x = u_xlat29 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_11.xyz;
    u_xlat53 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat15.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat74 * u_xlat53;
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_61.x;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_11.x) + 1.0;
    u_xlat80 = u_xlat75 * u_xlat74;
    u_xlat16.z = u_xlat53 * u_xlat80;
    u_xlat53 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat53 = max(u_xlat53, 6.10351563e-05);
    u_xlat53 = u_xlat80 / u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat81 = u_xlat80 * 0.318309873;
    u_xlat53 = u_xlat53 * u_xlat81;
    u_xlat53 = min(u_xlat53, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat53;
    u_xlat16_11.x = u_xlat78 * u_xlat78;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_35 = u_xlat78 * u_xlat16_11.x;
    u_xlat53 = (-u_xlat16_11.x) * u_xlat78 + 1.0;
    u_xlat58.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat58.xy = fract(u_xlat58.xy);
    u_xlat16_11.x = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_11.xz = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xz = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_11.xz;
    u_xlat58.xy = u_xlat58.xy + u_xlat16_11.xz;
    u_xlat16_61.xy = u_xlat58.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_78 = texture(_FlowChangeColorMask, u_xlat16_61.xy).x;
    u_xlat16_15.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.zxy + (-u_xlat16_16.zxy);
    u_xlat16_17.xyz = vec3(u_xlat16_78) * u_xlat16_17.xyz + u_xlat16_16.zxy;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_37.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat16_37.xyz;
    u_xlat76 = u_xlat16_37.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat76) * vec3(u_xlat16_35) + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat24.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat74 * u_xlat4.x;
    u_xlat16_35 = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_35;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat80 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat81 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58.x = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat75 * u_xlat58.x;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat74 * u_xlat16_35;
    u_xlat58.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat16.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat29 * u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat4.x = u_xlat4.x * u_xlat58.x;
    u_xlat16_35 = u_xlat53 * u_xlat53;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_86 = u_xlat53 * u_xlat16_35;
    u_xlat53 = (-u_xlat16_35) * u_xlat53 + 1.0;
    u_xlat20.xyz = u_xlat16_37.xyz * vec3(u_xlat53);
    u_xlat20.xyz = vec3(u_xlat76) * vec3(u_xlat16_86) + u_xlat20.xyz;
    u_xlat20.xyz = u_xlat4.xxx * u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.zxy;
    u_xlat20.xyz = u_xlat16.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat20.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_35);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat15.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_19.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_19.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat75;
    u_xlat15.y = u_xlat74 * u_xlat4.x;
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat75 * u_xlat16_79;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_79) + 1.0;
    u_xlat15.z = u_xlat75 * u_xlat80;
    u_xlat75 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat80 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat81 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat16_19.xyz);
    u_xlat3.y = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat3.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat29 * u_xlat74 + 6.10351563e-05;
    u_xlat74 = float(1.0) / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_89 = u_xlat4.x * u_xlat16_86;
    u_xlat27.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat27.xyz = u_xlat16_37.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat76) * vec3(u_xlat16_89) + u_xlat27.xyz;
    u_xlat27.xyz = vec3(u_xlat74) * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.zxy;
    u_xlat27.xyz = u_xlat3.xxx * u_xlat27.xyz;
    u_xlat16_86 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_86;
    u_xlat16_35 = max(u_xlat16_21.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_86);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat27.xyz * u_xlat24.yyy + u_xlat16_18.xyz;
    u_xlat16_79 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_35 = (-u_xlat16_79) + u_xlat16_35;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_35 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_79;
    u_xlat16_35 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_35 + -1.0;
    u_xlat16_35 = _occlusionScale * u_xlat16_35 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat0.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_22.y = u_xlat16_12.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_22.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_35) * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_7.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat25.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_84 * 8.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_83) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat25.xxx;
    u_xlat16_86 = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_86) + (-u_xlat16_14.xyz);
    u_xlat25.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_84) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_83 = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_83 = u_xlat16_13.x * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_83);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_83);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_43.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_37.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_83 = u_xlat16_79 + 1.0;
    u_xlat16_83 = min(u_xlat16_83, 15.0);
    u_xlat16_2.x = u_xlat16_83 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_14.z * 15.0 + (-u_xlat16_79);
    u_xlat16_83 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_35 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_35 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_35 + u_xlat16_79;
    u_xlat16_35 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_83 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_35;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_4.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_12.yzx * u_xlat16_13.yzx + u_xlat16_18.yzx;
    u_xlat16_79 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * vec3(u_xlat16_78);
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat48 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_11.xz;
    u_xlat16_11.xz = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_11.xz).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * u_xlat16_11.xzw;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xzw = u_xlat0.xxx * u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_11.xzw * abs(vec3(u_xlat48)) + u_xlat16_7.xyz;
    u_xlat16_11.xzw = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xzw + u_xlat16_7.xyz;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_79 : u_xlat16_35;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
bool u_xlatb25;
vec3 u_xlat27;
float u_xlat29;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
float u_xlat53;
vec2 u_xlat58;
mediump vec2 u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_89;
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
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25.x = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25.x = u_xlat25.x * vs_TEXCOORD2.w;
    u_xlat49 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat49) + u_xlat8.xyz;
    u_xlat49 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat25.zxy;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat74) * u_xlat3.xyz;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_79 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_83 = u_xlat16_79 + -1.0;
    u_xlat75 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_84 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_84;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat5.z = u_xlat74 * u_xlat75;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat74 = u_xlat16_79 * u_xlat16_84;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat5.y = u_xlat16_61.x * u_xlat74;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat8.xyz;
    u_xlat29 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat75 * u_xlat29;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat74 * u_xlat29;
    u_xlat29 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat10.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat4.x = u_xlat29 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_11.xyz;
    u_xlat53 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat15.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat74 * u_xlat53;
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_61.x;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_11.x) + 1.0;
    u_xlat80 = u_xlat75 * u_xlat74;
    u_xlat16.z = u_xlat53 * u_xlat80;
    u_xlat53 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat53 = max(u_xlat53, 6.10351563e-05);
    u_xlat53 = u_xlat80 / u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat81 = u_xlat80 * 0.318309873;
    u_xlat53 = u_xlat53 * u_xlat81;
    u_xlat53 = min(u_xlat53, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat53;
    u_xlat16_11.x = u_xlat78 * u_xlat78;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_35 = u_xlat78 * u_xlat16_11.x;
    u_xlat53 = (-u_xlat16_11.x) * u_xlat78 + 1.0;
    u_xlat58.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat58.xy = fract(u_xlat58.xy);
    u_xlat16_11.x = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_11.xz = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xz = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_11.xz;
    u_xlat58.xy = u_xlat58.xy + u_xlat16_11.xz;
    u_xlat16_61.xy = u_xlat58.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_78 = texture(_FlowChangeColorMask, u_xlat16_61.xy).x;
    u_xlat16_15.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.zxy + (-u_xlat16_16.zxy);
    u_xlat16_17.xyz = vec3(u_xlat16_78) * u_xlat16_17.xyz + u_xlat16_16.zxy;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_37.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat16_37.xyz;
    u_xlat76 = u_xlat16_37.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat76) * vec3(u_xlat16_35) + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat24.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat74 * u_xlat4.x;
    u_xlat16_35 = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_35;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat80 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat81 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58.x = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat75 * u_xlat58.x;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat74 * u_xlat16_35;
    u_xlat58.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat16.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat29 * u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat4.x = u_xlat4.x * u_xlat58.x;
    u_xlat16_35 = u_xlat53 * u_xlat53;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_86 = u_xlat53 * u_xlat16_35;
    u_xlat53 = (-u_xlat16_35) * u_xlat53 + 1.0;
    u_xlat20.xyz = u_xlat16_37.xyz * vec3(u_xlat53);
    u_xlat20.xyz = vec3(u_xlat76) * vec3(u_xlat16_86) + u_xlat20.xyz;
    u_xlat20.xyz = u_xlat4.xxx * u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.zxy;
    u_xlat20.xyz = u_xlat16.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat20.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_35);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat15.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_19.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_19.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat75;
    u_xlat15.y = u_xlat74 * u_xlat4.x;
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat75 * u_xlat16_79;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_79) + 1.0;
    u_xlat15.z = u_xlat75 * u_xlat80;
    u_xlat75 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat80 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat81 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat16_19.xyz);
    u_xlat3.y = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat3.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat29 * u_xlat74 + 6.10351563e-05;
    u_xlat74 = float(1.0) / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_89 = u_xlat4.x * u_xlat16_86;
    u_xlat27.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat27.xyz = u_xlat16_37.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat76) * vec3(u_xlat16_89) + u_xlat27.xyz;
    u_xlat27.xyz = vec3(u_xlat74) * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.zxy;
    u_xlat27.xyz = u_xlat3.xxx * u_xlat27.xyz;
    u_xlat16_86 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_86;
    u_xlat16_35 = max(u_xlat16_21.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_86);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat27.xyz * u_xlat24.yyy + u_xlat16_18.xyz;
    u_xlat16_79 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_35 = (-u_xlat16_79) + u_xlat16_35;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_35 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_79;
    u_xlat16_35 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_35 + -1.0;
    u_xlat16_35 = _occlusionScale * u_xlat16_35 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat0.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_22.y = u_xlat16_12.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_22.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_35) * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_7.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat25.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_84 * 8.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_83) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat25.xxx;
    u_xlat16_86 = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_86) + (-u_xlat16_14.xyz);
    u_xlat25.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_84) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_83 = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_83 = u_xlat16_13.x * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_83);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_83);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_43.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_37.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_83 = u_xlat16_79 + 1.0;
    u_xlat16_83 = min(u_xlat16_83, 15.0);
    u_xlat16_2.x = u_xlat16_83 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_14.z * 15.0 + (-u_xlat16_79);
    u_xlat16_83 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_35 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_35 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_35 + u_xlat16_79;
    u_xlat16_35 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_83 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_35;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_4.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_12.yzx * u_xlat16_13.yzx + u_xlat16_18.yzx;
    u_xlat16_79 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.zxy * vec3(u_xlat16_78);
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat48 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_11.xz;
    u_xlat16_11.xz = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_11.xz).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * u_xlat16_11.xzw;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xzw = u_xlat0.xxx * u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_11.xzw * abs(vec3(u_xlat48)) + u_xlat16_7.xyz;
    u_xlat16_11.xzw = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xzw + u_xlat16_7.xyz;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_79 : u_xlat16_35;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
mediump float u_xlat16_21;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_29;
mediump vec2 u_xlat16_31;
mediump vec3 u_xlat16_37;
float u_xlat40;
mediump vec2 u_xlat16_40;
bool u_xlatb40;
vec2 u_xlat47;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_49;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
bool u_xlatb60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
int u_xlati63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
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
    u_xlatb20 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb20 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat20.x = (u_xlatb20) ? 1.0 : -1.0;
    u_xlat20.x = u_xlat20.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat16_1.xyz;
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
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat60 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat60) + u_xlat2.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat20.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat6.xyz = u_xlat20.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_61 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat60 = u_xlat16_61 * u_xlat16_49.x;
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat60 = max(u_xlat60, 0.00100000005);
    u_xlat10.y = u_xlat20.x * u_xlat60;
    u_xlat16_69 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat20.x = (-u_xlat16_61) + 1.0;
    u_xlat20.x = u_xlat20.x * u_xlat16_49.x;
    u_xlat20.x = max(u_xlat20.x, 0.00100000005);
    u_xlat10.x = u_xlat16_69 * u_xlat20.x;
    u_xlat62 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_69) + 1.0;
    u_xlat64 = u_xlat20.x * u_xlat60;
    u_xlat10.z = u_xlat62 * u_xlat64;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = max(u_xlat62, 6.10351563e-05);
    u_xlat62 = u_xlat64 / u_xlat62;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat64 * u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat65 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat20.x * u_xlat65;
    u_xlat7.z = u_xlat20.x * u_xlat64;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat20.x * u_xlat60;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat7.x;
    u_xlat16_69 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat60 * u_xlat16_69;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = sqrt(u_xlat60);
    u_xlat20.z = u_xlat60 + u_xlat6.x;
    u_xlat20.xz = u_xlat20.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.z + 6.10351563e-05;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat62;
    u_xlat16_69 = u_xlat63 * u_xlat63;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_11.x = u_xlat63 * u_xlat16_69;
    u_xlat60 = (-u_xlat16_69) * u_xlat63 + 1.0;
    u_xlat26.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat26.xy = fract(u_xlat26.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_31.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_31.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_31.xy;
    u_xlat26.xy = u_xlat26.xy + u_xlat16_31.xy;
    u_xlat16_12.xy = u_xlat26.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_62 = texture(_FlowChangeColorMask, u_xlat16_12.xy).x;
    u_xlat16_26.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_26.zxy + (-u_xlat16_10.zxy);
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz + u_xlat16_10.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_13.xyz;
    u_xlat60 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_11.xxx + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat20.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat26.xyz = u_xlat6.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_11.www + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
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
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_14.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_29 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_47.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat47.xy = u_xlat16_47.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xy = min(max(u_xlat47.xy, 0.0), 1.0);
#else
    u_xlat47.xy = clamp(u_xlat47.xy, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat47.yyy * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29 = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = u_xlat8.xyw * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_11.www + u_xlat16_16.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat60 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_15.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat4.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_16.xyz = vec3(u_xlat16_29) * u_xlat16_16.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_29) + u_xlat16_69;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_69 + u_xlat16_29;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_29;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_29 = u_xlat16_69 * u_xlat16_29;
    u_xlat20.x = min(u_xlat16_29, 1.0);
    u_xlat60 = min(u_xlat20.x, u_xlat16_8.z);
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_69) * u_xlat16_19.xyz;
    u_xlati60 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati60].xyz;
    u_xlati60 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati63 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_29 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_14.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_14.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_61>=0.0);
#else
    u_xlatb0 = u_xlat16_61>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + u_xlat2.xyz;
    u_xlat16_11.x = u_xlat16_49.x * 8.0;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat16_49.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_61) * u_xlat16_11.x;
    u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_11.xxx + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat3.xyz = u_xlat16_49.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_61)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_61) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat40 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
    u_xlat16_37.y = u_xlat40 * 0.5;
    u_xlat16_21 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_21;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat2.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_29) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_37.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_29 = u_xlat16_9.x + 1.0;
    u_xlat16_29 = min(u_xlat16_29, 15.0);
    u_xlat16_1.x = u_xlat16_29 * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_40.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_29 = (-u_xlat16_60) + u_xlat16_40.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_29 + u_xlat16_60;
    u_xlat16_9.x = u_xlat16_69 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat20.x * 0.5;
    u_xlat16_29 = (-u_xlat20.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_29 + u_xlat16_9.x;
    u_xlat16_29 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_49.x = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_49.x + u_xlat16_29;
    u_xlat16_9.x = u_xlat20.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat26.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.yzx;
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
    u_xlat16_29 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * vec3(u_xlat16_62);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat40 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_31.xy;
    u_xlat16_49.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_49.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_11.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * abs(vec3(u_xlat40)) + u_xlat16_12.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_29;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
mediump float u_xlat16_21;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_29;
mediump vec2 u_xlat16_31;
mediump vec3 u_xlat16_37;
float u_xlat40;
mediump vec2 u_xlat16_40;
bool u_xlatb40;
vec2 u_xlat47;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_49;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
bool u_xlatb60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
int u_xlati63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
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
    u_xlatb20 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb20 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat20.x = (u_xlatb20) ? 1.0 : -1.0;
    u_xlat20.x = u_xlat20.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat16_1.xyz;
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
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat60 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat60) + u_xlat2.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat20.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat6.xyz = u_xlat20.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_61 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat60 = u_xlat16_61 * u_xlat16_49.x;
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat60 = max(u_xlat60, 0.00100000005);
    u_xlat10.y = u_xlat20.x * u_xlat60;
    u_xlat16_69 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat20.x = (-u_xlat16_61) + 1.0;
    u_xlat20.x = u_xlat20.x * u_xlat16_49.x;
    u_xlat20.x = max(u_xlat20.x, 0.00100000005);
    u_xlat10.x = u_xlat16_69 * u_xlat20.x;
    u_xlat62 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_69) + 1.0;
    u_xlat64 = u_xlat20.x * u_xlat60;
    u_xlat10.z = u_xlat62 * u_xlat64;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = max(u_xlat62, 6.10351563e-05);
    u_xlat62 = u_xlat64 / u_xlat62;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat64 * u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat65 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat20.x * u_xlat65;
    u_xlat7.z = u_xlat20.x * u_xlat64;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat20.x * u_xlat60;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat7.x;
    u_xlat16_69 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat60 * u_xlat16_69;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = sqrt(u_xlat60);
    u_xlat20.z = u_xlat60 + u_xlat6.x;
    u_xlat20.xz = u_xlat20.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.z + 6.10351563e-05;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat62;
    u_xlat16_69 = u_xlat63 * u_xlat63;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_11.x = u_xlat63 * u_xlat16_69;
    u_xlat60 = (-u_xlat16_69) * u_xlat63 + 1.0;
    u_xlat26.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat26.xy = fract(u_xlat26.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_31.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_31.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_31.xy;
    u_xlat26.xy = u_xlat26.xy + u_xlat16_31.xy;
    u_xlat16_12.xy = u_xlat26.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_62 = texture(_FlowChangeColorMask, u_xlat16_12.xy).x;
    u_xlat16_26.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_26.zxy + (-u_xlat16_10.zxy);
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz + u_xlat16_10.zxy;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_13.xyz;
    u_xlat60 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_11.xxx + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat20.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat26.xyz = u_xlat6.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_11.www + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
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
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_14.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_29 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_47.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat47.xy = u_xlat16_47.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xy = min(max(u_xlat47.xy, 0.0), 1.0);
#else
    u_xlat47.xy = clamp(u_xlat47.xy, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat47.yyy * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29 = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = u_xlat8.xyw * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_11.www + u_xlat16_16.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat60 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_15.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat4.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_16.xyz = vec3(u_xlat16_29) * u_xlat16_16.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_29) + u_xlat16_69;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_69 + u_xlat16_29;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_29;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_29 = u_xlat16_69 * u_xlat16_29;
    u_xlat20.x = min(u_xlat16_29, 1.0);
    u_xlat60 = min(u_xlat20.x, u_xlat16_8.z);
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_69) * u_xlat16_19.xyz;
    u_xlati60 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati60].xyz;
    u_xlati60 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati63 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_29 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_14.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_14.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_61>=0.0);
#else
    u_xlatb0 = u_xlat16_61>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + u_xlat2.xyz;
    u_xlat16_11.x = u_xlat16_49.x * 8.0;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat16_49.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_61) * u_xlat16_11.x;
    u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_11.xxx + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat3.xyz = u_xlat16_49.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_61)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_61) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat40 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
    u_xlat16_37.y = u_xlat40 * 0.5;
    u_xlat16_21 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_21;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat2.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_29) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_37.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_29 = u_xlat16_9.x + 1.0;
    u_xlat16_29 = min(u_xlat16_29, 15.0);
    u_xlat16_1.x = u_xlat16_29 * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_40.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_29 = (-u_xlat16_60) + u_xlat16_40.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_29 + u_xlat16_60;
    u_xlat16_9.x = u_xlat16_69 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat20.x * 0.5;
    u_xlat16_29 = (-u_xlat20.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_29 + u_xlat16_9.x;
    u_xlat16_29 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_49.x = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_49.x + u_xlat16_29;
    u_xlat16_9.x = u_xlat20.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat26.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.yzx;
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
    u_xlat16_29 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.zxy * vec3(u_xlat16_62);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat40 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_31.xy;
    u_xlat16_49.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_49.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_11.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * abs(vec3(u_xlat40)) + u_xlat16_12.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_29;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec2 u_xlat23;
vec3 u_xlat25;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_52;
float u_xlat63;
int u_xlati63;
float u_xlat66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
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
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22.x = (-u_xlat1.x) + u_xlat22.x;
    u_xlat0.z = _ShadowBias.y * u_xlat22.x + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_10.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_10.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_10.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_10.xy;
    u_xlat16_52.xy = u_xlat1.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_1.x = texture(_FlowChangeColorMask, u_xlat16_52.xy).x;
    u_xlat16_22.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_22.zxy + (-u_xlat16_2.zxy);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz + u_xlat16_2.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_69 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_69 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat2.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat21.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_anisoUse2U);
#else
    u_xlatb21 = 0.5<_anisoUse2U;
#endif
    u_xlat21.xy = (bool(u_xlatb21)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat21.xy = u_xlat21.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_21.x = texture(_anisotropicMap, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_21.x * 2.0 + -1.0;
    u_xlat21.x = u_xlat21.x * _sunShift + _sunShiftOffset;
    u_xlat21.x = u_xlat21.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb42 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat42 = (u_xlatb42) ? 1.0 : -1.0;
    u_xlat42 = u_xlat42 * vs_TEXCOORD2.w;
    u_xlat22.x = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat22.xyz = (-u_xlat8.yzx) * u_xlat22.xxx + u_xlat7.xyz;
    u_xlat66 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat66);
    u_xlat4.xyz = u_xlat22.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat22.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat21.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat42 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_52.x = u_xlat16_69 + -1.0;
    u_xlat66 = (-u_xlat16_52.x) + 1.0;
    u_xlat16_14.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_73 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat3.x = u_xlat66 * u_xlat16_73;
    u_xlat3.x = max(u_xlat3.x, 0.00100000005);
    u_xlat2.z = u_xlat42 * u_xlat3.x;
    u_xlat16_74 = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat42 = u_xlat16_69 * u_xlat16_73;
    u_xlat42 = max(u_xlat42, 0.00100000005);
    u_xlat2.y = u_xlat16_74 * u_xlat42;
    u_xlat23.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat2.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
    u_xlat17.z = u_xlat44 * u_xlat3.x;
    u_xlat44 = dot(u_xlat22.zxy, u_xlat16_15.xyz);
    u_xlat17.y = u_xlat42 * u_xlat44;
    u_xlat17.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat23.y = u_xlat44 + u_xlat17.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.y * u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat42 * u_xlat44;
    u_xlat42 = u_xlat3.x * u_xlat42;
    u_xlat16_69 = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat3.x * u_xlat16_69;
    u_xlat44 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_69) + 1.0;
    u_xlat7.z = u_xlat42 * u_xlat44;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 6.10351563e-05);
    u_xlat44 = u_xlat42 / u_xlat44;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat42 = u_xlat42 * u_xlat44;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat42 = u_xlat23.x * u_xlat42;
    u_xlat16_69 = u_xlat3.x * u_xlat3.x;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_74 = u_xlat3.x * u_xlat16_69;
    u_xlat23.x = (-u_xlat16_69) * u_xlat3.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_14.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_11.xyz;
    u_xlat23.x = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * vec3(u_xlat16_74) + u_xlat3.xyw;
    u_xlat3.xyw = vec3(u_xlat42) * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyw;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_35.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_35.xyz = vec3(_occlusionScale) * u_xlat16_35.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat16_35.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_35.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_69));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_35.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_35.xz);
    u_xlat16_19.y = u_xlat16_35.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati3.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_20.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati63 = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_75 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = vec3(u_xlat16_75) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat21.xxx * u_xlat16_13.xyz + u_xlat4.xyz;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_52.x>=0.0);
#else
    u_xlatb3 = u_xlat16_52.x>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb3)) ? u_xlat0.xyw : u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_15.xyz * u_xlat0.xyw;
    u_xlat22.xyz = u_xlat0.wxy * u_xlat16_15.yzx + (-u_xlat22.xyz);
    u_xlat3.xyw = u_xlat0.xyw * u_xlat22.xyz;
    u_xlat0.xyw = u_xlat22.zxy * u_xlat0.ywx + (-u_xlat3.xyw);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat68) + u_xlat0.xyw;
    u_xlat16_75 = u_xlat16_73 * 8.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_75 = abs(u_xlat16_52.x) * u_xlat16_75;
    u_xlat0.xyw = vec3(u_xlat16_75) * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat22.x = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat43 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat43);
    u_xlat16_75 = dot((-u_xlat16_15.xyz), u_xlat0.xyw);
    u_xlat16_75 = u_xlat16_75 + u_xlat16_75;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_75) + (-u_xlat16_15.xyz);
    u_xlat3.xyw = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xyw);
    u_xlat3.xyw = vec3(u_xlat16_73) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyw);
    u_xlat3.xyw = abs(u_xlat16_52.xxx) * u_xlat4.xyz + u_xlat3.xyw;
    u_xlat16_52.x = -abs(u_xlat16_52.x) * 0.800000012 + 1.0;
    u_xlat16_52.x = u_xlat16_14.x * u_xlat16_52.x;
    u_xlat16_52.x = u_xlat16_52.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_52.x);
    u_xlat0.x = dot(u_xlat16_35.xyz, u_xlat0.xyw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_73 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xw);
    u_xlat3.w = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xw);
    u_xlat3.x = u_xlat16_73;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat3.xyw, u_xlat16_52.x);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat0.xyw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_13.xyz;
    u_xlat17.y = u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_4.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_4.w);
    u_xlat16_52.x = u_xlat16_69 + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_4.x = u_xlat16_52.x * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_4.x = u_xlat16_69 * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_69 = u_xlat16_14.z * 15.0 + (-u_xlat16_69);
    u_xlat16_52.x = (-u_xlat16_21.x) + u_xlat16_0.x;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x + u_xlat16_21.x;
    u_xlat16_69 = u_xlat16_74 * u_xlat16_69;
    u_xlat0.x = u_xlat22.x * u_xlat16_69;
    u_xlat16_69 = u_xlat0.z * 0.5;
    u_xlat16_52.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_52.x + u_xlat16_69;
    u_xlat16_52.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_73 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73 + u_xlat16_52.x;
    u_xlat16_69 = u_xlat0.z * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat2.yzx * u_xlat16_6.yzx + u_xlat16_11.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_27 = u_xlat16_2.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_1.xxx;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat42 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat16_48.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_48.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * abs(vec3(u_xlat42)) + u_xlat16_11.xyz;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_21.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_21.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_27;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
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
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec2 u_xlat23;
vec3 u_xlat25;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_52;
float u_xlat63;
int u_xlati63;
float u_xlat66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
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
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22.x = (-u_xlat1.x) + u_xlat22.x;
    u_xlat0.z = _ShadowBias.y * u_xlat22.x + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_10.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_10.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_10.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_10.xy;
    u_xlat16_52.xy = u_xlat1.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_1.x = texture(_FlowChangeColorMask, u_xlat16_52.xy).x;
    u_xlat16_22.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_22.zxy + (-u_xlat16_2.zxy);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz + u_xlat16_2.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_69 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_69 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat2.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat21.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_anisoUse2U);
#else
    u_xlatb21 = 0.5<_anisoUse2U;
#endif
    u_xlat21.xy = (bool(u_xlatb21)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat21.xy = u_xlat21.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_21.x = texture(_anisotropicMap, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_21.x * 2.0 + -1.0;
    u_xlat21.x = u_xlat21.x * _sunShift + _sunShiftOffset;
    u_xlat21.x = u_xlat21.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb42 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat42 = (u_xlatb42) ? 1.0 : -1.0;
    u_xlat42 = u_xlat42 * vs_TEXCOORD2.w;
    u_xlat22.x = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat22.xyz = (-u_xlat8.yzx) * u_xlat22.xxx + u_xlat7.xyz;
    u_xlat66 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat66);
    u_xlat4.xyz = u_xlat22.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat22.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat21.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat42 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_52.x = u_xlat16_69 + -1.0;
    u_xlat66 = (-u_xlat16_52.x) + 1.0;
    u_xlat16_14.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_73 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat3.x = u_xlat66 * u_xlat16_73;
    u_xlat3.x = max(u_xlat3.x, 0.00100000005);
    u_xlat2.z = u_xlat42 * u_xlat3.x;
    u_xlat16_74 = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat42 = u_xlat16_69 * u_xlat16_73;
    u_xlat42 = max(u_xlat42, 0.00100000005);
    u_xlat2.y = u_xlat16_74 * u_xlat42;
    u_xlat23.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat2.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
    u_xlat17.z = u_xlat44 * u_xlat3.x;
    u_xlat44 = dot(u_xlat22.zxy, u_xlat16_15.xyz);
    u_xlat17.y = u_xlat42 * u_xlat44;
    u_xlat17.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat23.y = u_xlat44 + u_xlat17.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.y * u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat42 * u_xlat44;
    u_xlat42 = u_xlat3.x * u_xlat42;
    u_xlat16_69 = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat3.x * u_xlat16_69;
    u_xlat44 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_69) + 1.0;
    u_xlat7.z = u_xlat42 * u_xlat44;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 6.10351563e-05);
    u_xlat44 = u_xlat42 / u_xlat44;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat42 = u_xlat42 * u_xlat44;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat42 = u_xlat23.x * u_xlat42;
    u_xlat16_69 = u_xlat3.x * u_xlat3.x;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_74 = u_xlat3.x * u_xlat16_69;
    u_xlat23.x = (-u_xlat16_69) * u_xlat3.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_14.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_11.xyz;
    u_xlat23.x = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * vec3(u_xlat16_74) + u_xlat3.xyw;
    u_xlat3.xyw = vec3(u_xlat42) * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyw;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_35.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_35.xyz = vec3(_occlusionScale) * u_xlat16_35.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat16_35.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_35.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_69));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_35.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_35.xz);
    u_xlat16_19.y = u_xlat16_35.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati3.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_20.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati63 = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_75 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = vec3(u_xlat16_75) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat21.xxx * u_xlat16_13.xyz + u_xlat4.xyz;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_52.x>=0.0);
#else
    u_xlatb3 = u_xlat16_52.x>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb3)) ? u_xlat0.xyw : u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_15.xyz * u_xlat0.xyw;
    u_xlat22.xyz = u_xlat0.wxy * u_xlat16_15.yzx + (-u_xlat22.xyz);
    u_xlat3.xyw = u_xlat0.xyw * u_xlat22.xyz;
    u_xlat0.xyw = u_xlat22.zxy * u_xlat0.ywx + (-u_xlat3.xyw);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat68) + u_xlat0.xyw;
    u_xlat16_75 = u_xlat16_73 * 8.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_75 = abs(u_xlat16_52.x) * u_xlat16_75;
    u_xlat0.xyw = vec3(u_xlat16_75) * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat22.x = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat43 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat43);
    u_xlat16_75 = dot((-u_xlat16_15.xyz), u_xlat0.xyw);
    u_xlat16_75 = u_xlat16_75 + u_xlat16_75;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_75) + (-u_xlat16_15.xyz);
    u_xlat3.xyw = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xyw);
    u_xlat3.xyw = vec3(u_xlat16_73) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyw);
    u_xlat3.xyw = abs(u_xlat16_52.xxx) * u_xlat4.xyz + u_xlat3.xyw;
    u_xlat16_52.x = -abs(u_xlat16_52.x) * 0.800000012 + 1.0;
    u_xlat16_52.x = u_xlat16_14.x * u_xlat16_52.x;
    u_xlat16_52.x = u_xlat16_52.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_52.x);
    u_xlat0.x = dot(u_xlat16_35.xyz, u_xlat0.xyw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_73 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xw);
    u_xlat3.w = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xw);
    u_xlat3.x = u_xlat16_73;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat3.xyw, u_xlat16_52.x);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat0.xyw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_13.xyz;
    u_xlat17.y = u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_4.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_4.w);
    u_xlat16_52.x = u_xlat16_69 + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_4.x = u_xlat16_52.x * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_4.x = u_xlat16_69 * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_69 = u_xlat16_14.z * 15.0 + (-u_xlat16_69);
    u_xlat16_52.x = (-u_xlat16_21.x) + u_xlat16_0.x;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x + u_xlat16_21.x;
    u_xlat16_69 = u_xlat16_74 * u_xlat16_69;
    u_xlat0.x = u_xlat22.x * u_xlat16_69;
    u_xlat16_69 = u_xlat0.z * 0.5;
    u_xlat16_52.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_52.x + u_xlat16_69;
    u_xlat16_52.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_73 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73 + u_xlat16_52.x;
    u_xlat16_69 = u_xlat0.z * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat2.yzx * u_xlat16_6.yzx + u_xlat16_11.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_27 = u_xlat16_2.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_1.xxx;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat42 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat16_48.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_48.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * abs(vec3(u_xlat42)) + u_xlat16_11.xyz;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_21.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_21.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_27;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec2 u_xlat16_25;
ivec3 u_xlati25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec2 u_xlat16_28;
float u_xlat29;
mediump vec3 u_xlat16_33;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump vec2 u_xlat16_51;
float u_xlat54;
float u_xlat75;
bool u_xlatb75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
bool u_xlatb80;
mediump float u_xlat16_82;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
float u_xlat89;
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
    u_xlat16_51.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51.x;
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
    u_xlat5.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat16_77 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_28.xy = vec2(u_xlat16_77) * vs_TEXCOORD3.xy;
    u_xlat16_28.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_28.xy;
    u_xlat5.xy = u_xlat5.xy + u_xlat16_28.xy;
    u_xlat16_6.xy = u_xlat5.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_79 = texture(_FlowChangeColorMask, u_xlat16_6.xy).x;
    u_xlat16_5.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_79) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_5.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_33.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_33.xyz;
    u_xlat75 = u_xlat16_33.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_anisoUse2U);
#else
    u_xlatb5 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb5)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_5.x = texture(_anisotropicMap, u_xlat5.xw).x;
    u_xlat5.x = u_xlat16_5.x * 2.0 + -1.0;
    u_xlat5.x = u_xlat5.x * _sunShift + _sunShiftOffset;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb80 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat80 = (u_xlatb80) ? 1.0 : -1.0;
    u_xlat80 = u_xlat80 * vs_TEXCOORD2.w;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat12.xyz = u_xlat16_9.xyz * vec3(u_xlat85);
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat13.x;
    u_xlat11.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat12.x;
    u_xlat14.y = u_xlat13.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_9.xyz, u_xlat14.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat13.xyz = vec3(u_xlat85) * u_xlat11.xyz;
    u_xlat86 = dot(u_xlat12.zxy, u_xlat13.xyz);
    u_xlat12.xyz = (-u_xlat13.yzx) * vec3(u_xlat86) + u_xlat12.xyz;
    u_xlat86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat12.xyz = vec3(u_xlat86) * u_xlat12.xyz;
    u_xlat14.xyz = u_xlat12.yzx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat13.zxy * u_xlat12.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat13.xyz + u_xlat14.zxy;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat16_77 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_77 + -1.0;
    u_xlat86 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_78 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat86 = u_xlat86 * u_xlat16_78;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat16.z = u_xlat80 * u_xlat86;
    u_xlat16.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat80 = u_xlat16_77 * u_xlat16_78;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat16.y = u_xlat16_26.x * u_xlat80;
    u_xlat87 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat16.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_26.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat17.z = u_xlat86 * u_xlat88;
    u_xlat17.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat88 = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat17.y = u_xlat80 * u_xlat88;
    u_xlat88 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat17.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat87 = u_xlat88 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat89 = dot(u_xlat15.xyz, u_xlat4.xyz);
    u_xlat18.y = u_xlat80 * u_xlat89;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat16_77 * u_xlat86;
    u_xlat29 = u_xlat86 * u_xlat80;
    u_xlat18.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat29 * 0.318309873;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat87 * u_xlat4.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat16.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_41.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat41.xy = u_xlat16_41.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xy = min(max(u_xlat41.xy, 0.0), 1.0);
#else
    u_xlat41.xy = clamp(u_xlat41.xy, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * u_xlat41.xxx;
    u_xlat18.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat18.xyz = u_xlat4.xxx * u_xlat18.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat80;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_77 * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat16_77) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat89 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat86 * u_xlat89;
    u_xlat18.x = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(u_xlat12.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_77 * u_xlat80;
    u_xlat89 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat89 + u_xlat18.x;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat88 * u_xlat89 + 6.10351563e-05;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat4.x = u_xlat4.x * u_xlat89;
    u_xlat16_77 = u_xlat87 * u_xlat87;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_82 = u_xlat87 * u_xlat16_77;
    u_xlat87 = (-u_xlat16_77) * u_xlat87 + 1.0;
    u_xlat43.xyz = u_xlat16_33.xyz * vec3(u_xlat87);
    u_xlat43.xyz = vec3(u_xlat75) * vec3(u_xlat16_82) + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat4.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat43.xyz * _directSpecularColor.xyz;
    u_xlat43.xyz = u_xlat18.xxx * u_xlat43.xyz;
    u_xlat16_9.xyz = u_xlat43.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_77);
    u_xlat16_20.xyz = vec3(u_xlat16_82) * u_xlat10.xyz;
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat10.z = u_xlat10.x * u_xlat86;
    u_xlat15.y = u_xlat4.x * u_xlat80;
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat0.xyz);
    u_xlat15.x = u_xlat16_1.x * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat15.z = u_xlat4.x * u_xlat29;
    u_xlat25.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat25.x = max(u_xlat25.x, 6.10351563e-05);
    u_xlat25.x = u_xlat29 / u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat54 * u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat16_20.xyz);
    u_xlat10.y = u_xlat16_1.x * u_xlat80;
    u_xlat10.x = dot(u_xlat13.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat88 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25.x = u_xlat50 * u_xlat25.x;
    u_xlat16_82 = u_xlat0.x * u_xlat0.x;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_84 = u_xlat0.x * u_xlat16_82;
    u_xlat0.x = (-u_xlat16_82) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_33.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat75) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_82 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_82;
    u_xlat16_77 = max(u_xlat16_21.x, u_xlat16_77);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_82 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_82);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat16_20.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat41.yyy + u_xlat16_9.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat41.yyy * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat41.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat10.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat13.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_21.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_77 = (-u_xlat16_1.x) + u_xlat16_77;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_77 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_1.x;
    u_xlat16_77 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat16_77 = _occlusionScale * u_xlat16_77 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat25.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat25.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_77) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_24.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz + u_xlat16_2.xyz;
    u_xlat16_7.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_7.xyz = u_xlat16_7.xxx * vs_TEXCOORD1.yzx;
    u_xlat25.xyz = u_xlat5.xxx * u_xlat16_7.xyz + u_xlat14.xyz;
    u_xlat4.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat25.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : u_xlat12.xyz;
    u_xlat4.xyz = u_xlat16_26.xyz * u_xlat25.xyz;
    u_xlat4.xyz = u_xlat25.zxy * u_xlat16_26.yzx + (-u_xlat4.xyz);
    u_xlat5.xyw = u_xlat25.xyz * u_xlat4.xyz;
    u_xlat25.xyz = u_xlat4.zxy * u_xlat25.yzx + (-u_xlat5.xyw);
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + u_xlat25.xyz;
    u_xlat16_7.x = u_xlat16_78 * 8.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
    u_xlat25.xyz = u_xlat16_7.xxx * u_xlat25.xyz + u_xlat13.xyz;
    u_xlat4.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat29);
    u_xlat16_7.x = dot((-u_xlat16_26.xyz), u_xlat25.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat25.xyz = (-u_xlat25.xyz) * u_xlat16_7.xxx + (-u_xlat16_26.xyz);
    u_xlat5.xyw = u_xlat11.xyz * vec3(u_xlat85) + (-u_xlat25.xyz);
    u_xlat5.xyw = vec3(u_xlat16_78) * u_xlat5.xyw + u_xlat25.xyz;
    u_xlat10.xyz = u_xlat25.xyz + (-u_xlat5.xyw);
    u_xlat5.xyw = abs(u_xlat16_3.xxx) * u_xlat10.xyz + u_xlat5.xyw;
    u_xlat16_26.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_26.x = u_xlat16_8.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat25.x = dot(u_xlat16_21.xyz, u_xlat25.xyz);
    u_xlat16_47.y = u_xlat25.x * 0.5;
    u_xlat16_51.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xw);
    u_xlat5.w = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xw);
    u_xlat5.x = u_xlat16_51.x;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat5.xyw, u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_7.www * u_xlat16_7.xyz;
    u_xlat25.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat25.xyz * u_xlat25.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb25 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb25)) ? u_xlat16_20.xyz : u_xlat16_26.xyz;
    u_xlat17.y = u_xlat16_8.x;
    u_xlat16_47.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_20.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.xyz = min(max(u_xlat16_20.xyz, 0.0), 1.0);
#else
    u_xlat16_20.xyz = clamp(u_xlat16_20.xyz, 0.0, 1.0);
#endif
    u_xlat16_25.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_8.xyz = u_xlat16_33.xyz * u_xlat16_25.xxx + u_xlat16_25.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_7.yzw = u_xlat16_20.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_7.w);
    u_xlat16_3.x = u_xlat16_76 + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_7.x = u_xlat16_76 * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_76 = u_xlat16_20.z * 15.0 + (-u_xlat16_76);
    u_xlat16_3.x = (-u_xlat16_50) + u_xlat16_25.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_50;
    u_xlat16_76 = u_xlat16_77 * u_xlat16_76;
    u_xlat25.x = u_xlat4.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.x * 0.5;
    u_xlat16_77 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat25.x * u_xlat16_77 + u_xlat16_76;
    u_xlat16_77 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_3.x = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_76 = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_76, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
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
    u_xlat16_26.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(u_xlat16_79);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _emissiveColor.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat50 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_28.xy;
    u_xlat16_51.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_51.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * abs(vec3(u_xlat50)) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec2 u_xlat16_25;
ivec3 u_xlati25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec2 u_xlat16_28;
float u_xlat29;
mediump vec3 u_xlat16_33;
vec2 u_xlat41;
mediump vec2 u_xlat16_41;
vec3 u_xlat43;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
mediump vec2 u_xlat16_51;
float u_xlat54;
float u_xlat75;
bool u_xlatb75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
bool u_xlatb80;
mediump float u_xlat16_82;
mediump float u_xlat16_84;
float u_xlat85;
float u_xlat86;
float u_xlat87;
float u_xlat88;
float u_xlat89;
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
    u_xlat16_51.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_26.x * u_xlat16_51.x;
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
    u_xlat5.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat16_77 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_28.xy = vec2(u_xlat16_77) * vs_TEXCOORD3.xy;
    u_xlat16_28.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_28.xy;
    u_xlat5.xy = u_xlat5.xy + u_xlat16_28.xy;
    u_xlat16_6.xy = u_xlat5.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_79 = texture(_FlowChangeColorMask, u_xlat16_6.xy).x;
    u_xlat16_5.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_79) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_5.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_33.xyz = u_xlat16_8.yyy * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_33.xyz;
    u_xlat75 = u_xlat16_33.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat75) * u_xlat16_3.xxx + u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_anisoUse2U);
#else
    u_xlatb5 = 0.5<_anisoUse2U;
#endif
    u_xlat5.xw = (bool(u_xlatb5)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat5.xw = u_xlat5.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_5.x = texture(_anisotropicMap, u_xlat5.xw).x;
    u_xlat5.x = u_xlat16_5.x * 2.0 + -1.0;
    u_xlat5.x = u_xlat5.x * _sunShift + _sunShiftOffset;
    u_xlat5.x = u_xlat5.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb80 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat80 = (u_xlatb80) ? 1.0 : -1.0;
    u_xlat80 = u_xlat80 * vs_TEXCOORD2.w;
    u_xlat11.z = vs_TEXCOORD1.x;
    u_xlat16_77 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_77) + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat12.xyz = u_xlat16_9.xyz * vec3(u_xlat85);
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat11.y = u_xlat13.x;
    u_xlat11.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.x = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat14.x = u_xlat12.x;
    u_xlat14.y = u_xlat13.z;
    u_xlat14.z = vs_TEXCOORD1.y;
    u_xlat11.y = dot(u_xlat16_9.xyz, u_xlat14.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat11.z = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat13.xyz = vec3(u_xlat85) * u_xlat11.xyz;
    u_xlat86 = dot(u_xlat12.zxy, u_xlat13.xyz);
    u_xlat12.xyz = (-u_xlat13.yzx) * vec3(u_xlat86) + u_xlat12.xyz;
    u_xlat86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat12.xyz = vec3(u_xlat86) * u_xlat12.xyz;
    u_xlat14.xyz = u_xlat12.yzx * u_xlat13.xyz;
    u_xlat14.xyz = u_xlat13.zxy * u_xlat12.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat80) * u_xlat14.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat13.xyz + u_xlat14.zxy;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat15.xyz = vec3(u_xlat80) * u_xlat15.xyz;
    u_xlat80 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat16_77 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_5.zz);
    u_xlat16_3.x = u_xlat16_77 + -1.0;
    u_xlat86 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_78 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat86 = u_xlat86 * u_xlat16_78;
    u_xlat86 = max(u_xlat86, 0.00100000005);
    u_xlat16.z = u_xlat80 * u_xlat86;
    u_xlat16.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat80 = u_xlat16_77 * u_xlat16_78;
    u_xlat80 = max(u_xlat80, 0.00100000005);
    u_xlat16.y = u_xlat16_26.x * u_xlat80;
    u_xlat87 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat16.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_26.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat16_26.xyz);
    u_xlat17.z = u_xlat86 * u_xlat88;
    u_xlat17.x = dot(u_xlat13.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat88 = dot(u_xlat12.zxy, u_xlat16_26.xyz);
    u_xlat17.y = u_xlat80 * u_xlat88;
    u_xlat88 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat17.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat87 = u_xlat88 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat89 = dot(u_xlat15.xyz, u_xlat4.xyz);
    u_xlat18.y = u_xlat80 * u_xlat89;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat4.xyz);
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat16_77 * u_xlat86;
    u_xlat29 = u_xlat86 * u_xlat80;
    u_xlat18.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat29 * 0.318309873;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat87 * u_xlat4.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat16.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_41.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat41.xy = u_xlat16_41.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xy = min(max(u_xlat41.xy, 0.0), 1.0);
#else
    u_xlat41.xy = clamp(u_xlat41.xy, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * u_xlat41.xxx;
    u_xlat18.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat18.xyz = u_xlat4.xxx * u_xlat18.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat80;
    u_xlat16_77 = dot(u_xlat12.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_77 * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat87 = (-u_xlat16_77) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat29;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat29 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat54 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat89 = dot(u_xlat15.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat86 * u_xlat89;
    u_xlat18.x = dot(u_xlat13.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_77 = dot(u_xlat12.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_77 * u_xlat80;
    u_xlat89 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat89 = sqrt(u_xlat89);
    u_xlat89 = u_xlat89 + u_xlat18.x;
    u_xlat89 = u_xlat89 + 6.10351563e-05;
    u_xlat89 = u_xlat88 * u_xlat89 + 6.10351563e-05;
    u_xlat89 = float(1.0) / u_xlat89;
    u_xlat4.x = u_xlat4.x * u_xlat89;
    u_xlat16_77 = u_xlat87 * u_xlat87;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_77 = u_xlat87 * u_xlat16_77;
    u_xlat16_82 = u_xlat87 * u_xlat16_77;
    u_xlat87 = (-u_xlat16_77) * u_xlat87 + 1.0;
    u_xlat43.xyz = u_xlat16_33.xyz * vec3(u_xlat87);
    u_xlat43.xyz = vec3(u_xlat75) * vec3(u_xlat16_82) + u_xlat43.xyz;
    u_xlat43.xyz = u_xlat4.xxx * u_xlat43.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat43.xyz = min(max(u_xlat43.xyz, 0.0), 1.0);
#else
    u_xlat43.xyz = clamp(u_xlat43.xyz, 0.0, 1.0);
#endif
    u_xlat43.xyz = u_xlat43.xyz * _directSpecularColor.xyz;
    u_xlat43.xyz = u_xlat18.xxx * u_xlat43.xyz;
    u_xlat16_9.xyz = u_xlat43.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_77);
    u_xlat16_20.xyz = vec3(u_xlat16_82) * u_xlat10.xyz;
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat15.xyz, u_xlat16_20.xyz);
    u_xlat10.z = u_xlat10.x * u_xlat86;
    u_xlat15.y = u_xlat4.x * u_xlat80;
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat0.xyz);
    u_xlat15.x = u_xlat16_1.x * u_xlat86;
    u_xlat4.x = dot(u_xlat13.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_20.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_1.x) + 1.0;
    u_xlat15.z = u_xlat4.x * u_xlat29;
    u_xlat25.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat25.x = max(u_xlat25.x, 6.10351563e-05);
    u_xlat25.x = u_xlat29 / u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat54 * u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat16_1.x = dot(u_xlat12.zxy, u_xlat16_20.xyz);
    u_xlat10.y = u_xlat16_1.x * u_xlat80;
    u_xlat10.x = dot(u_xlat13.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat88 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25.x = u_xlat50 * u_xlat25.x;
    u_xlat16_82 = u_xlat0.x * u_xlat0.x;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_82 = u_xlat0.x * u_xlat16_82;
    u_xlat16_84 = u_xlat0.x * u_xlat16_82;
    u_xlat0.x = (-u_xlat16_82) * u_xlat0.x + 1.0;
    u_xlat4.xyz = u_xlat16_33.xyz * u_xlat0.xxx;
    u_xlat0.xzw = vec3(u_xlat75) * vec3(u_xlat16_84) + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_82 = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_82;
    u_xlat16_77 = max(u_xlat16_21.x, u_xlat16_77);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_82 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_82);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat16_20.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_20.xyz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat41.yyy + u_xlat16_9.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat41.yyy * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat41.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16.xxx * u_xlat16_2.xyz;
    u_xlat16_21.xyz = u_xlat16_7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_21.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat10.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_7.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat13.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_21.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_1.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_1.x * 0.5 + 0.5;
    u_xlat16_77 = (-u_xlat16_1.x) + u_xlat16_77;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_77 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_47.z * u_xlat16_1.x;
    u_xlat16_77 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_77 = u_xlat16_77 + -1.0;
    u_xlat16_77 = _occlusionScale * u_xlat16_77 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_77;
    u_xlat0.x = min(u_xlat16_1.x, 1.0);
    u_xlat25.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat25.xxx * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat25.xxx * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat25.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_7.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * u_xlat25.xxx + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati25.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_77) * u_xlat16_24.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati25.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlati25.x = int(uint(uint(u_xlati25.x) & 1u));
    u_xlati50 = (u_xlati25.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25.x].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_24.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_20.xyz + u_xlat16_2.xyz;
    u_xlat16_7.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_7.xyz = u_xlat16_7.xxx * vs_TEXCOORD1.yzx;
    u_xlat25.xyz = u_xlat5.xxx * u_xlat16_7.xyz + u_xlat14.xyz;
    u_xlat4.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_3.x>=0.0);
#else
    u_xlatb4 = u_xlat16_3.x>=0.0;
#endif
    u_xlat25.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : u_xlat12.xyz;
    u_xlat4.xyz = u_xlat16_26.xyz * u_xlat25.xyz;
    u_xlat4.xyz = u_xlat25.zxy * u_xlat16_26.yzx + (-u_xlat4.xyz);
    u_xlat5.xyw = u_xlat25.xyz * u_xlat4.xyz;
    u_xlat25.xyz = u_xlat4.zxy * u_xlat25.yzx + (-u_xlat5.xyw);
    u_xlat25.xyz = (-u_xlat11.xyz) * vec3(u_xlat85) + u_xlat25.xyz;
    u_xlat16_7.x = u_xlat16_78 * 8.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_78 = max(u_xlat16_78, 0.0078125);
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = abs(u_xlat16_3.x) * u_xlat16_7.x;
    u_xlat25.xyz = u_xlat16_7.xxx * u_xlat25.xyz + u_xlat13.xyz;
    u_xlat4.x = dot(u_xlat16_21.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat25.xyz = u_xlat25.xyz * vec3(u_xlat29);
    u_xlat16_7.x = dot((-u_xlat16_26.xyz), u_xlat25.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat25.xyz = (-u_xlat25.xyz) * u_xlat16_7.xxx + (-u_xlat16_26.xyz);
    u_xlat5.xyw = u_xlat11.xyz * vec3(u_xlat85) + (-u_xlat25.xyz);
    u_xlat5.xyw = vec3(u_xlat16_78) * u_xlat5.xyw + u_xlat25.xyz;
    u_xlat10.xyz = u_xlat25.xyz + (-u_xlat5.xyw);
    u_xlat5.xyw = abs(u_xlat16_3.xxx) * u_xlat10.xyz + u_xlat5.xyw;
    u_xlat16_26.x = -abs(u_xlat16_3.x) * 0.800000012 + 1.0;
    u_xlat16_26.x = u_xlat16_8.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat25.x = dot(u_xlat16_21.xyz, u_xlat25.xyz);
    u_xlat16_47.y = u_xlat25.x * 0.5;
    u_xlat16_51.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xw);
    u_xlat5.w = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xw);
    u_xlat5.x = u_xlat16_51.x;
    u_xlat16_7 = textureLod(_IndirectSpecularMap, u_xlat5.xyw, u_xlat16_26.x);
    u_xlat16_26.xyz = u_xlat16_7.www * u_xlat16_7.xyz;
    u_xlat25.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_26.xyz = u_xlat25.xyz * u_xlat25.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb25 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb25)) ? u_xlat16_20.xyz : u_xlat16_26.xyz;
    u_xlat17.y = u_xlat16_8.x;
    u_xlat16_47.x = u_xlat16_8.x * 1.09769487;
    u_xlat16_20.xyz = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.xyz = min(max(u_xlat16_20.xyz, 0.0), 1.0);
#else
    u_xlat16_20.xyz = clamp(u_xlat16_20.xyz, 0.0, 1.0);
#endif
    u_xlat16_25.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_8.xyz = u_xlat16_33.xyz * u_xlat16_25.xxx + u_xlat16_25.yyy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_7.yzw = u_xlat16_20.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_76 = floor(u_xlat16_7.w);
    u_xlat16_3.x = u_xlat16_76 + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 15.0);
    u_xlat16_7.x = u_xlat16_3.x * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_7.x = u_xlat16_76 * 16.0 + u_xlat16_7.z;
    u_xlat16_3.xw = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_3.xw = u_xlat16_3.xw * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xw).x;
    u_xlat16_76 = u_xlat16_20.z * 15.0 + (-u_xlat16_76);
    u_xlat16_3.x = (-u_xlat16_50) + u_xlat16_25.x;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_50;
    u_xlat16_76 = u_xlat16_77 * u_xlat16_76;
    u_xlat25.x = u_xlat4.x * u_xlat16_76;
    u_xlat16_76 = u_xlat0.x * 0.5;
    u_xlat16_77 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_76 = u_xlat25.x * u_xlat16_77 + u_xlat16_76;
    u_xlat16_77 = u_xlat16_76 + u_xlat16_76;
    u_xlat16_3.x = (-u_xlat16_76) * 2.0 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_3.x + u_xlat16_77;
    u_xlat16_76 = u_xlat0.x * u_xlat16_76;
    u_xlat16_76 = min(u_xlat16_76, u_xlat16_5.z);
    u_xlat16_1.xyz = vec3(u_xlat16_76) * u_xlat16_1.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
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
    u_xlat16_26.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(u_xlat16_79);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _emissiveColor.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat50 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_28.xy;
    u_xlat16_51.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_51.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * abs(vec3(u_xlat50)) + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
bool u_xlatb25;
vec3 u_xlat27;
float u_xlat29;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
float u_xlat53;
vec2 u_xlat58;
mediump vec2 u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_89;
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
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1 = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25.x = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25.x = u_xlat25.x * vs_TEXCOORD2.w;
    u_xlat49 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat49) + u_xlat8.xyz;
    u_xlat49 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat25.zxy;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat74) * u_xlat3.xyz;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_79 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_83 = u_xlat16_79 + -1.0;
    u_xlat75 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_84 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_84;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat5.z = u_xlat74 * u_xlat75;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat74 = u_xlat16_79 * u_xlat16_84;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat5.y = u_xlat16_61.x * u_xlat74;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat8.xyz;
    u_xlat29 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat75 * u_xlat29;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat74 * u_xlat29;
    u_xlat29 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat10.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat4.x = u_xlat29 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_11.xyz;
    u_xlat53 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat15.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat74 * u_xlat53;
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_61.x;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_11.x) + 1.0;
    u_xlat80 = u_xlat75 * u_xlat74;
    u_xlat16.z = u_xlat53 * u_xlat80;
    u_xlat53 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat53 = max(u_xlat53, 6.10351563e-05);
    u_xlat53 = u_xlat80 / u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat81 = u_xlat80 * 0.318309873;
    u_xlat53 = u_xlat53 * u_xlat81;
    u_xlat53 = min(u_xlat53, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat53;
    u_xlat16_11.x = u_xlat78 * u_xlat78;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_35 = u_xlat78 * u_xlat16_11.x;
    u_xlat53 = (-u_xlat16_11.x) * u_xlat78 + 1.0;
    u_xlat58.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat58.xy = fract(u_xlat58.xy);
    u_xlat16_11.x = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_11.xz = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xz = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_11.xz;
    u_xlat58.xy = u_xlat58.xy + u_xlat16_11.xz;
    u_xlat16_61.xy = u_xlat58.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_78 = texture(_FlowChangeColorMask, u_xlat16_61.xy).x;
    u_xlat16_15.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat16_78) * u_xlat16_17.xyz + u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_37.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat16_37.xyz;
    u_xlat76 = u_xlat16_37.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat76) * vec3(u_xlat16_35) + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat24.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat74 * u_xlat4.x;
    u_xlat16_35 = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_35;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat80 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat81 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58.x = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat75 * u_xlat58.x;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat74 * u_xlat16_35;
    u_xlat58.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat16.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat29 * u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat4.x = u_xlat4.x * u_xlat58.x;
    u_xlat16_35 = u_xlat53 * u_xlat53;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_86 = u_xlat53 * u_xlat16_35;
    u_xlat53 = (-u_xlat16_35) * u_xlat53 + 1.0;
    u_xlat20.xyz = u_xlat16_37.xyz * vec3(u_xlat53);
    u_xlat20.xyz = vec3(u_xlat76) * vec3(u_xlat16_86) + u_xlat20.xyz;
    u_xlat20.xyz = u_xlat4.xxx * u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.xyz;
    u_xlat20.xyz = u_xlat16.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat20.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_35);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat15.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_19.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_19.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat75;
    u_xlat15.y = u_xlat74 * u_xlat4.x;
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat75 * u_xlat16_79;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_79) + 1.0;
    u_xlat15.z = u_xlat75 * u_xlat80;
    u_xlat75 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat80 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat81 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat16_19.xyz);
    u_xlat3.y = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat3.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat29 * u_xlat74 + 6.10351563e-05;
    u_xlat74 = float(1.0) / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_89 = u_xlat4.x * u_xlat16_86;
    u_xlat27.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat27.xyz = u_xlat16_37.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat76) * vec3(u_xlat16_89) + u_xlat27.xyz;
    u_xlat27.xyz = vec3(u_xlat74) * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat3.xxx * u_xlat27.xyz;
    u_xlat16_86 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_86;
    u_xlat16_35 = max(u_xlat16_21.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_86);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat27.xyz * u_xlat24.yyy + u_xlat16_18.xyz;
    u_xlat16_79 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_35 = (-u_xlat16_79) + u_xlat16_35;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_35 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_79;
    u_xlat16_35 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_35 + -1.0;
    u_xlat16_35 = _occlusionScale * u_xlat16_35 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat0.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_22.y = u_xlat16_12.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_22.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_35) * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_7.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat25.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_84 * 8.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_83) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat25.xxx;
    u_xlat16_86 = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_86) + (-u_xlat16_14.xyz);
    u_xlat25.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_84) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_83 = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_83 = u_xlat16_13.x * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_83);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_83);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_43.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_37.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_83 = u_xlat16_79 + 1.0;
    u_xlat16_83 = min(u_xlat16_83, 15.0);
    u_xlat16_2.x = u_xlat16_83 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_14.z * 15.0 + (-u_xlat16_79);
    u_xlat16_83 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_35 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_35 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_35 + u_xlat16_79;
    u_xlat16_35 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_83 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_35;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_4.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_18.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(u_xlat16_78);
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat48 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_11.xz;
    u_xlat16_11.xz = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_11.xz).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * u_xlat16_11.xzw;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xzw = u_xlat0.xxx * u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_11.xzw * abs(vec3(u_xlat48)) + u_xlat16_7.xyz;
    u_xlat16_11.xzw = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xzw + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_79 : u_xlat16_35;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
bool u_xlatb25;
vec3 u_xlat27;
float u_xlat29;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_37;
mediump vec3 u_xlat16_43;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat49;
float u_xlat53;
vec2 u_xlat58;
mediump vec2 u_xlat16_61;
float u_xlat72;
bool u_xlatb72;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_86;
mediump float u_xlat16_89;
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
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
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
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_83 = max(u_xlat16_83, u_xlat16_12.x);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83;
    u_xlat16_12.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_anisoUse2U);
#else
    u_xlatb1 = 0.5<_anisoUse2U;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1 = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
    u_xlat1.x = u_xlat1.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb25 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat25.x = (u_xlatb25) ? 1.0 : -1.0;
    u_xlat25.x = u_xlat25.x * vs_TEXCOORD2.w;
    u_xlat49 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat2.xyz = (-u_xlat9.yzx) * vec3(u_xlat49) + u_xlat8.xyz;
    u_xlat49 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat9.xyz;
    u_xlat3.xyz = u_xlat9.zxy * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat9.xyz + u_xlat25.zxy;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat74) * u_xlat3.xyz;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat16_11.xyz);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_79 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_83 = u_xlat16_79 + -1.0;
    u_xlat75 = (-u_xlat16_83) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_84 = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat75 = u_xlat75 * u_xlat16_84;
    u_xlat75 = max(u_xlat75, 0.00100000005);
    u_xlat5.z = u_xlat74 * u_xlat75;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat16_11.xyz);
    u_xlat74 = u_xlat16_79 * u_xlat16_84;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat5.y = u_xlat16_61.x * u_xlat74;
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat5.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat8.xyz;
    u_xlat29 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat75 * u_xlat29;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat74 * u_xlat29;
    u_xlat29 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 + u_xlat10.x;
    u_xlat29 = u_xlat29 + 6.10351563e-05;
    u_xlat4.x = u_xlat29 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_11.xyz;
    u_xlat53 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat15.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat74 * u_xlat53;
    u_xlat16_61.x = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat75 * u_xlat16_61.x;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_11.x) + 1.0;
    u_xlat80 = u_xlat75 * u_xlat74;
    u_xlat16.z = u_xlat53 * u_xlat80;
    u_xlat53 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat53 = max(u_xlat53, 6.10351563e-05);
    u_xlat53 = u_xlat80 / u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat81 = u_xlat80 * 0.318309873;
    u_xlat53 = u_xlat53 * u_xlat81;
    u_xlat53 = min(u_xlat53, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat53;
    u_xlat16_11.x = u_xlat78 * u_xlat78;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat78 * u_xlat16_11.x;
    u_xlat16_35 = u_xlat78 * u_xlat16_11.x;
    u_xlat53 = (-u_xlat16_11.x) * u_xlat78 + 1.0;
    u_xlat58.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat58.xy = fract(u_xlat58.xy);
    u_xlat16_11.x = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_11.xz = u_xlat16_11.xx * vs_TEXCOORD3.xy;
    u_xlat16_11.xz = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_11.xz;
    u_xlat58.xy = u_xlat58.xy + u_xlat16_11.xz;
    u_xlat16_61.xy = u_xlat58.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_78 = texture(_FlowChangeColorMask, u_xlat16_61.xy).x;
    u_xlat16_15.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat16_78) * u_xlat16_17.xyz + u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_37.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat53) * u_xlat16_37.xyz;
    u_xlat76 = u_xlat16_37.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat76) * vec3(u_xlat16_35) + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat24.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat74 * u_xlat4.x;
    u_xlat16_35 = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat75 * u_xlat16_35;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat80;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat80 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat81 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58.x = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat75 * u_xlat58.x;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_35 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat74 * u_xlat16_35;
    u_xlat58.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat58.x + u_xlat16.x;
    u_xlat58.x = u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = u_xlat29 * u_xlat58.x + 6.10351563e-05;
    u_xlat58.x = float(1.0) / u_xlat58.x;
    u_xlat4.x = u_xlat4.x * u_xlat58.x;
    u_xlat16_35 = u_xlat53 * u_xlat53;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_35 = u_xlat53 * u_xlat16_35;
    u_xlat16_86 = u_xlat53 * u_xlat16_35;
    u_xlat53 = (-u_xlat16_35) * u_xlat53 + 1.0;
    u_xlat20.xyz = u_xlat16_37.xyz * vec3(u_xlat53);
    u_xlat20.xyz = vec3(u_xlat76) * vec3(u_xlat16_86) + u_xlat20.xyz;
    u_xlat20.xyz = u_xlat4.xxx * u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat20.xyz * _directSpecularColor.xyz;
    u_xlat20.xyz = u_xlat16.xxx * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat20.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_35);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat15.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_21.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_79) + u_xlat16_19.xyz;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_19.xyz);
    u_xlat3.z = u_xlat3.x * u_xlat75;
    u_xlat15.y = u_xlat74 * u_xlat4.x;
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat8.xyz);
    u_xlat15.x = u_xlat75 * u_xlat16_79;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_79) + 1.0;
    u_xlat15.z = u_xlat75 * u_xlat80;
    u_xlat75 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat80 / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat81 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat16_79 = dot(u_xlat2.zxy, u_xlat16_19.xyz);
    u_xlat3.y = u_xlat74 * u_xlat16_79;
    u_xlat3.x = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat3.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat74 = u_xlat29 * u_xlat74 + 6.10351563e-05;
    u_xlat74 = float(1.0) / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat75;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_89 = u_xlat4.x * u_xlat16_86;
    u_xlat27.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat27.xyz = u_xlat16_37.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat76) * vec3(u_xlat16_89) + u_xlat27.xyz;
    u_xlat27.xyz = vec3(u_xlat74) * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat3.xxx * u_xlat27.xyz;
    u_xlat16_86 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_35 = float(1.0) / float(u_xlat16_35);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_35 = u_xlat16_35 * u_xlat16_86;
    u_xlat16_35 = max(u_xlat16_21.x, u_xlat16_35);
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb74 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb74) ? 1.0 : 0.0;
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_86);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat16_19.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat27.xyz * u_xlat24.yyy + u_xlat16_18.xyz;
    u_xlat16_79 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_17.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat5.xxx * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat24.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat3.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_35 = (-u_xlat16_79) + u_xlat16_35;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_35 + u_xlat16_79;
    u_xlat16_79 = u_xlat16_43.z * u_xlat16_79;
    u_xlat16_35 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_35 + -1.0;
    u_xlat16_35 = _occlusionScale * u_xlat16_35 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_35;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_79));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat0.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_22.y = u_xlat16_12.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_22.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_35) * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_7.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat0.xzw = u_xlat1.xxx * u_xlat16_17.xyz + u_xlat25.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_83>=0.0);
#else
    u_xlatb1 = u_xlat16_83>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat6.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_84 * 8.0;
    u_xlat16_84 = u_xlat16_84 * u_xlat16_84;
    u_xlat16_84 = max(u_xlat16_84, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_83) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat25.xxx;
    u_xlat16_86 = dot((-u_xlat16_14.xyz), u_xlat0.xzw);
    u_xlat16_86 = u_xlat16_86 + u_xlat16_86;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_86) + (-u_xlat16_14.xyz);
    u_xlat25.xyz = u_xlat6.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_84) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_83)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_83 = -abs(u_xlat16_83) * 0.800000012 + 1.0;
    u_xlat16_83 = u_xlat16_13.x * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_83);
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_12.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_83);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat10.y = u_xlat16_13.x;
    u_xlat16_43.x = u_xlat16_13.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_13.xyz = u_xlat16_37.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_79 = floor(u_xlat16_2.w);
    u_xlat16_83 = u_xlat16_79 + 1.0;
    u_xlat16_83 = min(u_xlat16_83, 15.0);
    u_xlat16_2.x = u_xlat16_83 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_2.x = u_xlat16_79 * 16.0 + u_xlat16_2.z;
    u_xlat16_13.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_79 = u_xlat16_14.z * 15.0 + (-u_xlat16_79);
    u_xlat16_83 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_48;
    u_xlat16_79 = u_xlat16_35 * u_xlat16_79;
    u_xlat0.x = u_xlat1.x * u_xlat16_79;
    u_xlat16_79 = u_xlat0.y * 0.5;
    u_xlat16_35 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_79 = u_xlat0.x * u_xlat16_35 + u_xlat16_79;
    u_xlat16_35 = u_xlat16_79 + u_xlat16_79;
    u_xlat16_83 = (-u_xlat16_79) * 2.0 + 1.0;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_83 + u_xlat16_35;
    u_xlat16_79 = u_xlat0.y * u_xlat16_79;
    u_xlat16_79 = min(u_xlat16_4.z, u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_18.xyz;
    u_xlat16_79 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_16.w * _AlbedoColor.w + u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat16_16.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(u_xlat16_78);
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat48 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_11.xz;
    u_xlat16_11.xz = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_11.xz).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xzw = u_xlat16_0.xxx * u_xlat16_11.xzw;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xzw = u_xlat0.xxx * u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_11.xzw * abs(vec3(u_xlat48)) + u_xlat16_7.xyz;
    u_xlat16_11.xzw = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xzw + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_79 : u_xlat16_35;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_29;
mediump vec2 u_xlat16_31;
mediump vec3 u_xlat16_37;
float u_xlat40;
mediump vec2 u_xlat16_40;
bool u_xlatb40;
vec2 u_xlat47;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_49;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
bool u_xlatb60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
int u_xlati63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
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
    u_xlatb20 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb20 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat20.x = (u_xlatb20) ? 1.0 : -1.0;
    u_xlat20.x = u_xlat20.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat16_1.xyz;
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
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat60 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat60) + u_xlat2.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat20.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat6.xyz = u_xlat20.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_61 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat60 = u_xlat16_61 * u_xlat16_49.x;
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat60 = max(u_xlat60, 0.00100000005);
    u_xlat10.y = u_xlat20.x * u_xlat60;
    u_xlat16_69 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat20.x = (-u_xlat16_61) + 1.0;
    u_xlat20.x = u_xlat20.x * u_xlat16_49.x;
    u_xlat20.x = max(u_xlat20.x, 0.00100000005);
    u_xlat10.x = u_xlat16_69 * u_xlat20.x;
    u_xlat62 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_69) + 1.0;
    u_xlat64 = u_xlat20.x * u_xlat60;
    u_xlat10.z = u_xlat62 * u_xlat64;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = max(u_xlat62, 6.10351563e-05);
    u_xlat62 = u_xlat64 / u_xlat62;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat64 * u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat65 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat20.x * u_xlat65;
    u_xlat7.z = u_xlat20.x * u_xlat64;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat20.x * u_xlat60;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat7.x;
    u_xlat16_69 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat60 * u_xlat16_69;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = sqrt(u_xlat60);
    u_xlat20.z = u_xlat60 + u_xlat6.x;
    u_xlat20.xz = u_xlat20.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.z + 6.10351563e-05;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat62;
    u_xlat16_69 = u_xlat63 * u_xlat63;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_11.x = u_xlat63 * u_xlat16_69;
    u_xlat60 = (-u_xlat16_69) * u_xlat63 + 1.0;
    u_xlat26.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat26.xy = fract(u_xlat26.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_31.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_31.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_31.xy;
    u_xlat26.xy = u_xlat26.xy + u_xlat16_31.xy;
    u_xlat16_12.xy = u_xlat26.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_62 = texture(_FlowChangeColorMask, u_xlat16_12.xy).x;
    u_xlat16_26.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_26.xyz + (-u_xlat16_10.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_13.xyz;
    u_xlat60 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_11.xxx + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat20.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat26.xyz = u_xlat6.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_11.www + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
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
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_14.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_29 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_47.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat47.xy = u_xlat16_47.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xy = min(max(u_xlat47.xy, 0.0), 1.0);
#else
    u_xlat47.xy = clamp(u_xlat47.xy, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat47.yyy * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29 = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = u_xlat8.xyw * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_11.www + u_xlat16_16.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat60 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_15.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat4.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_16.xyz = vec3(u_xlat16_29) * u_xlat16_16.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_29) + u_xlat16_69;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_69 + u_xlat16_29;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_29;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_29 = u_xlat16_69 * u_xlat16_29;
    u_xlat20.x = min(u_xlat16_29, 1.0);
    u_xlat60 = min(u_xlat20.x, u_xlat16_8.z);
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_69) * u_xlat16_19.xyz;
    u_xlati60 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati60].xyz;
    u_xlati60 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati63 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_29 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_14.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_14.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_61>=0.0);
#else
    u_xlatb0 = u_xlat16_61>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + u_xlat2.xyz;
    u_xlat16_11.x = u_xlat16_49.x * 8.0;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat16_49.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_61) * u_xlat16_11.x;
    u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_11.xxx + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat3.xyz = u_xlat16_49.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_61)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_61) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat40 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
    u_xlat16_37.y = u_xlat40 * 0.5;
    u_xlat16_21 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_21;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_29) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_37.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_29 = u_xlat16_9.x + 1.0;
    u_xlat16_29 = min(u_xlat16_29, 15.0);
    u_xlat16_1.x = u_xlat16_29 * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_40.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_29 = (-u_xlat16_60) + u_xlat16_40.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_29 + u_xlat16_60;
    u_xlat16_9.x = u_xlat16_69 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat20.x * 0.5;
    u_xlat16_29 = (-u_xlat20.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_29 + u_xlat16_9.x;
    u_xlat16_29 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_49.x = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_49.x + u_xlat16_29;
    u_xlat16_9.x = u_xlat20.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
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
    u_xlat16_29 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * vec3(u_xlat16_62);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat40 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_31.xy;
    u_xlat16_49.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_49.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_11.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * abs(vec3(u_xlat40)) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_29;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(9) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_29;
mediump vec2 u_xlat16_31;
mediump vec3 u_xlat16_37;
float u_xlat40;
mediump vec2 u_xlat16_40;
bool u_xlatb40;
vec2 u_xlat47;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_49;
float u_xlat60;
mediump float u_xlat16_60;
int u_xlati60;
bool u_xlatb60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
int u_xlati63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
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
    u_xlatb20 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb20 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat20.x = (u_xlatb20) ? 1.0 : -1.0;
    u_xlat20.x = u_xlat20.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat16_1.xyz;
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
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat60 = dot(u_xlat2.zxy, u_xlat4.xyz);
    u_xlat2.xyz = (-u_xlat4.yzx) * vec3(u_xlat60) + u_xlat2.xyz;
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat2.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat20.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat6.xyz = u_xlat20.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat7.xyz;
    u_xlat20.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat7.xyz = u_xlat20.xxx * u_xlat8.xyz;
    u_xlat20.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_61 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_9.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_49.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat60 = u_xlat16_61 * u_xlat16_49.x;
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat60 = max(u_xlat60, 0.00100000005);
    u_xlat10.y = u_xlat20.x * u_xlat60;
    u_xlat16_69 = dot(u_xlat2.zxy, u_xlat7.xyz);
    u_xlat20.x = (-u_xlat16_61) + 1.0;
    u_xlat20.x = u_xlat20.x * u_xlat16_49.x;
    u_xlat20.x = max(u_xlat20.x, 0.00100000005);
    u_xlat10.x = u_xlat16_69 * u_xlat20.x;
    u_xlat62 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_69) + 1.0;
    u_xlat64 = u_xlat20.x * u_xlat60;
    u_xlat10.z = u_xlat62 * u_xlat64;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = max(u_xlat62, 6.10351563e-05);
    u_xlat62 = u_xlat64 / u_xlat62;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat64 * u_xlat62;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat65 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat20.x * u_xlat65;
    u_xlat7.z = u_xlat20.x * u_xlat64;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat2.zxy, u_xlat16_1.xyz);
    u_xlat7.y = u_xlat20.x * u_xlat60;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat7.x;
    u_xlat16_69 = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat60 * u_xlat16_69;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = sqrt(u_xlat60);
    u_xlat20.z = u_xlat60 + u_xlat6.x;
    u_xlat20.xz = u_xlat20.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat20.x = u_xlat20.x * u_xlat20.z + 6.10351563e-05;
    u_xlat20.x = float(1.0) / u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat62;
    u_xlat16_69 = u_xlat63 * u_xlat63;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_69 = u_xlat63 * u_xlat16_69;
    u_xlat16_11.x = u_xlat63 * u_xlat16_69;
    u_xlat60 = (-u_xlat16_69) * u_xlat63 + 1.0;
    u_xlat26.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat26.xy = fract(u_xlat26.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_31.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_31.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_31.xy;
    u_xlat26.xy = u_xlat26.xy + u_xlat16_31.xy;
    u_xlat16_12.xy = u_xlat26.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_62 = texture(_FlowChangeColorMask, u_xlat16_12.xy).x;
    u_xlat16_26.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_26.xyz + (-u_xlat16_10.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_8.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_13.xyz;
    u_xlat60 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat26.xyz = vec3(u_xlat60) * u_xlat16_11.xxx + u_xlat26.xyz;
    u_xlat26.xyz = u_xlat20.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat26.xyz = u_xlat6.xxx * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb20 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_29 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_69 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb20 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb20)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_11.www + u_xlat16_15.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
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
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_14.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_29 = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_47.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat47.xy = u_xlat16_47.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xy = min(max(u_xlat47.xy, 0.0), 1.0);
#else
    u_xlat47.xy = clamp(u_xlat47.xy, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat47.yyy * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb60 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_29 = (u_xlatb60) ? 1.0 : 0.0;
    u_xlat8.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat8.xyw, u_xlat8.xyw);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = u_xlat8.xyw * u_xlat16_11.xxx;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb60 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xw = (bool(u_xlatb60)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_11.www + u_xlat16_16.xyz;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat60 = dot(u_xlat4.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_71);
    u_xlat16_71 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_71;
    u_xlat16_69 = max(u_xlat16_11.x, u_xlat16_69);
    u_xlat16_29 = u_xlat16_29 * u_xlat16_69;
    u_xlat16_15.xyz = vec3(u_xlat16_29) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat4.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_16.xyz = vec3(u_xlat16_29) * u_xlat16_16.xyz;
    u_xlat16_29 = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_29) + u_xlat16_69;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_69 + u_xlat16_29;
    u_xlat16_29 = u_xlat16_37.z * u_xlat16_29;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_29 = u_xlat16_69 * u_xlat16_29;
    u_xlat20.x = min(u_xlat16_29, 1.0);
    u_xlat60 = min(u_xlat20.x, u_xlat16_8.z);
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat60) * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat60) * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat60) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * vec3(u_xlat60) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_69) * u_xlat16_19.xyz;
    u_xlati60 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati60].xyz;
    u_xlati60 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati63 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_29 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_19.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_11.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_14.xyz = u_xlat16_11.xxx * vs_TEXCOORD1.yzx;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_14.xyz + u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_61>=0.0);
#else
    u_xlatb0 = u_xlat16_61>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : u_xlat2.xyz;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.zxy * u_xlat16_1.yzx + (-u_xlat5.xyz);
    u_xlat8.xyw = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat5.zxy * u_xlat2.yzx + (-u_xlat8.xyw);
    u_xlat2.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + u_xlat2.xyz;
    u_xlat16_11.x = u_xlat16_49.x * 8.0;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat16_49.x;
    u_xlat16_49.x = max(u_xlat16_49.x, 0.0078125);
    u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
    u_xlat16_11.x = abs(u_xlat16_61) * u_xlat16_11.x;
    u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat2.xyz = vec3(u_xlat60) * u_xlat2.xyz;
    u_xlat16_11.x = dot((-u_xlat16_1.xyz), u_xlat2.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_11.xxx + (-u_xlat16_1.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat3.xyz = u_xlat16_49.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = abs(vec3(u_xlat16_61)) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat16_1.x = -abs(u_xlat16_61) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat40 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
    u_xlat16_37.y = u_xlat40 * 0.5;
    u_xlat16_21 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat3.x = u_xlat16_21;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_29) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat7.y = u_xlat16_9.x;
    u_xlat16_37.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_1.w);
    u_xlat16_29 = u_xlat16_9.x + 1.0;
    u_xlat16_29 = min(u_xlat16_29, 15.0);
    u_xlat16_1.x = u_xlat16_29 * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_40.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_1.x = u_xlat16_9.x * 16.0 + u_xlat16_1.z;
    u_xlat16_11.xw = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_11.xw = u_xlat16_11.xw * vec2(0.00390625, 0.0625);
    u_xlat16_60 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xw).x;
    u_xlat16_9.x = u_xlat16_9.z * 15.0 + (-u_xlat16_9.x);
    u_xlat16_29 = (-u_xlat16_60) + u_xlat16_40.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_29 + u_xlat16_60;
    u_xlat16_9.x = u_xlat16_69 * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat20.x * 0.5;
    u_xlat16_29 = (-u_xlat20.x) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat0.x * u_xlat16_29 + u_xlat16_9.x;
    u_xlat16_29 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_49.x = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_49.x + u_xlat16_29;
    u_xlat16_9.x = u_xlat20.x * u_xlat16_9.x;
    u_xlat16_9.x = min(u_xlat16_8.z, u_xlat16_9.x);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat26.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
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
    u_xlat16_29 = u_xlat16_10.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * vec3(u_xlat16_62);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat40 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_31.xy;
    u_xlat16_49.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_49.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_11.xyz = u_xlat16_0.xxx * u_xlat16_11.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_11.xyz = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * abs(vec3(u_xlat40)) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_9.x : u_xlat16_29;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
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
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec2 u_xlat23;
vec3 u_xlat25;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_52;
int u_xlati63;
float u_xlat66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
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
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22.x = (-u_xlat1.x) + u_xlat22.x;
    u_xlat0.z = _ShadowBias.y * u_xlat22.x + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_10.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_10.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_10.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_10.xy;
    u_xlat16_52.xy = u_xlat1.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_1 = texture(_FlowChangeColorMask, u_xlat16_52.xy).x;
    u_xlat16_22.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_22.xyz + (-u_xlat16_2.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_1) * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_69 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_69 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat2.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat21.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_anisoUse2U);
#else
    u_xlatb21 = 0.5<_anisoUse2U;
#endif
    u_xlat21.xy = (bool(u_xlatb21)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat21.xy = u_xlat21.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_21.x = texture(_anisotropicMap, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_21.x * 2.0 + -1.0;
    u_xlat21.x = u_xlat21.x * _sunShift + _sunShiftOffset;
    u_xlat21.x = u_xlat21.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb42 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat42 = (u_xlatb42) ? 1.0 : -1.0;
    u_xlat42 = u_xlat42 * vs_TEXCOORD2.w;
    u_xlat22.x = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat22.xyz = (-u_xlat8.yzx) * u_xlat22.xxx + u_xlat7.xyz;
    u_xlat66 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat66);
    u_xlat4.xyz = u_xlat22.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat22.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat21.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat42 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_52.x = u_xlat16_69 + -1.0;
    u_xlat66 = (-u_xlat16_52.x) + 1.0;
    u_xlat16_14.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_73 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat3.x = u_xlat66 * u_xlat16_73;
    u_xlat3.x = max(u_xlat3.x, 0.00100000005);
    u_xlat2.z = u_xlat42 * u_xlat3.x;
    u_xlat16_74 = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat42 = u_xlat16_69 * u_xlat16_73;
    u_xlat42 = max(u_xlat42, 0.00100000005);
    u_xlat2.y = u_xlat16_74 * u_xlat42;
    u_xlat23.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat2.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
    u_xlat17.z = u_xlat44 * u_xlat3.x;
    u_xlat44 = dot(u_xlat22.zxy, u_xlat16_15.xyz);
    u_xlat17.y = u_xlat42 * u_xlat44;
    u_xlat17.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat23.y = u_xlat44 + u_xlat17.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.y * u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat42 * u_xlat44;
    u_xlat42 = u_xlat3.x * u_xlat42;
    u_xlat16_69 = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat3.x * u_xlat16_69;
    u_xlat44 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_69) + 1.0;
    u_xlat7.z = u_xlat42 * u_xlat44;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 6.10351563e-05);
    u_xlat44 = u_xlat42 / u_xlat44;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat42 = u_xlat42 * u_xlat44;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat42 = u_xlat23.x * u_xlat42;
    u_xlat16_69 = u_xlat3.x * u_xlat3.x;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_74 = u_xlat3.x * u_xlat16_69;
    u_xlat23.x = (-u_xlat16_69) * u_xlat3.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_14.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_11.xyz;
    u_xlat23.x = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * vec3(u_xlat16_74) + u_xlat3.xyw;
    u_xlat3.xyw = vec3(u_xlat42) * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyw;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_35.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_35.xyz = vec3(_occlusionScale) * u_xlat16_35.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat16_35.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_35.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_69));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_35.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_35.xz);
    u_xlat16_19.y = u_xlat16_35.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati3.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_20.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati63 = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_75 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = vec3(u_xlat16_75) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat21.xxx * u_xlat16_13.xyz + u_xlat4.xyz;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_52.x>=0.0);
#else
    u_xlatb3 = u_xlat16_52.x>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb3)) ? u_xlat0.xyw : u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_15.xyz * u_xlat0.xyw;
    u_xlat22.xyz = u_xlat0.wxy * u_xlat16_15.yzx + (-u_xlat22.xyz);
    u_xlat3.xyw = u_xlat0.xyw * u_xlat22.xyz;
    u_xlat0.xyw = u_xlat22.zxy * u_xlat0.ywx + (-u_xlat3.xyw);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat68) + u_xlat0.xyw;
    u_xlat16_75 = u_xlat16_73 * 8.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_75 = abs(u_xlat16_52.x) * u_xlat16_75;
    u_xlat0.xyw = vec3(u_xlat16_75) * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat22.x = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat43 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat43);
    u_xlat16_75 = dot((-u_xlat16_15.xyz), u_xlat0.xyw);
    u_xlat16_75 = u_xlat16_75 + u_xlat16_75;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_75) + (-u_xlat16_15.xyz);
    u_xlat3.xyw = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xyw);
    u_xlat3.xyw = vec3(u_xlat16_73) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyw);
    u_xlat3.xyw = abs(u_xlat16_52.xxx) * u_xlat4.xyz + u_xlat3.xyw;
    u_xlat16_52.x = -abs(u_xlat16_52.x) * 0.800000012 + 1.0;
    u_xlat16_52.x = u_xlat16_14.x * u_xlat16_52.x;
    u_xlat16_52.x = u_xlat16_52.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_52.x);
    u_xlat0.x = dot(u_xlat16_35.xyz, u_xlat0.xyw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_73 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xw);
    u_xlat3.w = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xw);
    u_xlat3.x = u_xlat16_73;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat3.xyw, u_xlat16_52.x);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_13.xyz;
    u_xlat17.y = u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_4.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_4.w);
    u_xlat16_52.x = u_xlat16_69 + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_4.x = u_xlat16_52.x * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_4.x = u_xlat16_69 * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_69 = u_xlat16_14.z * 15.0 + (-u_xlat16_69);
    u_xlat16_52.x = (-u_xlat16_21.x) + u_xlat16_0.x;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x + u_xlat16_21.x;
    u_xlat16_69 = u_xlat16_74 * u_xlat16_69;
    u_xlat0.x = u_xlat22.x * u_xlat16_69;
    u_xlat16_69 = u_xlat0.z * 0.5;
    u_xlat16_52.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_52.x + u_xlat16_69;
    u_xlat16_52.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_73 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73 + u_xlat16_52.x;
    u_xlat16_69 = u_xlat0.z * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_27 = u_xlat16_2.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1);
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat42 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat16_48.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_48.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * abs(vec3(u_xlat42)) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_27;
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
uniform 	mediump vec4 _FlowChangeColorMask_ST;
uniform 	mediump float _UseFlowChangeColor2U;
uniform 	mediump vec2 _FlowChangeColorDirSpeed;
uniform 	mediump vec4 _FlowLightTex_ST;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowChangeColorMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowChangeColorMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
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
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
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
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat16_21;
bool u_xlatb21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
vec2 u_xlat23;
vec3 u_xlat25;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_37;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
float u_xlat44;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_52;
int u_xlati63;
float u_xlat66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
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
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat68 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat16_6.xyz;
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
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat22.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22.x = (-u_xlat1.x) + u_xlat22.x;
    u_xlat0.z = _ShadowBias.y * u_xlat22.x + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_21.z * _shadowStrength;
    u_xlat21.xy = u_xlat16_21.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xy = min(max(u_xlat21.xy, 0.0), 1.0);
#else
    u_xlat21.xy = clamp(u_xlat21.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xy = vec2(_FlowChangeColorDirSpeed.x, _FlowChangeColorDirSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_69 = (-_UseFlowChangeColor2U) + 1.0;
    u_xlat16_10.xy = vec2(u_xlat16_69) * vs_TEXCOORD3.xy;
    u_xlat16_10.xy = vec2(_UseFlowChangeColor2U) * vs_TEXCOORD3.zw + u_xlat16_10.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat16_10.xy;
    u_xlat16_52.xy = u_xlat1.xy * _FlowChangeColorMask_ST.xy + _FlowChangeColorMask_ST.zw;
    u_xlat16_1 = texture(_FlowChangeColorMask, u_xlat16_52.xy).x;
    u_xlat16_22.xyz = texture(_FlowChangeColorMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_22.xyz + (-u_xlat16_2.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_1) * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_69 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_6.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_69 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat2.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb21 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_52.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_52.x = max(u_xlat16_52.x, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb21 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_15.xy = (bool(u_xlatb21)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_73);
    u_xlat16_73 = u_xlat16_52.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_52.x = float(1.0) / float(u_xlat16_52.x);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_52.x = u_xlat16_73 * u_xlat16_52.x;
    u_xlat16_52.x = max(u_xlat16_15.x, u_xlat16_52.x);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x;
    u_xlat16_14.xyz = vec3(u_xlat16_69) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat21.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat21.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_anisoUse2U);
#else
    u_xlatb21 = 0.5<_anisoUse2U;
#endif
    u_xlat21.xy = (bool(u_xlatb21)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat21.xy = u_xlat21.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_21.x = texture(_anisotropicMap, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_21.x * 2.0 + -1.0;
    u_xlat21.x = u_xlat21.x * _sunShift + _sunShiftOffset;
    u_xlat21.x = u_xlat21.x + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb42 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat42 = (u_xlatb42) ? 1.0 : -1.0;
    u_xlat42 = u_xlat42 * vs_TEXCOORD2.w;
    u_xlat22.x = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat22.xyz = (-u_xlat8.yzx) * u_xlat22.xxx + u_xlat7.xyz;
    u_xlat66 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat66);
    u_xlat4.xyz = u_xlat22.yzx * u_xlat8.xyz;
    u_xlat4.xyz = u_xlat8.zxy * u_xlat22.zxy + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat21.xxx * u_xlat8.xyz + u_xlat4.zxy;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat42 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_69 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_52.x = u_xlat16_69 + -1.0;
    u_xlat66 = (-u_xlat16_52.x) + 1.0;
    u_xlat16_14.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_73 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat3.x = u_xlat66 * u_xlat16_73;
    u_xlat3.x = max(u_xlat3.x, 0.00100000005);
    u_xlat2.z = u_xlat42 * u_xlat3.x;
    u_xlat16_74 = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat42 = u_xlat16_69 * u_xlat16_73;
    u_xlat42 = max(u_xlat42, 0.00100000005);
    u_xlat2.y = u_xlat16_74 * u_xlat42;
    u_xlat23.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat2.x;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat16_69) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
    u_xlat17.z = u_xlat44 * u_xlat3.x;
    u_xlat44 = dot(u_xlat22.zxy, u_xlat16_15.xyz);
    u_xlat17.y = u_xlat42 * u_xlat44;
    u_xlat17.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat23.y = u_xlat44 + u_xlat17.x;
    u_xlat23.xy = u_xlat23.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat23.x = u_xlat23.y * u_xlat23.x + 6.10351563e-05;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat7.y = u_xlat42 * u_xlat44;
    u_xlat42 = u_xlat3.x * u_xlat42;
    u_xlat16_69 = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat7.x = u_xlat3.x * u_xlat16_69;
    u_xlat44 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_69 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_69) + 1.0;
    u_xlat7.z = u_xlat42 * u_xlat44;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 6.10351563e-05);
    u_xlat44 = u_xlat42 / u_xlat44;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat42 = u_xlat42 * u_xlat44;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat42 = u_xlat23.x * u_xlat42;
    u_xlat16_69 = u_xlat3.x * u_xlat3.x;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_69 = u_xlat3.x * u_xlat16_69;
    u_xlat16_74 = u_xlat3.x * u_xlat16_69;
    u_xlat23.x = (-u_xlat16_69) * u_xlat3.x + 1.0;
    u_xlat16_11.xyz = u_xlat16_14.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyw = u_xlat23.xxx * u_xlat16_11.xyz;
    u_xlat23.x = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat23.xxx * vec3(u_xlat16_74) + u_xlat3.xyw;
    u_xlat3.xyw = vec3(u_xlat42) * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyw;
    u_xlat2.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_13.xyz;
    u_xlat16_35.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_35.xyz = vec3(_occlusionScale) * u_xlat16_35.xyz + u_xlat8.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat16_35.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_35.xyz;
    u_xlat16_69 = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_69) + u_xlat16_74;
    u_xlat16_75 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_74 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_37.z * u_xlat16_69;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_74;
    u_xlat0.xz = min(u_xlat0.xw, vec2(u_xlat16_69));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_35.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_35.xz);
    u_xlat16_19.y = u_xlat16_35.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati3.xyw = ivec3(uvec3(lessThan(u_xlat16_19.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat16_20.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati63 = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati63].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_20.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz + u_xlat16_13.xyz;
    u_xlat16_75 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = vec3(u_xlat16_75) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat21.xxx * u_xlat16_13.xyz + u_xlat4.xyz;
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_52.x>=0.0);
#else
    u_xlatb3 = u_xlat16_52.x>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb3)) ? u_xlat0.xyw : u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_15.xyz * u_xlat0.xyw;
    u_xlat22.xyz = u_xlat0.wxy * u_xlat16_15.yzx + (-u_xlat22.xyz);
    u_xlat3.xyw = u_xlat0.xyw * u_xlat22.xyz;
    u_xlat0.xyw = u_xlat22.zxy * u_xlat0.ywx + (-u_xlat3.xyw);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat68) + u_xlat0.xyw;
    u_xlat16_75 = u_xlat16_73 * 8.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_73 = max(u_xlat16_73, 0.0078125);
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_75 = abs(u_xlat16_52.x) * u_xlat16_75;
    u_xlat0.xyw = vec3(u_xlat16_75) * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat22.x = dot(u_xlat16_35.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat43 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat43);
    u_xlat16_75 = dot((-u_xlat16_15.xyz), u_xlat0.xyw);
    u_xlat16_75 = u_xlat16_75 + u_xlat16_75;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_75) + (-u_xlat16_15.xyz);
    u_xlat3.xyw = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat0.xyw);
    u_xlat3.xyw = vec3(u_xlat16_73) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat4.xyz = u_xlat0.xyw + (-u_xlat3.xyw);
    u_xlat3.xyw = abs(u_xlat16_52.xxx) * u_xlat4.xyz + u_xlat3.xyw;
    u_xlat16_52.x = -abs(u_xlat16_52.x) * 0.800000012 + 1.0;
    u_xlat16_52.x = u_xlat16_14.x * u_xlat16_52.x;
    u_xlat16_52.x = u_xlat16_52.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_52.x);
    u_xlat0.x = dot(u_xlat16_35.xyz, u_xlat0.xyw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_73 = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xw);
    u_xlat3.w = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xw);
    u_xlat3.x = u_xlat16_73;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat3.xyw, u_xlat16_52.x);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyw * u_xlat0.xyw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_35.xyz = vec3(u_xlat16_69) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_13.xyz;
    u_xlat17.y = u_xlat16_14.x;
    u_xlat16_37.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat17.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_11.xyz;
    u_xlat16_4.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_4.w);
    u_xlat16_52.x = u_xlat16_69 + 1.0;
    u_xlat16_52.x = min(u_xlat16_52.x, 15.0);
    u_xlat16_4.x = u_xlat16_52.x * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_4.x = u_xlat16_69 * 16.0 + u_xlat16_4.z;
    u_xlat16_52.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_52.xy = u_xlat16_52.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_52.xy).x;
    u_xlat16_69 = u_xlat16_14.z * 15.0 + (-u_xlat16_69);
    u_xlat16_52.x = (-u_xlat16_21.x) + u_xlat16_0.x;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_52.x + u_xlat16_21.x;
    u_xlat16_69 = u_xlat16_74 * u_xlat16_69;
    u_xlat0.x = u_xlat22.x * u_xlat16_69;
    u_xlat16_69 = u_xlat0.z * 0.5;
    u_xlat16_52.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_52.x + u_xlat16_69;
    u_xlat16_52.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_73 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73 + u_xlat16_52.x;
    u_xlat16_69 = u_xlat0.z * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_2.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_27 = u_xlat16_2.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1);
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = _FlowLightFactory.yzw * _Time.yyy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat42 = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_10.xy;
    u_xlat16_48.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat16_48.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.xy).x;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_0.x = texture(_FlowLightMask, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * abs(vec3(u_xlat42)) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_27;
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
  GpuProgramID 88356
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_FlowChangeColorGUI"
}