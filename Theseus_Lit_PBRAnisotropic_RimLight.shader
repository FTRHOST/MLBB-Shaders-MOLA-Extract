//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_RimLight" {
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
  GpuProgramID 22005
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_9;
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
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat30;
int u_xlati30;
bool u_xlatb30;
mediump float u_xlat16_33;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_49;
float u_xlat54;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_76;
bool u_xlatb76;
float u_xlat77;
bool u_xlatb77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
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
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat72 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat0.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.5<_anisoUse2U);
#else
    u_xlatb76 = 0.5<_anisoUse2U;
#endif
    u_xlat7.xy = (bool(u_xlatb76)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat7.xy = u_xlat7.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_76 = texture(_anisotropicMap, u_xlat7.xy).x;
    u_xlat76 = u_xlat16_76 * 2.0 + -1.0;
    u_xlat76 = u_xlat76 * _sunShift + _sunShiftOffset;
    u_xlat76 = u_xlat76 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb77 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat77 = (u_xlatb77) ? 1.0 : -1.0;
    u_xlat77 = u_xlat77 * vs_TEXCOORD2.w;
    u_xlat78 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat78) + u_xlat4.xyz;
    u_xlat78 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat78);
    u_xlat7.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat7.xyz;
    u_xlat8.xyz = vec3(u_xlat76) * u_xlat5.xyz + u_xlat7.zxy;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat8.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat78 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_57;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat6.z = u_xlat77 * u_xlat78;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat77 = u_xlat16_1.x * u_xlat16_57;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat6.y = u_xlat16_81 * u_xlat77;
    u_xlat30.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat6.x;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat10.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat54 * u_xlat78;
    u_xlat12.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat77 * u_xlat54;
    u_xlat54 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat30.y = u_xlat54 + u_xlat12.x;
    u_xlat30.xy = u_xlat30.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat30.x = u_xlat30.y * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat13.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat79 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat77 * u_xlat79;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat78 * u_xlat16_81;
    u_xlat79 = dot(u_xlat5.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat82 = u_xlat78 * u_xlat77;
    u_xlat14.z = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = max(u_xlat79, 6.10351563e-05);
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat60 = u_xlat82 * 0.318309873;
    u_xlat79 = u_xlat79 * u_xlat60;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat30.x = u_xlat30.x * u_xlat79;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat16_16.xyz;
    u_xlat79 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat30.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = u_xlat6.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat10.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat30.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat18.xyz = u_xlat30.xxx * u_xlat18.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat77 * u_xlat30.x;
    u_xlat16_25.x = dot(u_xlat4.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_25.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat78 * u_xlat84;
    u_xlat18.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_25.x * u_xlat77;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat30.y * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat30.x = u_xlat30.x * u_xlat84;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat80 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat80);
    u_xlat42.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = u_xlat30.xxx * u_xlat42.xyz;
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
    u_xlatb30 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb30 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb30)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat30.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat10.xyz = u_xlat30.xxx * u_xlat10.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat78 * u_xlat8.x;
    u_xlat13.y = u_xlat77 * u_xlat30.x;
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat10.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat16_1.x * u_xlat77;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat16_17.xyz);
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
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat8.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat30.y * u_xlat77 + 6.10351563e-05;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat30.x;
    u_xlat16_81 = u_xlat78 * u_xlat78;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_83 = u_xlat78 * u_xlat16_81;
    u_xlat30.x = (-u_xlat16_81) * u_xlat78 + 1.0;
    u_xlat30.xyz = u_xlat16_16.xyz * u_xlat30.xxx;
    u_xlat30.xyz = vec3(u_xlat79) * vec3(u_xlat16_83) + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat77) * u_xlat30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xyz = min(max(u_xlat30.xyz, 0.0), 1.0);
#else
    u_xlat30.xyz = clamp(u_xlat30.xyz, 0.0, 1.0);
#endif
    u_xlat30.xyz = u_xlat30.xyz * _directSpecularColor.zxy;
    u_xlat30.xyz = u_xlat8.xxx * u_xlat30.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb77 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb77) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat30.xyz = u_xlat30.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat30.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat5.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_17.xyz = vec3(u_xlat16_73) * u_xlat16_17.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_33 = (-u_xlat16_73) + u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_33 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_73;
    u_xlat16_33 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_33 + -1.0;
    u_xlat16_33 = _occlusionScale * u_xlat16_33 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_33;
    u_xlat77 = min(u_xlat16_73, 1.0);
    u_xlat6.x = min(u_xlat16_3.z, u_xlat77);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat6.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat6.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_33) * u_xlat16_23.xyz;
    u_xlati30 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati30].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati30 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati30].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_81 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * vs_TEXCOORD1.yzx;
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb76 = u_xlat16_74>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb76)) ? u_xlat6.xyz : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat6.xyz);
    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat6.zxy * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_81 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_81 = min(u_xlat16_81, 1.0);
    u_xlat16_81 = abs(u_xlat16_74) * u_xlat16_81;
    u_xlat4.xyz = vec3(u_xlat16_81) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat76 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xxx;
    u_xlat16_81 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_81 = u_xlat16_81 + u_xlat16_81;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_81) + (-u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + u_xlat4.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_74)) * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat72 = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat16_44.y = u_xlat72 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_57;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xzw = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xzw = min(max(u_xlat16_9.xzw, 0.0), 1.0);
