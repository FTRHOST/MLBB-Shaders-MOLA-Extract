//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_FlowTexture" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

_alphatomask ("AlphaToCoverage", Float) = 0.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Tex] _FlowTextureMask ("流动纹理区域", 2D) = "black" { }

[Tex] _FlowAlbedoMap ("流动Albedo贴图", 2D) = "white" { }

[Tex] _FlowMaterialParamsMap ("流动RMO贴图", 2D) = "white" { }

[Tex] _FlowNormalMap ("流动法线贴图", 2D) = "bump" { }

[Tex] _FlowLightMap ("流动流光贴图", 2D) = "black" { }

_FlowLightColor ("流动流光颜色", Color) = (0,0,0,1)

_FlowTextureFactory ("流动纹理参数", Vector) = (1,1,1,1)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

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
  GpuProgramID 59817
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
mediump float u_xlat16_27;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat52;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
float u_xlat66;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat61 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat61>=(-u_xlat61));
#else
    u_xlatb5 = u_xlat61>=(-u_xlat61);
#endif
    u_xlat61 = fract(abs(u_xlat61));
    u_xlat61 = (u_xlatb5) ? u_xlat61 : (-u_xlat61);
    u_xlat61 = u_xlat61 * 1000.0;
    u_xlat5.xy = vec2(u_xlat61) * _FlowTextureFactory.zw;
    u_xlat5.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat5.xy;
    u_xlat16_6.xyz = texture(_FlowAlbedoMap, u_xlat5.xy).xyz;
    u_xlat16_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_6.zxy + (-u_xlat16_7.zxy);
    u_xlat16_61 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_61) * u_xlat16_22.xyz + u_xlat16_7.zxy;
    u_xlat16_8.xyz = u_xlat16_22.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_FlowMaterialParamsMap, u_xlat5.xy);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6 = u_xlat16_6 + (-u_xlat16_9);
    u_xlat16_6 = vec4(u_xlat16_61) * u_xlat16_6 + u_xlat16_9;
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_10.xyz;
    u_xlat57 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat7.xyz;
    u_xlat16_9.xyz = texture(_FlowNormalMap, u_xlat5.xy).xyz;
    u_xlat16_5.xyz = texture(_FlowLightMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_61) * u_xlat16_5.zxy;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat14.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat5.x = dot(u_xlat16_12.xyz, u_xlat5.xyz);
    u_xlat14.x = u_xlat9.y;
    u_xlat9.y = u_xlat14.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_12.xyz, u_xlat9.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_12.xyz, u_xlat14.xyz);
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat66 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat66 = u_xlat62 * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat62 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat52 = u_xlat14.x * u_xlat52 + u_xlat16_20.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat14.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat52;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat4.xxx * u_xlat7.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat66) * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat23 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_20.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat71 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat71 * u_xlat71;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_58 = u_xlat71 * u_xlat16_39;
    u_xlat71 = (-u_xlat16_39) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat15.xyz;
    u_xlat71 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat71) * u_xlat16_20.x + u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat72 + u_xlat16_20.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat71 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat52 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat71) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat7.xyz = u_xlat16_10.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat7.xyz;
    u_xlat23 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat7.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat7.x = u_xlat23 * u_xlat7.x + u_xlat16_20.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat23 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat7.x = u_xlat7.x * u_xlat52;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat9.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_59) + u_xlat16_60;
    u_xlat16_27 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_27 + 1.0;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_60 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_59;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_6.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_12.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat9.xyz) * u_xlat16_2.xxx + (-u_xlat16_12.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_9.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_9.x = u_xlat16_21.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_9.x = u_xlat16_2.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_6.z);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_8.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_3.yzx + u_xlat16_13.yzx;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_7.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_7.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * _FlowLightColor.zxy + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat3.x = u_xlat57 * 0.0625 + u_xlat3.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_19.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
mediump float u_xlat16_27;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat52;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
float u_xlat66;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat61 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat61>=(-u_xlat61));
#else
    u_xlatb5 = u_xlat61>=(-u_xlat61);
