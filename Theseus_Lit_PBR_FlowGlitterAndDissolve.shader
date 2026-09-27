//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_FlowGlitterAndDissolve" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _AlbedoTex ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_GlitterTex ("闪点贴图", 2D) = "white" { }

_GlitterMask ("闪点遮罩: R: 范围; G: 强度", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 20)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_GlitterFlowSpeed ("闪点流动速度", Range(-5, 5)) = 1.0

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("启用竖向溶解", Float) = 0.0

_DissolveDirSpeed ("溶解方向速度", Vector) = (1,0,0,0)

_DissolveTex ("溶解纹理", 2D) = "white" { }

_DissolveEdgeColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveEdgeShrink ("溶解边缘压缩", Float) = 6.0

_DissolveEdgeRange ("溶解边缘范围", Range(0.2, 10)) = 0.0

_DissolveEdgeHard ("溶解边缘硬度", Range(0, 0.5)) = 0.30000001192092896

_Cutoff ("溶解进度", Range(0, 1)) = 0.0

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 35514
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
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
ivec3 u_xlati17;
bool u_xlatb17;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
vec2 u_xlat34;
mediump float u_xlat16_34;
int u_xlati34;
mediump float u_xlat16_35;
mediump vec2 u_xlat16_36;
float u_xlat38;
float u_xlat46;
float u_xlat51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat55;
mediump float u_xlat16_56;
mediump float u_xlat16_58;
float u_xlat60;
float u_xlat61;
float u_xlat62;
float u_xlat63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_18.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_18.x = (-u_xlat16_18.x) * u_xlat16_18.x + 1.0;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_35 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_18.x * u_xlat16_35;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_18.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * u_xlat16_18.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_19 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_19, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat51 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat4.xyz;
    u_xlat16_53 = dot(u_xlat16_18.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat51 * u_xlat51;
    u_xlat16_53 = u_xlat51 * u_xlat16_53;
    u_xlat16_53 = u_xlat51 * u_xlat16_53;
    u_xlat16_5.x = u_xlat51 * u_xlat16_53;
    u_xlat51 = (-u_xlat16_53) * u_xlat51 + 1.0;
    u_xlat16_6.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_6.zxy * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_6.zxy;
    u_xlat16_7.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_3.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_7.xyz;
    u_xlat51 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat55 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat55 = max(u_xlat55, 1.17549435e-38);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat55 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat55 = max(u_xlat55, 1.17549435e-38);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat10.xyz;
    u_xlat60 = dot(u_xlat11.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat61 = (-u_xlat60) * u_xlat16_18.x + u_xlat60;
    u_xlat61 = u_xlat60 * u_xlat61 + u_xlat16_18.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat60 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat12.x) * u_xlat16_18.x + u_xlat12.x;
    u_xlat62 = u_xlat12.x * u_xlat62 + u_xlat16_18.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat12.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat62;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat21 = u_xlat16_18.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat21 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_18.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat38) * u_xlat13.xyz;
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat21 + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat61 = u_xlat16_18.x / u_xlat38;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat46 = (-u_xlat16_35) + 1.0;
    u_xlat16_35 = u_xlat46 * u_xlat46;
    u_xlat16_35 = u_xlat46 * u_xlat16_35;
    u_xlat16_35 = u_xlat46 * u_xlat16_35;
    u_xlat16_52 = u_xlat46 * u_xlat16_35;
    u_xlat46 = (-u_xlat16_35) * u_xlat46 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat46);
    u_xlat13.xyz = vec3(u_xlat51) * vec3(u_xlat16_52) + u_xlat13.xyz;
    u_xlat46 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat46) * u_xlat16_18.x + u_xlat46;
    u_xlat63 = u_xlat46 * u_xlat63 + u_xlat16_18.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat46;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat62 * u_xlat63;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat46) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_52 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_53 = float(1.0) / float(u_xlat16_35);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_15.xyz = vec3(u_xlat16_35) * u_xlat9.xyz;
    u_xlat16_35 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_52 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_52));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_52);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_35 = max(u_xlat16_35, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_53 = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_53);
    u_xlat16_35 = u_xlat16_52 * u_xlat16_35;
    u_xlat16_16.xyz = vec3(u_xlat16_35) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat9.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
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
    u_xlat0.x = u_xlat0.x * u_xlat21 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_18.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat34.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat34.x * u_xlat34.x;
    u_xlat16_1.x = u_xlat34.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat34.x * u_xlat16_1.x;
    u_xlat16_35 = u_xlat34.x * u_xlat16_1.x;
    u_xlat34.x = (-u_xlat16_1.x) * u_xlat34.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat34.xxx;
    u_xlat9.xyz = vec3(u_xlat51) * vec3(u_xlat16_35) + u_xlat9.xyz;
    u_xlat34.x = (-u_xlat17.x) * u_xlat16_18.x + u_xlat17.x;
    u_xlat34.x = u_xlat17.x * u_xlat34.x + u_xlat16_18.x;
    u_xlat34.x = sqrt(u_xlat34.x);
    u_xlat34.x = u_xlat34.x + u_xlat17.x;
    u_xlat34.x = u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = u_xlat34.x * u_xlat62;
    u_xlat0.z = float(1.0) / u_xlat34.x;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat9.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat17.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_53 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_5.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat46) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat17.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat10.xyz) * vec3(u_xlat55) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(_OcclusionScale) * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_56 = (-u_xlat16_53) + u_xlat16_56;
    u_xlat16_58 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_58 + 1.0;
    u_xlat16_53 = u_xlat16_6.w * u_xlat16_56 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_6.w * u_xlat16_53;
    u_xlat16_56 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 + -1.0;
    u_xlat16_56 = _OcclusionScale * u_xlat16_56 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_56;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat17.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat17.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat17.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat17.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat17.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_15.y = u_xlat16_2.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati17.x = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati34 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati17.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_5.xyz * u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_5.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat17.xyz = (-u_xlat11.xyz) * u_xlat16_5.xxx + (-u_xlat16_8.xyz);
    u_xlat9.x = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_2.xyz, u_xlat17.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat10.xyz * vec3(u_xlat55) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat16_18.xxx * u_xlat26.xyz + u_xlat17.xyz;
    u_xlat16_5.x = dot(_IndirectCubemapRotationParams.xy, u_xlat17.xz);
    u_xlat16_5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat17.xz);
    u_xlat5.y = u_xlat17.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat16_18.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_17.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_17.xxx + u_xlat16_17.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_18.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat17.xyz * u_xlat17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb17 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb17)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_4.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_18.x = floor(u_xlat16_4.w);
    u_xlat16_2.x = u_xlat16_18.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_4.x = u_xlat16_2.x * 16.0 + u_xlat16_4.z;
    u_xlat16_2.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_17.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_4.x = u_xlat16_18.x * 16.0 + u_xlat16_4.z;
    u_xlat16_2.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_18.x = u_xlat16_2.z * 15.0 + (-u_xlat16_18.x);
    u_xlat16_2.x = (-u_xlat16_34) + u_xlat16_17.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x + u_xlat16_34;
    u_xlat16_18.x = u_xlat16_56 * u_xlat16_18.x;
    u_xlat17.x = u_xlat9.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_18.x = u_xlat17.x * u_xlat16_2.x + u_xlat16_18.x;
    u_xlat16_2.x = u_xlat16_18.x + u_xlat16_18.x;
    u_xlat16_19 = (-u_xlat16_18.x) * 2.0 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_19 + u_xlat16_2.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_18.x = min(u_xlat16_18.x, u_xlat16_3.z);
    u_xlat16_2.xyz = u_xlat16_18.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_52 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat0.xy = u_xlat16_8.yy * vs_TEXCOORD6.xy;
    u_xlat0.xy = vs_TEXCOORD5.xy * u_xlat16_8.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_8.zz + u_xlat0.xy;
    u_xlat9.x = u_xlat0.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat0.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat9.y = u_xlat0.y * -0.0500000007 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * 1.5;
    u_xlat34.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat9.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat34.xy);
    u_xlat9.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat34.xy);
    u_xlat34.xy = u_xlat9.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat34.xy = u_xlat34.xy * u_xlat16_2.xx;
    u_xlat16_9.xyz = texture(_GlitterTex, u_xlat34.xy).xyz;
    u_xlat0.x = vs_TEXCOORD3.x * 1.5;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_9.zxy * u_xlat16_0.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat16_52) + u_xlat16_1.xyz;
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_36.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_36.xy + u_xlat16_2.xy;
    u_xlat16_52 = (u_xlatb0.y) ? 0.0 : u_xlat16_2.x;
    u_xlat16_36.x = (u_xlatb0.y) ? u_xlat16_2.y : 0.0;
    u_xlat16_52 = u_xlat16_52 + u_xlat16_36.x;
    u_xlat16_36.x = _Cutoff + -1.0;
    u_xlat16_52 = u_xlat16_36.x * -1.10000002 + u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = u_xlat16_52 * 2.0 + -0.0599999987;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat16_2.xy * _DissolveTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_52 = u_xlat16_52 * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_2.x = dot(vec2(u_xlat16_52), vec2(_DissolveEdgeRange));
    u_xlat16_52 = u_xlat16_52 + (-_DissolveEdgeHard);
    u_xlat16_2.x = u_xlat16_2.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_53 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_53 = float(1.0) / u_xlat16_53;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_52 = min(u_xlat16_52, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_52) * u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_52;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat9.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat9.xy, 0.0).xyz;
    u_xlat9.xyz = (-u_xlat16_17.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat16_17.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
ivec3 u_xlati17;
bool u_xlatb17;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat21;
mediump vec3 u_xlat16_22;
vec3 u_xlat26;
vec2 u_xlat34;
mediump float u_xlat16_34;
int u_xlati34;
mediump float u_xlat16_35;
mediump vec2 u_xlat16_36;
float u_xlat38;
float u_xlat46;
float u_xlat51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
float u_xlat55;
mediump float u_xlat16_56;
mediump float u_xlat16_58;
float u_xlat60;
float u_xlat61;
float u_xlat62;
float u_xlat63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_18.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_18.x = (-u_xlat16_18.x) * u_xlat16_18.x + 1.0;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_35 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_18.x * u_xlat16_35;
    u_xlat16_18.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_18.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_18.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * u_xlat16_18.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_19 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_19, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat51 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat4.xyz;
    u_xlat16_53 = dot(u_xlat16_18.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat51 * u_xlat51;
    u_xlat16_53 = u_xlat51 * u_xlat16_53;
    u_xlat16_53 = u_xlat51 * u_xlat16_53;
    u_xlat16_5.x = u_xlat51 * u_xlat16_53;
    u_xlat51 = (-u_xlat16_53) * u_xlat51 + 1.0;
    u_xlat16_6.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_6.zxy * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_6.zxy;
    u_xlat16_7.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_3.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_7.xyz;
    u_xlat51 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat55 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat55 = max(u_xlat55, 1.17549435e-38);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat55 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat55 = max(u_xlat55, 1.17549435e-38);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat10.xyz;
    u_xlat60 = dot(u_xlat11.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat61 = (-u_xlat60) * u_xlat16_18.x + u_xlat60;
    u_xlat61 = u_xlat60 * u_xlat61 + u_xlat16_18.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat60 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat12.x) * u_xlat16_18.x + u_xlat12.x;
    u_xlat62 = u_xlat12.x * u_xlat62 + u_xlat16_18.x;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat12.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat62;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat21 = u_xlat16_18.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat21 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_18.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat13.xyz = vec3(u_xlat38) * u_xlat13.xyz;
    u_xlat16_35 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35 = min(max(u_xlat16_35, 0.0), 1.0);
#else
    u_xlat16_35 = clamp(u_xlat16_35, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat21 + 1.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat61 = u_xlat16_18.x / u_xlat38;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat46 = (-u_xlat16_35) + 1.0;
    u_xlat16_35 = u_xlat46 * u_xlat46;
    u_xlat16_35 = u_xlat46 * u_xlat16_35;
    u_xlat16_35 = u_xlat46 * u_xlat16_35;
    u_xlat16_52 = u_xlat46 * u_xlat16_35;
    u_xlat46 = (-u_xlat16_35) * u_xlat46 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat46);
    u_xlat13.xyz = vec3(u_xlat51) * vec3(u_xlat16_52) + u_xlat13.xyz;
    u_xlat46 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat46) * u_xlat16_18.x + u_xlat46;
    u_xlat63 = u_xlat46 * u_xlat63 + u_xlat16_18.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat46;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat62 * u_xlat63;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat46) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_35 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_35 = max(u_xlat16_35, 6.10351563e-05);
    u_xlat16_52 = u_xlat16_35 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_53 = float(1.0) / float(u_xlat16_35);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_15.xyz = vec3(u_xlat16_35) * u_xlat9.xyz;
    u_xlat16_35 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_52 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_52));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_52);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_35 = max(u_xlat16_35, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_53 = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_53);
    u_xlat16_35 = u_xlat16_52 * u_xlat16_35;
    u_xlat16_16.xyz = vec3(u_xlat16_35) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat9.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
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
    u_xlat0.x = u_xlat0.x * u_xlat21 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_18.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat17.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat34.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat34.x * u_xlat34.x;
    u_xlat16_1.x = u_xlat34.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat34.x * u_xlat16_1.x;
    u_xlat16_35 = u_xlat34.x * u_xlat16_1.x;
    u_xlat34.x = (-u_xlat16_1.x) * u_xlat34.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat34.xxx;
    u_xlat9.xyz = vec3(u_xlat51) * vec3(u_xlat16_35) + u_xlat9.xyz;
    u_xlat34.x = (-u_xlat17.x) * u_xlat16_18.x + u_xlat17.x;
    u_xlat34.x = u_xlat17.x * u_xlat34.x + u_xlat16_18.x;
    u_xlat34.x = sqrt(u_xlat34.x);
    u_xlat34.x = u_xlat34.x + u_xlat17.x;
    u_xlat34.x = u_xlat34.x + 6.10351563e-05;
    u_xlat34.x = u_xlat34.x * u_xlat62;
    u_xlat0.z = float(1.0) / u_xlat34.x;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat9.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat17.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_53 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_5.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.xxx * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat46) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat17.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat10.xyz) * vec3(u_xlat55) + vs_TEXCOORD4.xyz;
    u_xlat16_2.xyz = vec3(_OcclusionScale) * u_xlat16_2.xyz + u_xlat11.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_56 = (-u_xlat16_53) + u_xlat16_56;
    u_xlat16_58 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_58 + 1.0;
    u_xlat16_53 = u_xlat16_6.w * u_xlat16_56 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_6.w * u_xlat16_53;
    u_xlat16_56 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 + -1.0;
    u_xlat16_56 = _OcclusionScale * u_xlat16_56 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_56;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat17.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat17.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat17.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat17.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat17.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_2.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_2.xz);
    u_xlat16_15.y = u_xlat16_2.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati17.x = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati34 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati17.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xzw = u_xlat16_5.xyz * u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_5.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat17.xyz = (-u_xlat11.xyz) * u_xlat16_5.xxx + (-u_xlat16_8.xyz);
    u_xlat9.x = dot(u_xlat16_2.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_2.xyz, u_xlat17.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat10.xyz * vec3(u_xlat55) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat16_18.xxx * u_xlat26.xyz + u_xlat17.xyz;
    u_xlat16_5.x = dot(_IndirectCubemapRotationParams.xy, u_xlat17.xz);
    u_xlat16_5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat17.xz);
    u_xlat5.y = u_xlat17.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat16_18.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_17.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_17.xxx + u_xlat16_17.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_18.x);
    u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat17.xyz * u_xlat17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb17 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb17)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_14.xyz;
    u_xlat16_4.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_18.x = floor(u_xlat16_4.w);
    u_xlat16_2.x = u_xlat16_18.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 15.0);
    u_xlat16_4.x = u_xlat16_2.x * 16.0 + u_xlat16_4.z;
    u_xlat16_2.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_17.x = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_4.x = u_xlat16_18.x * 16.0 + u_xlat16_4.z;
    u_xlat16_2.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_2.xy).x;
    u_xlat16_18.x = u_xlat16_2.z * 15.0 + (-u_xlat16_18.x);
    u_xlat16_2.x = (-u_xlat16_34) + u_xlat16_17.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x + u_xlat16_34;
    u_xlat16_18.x = u_xlat16_56 * u_xlat16_18.x;
    u_xlat17.x = u_xlat9.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat0.x * 0.5;
    u_xlat16_2.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_18.x = u_xlat17.x * u_xlat16_2.x + u_xlat16_18.x;
    u_xlat16_2.x = u_xlat16_18.x + u_xlat16_18.x;
    u_xlat16_19 = (-u_xlat16_18.x) * 2.0 + 1.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_19 + u_xlat16_2.x;
    u_xlat16_18.x = u_xlat0.x * u_xlat16_18.x;
    u_xlat16_18.x = min(u_xlat16_18.x, u_xlat16_3.z);
    u_xlat16_2.xyz = u_xlat16_18.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + u_xlat16_1.xzw;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_52 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat0.xy = u_xlat16_8.yy * vs_TEXCOORD6.xy;
    u_xlat0.xy = vs_TEXCOORD5.xy * u_xlat16_8.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_8.zz + u_xlat0.xy;
    u_xlat9.x = u_xlat0.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat0.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat9.y = u_xlat0.y * -0.0500000007 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * 1.5;
    u_xlat34.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat9.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat34.xy);
    u_xlat9.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat34.xy);
    u_xlat34.xy = u_xlat9.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat34.xy = u_xlat34.xy * u_xlat16_2.xx;
    u_xlat16_9.xyz = texture(_GlitterTex, u_xlat34.xy).xyz;
    u_xlat0.x = vs_TEXCOORD3.x * 1.5;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_9.zxy * u_xlat16_0.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat16_52) + u_xlat16_1.xyz;
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_36.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_36.xy + u_xlat16_2.xy;
    u_xlat16_52 = (u_xlatb0.y) ? 0.0 : u_xlat16_2.x;
    u_xlat16_36.x = (u_xlatb0.y) ? u_xlat16_2.y : 0.0;
    u_xlat16_52 = u_xlat16_52 + u_xlat16_36.x;
    u_xlat16_36.x = _Cutoff + -1.0;
    u_xlat16_52 = u_xlat16_36.x * -1.10000002 + u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = u_xlat16_52 * 2.0 + -0.0599999987;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat16_2.xy * _DissolveTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_52 = u_xlat16_52 * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_2.x = dot(vec2(u_xlat16_52), vec2(_DissolveEdgeRange));
    u_xlat16_52 = u_xlat16_52 + (-_DissolveEdgeHard);
    u_xlat16_2.x = u_xlat16_2.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_53 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_53 = float(1.0) / u_xlat16_53;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_52 * -2.0 + 3.0;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_52 = min(u_xlat16_52, 1.0);
    u_xlat16_2.xyz = vec3(u_xlat16_52) * u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_52;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat9.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat9.xy, 0.0).xyz;
    u_xlat9.xyz = (-u_xlat16_17.xyz) + u_xlat16_9.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat16_17.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