#else
    u_xlat16_9.xzw = clamp(u_xlat16_9.xzw, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_0.yzw = u_xlat16_9.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_0.w);
    u_xlat16_74 = u_xlat16_73 + 1.0;
    u_xlat16_74 = min(u_xlat16_74, 15.0);
    u_xlat16_0.x = u_xlat16_74 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_0.x = u_xlat16_73 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_28.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_73 = u_xlat16_9.w * 15.0 + (-u_xlat16_73);
    u_xlat16_74 = (-u_xlat16_28.x) + u_xlat16_4.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat16_33 * u_xlat16_73;
    u_xlat4.x = u_xlat76 * u_xlat16_73;
    u_xlat16_73 = u_xlat77 * 0.5;
    u_xlat16_74 = (-u_xlat77) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat4.x * u_xlat16_74 + u_xlat16_73;
    u_xlat16_74 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_9.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_73 = u_xlat16_73 * u_xlat77;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_3.z);
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
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat4.x = (-_UseFlowLight2U) + 1.0;
    u_xlat4.xy = u_xlat4.xx * vs_TEXCOORD3.xy;
    u_xlat4.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat4.xy;
    u_xlat16_5.xyz = texture(_FlowLightMask, u_xlat4.xy).xyz;
    u_xlat4.xy = _Time.yy * _FlowLightFactory.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat4.xy);
    u_xlat4.xyz = u_xlat16_0.zxy * u_xlat16_5.zxy;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightFactory.xxx;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightColor.zxy + u_xlat16_2.xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_76 = texture(_GlobalEffOutlineTex, u_xlat5.xy).x;
    u_xlat76 = (-u_xlat16_76) + 1.0;
    u_xlat76 = log2(u_xlat76);
    u_xlat76 = u_xlat76 * _FresnelPower;
    u_xlat76 = exp2(u_xlat76);
    u_xlat16_5.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat76) * u_xlat16_5.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.zxy + u_xlat4.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat76 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat4.x = u_xlat4.x * 15.0 + (-u_xlat76);
    u_xlat0.x = u_xlat76 * 0.0625 + u_xlat0.y;
    u_xlat16_28.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_28.xyz) + u_xlat16_5.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16_28.xyz;
    SV_Target0.xyz = u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb4 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1.x : u_xlat16_25.x;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_9;
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
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat30;
int u_xlati30;
bool u_xlatb30;
mediump float u_xlat16_33;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_49;
float u_xlat54;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_76;
bool u_xlatb76;
float u_xlat77;
bool u_xlatb77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
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
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat72 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat0.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.5<_anisoUse2U);
#else
    u_xlatb76 = 0.5<_anisoUse2U;
#endif
    u_xlat7.xy = (bool(u_xlatb76)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat7.xy = u_xlat7.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_76 = texture(_anisotropicMap, u_xlat7.xy).x;
    u_xlat76 = u_xlat16_76 * 2.0 + -1.0;
    u_xlat76 = u_xlat76 * _sunShift + _sunShiftOffset;
    u_xlat76 = u_xlat76 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb77 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat77 = (u_xlatb77) ? 1.0 : -1.0;
    u_xlat77 = u_xlat77 * vs_TEXCOORD2.w;
    u_xlat78 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat78) + u_xlat4.xyz;
    u_xlat78 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat78);
    u_xlat7.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat7.xyz;
    u_xlat8.xyz = vec3(u_xlat76) * u_xlat5.xyz + u_xlat7.zxy;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat8.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat78 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_57;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat6.z = u_xlat77 * u_xlat78;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat77 = u_xlat16_1.x * u_xlat16_57;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat6.y = u_xlat16_81 * u_xlat77;
    u_xlat30.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat6.x;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat10.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat54 * u_xlat78;
    u_xlat12.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat77 * u_xlat54;
    u_xlat54 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat30.y = u_xlat54 + u_xlat12.x;
    u_xlat30.xy = u_xlat30.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat30.x = u_xlat30.y * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat13.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat79 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat77 * u_xlat79;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat78 * u_xlat16_81;
    u_xlat79 = dot(u_xlat5.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat82 = u_xlat78 * u_xlat77;
    u_xlat14.z = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = max(u_xlat79, 6.10351563e-05);
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat60 = u_xlat82 * 0.318309873;
    u_xlat79 = u_xlat79 * u_xlat60;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat30.x = u_xlat30.x * u_xlat79;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_13.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat16_16.xyz;
    u_xlat79 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat30.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = u_xlat6.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat10.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat30.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat18.xyz = u_xlat30.xxx * u_xlat18.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat77 * u_xlat30.x;
    u_xlat16_25.x = dot(u_xlat4.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_25.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat78 * u_xlat84;
    u_xlat18.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_25.x * u_xlat77;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat30.y * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat30.x = u_xlat30.x * u_xlat84;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat80 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat80);
    u_xlat42.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = u_xlat30.xxx * u_xlat42.xyz;
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
    u_xlatb30 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb30 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb30)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat30.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat10.xyz = u_xlat30.xxx * u_xlat10.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat78 * u_xlat8.x;
    u_xlat13.y = u_xlat77 * u_xlat30.x;
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat10.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat16_1.x * u_xlat77;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat16_17.xyz);
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
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat8.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat30.y * u_xlat77 + 6.10351563e-05;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat30.x;
    u_xlat16_81 = u_xlat78 * u_xlat78;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_83 = u_xlat78 * u_xlat16_81;
    u_xlat30.x = (-u_xlat16_81) * u_xlat78 + 1.0;
    u_xlat30.xyz = u_xlat16_16.xyz * u_xlat30.xxx;
    u_xlat30.xyz = vec3(u_xlat79) * vec3(u_xlat16_83) + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat77) * u_xlat30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xyz = min(max(u_xlat30.xyz, 0.0), 1.0);
#else
    u_xlat30.xyz = clamp(u_xlat30.xyz, 0.0, 1.0);