#endif
    u_xlat61 = fract(abs(u_xlat61));
    u_xlat61 = (u_xlatb5) ? u_xlat61 : (-u_xlat61);
    u_xlat61 = u_xlat61 * 1000.0;
    u_xlat5.xy = vec2(u_xlat61) * _FlowTextureFactory.zw;
    u_xlat5.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat5.xy;
    u_xlat16_6.xyz = texture(_FlowAlbedoMap, u_xlat5.xy).xyz;
    u_xlat16_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_6.zxy + (-u_xlat16_7.zxy);
    u_xlat16_61 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_61) * u_xlat16_22.xyz + u_xlat16_7.zxy;
    u_xlat16_8.xyz = u_xlat16_22.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_FlowMaterialParamsMap, u_xlat5.xy);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6 = u_xlat16_6 + (-u_xlat16_9);
    u_xlat16_6 = vec4(u_xlat16_61) * u_xlat16_6 + u_xlat16_9;
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_10.xyz;
    u_xlat57 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat7.xyz;
    u_xlat16_9.xyz = texture(_FlowNormalMap, u_xlat5.xy).xyz;
    u_xlat16_5.xyz = texture(_FlowLightMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_61) * u_xlat16_5.zxy;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat14.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat5.x = dot(u_xlat16_12.xyz, u_xlat5.xyz);
    u_xlat14.x = u_xlat9.y;
    u_xlat9.y = u_xlat14.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_12.xyz, u_xlat9.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_12.xyz, u_xlat14.xyz);
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat66 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat66 = u_xlat62 * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat62 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat52 = u_xlat14.x * u_xlat52 + u_xlat16_20.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat14.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat52;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat4.xxx * u_xlat7.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat66) * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat23 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_20.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat71 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat71 * u_xlat71;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_58 = u_xlat71 * u_xlat16_39;
    u_xlat71 = (-u_xlat16_39) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat15.xyz;
    u_xlat71 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat71) * u_xlat16_20.x + u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat72 + u_xlat16_20.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat71 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat52 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat71) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat7.xyz = u_xlat16_10.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat7.xyz;
    u_xlat23 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat7.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat7.x = u_xlat23 * u_xlat7.x + u_xlat16_20.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat23 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat7.x = u_xlat7.x * u_xlat52;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat9.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_59) + u_xlat16_60;
    u_xlat16_27 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_27 + 1.0;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_60 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_59;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_6.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_12.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat9.xyz) * u_xlat16_2.xxx + (-u_xlat16_12.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_9.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_9.x = u_xlat16_21.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_9.x = u_xlat16_2.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_6.z);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_8.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_3.yzx + u_xlat16_13.yzx;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_7.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_7.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * _FlowLightColor.zxy + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
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
    u_xlat57 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat3.x = u_xlat57 * 0.0625 + u_xlat3.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_19.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(15) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat24;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_40;
int u_xlati40;
float u_xlat41;
float u_xlat44;
float u_xlat49;
float u_xlat60;
float u_xlat61;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
bool u_xlatb67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat65 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(u_xlat65>=(-u_xlat65));
#else
    u_xlatb67 = u_xlat65>=(-u_xlat65);