float u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
mediump float u_xlat16_27;
vec2 u_xlat34;
mediump float u_xlat16_34;
int u_xlati34;
float u_xlat35;
float u_xlat42;
mediump vec2 u_xlat16_44;
float u_xlat51;
bool u_xlatb51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
float u_xlat54;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
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
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat17 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_17.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_17.x * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat17 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = max(u_xlat16_57, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_57 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_27 = float(1.0) / float(u_xlat16_57);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat16_57 = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb51 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb51)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb51 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb51) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_11.x);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_11.xyz = vec3(u_xlat16_57) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat2.x = (-u_xlat16_61) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_27 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_19.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_19.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_19.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_19.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat53 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_27) + u_xlat2.xyz;
    u_xlat16_27 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat3.x = (-u_xlat51) * u_xlat16_27 + u_xlat51;
    u_xlat3.x = u_xlat51 * u_xlat3.x + u_xlat16_27;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat51 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat8.x) * u_xlat16_27 + u_xlat8.x;
    u_xlat54 = u_xlat8.x * u_xlat54 + u_xlat16_27;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat3.w = u_xlat54 + u_xlat8.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat58 = u_xlat16_27 + -1.0;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat52 = u_xlat3.x * u_xlat52;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat9.xyz = vec3(u_xlat52) * u_xlat9.xyz;
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat3.x = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat3.x * u_xlat3.x;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_63 = u_xlat3.x * u_xlat16_62;
    u_xlat3.x = (-u_xlat16_62) * u_xlat3.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat9.xyz = vec3(u_xlat53) * vec3(u_xlat16_63) + u_xlat9.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat3.x) * u_xlat16_27 + u_xlat3.x;
    u_xlat42 = u_xlat3.x * u_xlat42 + u_xlat16_27;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat3.x + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat3.w * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat52 = u_xlat52 * u_xlat42;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_64 = float(1.0) / float(u_xlat16_62);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_62);
    u_xlat16_62 = u_xlat16_63 * u_xlat16_64;
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb52 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_16.xy = (bool(u_xlatb52)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_64);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_16.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_15.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_57 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat58 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_27 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat35 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35 * u_xlat35;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_62 = u_xlat35 * u_xlat16_57;
    u_xlat35 = (-u_xlat16_57) * u_xlat35 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat35);
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_62) + u_xlat2.xyz;
    u_xlat35 = (-u_xlat18.x) * u_xlat16_27 + u_xlat18.x;
    u_xlat35 = u_xlat18.x * u_xlat35 + u_xlat16_27;
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat18.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat35 * u_xlat3.w;
    u_xlat1.z = float(1.0) / u_xlat35;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat1.xzw = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat1.xzw = u_xlat1.xzw * _DirectSpecularColor.zxy;
    u_xlat1.xzw = u_xlat18.xxx * u_xlat1.xzw;
    u_xlat1.xzw = u_xlat16_16.xyz * u_xlat1.xzw;
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat17) + u_xlat16_14.xyz;
    u_xlat16_57 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_57) * u_xlat16_10.xzw;
    u_xlat16_15.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat51) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat18.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = vec3(u_xlat16_57) * u_xlat16_11.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_57) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_57;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_57));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_27) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_27 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_27);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (u_xlatb0.x) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_57 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.w * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_3.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_57 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD6.xy;
    u_xlat0.xy = vs_TEXCOORD5.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat1.x = u_xlat0.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat0.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat1.y = u_xlat0.y * -0.0500000007 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * 1.5;
    u_xlat34.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat34.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat34.xy);
    u_xlat34.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_10.x = _GlitterScale * 0.681690156;
    u_xlat34.xy = u_xlat34.xy * u_xlat16_10.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat34.xy).xyz;
    u_xlat0.x = vs_TEXCOORD3.x * 1.5;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_0.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_GlitterIntensity);
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _GlitterColor.zxy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(u_xlat16_57) + u_xlat16_6.xyz;
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_10.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_44.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_44.xy + u_xlat16_10.xy;
    u_xlat16_57 = (u_xlatb0.y) ? 0.0 : u_xlat16_10.x;
    u_xlat16_44.x = (u_xlatb0.y) ? u_xlat16_10.y : 0.0;
    u_xlat16_57 = u_xlat16_57 + u_xlat16_44.x;
    u_xlat16_44.x = _Cutoff + -1.0;
    u_xlat16_57 = u_xlat16_44.x * -1.10000002 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = u_xlat16_57 * 2.0 + -0.0599999987;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_57 = u_xlat16_57 * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_57), vec2(_DissolveEdgeRange));
    u_xlat16_57 = u_xlat16_57 + (-_DissolveEdgeHard);
    u_xlat16_10.x = u_xlat16_10.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_61 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_61 = float(1.0) / u_xlat16_61;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * -2.0 + 3.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_57 = min(u_xlat16_57, 1.0);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_10.xyz;
    SV_Target0.w = u_xlat16_57;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_17.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_17.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