#endif
    u_xlat30.xyz = u_xlat30.xyz * _directSpecularColor.zxy;
    u_xlat30.xyz = u_xlat8.xxx * u_xlat30.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb77 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb77) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat30.xyz = u_xlat30.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat30.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat5.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_17.xyz = vec3(u_xlat16_73) * u_xlat16_17.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_33 = (-u_xlat16_73) + u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_33 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_73;
    u_xlat16_33 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_33 + -1.0;
    u_xlat16_33 = _occlusionScale * u_xlat16_33 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_33;
    u_xlat77 = min(u_xlat16_73, 1.0);
    u_xlat6.x = min(u_xlat16_3.z, u_xlat77);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat6.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat6.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_33) * u_xlat16_23.xyz;
    u_xlati30 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati30].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati30 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati30].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_81 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * vs_TEXCOORD1.yzx;
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb76 = u_xlat16_74>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb76)) ? u_xlat6.xyz : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat6.xyz);
    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat6.zxy * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_81 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_81 = min(u_xlat16_81, 1.0);
    u_xlat16_81 = abs(u_xlat16_74) * u_xlat16_81;
    u_xlat4.xyz = vec3(u_xlat16_81) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat76 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xxx;
    u_xlat16_81 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_81 = u_xlat16_81 + u_xlat16_81;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_81) + (-u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + u_xlat4.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_74)) * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat72 = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat16_44.y = u_xlat72 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_57;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xzw = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xzw = min(max(u_xlat16_9.xzw, 0.0), 1.0);
#else
    u_xlat16_9.xzw = clamp(u_xlat16_9.xzw, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_0.yzw = u_xlat16_9.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_0.w);
    u_xlat16_74 = u_xlat16_73 + 1.0;
    u_xlat16_74 = min(u_xlat16_74, 15.0);
    u_xlat16_0.x = u_xlat16_74 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_0.x = u_xlat16_73 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_28.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_73 = u_xlat16_9.w * 15.0 + (-u_xlat16_73);
    u_xlat16_74 = (-u_xlat16_28.x) + u_xlat16_4.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74 + u_xlat16_28.x;
    u_xlat16_73 = u_xlat16_33 * u_xlat16_73;
    u_xlat4.x = u_xlat76 * u_xlat16_73;
    u_xlat16_73 = u_xlat77 * 0.5;
    u_xlat16_74 = (-u_xlat77) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat4.x * u_xlat16_74 + u_xlat16_73;
    u_xlat16_74 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_9.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_73 = u_xlat16_73 * u_xlat77;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_3.z);
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
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat4.x = (-_UseFlowLight2U) + 1.0;
    u_xlat4.xy = u_xlat4.xx * vs_TEXCOORD3.xy;
    u_xlat4.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat4.xy;
    u_xlat16_5.xyz = texture(_FlowLightMask, u_xlat4.xy).xyz;
    u_xlat4.xy = _Time.yy * _FlowLightFactory.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat4.xy);
    u_xlat4.xyz = u_xlat16_0.zxy * u_xlat16_5.zxy;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightFactory.xxx;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightColor.zxy + u_xlat16_2.xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_76 = texture(_GlobalEffOutlineTex, u_xlat5.xy).x;
    u_xlat76 = (-u_xlat16_76) + 1.0;
    u_xlat76 = log2(u_xlat76);
    u_xlat76 = u_xlat76 * _FresnelPower;
    u_xlat76 = exp2(u_xlat76);
    u_xlat16_5.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat76) * u_xlat16_5.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.zxy + u_xlat4.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat76 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat4.x = u_xlat4.x * 15.0 + (-u_xlat76);
    u_xlat0.x = u_xlat76 * 0.0625 + u_xlat0.y;
    u_xlat16_28.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_28.xyz) + u_xlat16_5.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16_28.xyz;
    SV_Target0.xyz = u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb4 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1.x : u_xlat16_25.x;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
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
vec3 u_xlat39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_59;
float u_xlat69;
mediump float u_xlat16_69;
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
    u_xlat16_23.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _shadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
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
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
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
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_76 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
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
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat28;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat28 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat28;
    u_xlat28 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat10.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat4.x = u_xlat28 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat51 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat15.xyz;
    u_xlat51 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat51;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat51 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_11.x) + 1.0;
    u_xlat77 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat51 * u_xlat77;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = max(u_xlat51, 6.10351563e-05);
    u_xlat51 = u_xlat77 / u_xlat51;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat78 = u_xlat77 * 0.318309873;
    u_xlat51 = u_xlat51 * u_xlat78;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat51;
    u_xlat16_11.x = u_xlat75 * u_xlat75;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat75 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat75 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat16_36.xyz;
    u_xlat73 = u_xlat16_36.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat72 * u_xlat16_11.x;
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
    u_xlat20.z = u_xlat4.x * u_xlat77;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat77 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat78 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat75 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat75;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat28 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat4.x = u_xlat4.x * u_xlat75;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat39.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat39.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.zxy;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat39.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
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
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_21.xyz;
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
    u_xlat15.z = u_xlat72 * u_xlat77;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat77 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat78 * u_xlat72;
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
    u_xlat71 = u_xlat28 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat73) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_19.x, u_xlat16_83);
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
    u_xlat16_76 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_19.xyz;
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
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
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
    u_xlat16_41.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
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
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_7.xyz;
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
    u_xlat16_76 = u_xlat16_15.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_69 = texture(_GlobalEffOutlineTex, u_xlat1.xy).x;
    u_xlat69 = (-u_xlat16_69) + 1.0;
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _FresnelPower;
    u_xlat69 = exp2(u_xlat69);
    u_xlat16_1.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = vec3(u_xlat69) * u_xlat16_1.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _FresnelColor.zxy + u_xlat0.xyz;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump float vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
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
vec3 u_xlat39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_59;
float u_xlat69;
mediump float u_xlat16_69;
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
    u_xlat16_23.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _shadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
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
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
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
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_76 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
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
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat28;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat28 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat28;
    u_xlat28 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat10.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat4.x = u_xlat28 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat51 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat15.xyz;
    u_xlat51 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat51;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat51 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_11.x) + 1.0;
    u_xlat77 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat51 * u_xlat77;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = max(u_xlat51, 6.10351563e-05);
    u_xlat51 = u_xlat77 / u_xlat51;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat78 = u_xlat77 * 0.318309873;
    u_xlat51 = u_xlat51 * u_xlat78;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat51;
    u_xlat16_11.x = u_xlat75 * u_xlat75;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat75 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat75 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.zxy * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat16_36.xyz;
    u_xlat73 = u_xlat16_36.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat72 * u_xlat16_11.x;
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
    u_xlat20.z = u_xlat4.x * u_xlat77;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat77 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat78 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat75 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat75;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat28 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat4.x = u_xlat4.x * u_xlat75;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat39.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat39.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.zxy;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat39.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
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
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_21.xyz;
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
    u_xlat15.z = u_xlat72 * u_xlat77;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat77 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat78 * u_xlat72;
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
    u_xlat71 = u_xlat28 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat73) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.zxy;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_19.x, u_xlat16_83);
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
    u_xlat16_76 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_19.xyz;
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
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
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
    u_xlat16_41.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
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
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_7.xyz;
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
    u_xlat16_76 = u_xlat16_15.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_69 = texture(_GlobalEffOutlineTex, u_xlat1.xy).x;
    u_xlat69 = (-u_xlat16_69) + 1.0;
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _FresnelPower;
    u_xlat69 = exp2(u_xlat69);
    u_xlat16_1.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = vec3(u_xlat69) * u_xlat16_1.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _FresnelColor.zxy + u_xlat0.xyz;
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
UNITY_LOCATION(9) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_9;
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
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump float u_xlat16_28;
vec3 u_xlat30;
int u_xlati30;
bool u_xlatb30;
mediump float u_xlat16_33;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_49;
float u_xlat54;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_76;
bool u_xlatb76;
float u_xlat77;
bool u_xlatb77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
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
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat72 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat0.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.5<_anisoUse2U);
#else
    u_xlatb76 = 0.5<_anisoUse2U;