#endif
    u_xlat65 = fract(abs(u_xlat65));
    u_xlat65 = (u_xlatb67) ? u_xlat65 : (-u_xlat65);
    u_xlat65 = u_xlat65 * 1000.0;
    u_xlat9.xy = vec2(u_xlat65) * _FlowTextureFactory.zw;
    u_xlat9.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat9.xy;
    u_xlat16_10.xyz = texture(_FlowNormalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_11.xyz);
    u_xlat16_65 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = vec3(u_xlat16_65) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat27.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat24.x = dot(u_xlat27.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat27.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_11.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat27.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat22.x = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat22.x = (-u_xlat16_11.x) * u_xlat22.x + 1.0;
    u_xlat16_3.xyz = texture(_FlowAlbedoMap, u_xlat9.xy).xyz;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_3.zxy + (-u_xlat16_4.zxy);
    u_xlat16_11.xzw = vec3(u_xlat16_65) * u_xlat16_11.xzw + u_xlat16_4.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_3 = texture(_FlowMaterialParamsMap, u_xlat9.xy);
    u_xlat16_4.xyz = texture(_FlowLightMap, u_xlat9.xy).xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_65) * u_xlat16_4.zxy;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_8);
    u_xlat16_3 = vec4(u_xlat16_65) * u_xlat16_3 + u_xlat16_8;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat4.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat4.xxx * u_xlat16_31.xxx + u_xlat22.xyz;
    u_xlat16_31.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat61) * u_xlat16_31.x + u_xlat61;
    u_xlat24.x = u_xlat61 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat61 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat9.x = dot(u_xlat27.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat9.x) * u_xlat16_31.x + u_xlat9.x;
    u_xlat44 = u_xlat9.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat24.y = u_xlat44 + u_xlat9.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat65 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat65 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat20.xxx * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat27.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat65 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat24.x = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat24.x * u_xlat24.x;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_73 = u_xlat24.x * u_xlat16_72;
    u_xlat24.x = (-u_xlat16_72) * u_xlat24.x + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat24.xxx;
    u_xlat10.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat10.xyz;
    u_xlat24.x = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat49 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat49 = u_xlat24.x * u_xlat49 + u_xlat16_31.x;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat24.x + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat24.y * u_xlat49;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat62 = u_xlat62 * u_xlat49;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat10.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat65 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_31.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat21.x * u_xlat21.x;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_73 = u_xlat21.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat21.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat21.xxx;
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat21.x = dot(u_xlat27.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat41 = (-u_xlat21.x) * u_xlat16_31.x + u_xlat21.x;
    u_xlat41 = u_xlat21.x * u_xlat41 + u_xlat16_31.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat41 + u_xlat21.x;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat41 = u_xlat41 * u_xlat24.y;
    u_xlat1.z = float(1.0) / u_xlat41;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_18.x, u_xlat16_72);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_73);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat2.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_66) * u_xlat16_11.xzw;
    u_xlat16_18.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat61) * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat24.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_17.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.yyy * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat21.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = (-u_xlat5.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat27.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat27.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat27.xyz) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_11.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_31.xxx * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat12.y = u_xlat0.z;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_31.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_31.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_2.w);
    u_xlat16_11.x = u_xlat16_66 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_66 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_66 = u_xlat16_11.w * 15.0 + (-u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_40) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x + u_xlat16_40;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat1.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_11.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_31.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_31.x + u_xlat16_11.x;
    u_xlat16_66 = u_xlat0.y * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_3.z, u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_14.yzx + u_xlat16_16.yzx;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_4.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _FlowLightColor.zxy + u_xlat16_6.xyz;
    u_xlat16_31.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_31.xyz + u_xlat16_6.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_11.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(15) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat24;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_40;
int u_xlati40;
float u_xlat41;
float u_xlat44;
float u_xlat49;
float u_xlat60;
float u_xlat61;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
bool u_xlatb67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat65 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(u_xlat65>=(-u_xlat65));
#else
    u_xlatb67 = u_xlat65>=(-u_xlat65);