float u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
mediump float u_xlat16_27;
vec2 u_xlat34;
mediump float u_xlat16_34;
int u_xlati34;
float u_xlat35;
float u_xlat42;
mediump vec2 u_xlat16_44;
float u_xlat51;
bool u_xlatb51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
float u_xlat54;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
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
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat17 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_17.x = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_17.x * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat17 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = max(u_xlat16_57, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_57 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_27 = float(1.0) / float(u_xlat16_57);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat16_57 = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb51 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb51)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb51 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb51) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_11.x);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_11.xyz = vec3(u_xlat16_57) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat2.x = (-u_xlat16_61) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_27 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_19.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_19.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_19.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_19.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat53 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_27) + u_xlat2.xyz;
    u_xlat16_27 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat3.x = (-u_xlat51) * u_xlat16_27 + u_xlat51;
    u_xlat3.x = u_xlat51 * u_xlat3.x + u_xlat16_27;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat51 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat8.x) * u_xlat16_27 + u_xlat8.x;
    u_xlat54 = u_xlat8.x * u_xlat54 + u_xlat16_27;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat3.w = u_xlat54 + u_xlat8.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat58 = u_xlat16_27 + -1.0;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat52 = u_xlat3.x * u_xlat52;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat9.xyz = vec3(u_xlat52) * u_xlat9.xyz;
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat3.x = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat3.x * u_xlat3.x;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_63 = u_xlat3.x * u_xlat16_62;
    u_xlat3.x = (-u_xlat16_62) * u_xlat3.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat9.xyz = vec3(u_xlat53) * vec3(u_xlat16_63) + u_xlat9.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat3.x) * u_xlat16_27 + u_xlat3.x;
    u_xlat42 = u_xlat3.x * u_xlat42 + u_xlat16_27;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat3.x + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat3.w * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat52 = u_xlat52 * u_xlat42;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_64 = float(1.0) / float(u_xlat16_62);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_62);
    u_xlat16_62 = u_xlat16_63 * u_xlat16_64;
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb52 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_16.xy = (bool(u_xlatb52)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_64);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_16.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_15.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_57 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat58 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_27 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat35 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35 * u_xlat35;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_62 = u_xlat35 * u_xlat16_57;
    u_xlat35 = (-u_xlat16_57) * u_xlat35 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat35);
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_62) + u_xlat2.xyz;
    u_xlat35 = (-u_xlat18.x) * u_xlat16_27 + u_xlat18.x;
    u_xlat35 = u_xlat18.x * u_xlat35 + u_xlat16_27;
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat18.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat35 * u_xlat3.w;
    u_xlat1.z = float(1.0) / u_xlat35;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat1.xzw = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat1.xzw = u_xlat1.xzw * _DirectSpecularColor.zxy;
    u_xlat1.xzw = u_xlat18.xxx * u_xlat1.xzw;
    u_xlat1.xzw = u_xlat16_16.xyz * u_xlat1.xzw;
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat17) + u_xlat16_14.xyz;
    u_xlat16_57 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_57) * u_xlat16_10.xzw;
    u_xlat16_15.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat51) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat18.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = vec3(u_xlat16_57) * u_xlat16_11.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_57) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_57;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_57));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_27) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_27 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_27);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (u_xlatb0.x) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_57 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.w * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_3.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_57 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD6.xy;
    u_xlat0.xy = vs_TEXCOORD5.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat1.x = u_xlat0.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat0.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat1.y = u_xlat0.y * -0.0500000007 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * 1.5;
    u_xlat34.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat34.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat34.xy);
    u_xlat34.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_10.x = _GlitterScale * 0.681690156;
    u_xlat34.xy = u_xlat34.xy * u_xlat16_10.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat34.xy).xyz;
    u_xlat0.x = vs_TEXCOORD3.x * 1.5;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_0.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_GlitterIntensity);
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _GlitterColor.zxy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(u_xlat16_57) + u_xlat16_6.xyz;
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_10.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_44.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_44.xy + u_xlat16_10.xy;
    u_xlat16_57 = (u_xlatb0.y) ? 0.0 : u_xlat16_10.x;
    u_xlat16_44.x = (u_xlatb0.y) ? u_xlat16_10.y : 0.0;
    u_xlat16_57 = u_xlat16_57 + u_xlat16_44.x;
    u_xlat16_44.x = _Cutoff + -1.0;
    u_xlat16_57 = u_xlat16_44.x * -1.10000002 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = u_xlat16_57 * 2.0 + -0.0599999987;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_57 = u_xlat16_57 * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_57), vec2(_DissolveEdgeRange));
    u_xlat16_57 = u_xlat16_57 + (-_DissolveEdgeHard);
    u_xlat16_10.x = u_xlat16_10.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_61 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_61 = float(1.0) / u_xlat16_61;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * -2.0 + 3.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_57 = min(u_xlat16_57, 1.0);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_10.xyz;
    SV_Target0.w = u_xlat16_57;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_17.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_17.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