#endif
    u_xlat7.xy = (bool(u_xlatb76)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat7.xy = u_xlat7.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_76 = texture(_anisotropicMap, u_xlat7.xy).x;
    u_xlat76 = u_xlat16_76 * 2.0 + -1.0;
    u_xlat76 = u_xlat76 * _sunShift + _sunShiftOffset;
    u_xlat76 = u_xlat76 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb77 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat77 = (u_xlatb77) ? 1.0 : -1.0;
    u_xlat77 = u_xlat77 * vs_TEXCOORD2.w;
    u_xlat78 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat78) + u_xlat4.xyz;
    u_xlat78 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat78);
    u_xlat7.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat7.xyz;
    u_xlat8.xyz = vec3(u_xlat76) * u_xlat5.xyz + u_xlat7.zxy;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat8.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat78 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_57;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat6.z = u_xlat77 * u_xlat78;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat77 = u_xlat16_1.x * u_xlat16_57;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat6.y = u_xlat16_81 * u_xlat77;
    u_xlat30.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat6.x;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat10.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat54 * u_xlat78;
    u_xlat12.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat77 * u_xlat54;
    u_xlat54 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat30.y = u_xlat54 + u_xlat12.x;
    u_xlat30.xy = u_xlat30.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat30.x = u_xlat30.y * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat13.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat79 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat77 * u_xlat79;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat78 * u_xlat16_81;
    u_xlat79 = dot(u_xlat5.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat82 = u_xlat78 * u_xlat77;
    u_xlat14.z = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = max(u_xlat79, 6.10351563e-05);
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat60 = u_xlat82 * 0.318309873;
    u_xlat79 = u_xlat79 * u_xlat60;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat30.x = u_xlat30.x * u_xlat79;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat16_16.xyz;
    u_xlat79 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat30.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat6.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat10.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat30.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat18.xyz = u_xlat30.xxx * u_xlat18.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat77 * u_xlat30.x;
    u_xlat16_25.x = dot(u_xlat4.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_25.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat78 * u_xlat84;
    u_xlat18.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_25.x * u_xlat77;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat30.y * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat30.x = u_xlat30.x * u_xlat84;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat80 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat80);
    u_xlat42.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = u_xlat30.xxx * u_xlat42.xyz;
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
    u_xlatb30 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb30 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb30)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat30.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat10.xyz = u_xlat30.xxx * u_xlat10.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat78 * u_xlat8.x;
    u_xlat13.y = u_xlat77 * u_xlat30.x;
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat10.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat16_1.x * u_xlat77;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat16_17.xyz);
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
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat8.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat30.y * u_xlat77 + 6.10351563e-05;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat30.x;
    u_xlat16_81 = u_xlat78 * u_xlat78;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_83 = u_xlat78 * u_xlat16_81;
    u_xlat30.x = (-u_xlat16_81) * u_xlat78 + 1.0;
    u_xlat30.xyz = u_xlat16_16.xyz * u_xlat30.xxx;
    u_xlat30.xyz = vec3(u_xlat79) * vec3(u_xlat16_83) + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat77) * u_xlat30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xyz = min(max(u_xlat30.xyz, 0.0), 1.0);
#else
    u_xlat30.xyz = clamp(u_xlat30.xyz, 0.0, 1.0);
#endif
    u_xlat30.xyz = u_xlat30.xyz * _directSpecularColor.xyz;
    u_xlat30.xyz = u_xlat8.xxx * u_xlat30.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb77 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb77) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat30.xyz = u_xlat30.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat30.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat5.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_17.xyz = vec3(u_xlat16_73) * u_xlat16_17.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_33 = (-u_xlat16_73) + u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_33 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_73;
    u_xlat16_33 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_33 + -1.0;
    u_xlat16_33 = _occlusionScale * u_xlat16_33 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_33;
    u_xlat77 = min(u_xlat16_73, 1.0);
    u_xlat6.x = min(u_xlat16_3.z, u_xlat77);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat6.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat6.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_33) * u_xlat16_23.xyz;
    u_xlati30 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati30].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati30 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati30].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_81 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * vs_TEXCOORD1.yzx;
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb76 = u_xlat16_74>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb76)) ? u_xlat6.xyz : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat6.xyz);
    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat6.zxy * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_81 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_81 = min(u_xlat16_81, 1.0);
    u_xlat16_81 = abs(u_xlat16_74) * u_xlat16_81;
    u_xlat4.xyz = vec3(u_xlat16_81) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat76 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xxx;
    u_xlat16_81 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_81 = u_xlat16_81 + u_xlat16_81;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_81) + (-u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + u_xlat4.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_74)) * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat72 = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat16_44.y = u_xlat72 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_57;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xzw = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xzw = min(max(u_xlat16_9.xzw, 0.0), 1.0);