#endif
    u_xlat65 = fract(abs(u_xlat65));
    u_xlat65 = (u_xlatb67) ? u_xlat65 : (-u_xlat65);
    u_xlat65 = u_xlat65 * 1000.0;
    u_xlat9.xy = vec2(u_xlat65) * _FlowTextureFactory.zw;
    u_xlat9.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat9.xy;
    u_xlat16_10.xyz = texture(_FlowNormalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_11.xyz);
    u_xlat16_65 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = vec3(u_xlat16_65) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat27.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat24.x = dot(u_xlat27.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat27.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_11.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat27.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat22.x = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat22.x = (-u_xlat16_11.x) * u_xlat22.x + 1.0;
    u_xlat16_3.xyz = texture(_FlowAlbedoMap, u_xlat9.xy).xyz;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_3.zxy + (-u_xlat16_4.zxy);
    u_xlat16_11.xzw = vec3(u_xlat16_65) * u_xlat16_11.xzw + u_xlat16_4.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_3 = texture(_FlowMaterialParamsMap, u_xlat9.xy);
    u_xlat16_4.xyz = texture(_FlowLightMap, u_xlat9.xy).xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_65) * u_xlat16_4.zxy;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_8);
    u_xlat16_3 = vec4(u_xlat16_65) * u_xlat16_3 + u_xlat16_8;
    u_xlat16_14.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat4.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat4.xxx * u_xlat16_31.xxx + u_xlat22.xyz;
    u_xlat16_31.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat61) * u_xlat16_31.x + u_xlat61;
    u_xlat24.x = u_xlat61 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat61 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat9.x = dot(u_xlat27.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat9.x) * u_xlat16_31.x + u_xlat9.x;
    u_xlat44 = u_xlat9.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat24.y = u_xlat44 + u_xlat9.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat65 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat65 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat20.xxx * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat27.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat65 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat24.x = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat24.x * u_xlat24.x;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_73 = u_xlat24.x * u_xlat16_72;
    u_xlat24.x = (-u_xlat16_72) * u_xlat24.x + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat24.xxx;
    u_xlat10.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat10.xyz;
    u_xlat24.x = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat49 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat49 = u_xlat24.x * u_xlat49 + u_xlat16_31.x;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat24.x + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat24.y * u_xlat49;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat62 = u_xlat62 * u_xlat49;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat10.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat65 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_31.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat21.x * u_xlat21.x;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_73 = u_xlat21.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat21.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat21.xxx;
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat21.x = dot(u_xlat27.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat41 = (-u_xlat21.x) * u_xlat16_31.x + u_xlat21.x;
    u_xlat41 = u_xlat21.x * u_xlat41 + u_xlat16_31.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat41 + u_xlat21.x;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat41 = u_xlat41 * u_xlat24.y;
    u_xlat1.z = float(1.0) / u_xlat41;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_18.x, u_xlat16_72);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_73);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat2.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_66) * u_xlat16_11.xzw;
    u_xlat16_18.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat61) * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat24.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_17.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.yyy * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat21.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = (-u_xlat5.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat27.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat27.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat27.xyz) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_11.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_31.xxx * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat12.y = u_xlat0.z;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_31.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_31.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_2.w);
    u_xlat16_11.x = u_xlat16_66 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_66 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_66 = u_xlat16_11.w * 15.0 + (-u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_40) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x + u_xlat16_40;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat1.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_11.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_31.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_31.x + u_xlat16_11.x;
    u_xlat16_66 = u_xlat0.y * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_3.z, u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_14.yzx + u_xlat16_16.yzx;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_4.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _FlowLightColor.zxy + u_xlat16_6.xyz;
    u_xlat16_31.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_31.xyz + u_xlat16_6.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_11.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
mediump float u_xlat16_27;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat52;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
float u_xlat66;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat61 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat61>=(-u_xlat61));
#else
    u_xlatb5 = u_xlat61>=(-u_xlat61);
#endif
    u_xlat61 = fract(abs(u_xlat61));
    u_xlat61 = (u_xlatb5) ? u_xlat61 : (-u_xlat61);
    u_xlat61 = u_xlat61 * 1000.0;
    u_xlat5.xy = vec2(u_xlat61) * _FlowTextureFactory.zw;
    u_xlat5.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat5.xy;
    u_xlat16_6.xyz = texture(_FlowAlbedoMap, u_xlat5.xy).xyz;
    u_xlat16_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_61 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_61) * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_8.xyz = u_xlat16_22.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_FlowMaterialParamsMap, u_xlat5.xy);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6 = u_xlat16_6 + (-u_xlat16_9);
    u_xlat16_6 = vec4(u_xlat16_61) * u_xlat16_6 + u_xlat16_9;
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_10.xyz;
    u_xlat57 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat7.xyz;
    u_xlat16_9.xyz = texture(_FlowNormalMap, u_xlat5.xy).xyz;
    u_xlat16_5.xyz = texture(_FlowLightMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_61) * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat14.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat5.x = dot(u_xlat16_12.xyz, u_xlat5.xyz);
    u_xlat14.x = u_xlat9.y;
    u_xlat9.y = u_xlat14.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_12.xyz, u_xlat9.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_12.xyz, u_xlat14.xyz);
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat66 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat66 = u_xlat62 * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat62 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat52 = u_xlat14.x * u_xlat52 + u_xlat16_20.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat14.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat52;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat4.xxx * u_xlat7.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat66) * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat23 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_20.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat71 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat71 * u_xlat71;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_58 = u_xlat71 * u_xlat16_39;
    u_xlat71 = (-u_xlat16_39) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat15.xyz;
    u_xlat71 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat71) * u_xlat16_20.x + u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat72 + u_xlat16_20.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat71 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat52 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat71) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat7.xyz = u_xlat16_10.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat7.xyz;
    u_xlat23 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat7.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat7.x = u_xlat23 * u_xlat7.x + u_xlat16_20.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat23 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat7.x = u_xlat7.x * u_xlat52;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat9.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_59) + u_xlat16_60;
    u_xlat16_27 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_27 + 1.0;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_60 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_59;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_6.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_12.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat9.xyz) * u_xlat16_2.xxx + (-u_xlat16_12.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_9.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_9.x = u_xlat16_21.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_9.x = u_xlat16_2.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_6.z);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_8.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_13.xyz;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_7.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_7.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