ivec3 u_xlati21;
bool u_xlatb21;
mediump vec3 u_xlat16_22;
float u_xlat23;
vec3 u_xlat27;
mediump float u_xlat16_37;
vec2 u_xlat39;
mediump float u_xlat16_39;
int u_xlati39;
mediump vec2 u_xlat16_40;
float u_xlat41;
float u_xlat48;
mediump float u_xlat16_56;
float u_xlat57;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb3.x = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb3.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_4.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat5.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat57 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat5.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat57 * u_xlat57;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_4.x = u_xlat57 * u_xlat16_56;
    u_xlat57 = (-u_xlat16_56) * u_xlat57 + 1.0;
    u_xlat16_6.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_6.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_7.xyz;
    u_xlat57 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_4.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat11.xyz = vec3(u_xlat59) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat11.xyz = vec3(u_xlat59) * u_xlat10.xyz;
    u_xlat63 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat64 = (-u_xlat63) * u_xlat16_19.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_19.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat3.xyz;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat65 = u_xlat12.x * u_xlat65 + u_xlat16_19.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat12.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat65;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat23 = u_xlat16_19.x + -1.0;
    u_xlat5.x = u_xlat5.x * u_xlat23 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_19.x / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat5.x = u_xlat64 * u_xlat5.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_5 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat5.x = u_xlat16_5 * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat41 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat13.xyz = vec3(u_xlat41) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat41 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat41 = u_xlat41 * u_xlat23 + 1.0;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat64 = u_xlat16_19.x / u_xlat41;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat48 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat48 * u_xlat48;
    u_xlat16_37 = u_xlat48 * u_xlat16_37;
    u_xlat16_56 = u_xlat48 * u_xlat16_37;
    u_xlat16_4.x = u_xlat48 * u_xlat16_56;
    u_xlat48 = (-u_xlat16_56) * u_xlat48 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat48);
    u_xlat13.xyz = vec3(u_xlat57) * u_xlat16_4.xxx + u_xlat13.xyz;
    u_xlat48 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat48) * u_xlat16_19.x + u_xlat48;
    u_xlat66 = u_xlat48 * u_xlat66 + u_xlat16_19.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat48;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat65 * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat64 = u_xlat64 * u_xlat66;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_4.x = u_xlat16_56 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_61 = float(1.0) / float(u_xlat16_56);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat9.xyz;
    u_xlat16_56 = u_xlat16_4.x * u_xlat16_61;
    u_xlat16_4.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_4.x));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_4.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_61);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_4.x;
    u_xlat16_16.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat9.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat9.xxx;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat11.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat23 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_19.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat21.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat39.x = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat39.x * u_xlat39.x;
    u_xlat16_56 = u_xlat39.x * u_xlat16_56;
    u_xlat16_56 = u_xlat39.x * u_xlat16_56;
    u_xlat16_4.x = u_xlat39.x * u_xlat16_56;
    u_xlat39.x = (-u_xlat16_56) * u_xlat39.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat39.xxx;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_4.xxx + u_xlat9.xyz;
    u_xlat39.x = (-u_xlat21.x) * u_xlat16_19.x + u_xlat21.x;
    u_xlat39.x = u_xlat21.x * u_xlat39.x + u_xlat16_19.x;
    u_xlat39.x = sqrt(u_xlat39.x);
    u_xlat39.x = u_xlat39.x + u_xlat21.x;
    u_xlat39.x = u_xlat39.x + 6.10351563e-05;
    u_xlat39.x = u_xlat39.x * u_xlat65;
    u_xlat3.z = float(1.0) / u_xlat39.x;
    u_xlat3.xz = min(u_xlat3.xz, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat3.xzw = u_xlat9.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xzw = min(max(u_xlat3.xzw, 0.0), 1.0);
#else
    u_xlat3.xzw = clamp(u_xlat3.xzw, 0.0, 1.0);
#endif
    u_xlat3.xzw = u_xlat3.xzw * _DirectSpecularColor.xyz;
    u_xlat3.xzw = u_xlat21.xxx * u_xlat3.xzw;
    u_xlat3.xzw = u_xlat16_16.xyz * u_xlat3.xzw;
    u_xlat16_14.xyz = u_xlat3.xzw * u_xlat5.xxx + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_56) * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_4.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat5.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat63) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat48) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat21.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = (-u_xlat10.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_14.xyz = vec3(u_xlat16_56) * u_xlat16_14.xyz;
    u_xlat16_56 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_58 = (-u_xlat16_56) + u_xlat16_58;
    u_xlat16_61 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_61 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_58 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
    u_xlat16_58 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat16_58 = _OcclusionScale * u_xlat16_58 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat3.x = min(u_xlat16_56, 1.0);
    u_xlat21.x = min(u_xlat16_0.z, u_xlat3.x);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat21.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat21.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat21.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat21.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati21.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz;
    u_xlati39 = int(int_bitfieldInsert(2,u_xlati21.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati39].xyz;
    u_xlati21.x = int(uint(uint(u_xlati21.x) & 1u));
    u_xlati39 = (u_xlati21.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati21.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati39].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat21.xyz = (-u_xlat11.xyz) * u_xlat16_4.xxx + (-u_xlat16_8.xyz);
    u_xlat9.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat21.xyz);
    u_xlat16_4.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat10.xyz * vec3(u_xlat59) + (-u_xlat21.xyz);
    u_xlat21.xyz = u_xlat16_19.xxx * u_xlat27.xyz + u_xlat21.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat21.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat21.xz);
    u_xlat14.y = u_xlat21.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_61 = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_21.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xxx + u_xlat16_21.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_61);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat21.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat21.xyz * u_xlat21.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb21 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb21)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_15.xyz;
    u_xlat16_1.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_56 = floor(u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_56 + 1.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 15.0);
    u_xlat16_1.x = u_xlat16_4.x * 16.0 + u_xlat16_1.z;
    u_xlat16_4.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_1.x = u_xlat16_56 * 16.0 + u_xlat16_1.z;
    u_xlat16_4.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_56 = u_xlat16_4.z * 15.0 + (-u_xlat16_56);
    u_xlat16_4.x = (-u_xlat16_39) + u_xlat16_21.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_4.x + u_xlat16_39;
    u_xlat16_56 = u_xlat16_58 * u_xlat16_56;
    u_xlat21.x = u_xlat9.x * u_xlat16_56;
    u_xlat16_56 = u_xlat3.x * 0.5;
    u_xlat16_4.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_56 = u_xlat21.x * u_xlat16_4.x + u_xlat16_56;
    u_xlat16_4.x = u_xlat16_56 + u_xlat16_56;
    u_xlat16_22.x = (-u_xlat16_56) * 2.0 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_22.x + u_xlat16_4.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat3.x;
    u_xlat16_56 = min(u_xlat16_0.z, u_xlat16_56);
    u_xlat16_4.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_56 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat3.xy = u_xlat16_8.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_8.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_8.zz + u_xlat3.xy;
    u_xlat9.x = u_xlat3.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat3.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat9.y = u_xlat3.y * -0.0500000007 + u_xlat3.x;
    u_xlat3.y = u_xlat3.x * 1.5;
    u_xlat39.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat9.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat39.xy);
    u_xlat9.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat39.xy);
    u_xlat39.xy = u_xlat9.xy + vec2(0.5, 0.5);
    u_xlat16_4.x = _GlitterScale * 0.681690156;
    u_xlat39.xy = u_xlat39.xy * u_xlat16_4.xx;
    u_xlat16_9.xyz = texture(_GlitterTex, u_xlat39.xy).xyz;
    u_xlat3.x = vs_TEXCOORD3.x * 1.5;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_9.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_GlitterIntensity);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _GlitterColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_56) + u_xlat16_2.xyz;
    u_xlatb3.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_4.xy = (u_xlatb3.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_40.xy = (u_xlatb3.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_40.xy + u_xlat16_4.xy;
    u_xlat16_56 = (u_xlatb3.y) ? 0.0 : u_xlat16_4.x;
    u_xlat16_40.x = (u_xlatb3.y) ? u_xlat16_4.y : 0.0;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_40.x;
    u_xlat16_40.x = _Cutoff + -1.0;
    u_xlat16_56 = u_xlat16_40.x * -1.10000002 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 + -1.0;
    u_xlat16_56 = u_xlat16_56 * 2.0 + -0.0599999987;
    u_xlat3.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat3.xy = u_xlat3.xy * _DissolveTex_ST.zw;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = u_xlat16_4.xy * _DissolveTex_ST.xy + u_xlat3.xy;
    u_xlat16_3.x = texture(_DissolveTex, u_xlat3.xy).x;
    u_xlat16_56 = u_xlat16_56 * _DissolveEdgeShrink + u_xlat16_3.x;
    u_xlat16_4.x = dot(vec2(u_xlat16_56), vec2(_DissolveEdgeRange));
    u_xlat16_56 = u_xlat16_56 + (-_DissolveEdgeHard);
    u_xlat16_4.x = u_xlat16_4.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_58 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_58 = float(1.0) / u_xlat16_58;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_56 * -2.0 + 3.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_56) * u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_56;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump float u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
ivec3 u_xlati21;
bool u_xlatb21;
mediump vec3 u_xlat16_22;
float u_xlat23;
vec3 u_xlat27;
mediump float u_xlat16_37;
vec2 u_xlat39;
mediump float u_xlat16_39;
int u_xlati39;
mediump vec2 u_xlat16_40;
float u_xlat41;
float u_xlat48;
mediump float u_xlat16_56;
float u_xlat57;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb3.x = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb3.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_4.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_4.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat5.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat57 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat5.xyz = vec3(u_xlat57) * u_xlat5.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat57 * u_xlat57;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_4.x = u_xlat57 * u_xlat16_56;
    u_xlat57 = (-u_xlat16_56) * u_xlat57 + 1.0;
    u_xlat16_6.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_6.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_0.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_7.xyz;
    u_xlat57 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_4.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat11.xyz = vec3(u_xlat59) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat59 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat11.xyz = vec3(u_xlat59) * u_xlat10.xyz;
    u_xlat63 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat64 = (-u_xlat63) * u_xlat16_19.x + u_xlat63;
    u_xlat64 = u_xlat63 * u_xlat64 + u_xlat16_19.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat63 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat3.xyz;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat65 = u_xlat12.x * u_xlat65 + u_xlat16_19.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat12.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat65;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat23 = u_xlat16_19.x + -1.0;
    u_xlat5.x = u_xlat5.x * u_xlat23 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_19.x / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat5.x = u_xlat64 * u_xlat5.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_5 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat5.x = u_xlat16_5 * _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat41 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat13.xyz = vec3(u_xlat41) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat41 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat41 = u_xlat41 * u_xlat23 + 1.0;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat64 = u_xlat16_19.x / u_xlat41;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat48 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat48 * u_xlat48;
    u_xlat16_37 = u_xlat48 * u_xlat16_37;
    u_xlat16_56 = u_xlat48 * u_xlat16_37;
    u_xlat16_4.x = u_xlat48 * u_xlat16_56;
    u_xlat48 = (-u_xlat16_56) * u_xlat48 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat48);
    u_xlat13.xyz = vec3(u_xlat57) * u_xlat16_4.xxx + u_xlat13.xyz;
    u_xlat48 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat48) * u_xlat16_19.x + u_xlat48;
    u_xlat66 = u_xlat48 * u_xlat66 + u_xlat16_19.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat48;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat65 * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat64 = u_xlat64 * u_xlat66;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_4.x = u_xlat16_56 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_61 = float(1.0) / float(u_xlat16_56);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat9.xyz;
    u_xlat16_56 = u_xlat16_4.x * u_xlat16_61;
    u_xlat16_4.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_4.x));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_4.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_4.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_4.x = u_xlat16_4.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_61);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_4.x;
    u_xlat16_16.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat9.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat9.xxx;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat11.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat23 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_19.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat21.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat39.x = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat39.x * u_xlat39.x;
    u_xlat16_56 = u_xlat39.x * u_xlat16_56;
    u_xlat16_56 = u_xlat39.x * u_xlat16_56;
    u_xlat16_4.x = u_xlat39.x * u_xlat16_56;
    u_xlat39.x = (-u_xlat16_56) * u_xlat39.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat39.xxx;
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_4.xxx + u_xlat9.xyz;
    u_xlat39.x = (-u_xlat21.x) * u_xlat16_19.x + u_xlat21.x;
    u_xlat39.x = u_xlat21.x * u_xlat39.x + u_xlat16_19.x;
    u_xlat39.x = sqrt(u_xlat39.x);
    u_xlat39.x = u_xlat39.x + u_xlat21.x;
    u_xlat39.x = u_xlat39.x + 6.10351563e-05;
    u_xlat39.x = u_xlat39.x * u_xlat65;
    u_xlat3.z = float(1.0) / u_xlat39.x;
    u_xlat3.xz = min(u_xlat3.xz, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat3.xzw = u_xlat9.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xzw = min(max(u_xlat3.xzw, 0.0), 1.0);
#else
    u_xlat3.xzw = clamp(u_xlat3.xzw, 0.0, 1.0);
#endif
    u_xlat3.xzw = u_xlat3.xzw * _DirectSpecularColor.xyz;
    u_xlat3.xzw = u_xlat21.xxx * u_xlat3.xzw;
    u_xlat3.xzw = u_xlat16_16.xyz * u_xlat3.xzw;
    u_xlat16_14.xyz = u_xlat3.xzw * u_xlat5.xxx + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_0.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_56) * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat16_4.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat5.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat63) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat48) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat21.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = (-u_xlat10.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_OcclusionScale) * u_xlat16_14.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_14.xyz = vec3(u_xlat16_56) * u_xlat16_14.xyz;
    u_xlat16_56 = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_58 = (-u_xlat16_56) + u_xlat16_58;
    u_xlat16_61 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_61 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_58 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
    u_xlat16_58 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 + -1.0;
    u_xlat16_58 = _OcclusionScale * u_xlat16_58 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat3.x = min(u_xlat16_56, 1.0);
    u_xlat21.x = min(u_xlat16_0.z, u_xlat3.x);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat21.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat21.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat21.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat21.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat21.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati21.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_58) * u_xlat16_17.xyz;
    u_xlati39 = int(int_bitfieldInsert(2,u_xlati21.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati39].xyz;
    u_xlati21.x = int(uint(uint(u_xlati21.x) & 1u));
    u_xlati39 = (u_xlati21.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati21.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati39].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_4.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat21.xyz = (-u_xlat11.xyz) * u_xlat16_4.xxx + (-u_xlat16_8.xyz);
    u_xlat9.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat21.xyz);
    u_xlat16_4.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat10.xyz * vec3(u_xlat59) + (-u_xlat21.xyz);
    u_xlat21.xyz = u_xlat16_19.xxx * u_xlat27.xyz + u_xlat21.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat21.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat21.xz);
    u_xlat14.y = u_xlat21.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_61 = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_21.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_21.xxx + u_xlat16_21.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_61);
    u_xlat16_15.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat21.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat21.xyz * u_xlat21.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb21 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb21)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_15.xyz;
    u_xlat16_1.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_56 = floor(u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_56 + 1.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 15.0);
    u_xlat16_1.x = u_xlat16_4.x * 16.0 + u_xlat16_1.z;
    u_xlat16_4.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21.x = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_1.x = u_xlat16_56 * 16.0 + u_xlat16_1.z;
    u_xlat16_4.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_56 = u_xlat16_4.z * 15.0 + (-u_xlat16_56);
    u_xlat16_4.x = (-u_xlat16_39) + u_xlat16_21.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_4.x + u_xlat16_39;
    u_xlat16_56 = u_xlat16_58 * u_xlat16_56;
    u_xlat21.x = u_xlat9.x * u_xlat16_56;
    u_xlat16_56 = u_xlat3.x * 0.5;
    u_xlat16_4.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_56 = u_xlat21.x * u_xlat16_4.x + u_xlat16_56;
    u_xlat16_4.x = u_xlat16_56 + u_xlat16_56;
    u_xlat16_22.x = (-u_xlat16_56) * 2.0 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_22.x + u_xlat16_4.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat3.x;
    u_xlat16_56 = min(u_xlat16_0.z, u_xlat16_56);
    u_xlat16_4.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_56 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat3.xy = u_xlat16_8.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_8.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_8.zz + u_xlat3.xy;
    u_xlat9.x = u_xlat3.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat3.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat9.y = u_xlat3.y * -0.0500000007 + u_xlat3.x;
    u_xlat3.y = u_xlat3.x * 1.5;
    u_xlat39.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat9.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat39.xy);
    u_xlat9.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat39.xy);
    u_xlat39.xy = u_xlat9.xy + vec2(0.5, 0.5);
    u_xlat16_4.x = _GlitterScale * 0.681690156;
    u_xlat39.xy = u_xlat39.xy * u_xlat16_4.xx;
    u_xlat16_9.xyz = texture(_GlitterTex, u_xlat39.xy).xyz;
    u_xlat3.x = vs_TEXCOORD3.x * 1.5;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_9.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_GlitterIntensity);
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * _GlitterColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_56) + u_xlat16_2.xyz;
    u_xlatb3.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_4.xy = (u_xlatb3.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_40.xy = (u_xlatb3.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_40.xy + u_xlat16_4.xy;
    u_xlat16_56 = (u_xlatb3.y) ? 0.0 : u_xlat16_4.x;
    u_xlat16_40.x = (u_xlatb3.y) ? u_xlat16_4.y : 0.0;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_40.x;
    u_xlat16_40.x = _Cutoff + -1.0;
    u_xlat16_56 = u_xlat16_40.x * -1.10000002 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 + -1.0;
    u_xlat16_56 = u_xlat16_56 * 2.0 + -0.0599999987;
    u_xlat3.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat3.xy = u_xlat3.xy * _DissolveTex_ST.zw;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = u_xlat16_4.xy * _DissolveTex_ST.xy + u_xlat3.xy;
    u_xlat16_3.x = texture(_DissolveTex, u_xlat3.xy).x;
    u_xlat16_56 = u_xlat16_56 * _DissolveEdgeShrink + u_xlat16_3.x;
    u_xlat16_4.x = dot(vec2(u_xlat16_56), vec2(_DissolveEdgeRange));
    u_xlat16_56 = u_xlat16_56 + (-_DissolveEdgeHard);
    u_xlat16_4.x = u_xlat16_4.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_58 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_58 = float(1.0) / u_xlat16_58;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_56 * -2.0 + 3.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_58;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_56) * u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_56;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
float u_xlat17;
mediump float u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
mediump float u_xlat16_27;
vec2 u_xlat34;
mediump float u_xlat16_34;
int u_xlati34;
float u_xlat35;
float u_xlat42;
mediump vec2 u_xlat16_44;
float u_xlat51;
bool u_xlatb51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
float u_xlat54;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
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
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat17 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_17 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_17 * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat17 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = max(u_xlat16_57, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_57 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_27 = float(1.0) / float(u_xlat16_57);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat16_57 = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb51 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb51)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb51 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb51) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_11.x);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_11.xyz = vec3(u_xlat16_57) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat2.x = (-u_xlat16_61) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_27 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_19.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_19.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_19.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat53 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_27) + u_xlat2.xyz;
    u_xlat16_27 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat3.x = (-u_xlat51) * u_xlat16_27 + u_xlat51;
    u_xlat3.x = u_xlat51 * u_xlat3.x + u_xlat16_27;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat51 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat8.x) * u_xlat16_27 + u_xlat8.x;
    u_xlat54 = u_xlat8.x * u_xlat54 + u_xlat16_27;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat3.w = u_xlat54 + u_xlat8.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat58 = u_xlat16_27 + -1.0;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat52 = u_xlat3.x * u_xlat52;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat9.xyz = vec3(u_xlat52) * u_xlat9.xyz;
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat3.x = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat3.x * u_xlat3.x;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_63 = u_xlat3.x * u_xlat16_62;
    u_xlat3.x = (-u_xlat16_62) * u_xlat3.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat9.xyz = vec3(u_xlat53) * vec3(u_xlat16_63) + u_xlat9.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat3.x) * u_xlat16_27 + u_xlat3.x;
    u_xlat42 = u_xlat3.x * u_xlat42 + u_xlat16_27;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat3.x + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat3.w * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat52 = u_xlat52 * u_xlat42;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_64 = float(1.0) / float(u_xlat16_62);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_62);
    u_xlat16_62 = u_xlat16_63 * u_xlat16_64;
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb52 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_16.xy = (bool(u_xlatb52)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_64);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_16.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_15.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_57 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat58 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_27 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat35 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35 * u_xlat35;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_62 = u_xlat35 * u_xlat16_57;
    u_xlat35 = (-u_xlat16_57) * u_xlat35 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat35);
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_62) + u_xlat2.xyz;
    u_xlat35 = (-u_xlat18.x) * u_xlat16_27 + u_xlat18.x;
    u_xlat35 = u_xlat18.x * u_xlat35 + u_xlat16_27;
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat18.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat35 * u_xlat3.w;
    u_xlat1.z = float(1.0) / u_xlat35;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat1.xzw = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat1.xzw = u_xlat1.xzw * _DirectSpecularColor.xyz;
    u_xlat1.xzw = u_xlat18.xxx * u_xlat1.xzw;
    u_xlat1.xzw = u_xlat16_16.xyz * u_xlat1.xzw;
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat17) + u_xlat16_14.xyz;
    u_xlat16_57 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_57) * u_xlat16_10.xzw;
    u_xlat16_15.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat51) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat18.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = vec3(u_xlat16_57) * u_xlat16_11.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_57) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_57;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_57));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_27) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_27 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_27);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (u_xlatb0.x) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_57 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.w * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_3.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_57 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD6.xy;
    u_xlat0.xy = vs_TEXCOORD5.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat1.x = u_xlat0.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat0.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat1.y = u_xlat0.y * -0.0500000007 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * 1.5;
    u_xlat34.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat34.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat34.xy);
    u_xlat34.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_10.x = _GlitterScale * 0.681690156;
    u_xlat34.xy = u_xlat34.xy * u_xlat16_10.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat34.xy).xyz;
    u_xlat0.x = vs_TEXCOORD3.x * 1.5;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_GlitterIntensity);
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _GlitterColor.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(u_xlat16_57) + u_xlat16_6.xyz;
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_10.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_44.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_44.xy + u_xlat16_10.xy;
    u_xlat16_57 = (u_xlatb0.y) ? 0.0 : u_xlat16_10.x;
    u_xlat16_44.x = (u_xlatb0.y) ? u_xlat16_10.y : 0.0;
    u_xlat16_57 = u_xlat16_57 + u_xlat16_44.x;
    u_xlat16_44.x = _Cutoff + -1.0;
    u_xlat16_57 = u_xlat16_44.x * -1.10000002 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = u_xlat16_57 * 2.0 + -0.0599999987;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_57 = u_xlat16_57 * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_57), vec2(_DissolveEdgeRange));
    u_xlat16_57 = u_xlat16_57 + (-_DissolveEdgeHard);
    u_xlat16_10.x = u_xlat16_10.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_61 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_61 = float(1.0) / u_xlat16_61;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * -2.0 + 3.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_57 = min(u_xlat16_57, 1.0);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_10.xyz;
    SV_Target0.w = u_xlat16_57;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
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
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
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
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
    vs_TEXCOORD8 = in_POSITION0;
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
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterMask;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
float u_xlat17;
mediump float u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
mediump float u_xlat16_27;
vec2 u_xlat34;
mediump float u_xlat16_34;
int u_xlati34;
float u_xlat35;
float u_xlat42;
mediump vec2 u_xlat16_44;
float u_xlat51;
bool u_xlatb51;
float u_xlat52;
bool u_xlatb52;
float u_xlat53;
float u_xlat54;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
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
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
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
    u_xlat17 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_17 = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_17 * _ShadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat17 = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = max(u_xlat16_57, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_57 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_27 = float(1.0) / float(u_xlat16_57);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat16_57 = u_xlat16_10.x * u_xlat16_27;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb51 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb51)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_57 = max(u_xlat16_57, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb51 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb51) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_11.x);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_11.xyz = vec3(u_xlat16_57) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_10.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat2.x = (-u_xlat16_61) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_27 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_19.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xzw = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_19.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_19.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat53 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat53 = min(max(u_xlat53, 0.0), 1.0);