#else
    u_xlat16_9.xzw = clamp(u_xlat16_9.xzw, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_0.yzw = u_xlat16_9.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_0.w);
    u_xlat16_74 = u_xlat16_73 + 1.0;
    u_xlat16_74 = min(u_xlat16_74, 15.0);
    u_xlat16_0.x = u_xlat16_74 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_0.x = u_xlat16_73 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_73 = u_xlat16_9.w * 15.0 + (-u_xlat16_73);
    u_xlat16_74 = (-u_xlat16_28) + u_xlat16_4.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74 + u_xlat16_28;
    u_xlat16_73 = u_xlat16_33 * u_xlat16_73;
    u_xlat4.x = u_xlat76 * u_xlat16_73;
    u_xlat16_73 = u_xlat77 * 0.5;
    u_xlat16_74 = (-u_xlat77) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat4.x * u_xlat16_74 + u_xlat16_73;
    u_xlat16_74 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_9.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_73 = u_xlat16_73 * u_xlat77;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_3.z);
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
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat4.x = (-_UseFlowLight2U) + 1.0;
    u_xlat4.xy = u_xlat4.xx * vs_TEXCOORD3.xy;
    u_xlat4.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat4.xy;
    u_xlat16_5.xyz = texture(_FlowLightMask, u_xlat4.xy).xyz;
    u_xlat4.xy = _Time.yy * _FlowLightFactory.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat4.xy);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightFactory.xxx;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_76 = texture(_GlobalEffOutlineTex, u_xlat5.xy).x;
    u_xlat76 = (-u_xlat16_76) + 1.0;
    u_xlat76 = log2(u_xlat76);
    u_xlat76 = u_xlat76 * _FresnelPower;
    u_xlat76 = exp2(u_xlat76);
    u_xlat16_5.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat76) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.xyz + u_xlat4.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb4 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1.x : u_xlat16_25.x;
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
UNITY_LOCATION(9) uniform mediump sampler2D _rimLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
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
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_9;
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
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump float u_xlat16_28;
vec3 u_xlat30;
int u_xlati30;
bool u_xlatb30;
mediump float u_xlat16_33;
vec3 u_xlat42;
mediump vec3 u_xlat16_44;
mediump float u_xlat16_49;
float u_xlat54;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_76;
bool u_xlatb76;
float u_xlat77;
bool u_xlatb77;
float u_xlat78;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
float u_xlat82;
mediump float u_xlat16_83;
float u_xlat84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
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
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat72 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat6.x = u_xlat4.x;
    u_xlat6.y = u_xlat5.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat72 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat72 = max(u_xlat72, 1.17549435e-38);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat5.xyz = vec3(u_xlat72) * u_xlat0.xyz;
    u_xlat6.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.5<_anisoUse2U);
#else
    u_xlatb76 = 0.5<_anisoUse2U;