ivec3 u_xlati19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
mediump float u_xlat16_27;
int u_xlati38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat52;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
float u_xlat62;
float u_xlat66;
float u_xlat71;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_20.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20.x = (-u_xlat16_20.x) * u_xlat16_20.x + 1.0;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_39 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_20.x * u_xlat16_39;
    u_xlat16_20.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_20.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_20.x);
#endif
    u_xlat16_20.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_20.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_2.xyz * u_xlat16_20.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
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
    u_xlat16_21.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_20.xyz;
    u_xlat57 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat4.xyz;
    u_xlat16_59 = dot(u_xlat16_20.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_59) + 1.0;
    u_xlat16_59 = u_xlat57 * u_xlat57;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_59 = u_xlat57 * u_xlat16_59;
    u_xlat16_3.x = u_xlat57 * u_xlat16_59;
    u_xlat57 = (-u_xlat16_59) * u_xlat57 + 1.0;
    u_xlat61 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat61>=(-u_xlat61));
#else
    u_xlatb5 = u_xlat61>=(-u_xlat61);
#endif
    u_xlat61 = fract(abs(u_xlat61));
    u_xlat61 = (u_xlatb5) ? u_xlat61 : (-u_xlat61);
    u_xlat61 = u_xlat61 * 1000.0;
    u_xlat5.xy = vec2(u_xlat61) * _FlowTextureFactory.zw;
    u_xlat5.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat5.xy;
    u_xlat16_6.xyz = texture(_FlowAlbedoMap, u_xlat5.xy).xyz;
    u_xlat16_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_22.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_61 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_22.xyz = vec3(u_xlat16_61) * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_8.xyz = u_xlat16_22.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_FlowMaterialParamsMap, u_xlat5.xy);
    u_xlat16_9 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6 = u_xlat16_6 + (-u_xlat16_9);
    u_xlat16_6 = vec4(u_xlat16_61) * u_xlat16_6 + u_xlat16_9;
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_8.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_10.xyz;
    u_xlat57 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat7.xyz;
    u_xlat16_9.xyz = texture(_FlowNormalMap, u_xlat5.xy).xyz;
    u_xlat16_5.xyz = texture(_FlowLightMap, u_xlat5.xy).xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_61) * u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_13.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat14.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat5.x = dot(u_xlat16_12.xyz, u_xlat5.xyz);
    u_xlat14.x = u_xlat9.y;
    u_xlat9.y = u_xlat14.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_12.xyz, u_xlat9.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_12.xyz, u_xlat14.xyz);
    u_xlat61 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat66 = (-u_xlat62) * u_xlat16_20.x + u_xlat62;
    u_xlat66 = u_xlat62 * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat62 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat14.x) * u_xlat16_20.x + u_xlat14.x;
    u_xlat52 = u_xlat14.x * u_xlat52 + u_xlat16_20.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat14.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat52;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat23 = u_xlat16_20.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat23 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_20.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat4.xxx * u_xlat7.xyz;
    u_xlat15.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat66) * u_xlat15.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat23 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_20.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat71 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat71 * u_xlat71;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_39 = u_xlat71 * u_xlat16_39;
    u_xlat16_58 = u_xlat71 * u_xlat16_39;
    u_xlat71 = (-u_xlat16_39) * u_xlat71 + 1.0;
    u_xlat15.xyz = u_xlat16_10.xyz * vec3(u_xlat71);
    u_xlat15.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat15.xyz;
    u_xlat71 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat71) * u_xlat16_20.x + u_xlat71;
    u_xlat72 = u_xlat71 * u_xlat72 + u_xlat16_20.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat71 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat52 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat71) * u_xlat15.xyz;
    u_xlat16_13.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat7.xyz;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat23 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_20.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat19.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat19.x * u_xlat19.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat16_58 = u_xlat19.x * u_xlat16_1.x;
    u_xlat19.x = (-u_xlat16_1.x) * u_xlat19.x + 1.0;
    u_xlat7.xyz = u_xlat16_10.xyz * u_xlat19.xxx;
    u_xlat19.xyz = vec3(u_xlat57) * vec3(u_xlat16_58) + u_xlat7.xyz;
    u_xlat23 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat7.x = (-u_xlat23) * u_xlat16_20.x + u_xlat23;
    u_xlat7.x = u_xlat23 * u_xlat7.x + u_xlat16_20.x;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat23 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 6.10351563e-05;
    u_xlat7.x = u_xlat7.x * u_xlat52;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.xyz = u_xlat19.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz;
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_39 = float(1.0) / float(u_xlat16_39);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_39 = max(u_xlat16_17.x, u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_58 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_58, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xzw;
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat4.zzz + u_xlat16_13.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat23) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_13.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat5.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat9.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_59) + u_xlat16_60;
    u_xlat16_27 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_27 + 1.0;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_60 + u_xlat16_59;
    u_xlat16_59 = u_xlat16_8.w * u_xlat16_59;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _occlusionScale * u_xlat16_60 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_60;
    u_xlat0.x = min(u_xlat16_59, 1.0);
    u_xlat19.x = min(u_xlat0.x, u_xlat16_6.z);
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat19.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat19.xxx * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat19.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati19.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati19.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati19.x = int(uint(uint(u_xlati19.x) & 1u));
    u_xlati38 = (u_xlati19.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati19.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_12.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat19.xyz = (-u_xlat9.xyz) * u_xlat16_2.xxx + (-u_xlat16_12.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat19.xyz);
    u_xlat16_2.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_9.w);
    u_xlat16_21.x = u_xlat16_2.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_9.x = u_xlat16_21.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_9.x = u_xlat16_2.x * 16.0 + u_xlat16_9.z;
    u_xlat16_3.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_21.x = (-u_xlat16_42) + u_xlat16_23;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_21.x + u_xlat16_42;
    u_xlat16_2.x = u_xlat16_60 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_2.x;
    u_xlat16_21.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_40 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_40 + u_xlat16_21.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_6.z);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat0.xyz = u_xlat16_20.xxx * u_xlat4.xyz + u_xlat19.xyz;
    u_xlat16_20.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_21.xyz = vec3(u_xlat16_59) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_21.xyz : u_xlat16_8.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_21.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_13.xyz;
    u_xlat16_58 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_7.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_7.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_2.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat24;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_40;