#else
    u_xlat53 = clamp(u_xlat53, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_27) + u_xlat2.xyz;
    u_xlat16_27 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_27 = max(u_xlat16_27, 0.0078125);
    u_xlat3.x = (-u_xlat51) * u_xlat16_27 + u_xlat51;
    u_xlat3.x = u_xlat51 * u_xlat3.x + u_xlat16_27;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat51 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_57);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat8.x) * u_xlat16_27 + u_xlat8.x;
    u_xlat54 = u_xlat8.x * u_xlat54 + u_xlat16_27;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat3.w = u_xlat54 + u_xlat8.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat58 = u_xlat16_27 + -1.0;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat52 = u_xlat3.x * u_xlat52;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat9.xyz = vec3(u_xlat52) * u_xlat9.xyz;
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat58 + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat16_27 / u_xlat52;
    u_xlat52 = u_xlat52 * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat3.x = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat3.x * u_xlat3.x;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_62 = u_xlat3.x * u_xlat16_62;
    u_xlat16_63 = u_xlat3.x * u_xlat16_62;
    u_xlat3.x = (-u_xlat16_62) * u_xlat3.x + 1.0;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat9.xyz = vec3(u_xlat53) * vec3(u_xlat16_63) + u_xlat9.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat3.x) * u_xlat16_27 + u_xlat3.x;
    u_xlat42 = u_xlat3.x * u_xlat42 + u_xlat16_27;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = u_xlat3.x + u_xlat42;
    u_xlat42 = u_xlat42 + 6.10351563e-05;
    u_xlat42 = u_xlat3.w * u_xlat42;
    u_xlat42 = float(1.0) / u_xlat42;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat52 = u_xlat52 * u_xlat42;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat52);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.xyz;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_64 = float(1.0) / float(u_xlat16_62);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_62);
    u_xlat16_62 = u_xlat16_63 * u_xlat16_64;
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb52 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_16.xy = (bool(u_xlatb52)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_64);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_16.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_57) + u_xlat16_15.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_57 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat58 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_27 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat35 = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35 * u_xlat35;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_57 = u_xlat35 * u_xlat16_57;
    u_xlat16_62 = u_xlat35 * u_xlat16_57;
    u_xlat35 = (-u_xlat16_57) * u_xlat35 + 1.0;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(u_xlat35);
    u_xlat2.xyz = vec3(u_xlat53) * vec3(u_xlat16_62) + u_xlat2.xyz;
    u_xlat35 = (-u_xlat18.x) * u_xlat16_27 + u_xlat18.x;
    u_xlat35 = u_xlat18.x * u_xlat35 + u_xlat16_27;
    u_xlat35 = sqrt(u_xlat35);
    u_xlat35 = u_xlat35 + u_xlat18.x;
    u_xlat35 = u_xlat35 + 6.10351563e-05;
    u_xlat35 = u_xlat35 * u_xlat3.w;
    u_xlat1.z = float(1.0) / u_xlat35;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat1.xzw = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat1.xzw = u_xlat1.xzw * _DirectSpecularColor.xyz;
    u_xlat1.xzw = u_xlat18.xxx * u_xlat1.xzw;
    u_xlat1.xzw = u_xlat16_16.xyz * u_xlat1.xzw;
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat17) + u_xlat16_14.xyz;
    u_xlat16_57 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_57) * u_xlat16_10.xzw;
    u_xlat16_15.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat51) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat17) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat18.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = vec3(u_xlat16_57) * u_xlat16_11.xyz;
    u_xlat16_57 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_57) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_4.w * u_xlat16_57;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_57));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_14.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_15.y = u_xlat16_11.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_10.xzw = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_27) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_27 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_27);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_57) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (u_xlatb0.x) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_2.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_57 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.w * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_3.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xy = texture(_GlitterMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_57 = u_xlat16_0.y * u_xlat16_0.x;
    u_xlat0.xy = u_xlat16_13.yy * vs_TEXCOORD6.xy;
    u_xlat0.xy = vs_TEXCOORD5.xy * u_xlat16_13.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_13.zz + u_xlat0.xy;
    u_xlat1.x = u_xlat0.x * -0.0500000007 + vs_TEXCOORD3.x;
    u_xlat0.x = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat1.y = u_xlat0.y * -0.0500000007 + u_xlat0.x;
    u_xlat0.y = u_xlat0.x * 1.5;
    u_xlat34.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat34.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat34.xy);
    u_xlat34.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_10.x = _GlitterScale * 0.681690156;
    u_xlat34.xy = u_xlat34.xy * u_xlat16_10.xx;
    u_xlat16_1.xyz = texture(_GlitterTex, u_xlat34.xy).xyz;
    u_xlat0.x = vs_TEXCOORD3.x * 1.5;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_0.xyz = texture(_GlitterTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_GlitterIntensity);
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _GlitterColor.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(u_xlat16_57) + u_xlat16_6.xyz;
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_10.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_44.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_44.xy + u_xlat16_10.xy;
    u_xlat16_57 = (u_xlatb0.y) ? 0.0 : u_xlat16_10.x;
    u_xlat16_44.x = (u_xlatb0.y) ? u_xlat16_10.y : 0.0;
    u_xlat16_57 = u_xlat16_57 + u_xlat16_44.x;
    u_xlat16_44.x = _Cutoff + -1.0;
    u_xlat16_57 = u_xlat16_44.x * -1.10000002 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = u_xlat16_57 * 2.0 + -0.0599999987;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat16_10.xy * _DissolveTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_57 = u_xlat16_57 * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_57), vec2(_DissolveEdgeRange));
    u_xlat16_57 = u_xlat16_57 + (-_DissolveEdgeHard);
    u_xlat16_10.x = u_xlat16_10.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_61 = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_61 = float(1.0) / u_xlat16_61;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * -2.0 + 3.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat16_57 = min(u_xlat16_57, 1.0);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_10.xyz;
    SV_Target0.w = u_xlat16_57;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
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
  GpuProgramID 81633
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_FlowGlitterAndDissolveGUI"
}