#endif
    u_xlat7.xy = (bool(u_xlatb76)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat7.xy = u_xlat7.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_76 = texture(_anisotropicMap, u_xlat7.xy).x;
    u_xlat76 = u_xlat16_76 * 2.0 + -1.0;
    u_xlat76 = u_xlat76 * _sunShift + _sunShiftOffset;
    u_xlat76 = u_xlat76 + vs_TEXCOORD6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb77 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat77 = (u_xlatb77) ? 1.0 : -1.0;
    u_xlat77 = u_xlat77 * vs_TEXCOORD2.w;
    u_xlat78 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat78) + u_xlat4.xyz;
    u_xlat78 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat78);
    u_xlat7.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat7.xyz;
    u_xlat8.xyz = vec3(u_xlat76) * u_xlat5.xyz + u_xlat7.zxy;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat8.xyz = vec3(u_xlat77) * u_xlat8.xyz;
    u_xlat77 = dot(u_xlat8.xyz, u_xlat16_25.xyz);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_74 = u_xlat16_1.x + -1.0;
    u_xlat78 = (-u_xlat16_74) + 1.0;
    u_xlat16_9.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_57 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat78 = u_xlat78 * u_xlat16_57;
    u_xlat78 = max(u_xlat78, 0.00100000005);
    u_xlat6.z = u_xlat77 * u_xlat78;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat77 = u_xlat16_1.x * u_xlat16_57;
    u_xlat77 = max(u_xlat77, 0.00100000005);
    u_xlat6.y = u_xlat16_81 * u_xlat77;
    u_xlat30.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat6.x;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat10.xyz;
    u_xlat54 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat12.z = u_xlat54 * u_xlat78;
    u_xlat12.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat12.y = u_xlat77 * u_xlat54;
    u_xlat54 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat30.y = u_xlat54 + u_xlat12.x;
    u_xlat30.xy = u_xlat30.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat30.x = u_xlat30.y * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat13.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat79 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat79 = dot(u_xlat8.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat77 * u_xlat79;
    u_xlat16_81 = dot(u_xlat4.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat78 * u_xlat16_81;
    u_xlat79 = dot(u_xlat5.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat16_25.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat82 = u_xlat78 * u_xlat77;
    u_xlat14.z = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = max(u_xlat79, 6.10351563e-05);
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat60 = u_xlat82 * 0.318309873;
    u_xlat79 = u_xlat79 * u_xlat60;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat30.x = u_xlat30.x * u_xlat79;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat79 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_9.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat16_16.xyz;
    u_xlat79 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat30.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat6.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_2.xyz * u_xlat13.xyz;
    u_xlat16_14.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat14.xy = u_xlat16_14.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xy = min(max(u_xlat14.xy, 0.0), 1.0);
#else
    u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * u_xlat14.xxx;
    u_xlat18.xyz = u_xlat10.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat30.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat18.xyz = u_xlat30.xxx * u_xlat18.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat77 * u_xlat30.x;
    u_xlat16_25.x = dot(u_xlat4.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_25.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25.x = min(max(u_xlat16_25.x, 0.0), 1.0);
#else
    u_xlat16_25.x = clamp(u_xlat16_25.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat16_25.x) + 1.0;
    u_xlat19.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat84 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat78 * u_xlat84;
    u_xlat18.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat16_25.x * u_xlat77;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat84 = sqrt(u_xlat84);
    u_xlat84 = u_xlat84 + u_xlat18.x;
    u_xlat84 = u_xlat84 + 6.10351563e-05;
    u_xlat84 = u_xlat30.y * u_xlat84 + 6.10351563e-05;
    u_xlat84 = float(1.0) / u_xlat84;
    u_xlat30.x = u_xlat30.x * u_xlat84;
    u_xlat16_25.x = u_xlat80 * u_xlat80;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_25.x = u_xlat80 * u_xlat16_25.x;
    u_xlat16_49 = u_xlat80 * u_xlat16_25.x;
    u_xlat80 = (-u_xlat16_25.x) * u_xlat80 + 1.0;
    u_xlat42.xyz = u_xlat16_16.xyz * vec3(u_xlat80);
    u_xlat42.xyz = vec3(u_xlat79) * vec3(u_xlat16_49) + u_xlat42.xyz;
    u_xlat42.xyz = u_xlat30.xxx * u_xlat42.xyz;
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
    u_xlatb30 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb30 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_20.xy = (bool(u_xlatb30)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat30.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat10.xyz = u_xlat30.xxx * u_xlat10.xyz;
    u_xlat30.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
    u_xlat8.z = u_xlat78 * u_xlat8.x;
    u_xlat13.y = u_xlat77 * u_xlat30.x;
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat10.xyz);
    u_xlat13.x = u_xlat16_1.x * u_xlat78;
    u_xlat30.x = dot(u_xlat5.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(u_xlat16_17.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_1.x) + 1.0;
    u_xlat13.z = u_xlat30.x * u_xlat82;
    u_xlat30.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat30.x = max(u_xlat30.x, 6.10351563e-05);
    u_xlat30.x = u_xlat82 / u_xlat30.x;
    u_xlat30.x = u_xlat30.x * u_xlat30.x;
    u_xlat30.x = u_xlat60 * u_xlat30.x;
    u_xlat30.x = min(u_xlat30.x, 16.0);
    u_xlat16_1.x = dot(u_xlat4.zxy, u_xlat16_17.xyz);
    u_xlat8.y = u_xlat16_1.x * u_xlat77;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat16_17.xyz);
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
    u_xlat77 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat8.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat77 = u_xlat30.y * u_xlat77 + 6.10351563e-05;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat30.x;
    u_xlat16_81 = u_xlat78 * u_xlat78;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_81 = u_xlat78 * u_xlat16_81;
    u_xlat16_83 = u_xlat78 * u_xlat16_81;
    u_xlat30.x = (-u_xlat16_81) * u_xlat78 + 1.0;
    u_xlat30.xyz = u_xlat16_16.xyz * u_xlat30.xxx;
    u_xlat30.xyz = vec3(u_xlat79) * vec3(u_xlat16_83) + u_xlat30.xyz;
    u_xlat30.xyz = vec3(u_xlat77) * u_xlat30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xyz = min(max(u_xlat30.xyz, 0.0), 1.0);
#else
    u_xlat30.xyz = clamp(u_xlat30.xyz, 0.0, 1.0);
#endif
    u_xlat30.xyz = u_xlat30.xyz * _directSpecularColor.xyz;
    u_xlat30.xyz = u_xlat8.xxx * u_xlat30.xyz;
    u_xlat16_81 = u_xlat16_33 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_33 = float(1.0) / float(u_xlat16_33);
    u_xlat16_81 = (-u_xlat16_81) * u_xlat16_81 + 1.0;
    u_xlat16_81 = max(u_xlat16_81, 0.0);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_33 = u_xlat16_81 * u_xlat16_33;
    u_xlat16_33 = max(u_xlat16_20.x, u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb77 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_81 = (u_xlatb77) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_81);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_33;
    u_xlat16_17.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat30.xyz = u_xlat30.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xyz = u_xlat30.xyz * u_xlat14.yyy + u_xlat16_25.xyz;
    u_xlat16_73 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat14.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat14.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_20.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat8.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat5.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_73 = inversesqrt(u_xlat16_73);
    u_xlat16_17.xyz = vec3(u_xlat16_73) * u_xlat16_17.xyz;
    u_xlat16_73 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_73 * 0.5 + 0.5;
    u_xlat16_33 = (-u_xlat16_73) + u_xlat16_33;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_33 + u_xlat16_73;
    u_xlat16_73 = u_xlat16_44.z * u_xlat16_73;
    u_xlat16_33 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_33 + -1.0;
    u_xlat16_33 = _occlusionScale * u_xlat16_33 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_33;
    u_xlat77 = min(u_xlat16_73, 1.0);
    u_xlat6.x = min(u_xlat16_3.z, u_xlat77);
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat6.xxx * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat6.xxx * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat6.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * u_xlat6.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_22.y = u_xlat16_17.y;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_33) * u_xlat16_23.xyz;
    u_xlati30 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati30].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati30 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati30].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_73 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_2.xyz;
    u_xlat16_81 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * vs_TEXCOORD1.yzx;
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat16_15.xyz + u_xlat7.xyz;
    u_xlat76 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat6.xyz = vec3(u_xlat76) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(u_xlat16_74>=0.0);
#else
    u_xlatb76 = u_xlat16_74>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb76)) ? u_xlat6.xyz : u_xlat4.xyz;
    u_xlat6.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat6.xyz);
    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat4.xyz = u_xlat6.zxy * u_xlat4.yzx + (-u_xlat7.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) * vec3(u_xlat72) + u_xlat4.xyz;
    u_xlat16_81 = u_xlat16_57 * 8.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_81 = min(u_xlat16_81, 1.0);
    u_xlat16_81 = abs(u_xlat16_74) * u_xlat16_81;
    u_xlat4.xyz = vec3(u_xlat16_81) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat76 = dot(u_xlat16_17.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xxx;
    u_xlat16_81 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_81 = u_xlat16_81 + u_xlat16_81;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_81) + (-u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat72) + (-u_xlat4.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + u_xlat4.xyz;
    u_xlat0.xyz = abs(vec3(u_xlat16_74)) * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_74 = -abs(u_xlat16_74) * 0.800000012 + 1.0;
    u_xlat16_74 = u_xlat16_9.x * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_74);
    u_xlat72 = dot(u_xlat16_17.xyz, u_xlat4.xyz);
    u_xlat16_44.y = u_xlat72 * 0.5;
    u_xlat16_57 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_57;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_74);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_73) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_11.xyz;
    u_xlat12.y = u_xlat16_9.x;
    u_xlat16_44.x = u_xlat16_9.x * 1.09769487;
    u_xlat16_9.xzw = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xzw = min(max(u_xlat16_9.xzw, 0.0), 1.0);