int u_xlati40;
float u_xlat41;
float u_xlat44;
float u_xlat49;
float u_xlat61;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
bool u_xlatb67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat65 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(u_xlat65>=(-u_xlat65));
#else
    u_xlatb67 = u_xlat65>=(-u_xlat65);
#endif
    u_xlat65 = fract(abs(u_xlat65));
    u_xlat65 = (u_xlatb67) ? u_xlat65 : (-u_xlat65);
    u_xlat65 = u_xlat65 * 1000.0;
    u_xlat9.xy = vec2(u_xlat65) * _FlowTextureFactory.zw;
    u_xlat9.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat9.xy;
    u_xlat16_10.xyz = texture(_FlowNormalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_11.xyz);
    u_xlat16_65 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = vec3(u_xlat16_65) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat27.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat24.x = dot(u_xlat27.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat27.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_11.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat27.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat22.x = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat22.x = (-u_xlat16_11.x) * u_xlat22.x + 1.0;
    u_xlat16_3.xyz = texture(_FlowAlbedoMap, u_xlat9.xy).xyz;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_11.xzw = vec3(u_xlat16_65) * u_xlat16_11.xzw + u_xlat16_4.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_3 = texture(_FlowMaterialParamsMap, u_xlat9.xy);
    u_xlat16_4.xyz = texture(_FlowLightMap, u_xlat9.xy).xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_65) * u_xlat16_4.xyz;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_8);
    u_xlat16_3 = vec4(u_xlat16_65) * u_xlat16_3 + u_xlat16_8;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat4.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat4.xxx * u_xlat16_31.xxx + u_xlat22.xyz;
    u_xlat16_31.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat61) * u_xlat16_31.x + u_xlat61;
    u_xlat24.x = u_xlat61 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat61 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat9.x = dot(u_xlat27.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat9.x) * u_xlat16_31.x + u_xlat9.x;
    u_xlat44 = u_xlat9.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat24.y = u_xlat44 + u_xlat9.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat65 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat65 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat20.xxx * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat27.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat65 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat24.x = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat24.x * u_xlat24.x;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_73 = u_xlat24.x * u_xlat16_72;
    u_xlat24.x = (-u_xlat16_72) * u_xlat24.x + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat24.xxx;
    u_xlat10.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat10.xyz;
    u_xlat24.x = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat49 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat49 = u_xlat24.x * u_xlat49 + u_xlat16_31.x;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat24.x + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat24.y * u_xlat49;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat62 = u_xlat62 * u_xlat49;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat10.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat65 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_31.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat21.x * u_xlat21.x;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_73 = u_xlat21.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat21.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat21.xxx;
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat21.x = dot(u_xlat27.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat41 = (-u_xlat21.x) * u_xlat16_31.x + u_xlat21.x;
    u_xlat41 = u_xlat21.x * u_xlat41 + u_xlat16_31.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat41 + u_xlat21.x;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat41 = u_xlat41 * u_xlat24.y;
    u_xlat1.z = float(1.0) / u_xlat41;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_18.x, u_xlat16_72);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_73);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat2.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_66) * u_xlat16_11.xzw;
    u_xlat16_18.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat61) * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat24.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_17.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.yyy * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat21.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = (-u_xlat5.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat27.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat27.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat27.xyz) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_11.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_31.xxx * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat12.y = u_xlat0.z;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_31.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_31.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_2.w);
    u_xlat16_11.x = u_xlat16_66 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_66 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_66 = u_xlat16_11.w * 15.0 + (-u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_40) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x + u_xlat16_40;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat1.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_11.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_31.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_31.x + u_xlat16_11.x;
    u_xlat16_66 = u_xlat0.y * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_3.z, u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_16.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_4.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_31.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_31.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_11.x;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowTextureFactory;