#else
    u_xlat16_9.xzw = clamp(u_xlat16_9.xzw, 0.0, 1.0);
#endif
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz;
    u_xlat16_0.yzw = u_xlat16_9.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_73 = floor(u_xlat16_0.w);
    u_xlat16_74 = u_xlat16_73 + 1.0;
    u_xlat16_74 = min(u_xlat16_74, 15.0);
    u_xlat16_0.x = u_xlat16_74 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_0.x = u_xlat16_73 * 16.0 + u_xlat16_0.z;
    u_xlat16_9.xz = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_9.xz = u_xlat16_9.xz * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xz).x;
    u_xlat16_73 = u_xlat16_9.w * 15.0 + (-u_xlat16_73);
    u_xlat16_74 = (-u_xlat16_28) + u_xlat16_4.x;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_74 + u_xlat16_28;
    u_xlat16_73 = u_xlat16_33 * u_xlat16_73;
    u_xlat4.x = u_xlat76 * u_xlat16_73;
    u_xlat16_73 = u_xlat77 * 0.5;
    u_xlat16_74 = (-u_xlat77) * 0.5 + 1.0;
    u_xlat16_73 = u_xlat4.x * u_xlat16_74 + u_xlat16_73;
    u_xlat16_74 = u_xlat16_73 + u_xlat16_73;
    u_xlat16_9.x = (-u_xlat16_73) * 2.0 + 1.0;
    u_xlat16_73 = u_xlat16_73 * u_xlat16_9.x + u_xlat16_74;
    u_xlat16_73 = u_xlat16_73 * u_xlat77;
    u_xlat16_73 = min(u_xlat16_73, u_xlat16_3.z);
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
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + u_xlat16_2.xyz;
    u_xlat4.x = (-_UseFlowLight2U) + 1.0;
    u_xlat4.xy = u_xlat4.xx * vs_TEXCOORD3.xy;
    u_xlat4.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat4.xy;
    u_xlat16_5.xyz = texture(_FlowLightMask, u_xlat4.xy).xyz;
    u_xlat4.xy = _Time.yy * _FlowLightFactory.yz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat4.xy);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightFactory.xxx;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_76 = texture(_GlobalEffOutlineTex, u_xlat5.xy).x;
    u_xlat76 = (-u_xlat16_76) + 1.0;
    u_xlat76 = log2(u_xlat76);
    u_xlat76 = u_xlat76 * _FresnelPower;
    u_xlat76 = exp2(u_xlat76);
    u_xlat16_5.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = vec3(u_xlat76) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FresnelColor.xyz + u_xlat4.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb4 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_1.x : u_xlat16_25.x;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
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
vec3 u_xlat39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_59;
float u_xlat69;
mediump float u_xlat16_69;
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
    u_xlat16_23.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _shadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
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
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
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
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_76 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
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
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat28;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat28 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat28;
    u_xlat28 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat10.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat4.x = u_xlat28 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat51 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat15.xyz;
    u_xlat51 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat51;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat51 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_11.x) + 1.0;
    u_xlat77 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat51 * u_xlat77;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = max(u_xlat51, 6.10351563e-05);
    u_xlat51 = u_xlat77 / u_xlat51;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat78 = u_xlat77 * 0.318309873;
    u_xlat51 = u_xlat51 * u_xlat78;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat51;
    u_xlat16_11.x = u_xlat75 * u_xlat75;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat75 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat75 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat16_36.xyz;
    u_xlat73 = u_xlat16_36.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat72 * u_xlat16_11.x;
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
    u_xlat20.z = u_xlat4.x * u_xlat77;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat77 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat78 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat75 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat75;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat28 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat4.x = u_xlat4.x * u_xlat75;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat39.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat39.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.xyz;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat39.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
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
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_21.xyz;
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
    u_xlat15.z = u_xlat72 * u_xlat77;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat77 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat78 * u_xlat72;
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
    u_xlat71 = u_xlat28 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat73) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_19.x, u_xlat16_83);
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
    u_xlat16_76 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_19.xyz;
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
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
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
    u_xlat16_41.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
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
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_7.xyz;
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
    u_xlat16_76 = u_xlat16_15.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_69 = texture(_GlobalEffOutlineTex, u_xlat1.xy).x;
    u_xlat69 = (-u_xlat16_69) + 1.0;
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _FresnelPower;
    u_xlat69 = exp2(u_xlat69);
    u_xlat16_1.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = vec3(u_xlat69) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _FresnelColor.xyz + u_xlat0.xyz;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
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
vec3 u_xlat39;
mediump vec3 u_xlat16_41;
mediump float u_xlat16_46;
int u_xlati46;
float u_xlat47;
float u_xlat51;
mediump float u_xlat16_59;
float u_xlat69;
mediump float u_xlat16_69;
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
    u_xlat16_23.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_23.z * _shadowStrength;
    u_xlat23.xy = u_xlat16_23.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xy = min(max(u_xlat23.xy, 0.0), 1.0);