uniform 	mediump vec4 _FlowLightColor;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowTextureMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowAlbedoMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowMaterialParamsMap;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowNormalMap;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat24;
vec3 u_xlat27;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_40;
int u_xlati40;
float u_xlat41;
float u_xlat44;
float u_xlat49;
float u_xlat61;
float u_xlat62;
float u_xlat65;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
bool u_xlatb67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat65 = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(u_xlat65>=(-u_xlat65));
#else
    u_xlatb67 = u_xlat65>=(-u_xlat65);
#endif
    u_xlat65 = fract(abs(u_xlat65));
    u_xlat65 = (u_xlatb67) ? u_xlat65 : (-u_xlat65);
    u_xlat65 = u_xlat65 * 1000.0;
    u_xlat9.xy = vec2(u_xlat65) * _FlowTextureFactory.zw;
    u_xlat9.xy = vs_TEXCOORD3.zw * _FlowTextureFactory.xy + u_xlat9.xy;
    u_xlat16_10.xyz = texture(_FlowNormalMap, u_xlat9.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_11.xyz);
    u_xlat16_65 = texture(_FlowTextureMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = vec3(u_xlat16_65) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat27.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat24.x = dot(u_xlat27.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat27.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_11.xyz;
    u_xlat61 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat27.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat22.x = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat22.x * u_xlat22.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat22.x * u_xlat16_11.x;
    u_xlat22.x = (-u_xlat16_11.x) * u_xlat22.x + 1.0;
    u_xlat16_3.xyz = texture(_FlowAlbedoMap, u_xlat9.xy).xyz;
    u_xlat16_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_11.xzw = vec3(u_xlat16_65) * u_xlat16_11.xzw + u_xlat16_4.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_3 = texture(_FlowMaterialParamsMap, u_xlat9.xy);
    u_xlat16_4.xyz = texture(_FlowLightMap, u_xlat9.xy).xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_65) * u_xlat16_4.xyz;
    u_xlat16_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_8);
    u_xlat16_3 = vec4(u_xlat16_65) * u_xlat16_3 + u_xlat16_8;
    u_xlat16_14.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_11.xzw * u_xlat16_14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_14.xyz;
    u_xlat16_8.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_8.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_14.xyz;
    u_xlat4.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat4.xxx * u_xlat16_31.xxx + u_xlat22.xyz;
    u_xlat16_31.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat24.x = (-u_xlat61) * u_xlat16_31.x + u_xlat61;
    u_xlat24.x = u_xlat61 * u_xlat24.x + u_xlat16_31.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat61 + u_xlat24.x;
    u_xlat16_15.xyz = u_xlat1.xyz * vec3(u_xlat16_66);
    u_xlat9.x = dot(u_xlat27.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat9.x) * u_xlat16_31.x + u_xlat9.x;
    u_xlat44 = u_xlat9.x * u_xlat44 + u_xlat16_31.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat24.y = u_xlat44 + u_xlat9.x;
    u_xlat24.xy = u_xlat24.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat24.x = u_xlat24.x * u_xlat24.y;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat65 = u_xlat16_31.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat65 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_31.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat24.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat61) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat20.xxx * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat27.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat65 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat24.x = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat24.x * u_xlat24.x;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_72 = u_xlat24.x * u_xlat16_72;
    u_xlat16_73 = u_xlat24.x * u_xlat16_72;
    u_xlat24.x = (-u_xlat16_72) * u_xlat24.x + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat24.xxx;
    u_xlat10.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat10.xyz;
    u_xlat24.x = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat49 = (-u_xlat24.x) * u_xlat16_31.x + u_xlat24.x;
    u_xlat49 = u_xlat24.x * u_xlat49 + u_xlat16_31.x;
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat24.x + u_xlat49;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat49 = u_xlat24.y * u_xlat49;
    u_xlat49 = float(1.0) / u_xlat49;
    u_xlat49 = min(u_xlat49, 16.0);
    u_xlat62 = u_xlat62 * u_xlat49;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat10.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat2.xyz * vec3(u_xlat16_73);
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat65 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_31.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat21.x = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat21.x * u_xlat21.x;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_66 = u_xlat21.x * u_xlat16_66;
    u_xlat16_73 = u_xlat21.x * u_xlat16_66;
    u_xlat21.x = (-u_xlat16_66) * u_xlat21.x + 1.0;
    u_xlat2.xyz = u_xlat16_14.xyz * u_xlat21.xxx;
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_73) + u_xlat2.xyz;
    u_xlat21.x = dot(u_xlat27.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat41 = (-u_xlat21.x) * u_xlat16_31.x + u_xlat21.x;
    u_xlat41 = u_xlat21.x * u_xlat41 + u_xlat16_31.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat41 + u_xlat21.x;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat41 = u_xlat41 * u_xlat24.y;
    u_xlat1.z = float(1.0) / u_xlat41;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat21.xxx * u_xlat2.xyz;
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = float(1.0) / float(u_xlat16_72);
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = max(u_xlat16_18.x, u_xlat16_72);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_73);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat16_17.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat2.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_66) * u_xlat16_11.xzw;
    u_xlat16_18.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat61) * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat24.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_17.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat20.yyy * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat21.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = (-u_xlat5.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat27.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_12.xyz = vec3(u_xlat16_66) * u_xlat16_12.xyz;
    u_xlat16_66 = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_66) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_72 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_15.xyz), u_xlat27.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xzw = (-u_xlat27.xyz) * u_xlat16_11.xxx + (-u_xlat16_15.xyz);
    u_xlat1.x = dot(u_xlat16_12.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8.z = dot(u_xlat16_12.xyz, u_xlat0.xzw);
    u_xlat16_11.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat0.xzw = u_xlat16_31.xxx * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat12.y = u_xlat0.z;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_31.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_31.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_66 = floor(u_xlat16_2.w);
    u_xlat16_11.x = u_xlat16_66 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_66 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_66 = u_xlat16_11.w * 15.0 + (-u_xlat16_66);
    u_xlat16_11.x = (-u_xlat16_40) + u_xlat16_0.x;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_11.x + u_xlat16_40;
    u_xlat16_66 = u_xlat16_72 * u_xlat16_66;
    u_xlat0.x = u_xlat1.x * u_xlat16_66;
    u_xlat16_66 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat0.x * u_xlat16_11.x + u_xlat16_66;
    u_xlat16_11.x = u_xlat16_66 + u_xlat16_66;
    u_xlat16_31.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_31.x + u_xlat16_11.x;
    u_xlat16_66 = u_xlat0.y * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_3.z, u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_14.xyz + u_xlat16_16.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_4.w * _albedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_4.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_31.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_31.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_66 : u_xlat16_11.x;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 66262
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_FlowTextureGUI"
}