#else
    u_xlat23.xy = clamp(u_xlat23.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
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
    u_xlat1.xy = u_xlat1.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_1.x = texture(_anisotropicMap, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat1.x = u_xlat1.x * _sunShift + _sunShiftOffset;
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
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_76 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_4.zz);
    u_xlat16_80 = u_xlat16_76 + -1.0;
    u_xlat72 = (-u_xlat16_80) + 1.0;
    u_xlat16_13.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
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
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_76 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_76 = inversesqrt(u_xlat16_76);
    u_xlat16_14.xyz = vec3(u_xlat16_76) * u_xlat8.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat16_14.xyz);
    u_xlat10.z = u_xlat72 * u_xlat28;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat28 = dot(u_xlat2.zxy, u_xlat16_14.xyz);
    u_xlat10.y = u_xlat71 * u_xlat28;
    u_xlat28 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat10.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat4.x = u_xlat28 * u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + u_xlat16_11.xyz;
    u_xlat51 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat15.xyz;
    u_xlat51 = dot(u_xlat3.xyz, u_xlat15.xyz);
    u_xlat16.y = u_xlat71 * u_xlat51;
    u_xlat16_59 = dot(u_xlat2.zxy, u_xlat15.xyz);
    u_xlat16.x = u_xlat72 * u_xlat16_59;
    u_xlat51 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_11.x) + 1.0;
    u_xlat77 = u_xlat72 * u_xlat71;
    u_xlat16.z = u_xlat51 * u_xlat77;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = max(u_xlat51, 6.10351563e-05);
    u_xlat51 = u_xlat77 / u_xlat51;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat78 = u_xlat77 * 0.318309873;
    u_xlat51 = u_xlat51 * u_xlat78;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat4.x = u_xlat4.x * u_xlat51;
    u_xlat16_11.x = u_xlat75 * u_xlat75;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat75 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat75 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat75 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat16_4.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_36.xyz = u_xlat16_13.yyy * u_xlat16_19.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat15.xyz = vec3(u_xlat51) * u_xlat16_36.xyz;
    u_xlat73 = u_xlat16_36.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat15.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat15.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = u_xlat5.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat23.xxx * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat16_76) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat16.xyz = u_xlat4.xxx * u_xlat16.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16.xyz);
    u_xlat20.y = u_xlat71 * u_xlat4.x;
    u_xlat16_11.x = dot(u_xlat2.zxy, u_xlat16.xyz);
    u_xlat20.x = u_xlat72 * u_xlat16_11.x;
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
    u_xlat20.z = u_xlat4.x * u_xlat77;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat77 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat78 * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat75 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.z = u_xlat72 * u_xlat75;
    u_xlat16.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(u_xlat2.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16.y = u_xlat71 * u_xlat16_11.x;
    u_xlat75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat16.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat75 = u_xlat28 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat4.x = u_xlat4.x * u_xlat75;
    u_xlat16_11.x = u_xlat51 * u_xlat51;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat51 * u_xlat16_11.x;
    u_xlat16_34.x = u_xlat51 * u_xlat16_11.x;
    u_xlat51 = (-u_xlat16_11.x) * u_xlat51 + 1.0;
    u_xlat39.xyz = u_xlat16_36.xyz * vec3(u_xlat51);
    u_xlat39.xyz = vec3(u_xlat73) * u_xlat16_34.xxx + u_xlat39.xyz;
    u_xlat39.xyz = u_xlat4.xxx * u_xlat39.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat39.xyz = min(max(u_xlat39.xyz, 0.0), 1.0);
#else
    u_xlat39.xyz = clamp(u_xlat39.xyz, 0.0, 1.0);
#endif
    u_xlat39.xyz = u_xlat39.xyz * _directSpecularColor.xyz;
    u_xlat39.xyz = u_xlat16.xxx * u_xlat39.xyz;
    u_xlat39.xyz = u_xlat39.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat39.xyz * u_xlat16_7.xyz + u_xlat15.xyz;
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
    u_xlat16_19.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_21.xyz;
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
    u_xlat15.z = u_xlat72 * u_xlat77;
    u_xlat72 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat77 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat78 * u_xlat72;
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
    u_xlat71 = u_xlat28 * u_xlat71 + 6.10351563e-05;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_86 = u_xlat4.x * u_xlat4.x;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_86 = u_xlat4.x * u_xlat16_86;
    u_xlat16_18.x = u_xlat4.x * u_xlat16_86;
    u_xlat26.x = (-u_xlat16_86) * u_xlat4.x + 1.0;
    u_xlat26.xyz = u_xlat16_36.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat73) * u_xlat16_18.xxx + u_xlat26.xyz;
    u_xlat26.xyz = vec3(u_xlat71) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat26.xyz = u_xlat3.xxx * u_xlat26.xyz;
    u_xlat16_86 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = float(1.0) / float(u_xlat16_83);
    u_xlat16_86 = (-u_xlat16_86) * u_xlat16_86 + 1.0;
    u_xlat16_86 = max(u_xlat16_86, 0.0);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_86;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_86;
    u_xlat16_83 = max(u_xlat16_19.x, u_xlat16_83);
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
    u_xlat16_76 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_76) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_19.xyz;
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
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat9.xyz;
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
    u_xlat16_41.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_83 + u_xlat16_76;
    u_xlat16_76 = u_xlat16_41.z * u_xlat16_76;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_76 = u_xlat16_76 * u_xlat16_83;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_76));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
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
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_7.xyz;
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
    u_xlat16_76 = u_xlat16_15.w * _AlbedoColor.w + u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_15.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_34.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_34.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_34.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_69 = texture(_GlobalEffOutlineTex, u_xlat1.xy).x;
    u_xlat69 = (-u_xlat16_69) + 1.0;
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _FresnelPower;
    u_xlat69 = exp2(u_xlat69);
    u_xlat16_1.xyz = texture(_rimLightMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = vec3(u_xlat69) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _FresnelColor.xyz + u_xlat0.xyz;
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
  GpuProgramID 81816
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