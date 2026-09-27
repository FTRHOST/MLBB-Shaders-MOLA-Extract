//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_DoubleFlowLight_Glitter_ColorChang" {
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

_MaskTex ("闪点流光遮罩贴图", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightUpTex ("流光上层纹理", 2D) = "black" { }

_FlowLightUpColor ("流光上层颜色", Color) = (1,1,1,1)

_FlowLightDownTex ("流光下层纹理", 2D) = "black" { }

_FlowLightDownColor ("流光下层颜色", Color) = (1,1,1,1)

_FlowLightDownDepth ("流光下层深度", Range(0, 1)) = 1.0

_FlowLightUpFactory ("流光上层参数", Vector) = (1,1,1,1)

_FlowLightDownFactory ("流光下层参数", Vector) = (1,1,1,1)

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

[Tex] _laserMap ("RGB:镭射渐变图, A:镭射Mask", 2D) = "black" { }

_laserColor ("镭射颜色", Color) = (1,1,1,1)

_laserIntensity ("镭射强度", Float) = 1.0

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

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

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.0

_ShadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 2446
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
ivec4 u_xlati9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
int u_xlati18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_25;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
vec2 u_xlat48;
mediump vec2 u_xlat16_48;
float u_xlat54;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
float u_xlat67;
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
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_54 = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_3.x = u_xlat16_3.x * 2.0 + -0.0599999987;
    u_xlat16_21.x = u_xlat16_3.x * _SoftChangColorShrink + u_xlat16_54;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorShrink + u_xlat16_54;
    u_xlat16_39 = u_xlat16_21.x + -0.100000001;
    u_xlat16_21.x = dot(u_xlat16_21.xx, vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_21.x = u_xlat16_21.x + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_21.xxx * _SoftChangEdgeColor.zxy;
    u_xlat16_21.x = u_xlat16_39 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_39;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_3.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xxx * _ChangEdgeColor.zxy;
    u_xlat16_59 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_59;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_3.xxx + u_xlat16_21.xyz;
    u_xlat16_6.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_6.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.zxy;
    u_xlat16_6 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoChangColor.zxy + (-u_xlat16_7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xxx * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_21.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_57 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_5.xyz = vec3(u_xlat16_57) * u_xlat16_5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_57 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_57) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat54 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat16_57 = dot(u_xlat8.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_57) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_9.xyz = texture(_laserMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_9.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_9.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _laserColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat16_57 = dot(u_xlat16_5.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat16_57 = u_xlat16_57 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_9.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_7.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_5.xyz;
    u_xlat58 = u_xlat16_5.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat58) * vec3(u_xlat16_56) + u_xlat10.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat9.x = (-u_xlat62) * u_xlat16_19.x + u_xlat62;
    u_xlat9.x = u_xlat62 * u_xlat9.x + u_xlat16_19.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat62 + u_xlat9.x;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat9.w = u_xlat63 + u_xlat12.x;
    u_xlat9.xw = u_xlat9.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.w;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat64 = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_19.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat9.x = u_xlat9.x * u_xlat64;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat9.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_48.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat48.xy = u_xlat16_48.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat48.xy = min(max(u_xlat48.xy, 0.0), 1.0);
#else
    u_xlat48.xy = clamp(u_xlat48.xy, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * u_xlat48.xxx;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat13.xyz = u_xlat9.xxx * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat22 + 1.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat16_19.x / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.318309873;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat64 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat64 * u_xlat64;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_55 = u_xlat64 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat64 + 1.0;
    u_xlat13.xyz = u_xlat16_5.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat58) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat64 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat64) * u_xlat16_19.x + u_xlat64;
    u_xlat67 = u_xlat64 * u_xlat67 + u_xlat16_19.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat64 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat9.w * u_xlat67;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat9.x = u_xlat9.x * u_xlat67;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat9.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_55) * u_xlat10.xyz;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
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
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat18;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat16_1.x) * u_xlat18 + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat10.xyz = u_xlat16_5.xyz * u_xlat36.xxx;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_1.xxx + u_xlat10.xyz;
    u_xlat18 = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat18) * u_xlat16_19.x + u_xlat18;
    u_xlat36.x = u_xlat18 * u_xlat36.x + u_xlat16_19.x;
    u_xlat36.x = sqrt(u_xlat36.x);
    u_xlat36.x = u_xlat36.x + u_xlat18;
    u_xlat36.x = u_xlat36.x + 6.10351563e-05;
    u_xlat36.x = u_xlat36.x * u_xlat9.w;
    u_xlat0.z = float(1.0) / u_xlat36.x;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37 = float(1.0) / float(u_xlat16_37);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_37 = max(u_xlat16_16.x, u_xlat16_37);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_55 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_55, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat10.xyz = u_xlat16_1.xzw * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat48.yyy + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_9.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat48.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat48.yyy * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_25 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _OcclusionScale * u_xlat16_25 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18 = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat18) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati9.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati18 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati36 = (u_xlati9.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat9.xyw = (-u_xlat8.xyz) * u_xlat16_2.xxx + (-u_xlat16_11.xyz);
    u_xlat18 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_15.xyz, u_xlat9.xyw);
    u_xlat16_2.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_4.w);
    u_xlat16_20.x = u_xlat16_2.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_4.x = u_xlat16_20.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_4.x = u_xlat16_2.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_8.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20.x = u_xlat16_36 + (-u_xlat16_8.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20.x + u_xlat16_8.x;
    u_xlat16_2.x = u_xlat16_57 * u_xlat16_2.x;
    u_xlat18 = u_xlat18 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat18 * u_xlat16_20.x + u_xlat16_2.x;
    u_xlat16_20.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_9.z);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat54) + (-u_xlat9.xyw);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat9.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat12.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_20.xyz : u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_20.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_7.yzx + u_xlat16_14.yzx;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_20.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_11.yyy * vs_TEXCOORD8.xyz;
    u_xlat0.xyz = vs_TEXCOORD7.xyz * u_xlat16_11.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD9.xyz * u_xlat16_11.zzz + u_xlat0.xyz;
    u_xlat6.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat36.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat36.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat36.xy);
    u_xlat36.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_20.x = _GlitterScale * 0.681690156;
    u_xlat36.xy = u_xlat36.xy * u_xlat16_20.xx;
    u_xlat16_36 = texture(_MaskTex, u_xlat36.xy).y;
    u_xlat6.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat6.xy = u_xlat6.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_54 = texture(_MaskTex, u_xlat6.xy).y;
    u_xlat16_20.x = u_xlat16_36 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_20.x * _GlitterIntensity;
    u_xlat16_20.x = log2(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * _GlitterContrast;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_20.xyz = u_xlat16_20.xxx * _GlitterColor.zxy;
    u_xlat16_6.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_6.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb36 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_20.xy = (bool(u_xlatb36)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_7.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_20.xy = u_xlat16_20.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat16_20.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_20.xy = u_xlat16_20.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat36.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_20.xy;
    u_xlat16_8.xyz = texture(_FlowLightUpTex, u_xlat36.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_8.zxy * _FlowLightUpColor.zxy;
    u_xlat36.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_7.xy;
    u_xlat16_7.x = _FlowLightDownDepth * 0.5;
    u_xlat0.xy = (-u_xlat16_7.xx) * u_xlat0.xy + u_xlat36.xy;
    u_xlat16_0.xyz = texture(_FlowLightDownTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _FlowLightDownColor.zxy;
    u_xlat16_61 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_61) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_6.zzz * u_xlat16_7.xyz;
    u_xlat16_61 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat16_61);
    u_xlat16_20.xyz = u_xlat16_6.yyy * u_xlat16_20.xyz;
    u_xlat16_20.xyz = max(u_xlat16_7.xyz, u_xlat16_20.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_1.xyz;
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
    u_xlat54 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat3.x = u_xlat54 * 0.0625 + u_xlat3.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_18.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
ivec4 u_xlati9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
int u_xlati18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_25;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
vec2 u_xlat48;
mediump vec2 u_xlat16_48;
float u_xlat54;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
float u_xlat67;
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
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_54 = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_3.x = u_xlat16_3.x * 2.0 + -0.0599999987;
    u_xlat16_21.x = u_xlat16_3.x * _SoftChangColorShrink + u_xlat16_54;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorShrink + u_xlat16_54;
    u_xlat16_39 = u_xlat16_21.x + -0.100000001;
    u_xlat16_21.x = dot(u_xlat16_21.xx, vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_21.x = u_xlat16_21.x + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_21.xxx * _SoftChangEdgeColor.zxy;
    u_xlat16_21.x = u_xlat16_39 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_39;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_3.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xxx * _ChangEdgeColor.zxy;
    u_xlat16_59 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_59;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_3.xxx + u_xlat16_21.xyz;
    u_xlat16_6.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_6.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.zxy;
    u_xlat16_6 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoChangColor.zxy + (-u_xlat16_7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xxx * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_21.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_57 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_5.xyz = vec3(u_xlat16_57) * u_xlat16_5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_57 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_57) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat54 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat16_57 = dot(u_xlat8.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_57) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_9.xyz = texture(_laserMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_9.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_9.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _laserColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat16_57 = dot(u_xlat16_5.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat16_57 = u_xlat16_57 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_9.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_7.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_5.xyz;
    u_xlat58 = u_xlat16_5.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat58) * vec3(u_xlat16_56) + u_xlat10.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat9.x = (-u_xlat62) * u_xlat16_19.x + u_xlat62;
    u_xlat9.x = u_xlat62 * u_xlat9.x + u_xlat16_19.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat62 + u_xlat9.x;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat9.w = u_xlat63 + u_xlat12.x;
    u_xlat9.xw = u_xlat9.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.w;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat64 = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_19.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat9.x = u_xlat9.x * u_xlat64;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat9.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_48.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat48.xy = u_xlat16_48.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat48.xy = min(max(u_xlat48.xy, 0.0), 1.0);
#else
    u_xlat48.xy = clamp(u_xlat48.xy, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * u_xlat48.xxx;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat13.xyz = u_xlat9.xxx * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat22 + 1.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat16_19.x / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.318309873;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat64 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat64 * u_xlat64;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_55 = u_xlat64 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat64 + 1.0;
    u_xlat13.xyz = u_xlat16_5.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat58) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat64 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat64) * u_xlat16_19.x + u_xlat64;
    u_xlat67 = u_xlat64 * u_xlat67 + u_xlat16_19.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat64 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat9.w * u_xlat67;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat9.x = u_xlat9.x * u_xlat67;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat9.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_55) * u_xlat10.xyz;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
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
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat18;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat16_1.x) * u_xlat18 + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat10.xyz = u_xlat16_5.xyz * u_xlat36.xxx;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_1.xxx + u_xlat10.xyz;
    u_xlat18 = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat18) * u_xlat16_19.x + u_xlat18;
    u_xlat36.x = u_xlat18 * u_xlat36.x + u_xlat16_19.x;
    u_xlat36.x = sqrt(u_xlat36.x);
    u_xlat36.x = u_xlat36.x + u_xlat18;
    u_xlat36.x = u_xlat36.x + 6.10351563e-05;
    u_xlat36.x = u_xlat36.x * u_xlat9.w;
    u_xlat0.z = float(1.0) / u_xlat36.x;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.zxy;
    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37 = float(1.0) / float(u_xlat16_37);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_37 = max(u_xlat16_16.x, u_xlat16_37);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_55 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_55, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat10.xyz = u_xlat16_1.xzw * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat48.yyy + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_9.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat48.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat48.yyy * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_25 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _OcclusionScale * u_xlat16_25 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18 = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat18) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati9.xyw = ivec3(uvec3(lessThan(u_xlat16_16.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati18 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati36 = (u_xlati9.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat9.xyw = (-u_xlat8.xyz) * u_xlat16_2.xxx + (-u_xlat16_11.xyz);
    u_xlat18 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_15.xyz, u_xlat9.xyw);
    u_xlat16_2.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_4.w);
    u_xlat16_20.x = u_xlat16_2.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_4.x = u_xlat16_20.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_4.x = u_xlat16_2.x * 16.0 + u_xlat16_4.z;
    u_xlat16_3.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_8.x = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20.x = u_xlat16_36 + (-u_xlat16_8.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20.x + u_xlat16_8.x;
    u_xlat16_2.x = u_xlat16_57 * u_xlat16_2.x;
    u_xlat18 = u_xlat18 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat18 * u_xlat16_20.x + u_xlat16_2.x;
    u_xlat16_20.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_9.z);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat54) + (-u_xlat9.xyw);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat9.xyw;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat12.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_20.xyz : u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_20.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_7.yzx + u_xlat16_14.yzx;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_20.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_11.yyy * vs_TEXCOORD8.xyz;
    u_xlat0.xyz = vs_TEXCOORD7.xyz * u_xlat16_11.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD9.xyz * u_xlat16_11.zzz + u_xlat0.xyz;
    u_xlat6.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat36.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat36.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat36.xy);
    u_xlat36.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_20.x = _GlitterScale * 0.681690156;
    u_xlat36.xy = u_xlat36.xy * u_xlat16_20.xx;
    u_xlat16_36 = texture(_MaskTex, u_xlat36.xy).y;
    u_xlat6.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat6.xy = u_xlat6.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_54 = texture(_MaskTex, u_xlat6.xy).y;
    u_xlat16_20.x = u_xlat16_36 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_20.x * _GlitterIntensity;
    u_xlat16_20.x = log2(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * _GlitterContrast;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_20.xyz = u_xlat16_20.xxx * _GlitterColor.zxy;
    u_xlat16_6.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_6.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb36 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_20.xy = (bool(u_xlatb36)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_7.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_20.xy = u_xlat16_20.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat16_20.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_20.xy = u_xlat16_20.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat36.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_20.xy;
    u_xlat16_8.xyz = texture(_FlowLightUpTex, u_xlat36.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_8.zxy * _FlowLightUpColor.zxy;
    u_xlat36.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_7.xy;
    u_xlat16_7.x = _FlowLightDownDepth * 0.5;
    u_xlat0.xy = (-u_xlat16_7.xx) * u_xlat0.xy + u_xlat36.xy;
    u_xlat16_0.xyz = texture(_FlowLightDownTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _FlowLightDownColor.zxy;
    u_xlat16_61 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_61) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_6.zzz * u_xlat16_7.xyz;
    u_xlat16_61 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat16_61);
    u_xlat16_20.xyz = u_xlat16_6.yyy * u_xlat16_20.xyz;
    u_xlat16_20.xyz = max(u_xlat16_7.xyz, u_xlat16_20.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_20.xyz;
    u_xlat16_20.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_20.xyz + u_xlat16_1.xyz;
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
    u_xlat54 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat3.x = u_xlat54 * 0.0625 + u_xlat3.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_18.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(16) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
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
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
vec3 u_xlat22;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_37;
float u_xlat44;
mediump float u_xlat16_47;
float u_xlat54;
mediump float u_xlat16_54;
float u_xlat56;
bool u_xlatb56;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
float u_xlat63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
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
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28.x = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_12.xy).x;
    u_xlat16_60 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_60 = u_xlat16_60 * 2.0 + -0.0599999987;
    u_xlat16_64 = u_xlat16_60 * _SoftChangColorShrink + u_xlat16_1.x;
    u_xlat16_60 = u_xlat16_60 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_65 = u_xlat16_64 + -0.100000001;
    u_xlat16_64 = dot(vec2(u_xlat16_64), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_64 = u_xlat16_64 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = (-u_xlat16_64) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _SoftChangEdgeColor.zxy;
    u_xlat16_64 = u_xlat16_65 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
    u_xlat16_64 = dot(vec2(u_xlat16_60), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_60 = u_xlat16_60 + -0.100000001;
    u_xlat16_60 = u_xlat16_60 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = (-u_xlat16_64) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _ChangEdgeColor.zxy;
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat16_60) + u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_13.xy = vec2(u_xlat16_64) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_2.xyz = texture(_laserMap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _laserColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + u_xlat16_13.xyz;
    u_xlat16_64 = dot(u_xlat16_13.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2.x = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_3.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat4.xyz = u_xlat2.xxx * u_xlat4.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat4.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_10.x = u_xlat4.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat4.x * u_xlat16_10.x;
    u_xlat22.x = (-u_xlat16_10.x) * u_xlat4.x + 1.0;
    u_xlat16_10.x = u_xlat4.x * u_xlat16_10.x;
    u_xlat4.xyz = u_xlat16_13.xyz * u_xlat22.xxx;
    u_xlat58 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat16_10.xxx + u_xlat4.xyz;
    u_xlat16_10.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat61 = (-u_xlat2.x) * u_xlat16_10.x + u_xlat2.x;
    u_xlat61 = u_xlat2.x * u_xlat61 + u_xlat16_10.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat2.x + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_28.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat8.x) * u_xlat16_10.x + u_xlat8.x;
    u_xlat44 = u_xlat8.x * u_xlat44 + u_xlat16_10.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat8.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat44;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat62 = u_xlat16_10.x + -1.0;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_10.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat56 = u_xlat61 * u_xlat56;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat18.xxx * u_xlat4.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_10.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat61 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat61 * u_xlat61;
    u_xlat16_65 = u_xlat61 * u_xlat16_65;
    u_xlat16_65 = u_xlat61 * u_xlat16_65;
    u_xlat16_66 = u_xlat61 * u_xlat16_65;
    u_xlat61 = (-u_xlat16_65) * u_xlat61 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat58) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat61) * u_xlat16_10.x + u_xlat61;
    u_xlat63 = u_xlat61 * u_xlat63 + u_xlat16_10.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat61 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat44 * u_xlat63;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat56 = u_xlat56 * u_xlat63;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat62 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat19 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19 * u_xlat19;
    u_xlat16_60 = u_xlat19 * u_xlat16_60;
    u_xlat16_60 = u_xlat19 * u_xlat16_60;
    u_xlat37 = (-u_xlat16_60) * u_xlat19 + 1.0;
    u_xlat16_60 = u_xlat19 * u_xlat16_60;
    u_xlat4.xyz = u_xlat16_13.xyz * vec3(u_xlat37);
    u_xlat4.xyz = vec3(u_xlat58) * vec3(u_xlat16_60) + u_xlat4.xyz;
    u_xlat19 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat37 = (-u_xlat19) * u_xlat16_10.x + u_xlat19;
    u_xlat37 = u_xlat19 * u_xlat37 + u_xlat16_10.x;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat19;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat37 = u_xlat37 * u_xlat44;
    u_xlat1.z = float(1.0) / u_xlat37;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_16.x, u_xlat16_65);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_66);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat18.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat2.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat61) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat19) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_67 + 1.0;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_67 = dot((-u_xlat16_28.xyz), u_xlat7.xyz);
    u_xlat16_67 = u_xlat16_67 + u_xlat16_67;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_67) + (-u_xlat16_28.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_4.w);
    u_xlat16_29.x = u_xlat16_11.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_4.x = u_xlat16_29.x * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_4.x = u_xlat16_11.x * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_37 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_29.x = (-u_xlat16_37) + u_xlat16_19;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_29.x + u_xlat16_37;
    u_xlat16_11.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_29.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_29.x + u_xlat16_11.x;
    u_xlat16_29.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_47 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_47 + u_xlat16_29.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_2.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_10.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat8.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_29.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_10.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_29.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_13.yzx + u_xlat16_14.yzx;
    u_xlat16_60 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_60;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_28.yyy * vs_TEXCOORD8.xyz;
    u_xlat0.xyz = vs_TEXCOORD7.xyz * u_xlat16_28.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD9.xyz * u_xlat16_28.zzz + u_xlat0.xyz;
    u_xlat1.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat36.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat36.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat36.xy);
    u_xlat36.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_28.x = _GlitterScale * 0.681690156;
    u_xlat36.xy = u_xlat36.xy * u_xlat16_28.xx;
    u_xlat16_36 = texture(_MaskTex, u_xlat36.xy).y;
    u_xlat1.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_54 = texture(_MaskTex, u_xlat1.xy).y;
    u_xlat16_28.x = u_xlat16_36 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = u_xlat16_28.x * _GlitterIntensity;
    u_xlat16_28.x = log2(u_xlat16_28.x);
    u_xlat16_28.x = u_xlat16_28.x * _GlitterContrast;
    u_xlat16_28.x = exp2(u_xlat16_28.x);
    u_xlat16_28.xyz = u_xlat16_28.xxx * _GlitterColor.zxy;
    u_xlat16_1.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_6.xyz = u_xlat16_28.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb36 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_28.xy = (bool(u_xlatb36)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_11.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_28.xy = u_xlat16_28.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_28.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_28.xy = u_xlat16_28.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat36.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_28.xy;
    u_xlat16_2.xyz = texture(_FlowLightUpTex, u_xlat36.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_2.zxy * _FlowLightUpColor.zxy;
    u_xlat36.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_11.xy;
    u_xlat16_11.x = _FlowLightDownDepth * 0.5;
    u_xlat0.xy = (-u_xlat16_11.xx) * u_xlat0.xy + u_xlat36.xy;
    u_xlat16_0.xyz = texture(_FlowLightDownTex, u_xlat0.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * _FlowLightDownColor.zxy;
    u_xlat16_65 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_65) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_1.zzz * u_xlat16_11.xyz;
    u_xlat16_65 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat16_65);
    u_xlat16_28.xyz = u_xlat16_1.yyy * u_xlat16_28.xyz;
    u_xlat16_28.xyz = max(u_xlat16_11.xyz, u_xlat16_28.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_28.xyz;
    u_xlat16_28.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_28.xyz + u_xlat16_6.xyz;
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
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_60 : u_xlat16_10.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(16) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
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
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
vec3 u_xlat22;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_37;
float u_xlat44;
mediump float u_xlat16_47;
float u_xlat54;
mediump float u_xlat16_54;
float u_xlat56;
bool u_xlatb56;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
float u_xlat63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
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
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28.x = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_12.xy).x;
    u_xlat16_60 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_60 = u_xlat16_60 * 2.0 + -0.0599999987;
    u_xlat16_64 = u_xlat16_60 * _SoftChangColorShrink + u_xlat16_1.x;
    u_xlat16_60 = u_xlat16_60 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_65 = u_xlat16_64 + -0.100000001;
    u_xlat16_64 = dot(vec2(u_xlat16_64), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_64 = u_xlat16_64 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = (-u_xlat16_64) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _SoftChangEdgeColor.zxy;
    u_xlat16_64 = u_xlat16_65 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
    u_xlat16_64 = dot(vec2(u_xlat16_60), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_60 = u_xlat16_60 + -0.100000001;
    u_xlat16_60 = u_xlat16_60 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = (-u_xlat16_64) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _ChangEdgeColor.zxy;
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat16_60) + u_xlat16_12.xyz;
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_1.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_13.xy = vec2(u_xlat16_64) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_2.xyz = texture(_laserMap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _laserColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + u_xlat16_13.xyz;
    u_xlat16_64 = dot(u_xlat16_13.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2.x = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_3.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat4.xyz = u_xlat2.xxx * u_xlat4.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat4.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat4.x * u_xlat4.x;
    u_xlat16_10.x = u_xlat4.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat4.x * u_xlat16_10.x;
    u_xlat22.x = (-u_xlat16_10.x) * u_xlat4.x + 1.0;
    u_xlat16_10.x = u_xlat4.x * u_xlat16_10.x;
    u_xlat4.xyz = u_xlat16_13.xyz * u_xlat22.xxx;
    u_xlat58 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat16_10.xxx + u_xlat4.xyz;
    u_xlat16_10.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat61 = (-u_xlat2.x) * u_xlat16_10.x + u_xlat2.x;
    u_xlat61 = u_xlat2.x * u_xlat61 + u_xlat16_10.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat2.x + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_28.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat8.x) * u_xlat16_10.x + u_xlat8.x;
    u_xlat44 = u_xlat8.x * u_xlat44 + u_xlat16_10.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat8.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat44;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat62 = u_xlat16_10.x + -1.0;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_10.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat56 = u_xlat61 * u_xlat56;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat18.xxx * u_xlat4.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_10.x / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat61 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat61 * u_xlat61;
    u_xlat16_65 = u_xlat61 * u_xlat16_65;
    u_xlat16_65 = u_xlat61 * u_xlat16_65;
    u_xlat16_66 = u_xlat61 * u_xlat16_65;
    u_xlat61 = (-u_xlat16_65) * u_xlat61 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat61);
    u_xlat9.xyz = vec3(u_xlat58) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat61) * u_xlat16_10.x + u_xlat61;
    u_xlat63 = u_xlat61 * u_xlat63 + u_xlat16_10.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat61 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat44 * u_xlat63;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat56 = u_xlat56 * u_xlat63;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat62 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat19 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19 * u_xlat19;
    u_xlat16_60 = u_xlat19 * u_xlat16_60;
    u_xlat16_60 = u_xlat19 * u_xlat16_60;
    u_xlat37 = (-u_xlat16_60) * u_xlat19 + 1.0;
    u_xlat16_60 = u_xlat19 * u_xlat16_60;
    u_xlat4.xyz = u_xlat16_13.xyz * vec3(u_xlat37);
    u_xlat4.xyz = vec3(u_xlat58) * vec3(u_xlat16_60) + u_xlat4.xyz;
    u_xlat19 = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat37 = (-u_xlat19) * u_xlat16_10.x + u_xlat19;
    u_xlat37 = u_xlat19 * u_xlat37 + u_xlat16_10.x;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 + u_xlat19;
    u_xlat37 = u_xlat37 + 6.10351563e-05;
    u_xlat37 = u_xlat37 * u_xlat44;
    u_xlat1.z = float(1.0) / u_xlat37;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_16.x, u_xlat16_65);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_66 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_66);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat18.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat2.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat61) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat19) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_67 + 1.0;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_67 = dot((-u_xlat16_28.xyz), u_xlat7.xyz);
    u_xlat16_67 = u_xlat16_67 + u_xlat16_67;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_67) + (-u_xlat16_28.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_4.w);
    u_xlat16_29.x = u_xlat16_11.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_4.x = u_xlat16_29.x * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_4.x = u_xlat16_11.x * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_37 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_29.x = (-u_xlat16_37) + u_xlat16_19;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_29.x + u_xlat16_37;
    u_xlat16_11.x = u_xlat16_65 * u_xlat16_11.x;
    u_xlat1.x = u_xlat1.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_29.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat1.x * u_xlat16_29.x + u_xlat16_11.x;
    u_xlat16_29.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_47 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_47 + u_xlat16_29.x;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_2.z, u_xlat16_11.x);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_10.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat8.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_29.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_10.x);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_29.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_13.yzx + u_xlat16_14.yzx;
    u_xlat16_60 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_60;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_28.yyy * vs_TEXCOORD8.xyz;
    u_xlat0.xyz = vs_TEXCOORD7.xyz * u_xlat16_28.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD9.xyz * u_xlat16_28.zzz + u_xlat0.xyz;
    u_xlat1.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat36.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat36.xy);
    u_xlat1.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat36.xy);
    u_xlat36.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_28.x = _GlitterScale * 0.681690156;
    u_xlat36.xy = u_xlat36.xy * u_xlat16_28.xx;
    u_xlat16_36 = texture(_MaskTex, u_xlat36.xy).y;
    u_xlat1.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_54 = texture(_MaskTex, u_xlat1.xy).y;
    u_xlat16_28.x = u_xlat16_36 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.x = min(max(u_xlat16_28.x, 0.0), 1.0);
#else
    u_xlat16_28.x = clamp(u_xlat16_28.x, 0.0, 1.0);
#endif
    u_xlat16_28.x = u_xlat16_28.x * _GlitterIntensity;
    u_xlat16_28.x = log2(u_xlat16_28.x);
    u_xlat16_28.x = u_xlat16_28.x * _GlitterContrast;
    u_xlat16_28.x = exp2(u_xlat16_28.x);
    u_xlat16_28.xyz = u_xlat16_28.xxx * _GlitterColor.zxy;
    u_xlat16_1.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_6.xyz = u_xlat16_28.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb36 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_28.xy = (bool(u_xlatb36)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_11.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_28.xy = u_xlat16_28.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_28.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_28.xy = u_xlat16_28.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat36.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_28.xy;
    u_xlat16_2.xyz = texture(_FlowLightUpTex, u_xlat36.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_2.zxy * _FlowLightUpColor.zxy;
    u_xlat36.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_11.xy;
    u_xlat16_11.x = _FlowLightDownDepth * 0.5;
    u_xlat0.xy = (-u_xlat16_11.xx) * u_xlat0.xy + u_xlat36.xy;
    u_xlat16_0.xyz = texture(_FlowLightDownTex, u_xlat0.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * _FlowLightDownColor.zxy;
    u_xlat16_65 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_65) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_1.zzz * u_xlat16_11.xyz;
    u_xlat16_65 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat16_65);
    u_xlat16_28.xyz = u_xlat16_1.yyy * u_xlat16_28.xyz;
    u_xlat16_28.xyz = max(u_xlat16_11.xyz, u_xlat16_28.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_28.xyz;
    u_xlat16_28.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_28.xyz + u_xlat16_6.xyz;
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
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_60 : u_xlat16_10.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
ivec4 u_xlati8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat14;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_21;
float u_xlat22;
int u_xlati22;
float u_xlat28;
mediump vec2 u_xlat16_29;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_35;
float u_xlat42;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
float u_xlat50;
bool u_xlatb50;
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
    u_xlat16_15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_29.xxx;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat16_29.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_29.yyy + u_xlat16_3.xyz;
    u_xlat16_43 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_15 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15 = float(1.0) / float(u_xlat16_15);
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_15 = u_xlat16_43 * u_xlat16_15;
    u_xlat16_15 = max(u_xlat16_29.x, u_xlat16_15);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_15;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_43 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_43 = u_xlat16_43 * 2.0 + -0.0599999987;
    u_xlat16_43 = u_xlat16_43 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_44 = dot(vec2(u_xlat16_43), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_43 = u_xlat16_43 + -0.100000001;
    u_xlat16_43 = u_xlat16_43 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = (-u_xlat16_44) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * _ChangEdgeColor.zxy;
    u_xlat16_44 = u_xlat16_43 * -2.0 + 3.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_44;
    u_xlat16_43 = min(u_xlat16_43, 1.0);
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.zxy + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_43) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_4.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_43 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_4.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_44 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_44) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat48);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat48 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = vec3(u_xlat48) * u_xlat6.xyz;
    u_xlat16_44 = dot(u_xlat7.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_44) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_8.xyz = texture(_laserMap, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _laserColor.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat16_44 = dot(u_xlat16_4.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_49 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_49;
    u_xlat16_44 = u_xlat16_44 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_8.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_44 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat9.xxx;
    u_xlat49 = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat49);
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat49 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat49) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat9.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_16.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat16_16.x = max(u_xlat16_16.x, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_16.x);
    u_xlat16_5.xyz = u_xlat16_30.xxx * u_xlat9.xzw;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb50 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat16_30.xy = (bool(u_xlatb50)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_30.yyy + u_xlat16_10.xyz;
    u_xlat16_44 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_5.xyz);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_44);
    u_xlat16_44 = u_xlat16_16.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16.x = float(1.0) / float(u_xlat16_16.x);
    u_xlat16_44 = (-u_xlat16_44) * u_xlat16_44 + 1.0;
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_16.x = u_xlat16_44 * u_xlat16_16.x;
    u_xlat16_16.x = max(u_xlat16_30.x, u_xlat16_16.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_16.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat9.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat50) + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_45 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat8.x = (-u_xlat49) * u_xlat16_45 + u_xlat49;
    u_xlat8.x = u_xlat49 * u_xlat8.x + u_xlat16_45;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat49 + u_xlat8.x;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_43);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_45 + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_45;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat8.y = u_xlat22 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_43) + 1.0;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat28 = u_xlat16_45 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat28 + 1.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat16_45 / u_xlat14;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat14 = min(u_xlat14, 16.0);
    u_xlat14 = u_xlat8.x * u_xlat14;
    u_xlat16_43 = u_xlat0.x * u_xlat0.x;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_46 = u_xlat0.x * u_xlat16_43;
    u_xlat0.x = (-u_xlat16_43) * u_xlat0.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyw = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.xyw = u_xlat0.xxx * vec3(u_xlat16_46) + u_xlat8.xyw;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat49) * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_11.xyz = vec3(u_xlat16_43) * u_xlat16_11.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_43 * 0.5 + 0.5;
    u_xlat16_16.x = (-u_xlat16_43) + u_xlat16_16.x;
    u_xlat16_46 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_46 + 1.0;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_16.x + u_xlat16_43;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_43;
    u_xlat16_16.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_16.x + -1.0;
    u_xlat16_16.x = _OcclusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_16.x;
    u_xlat49 = min(u_xlat16_43, 1.0);
    u_xlat8.x = min(u_xlat49, u_xlat16_8.z);
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat8.xxx + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat8.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.zxy;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_12.y = u_xlat16_11.y;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = u_xlat16_16.xxx * u_xlat16_13.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati8.x = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati22 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati8.x].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_43 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat8.xyw = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_5.xyz);
    u_xlat7.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_11.xyz, u_xlat8.xyw);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_5.w);
    u_xlat16_44 = u_xlat16_30.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_5.x = u_xlat16_44 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_30.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_35 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_30.x = u_xlat16_4.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_44 = (-u_xlat16_35) + u_xlat16_21;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_44 + u_xlat16_35;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_30.x;
    u_xlat7.x = u_xlat7.x * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat49 * 0.5;
    u_xlat16_30.x = (-u_xlat49) * 0.5 + 1.0;
    u_xlat16_16.x = u_xlat7.x * u_xlat16_30.x + u_xlat16_16.x;
    u_xlat16_30.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat16_44 = (-u_xlat16_16.x) * 2.0 + 1.0;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_44 + u_xlat16_30.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat49;
    u_xlat16_16.x = min(u_xlat16_16.x, u_xlat16_8.z);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat48) + (-u_xlat8.xyw);
    u_xlat6.xyz = vec3(u_xlat16_45) * u_xlat6.xyz + u_xlat8.xyw;
    u_xlat16_30.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_30.x);
    u_xlat16_2.xzw = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_43) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb6 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xxx * u_xlat16_2.xzw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_43 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_43;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_16.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_16.xyz + u_xlat16_1.xyz;
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
    u_xlat42 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat42);
    u_xlat3.x = u_xlat42 * 0.0625 + u_xlat3.y;
    u_xlat16_14.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_14.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_43 : u_xlat16_2.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
ivec4 u_xlati8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat14;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_21;
float u_xlat22;
int u_xlati22;
float u_xlat28;
mediump vec2 u_xlat16_29;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_35;
float u_xlat42;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
float u_xlat50;
bool u_xlatb50;
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
    u_xlat16_15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_29.xxx;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat16_29.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_29.yyy + u_xlat16_3.xyz;
    u_xlat16_43 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_15 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15 = float(1.0) / float(u_xlat16_15);
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_15 = u_xlat16_43 * u_xlat16_15;
    u_xlat16_15 = max(u_xlat16_29.x, u_xlat16_15);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_15;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_43 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_43 = u_xlat16_43 * 2.0 + -0.0599999987;
    u_xlat16_43 = u_xlat16_43 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_44 = dot(vec2(u_xlat16_43), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_43 = u_xlat16_43 + -0.100000001;
    u_xlat16_43 = u_xlat16_43 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = (-u_xlat16_44) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * _ChangEdgeColor.zxy;
    u_xlat16_44 = u_xlat16_43 * -2.0 + 3.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_44;
    u_xlat16_43 = min(u_xlat16_43, 1.0);
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.zxy * u_xlat16_4.xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.zxy * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.zxy + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_43) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_4.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_43 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_4.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_44 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_44) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat48);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat48 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = vec3(u_xlat48) * u_xlat6.xyz;
    u_xlat16_44 = dot(u_xlat7.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_44) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_8.xyz = texture(_laserMap, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _laserColor.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat16_44 = dot(u_xlat16_4.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_49 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_49;
    u_xlat16_44 = u_xlat16_44 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_8.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_44 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat9.xxx;
    u_xlat49 = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat49);
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat49 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat49) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat9.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_16.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat16_16.x = max(u_xlat16_16.x, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_16.x);
    u_xlat16_5.xyz = u_xlat16_30.xxx * u_xlat9.xzw;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb50 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat16_30.xy = (bool(u_xlatb50)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_30.yyy + u_xlat16_10.xyz;
    u_xlat16_44 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_5.xyz);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_44);
    u_xlat16_44 = u_xlat16_16.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16.x = float(1.0) / float(u_xlat16_16.x);
    u_xlat16_44 = (-u_xlat16_44) * u_xlat16_44 + 1.0;
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_16.x = u_xlat16_44 * u_xlat16_16.x;
    u_xlat16_16.x = max(u_xlat16_30.x, u_xlat16_16.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_16.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat9.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat50) + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_45 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat8.x = (-u_xlat49) * u_xlat16_45 + u_xlat49;
    u_xlat8.x = u_xlat49 * u_xlat8.x + u_xlat16_45;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat49 + u_xlat8.x;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_43);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_45 + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_45;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat8.y = u_xlat22 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_43) + 1.0;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat28 = u_xlat16_45 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat28 + 1.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat16_45 / u_xlat14;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat14 = min(u_xlat14, 16.0);
    u_xlat14 = u_xlat8.x * u_xlat14;
    u_xlat16_43 = u_xlat0.x * u_xlat0.x;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_46 = u_xlat0.x * u_xlat16_43;
    u_xlat0.x = (-u_xlat16_43) * u_xlat0.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyw = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.xyw = u_xlat0.xxx * vec3(u_xlat16_46) + u_xlat8.xyw;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat49) * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_11.xyz = vec3(u_xlat16_43) * u_xlat16_11.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_43 * 0.5 + 0.5;
    u_xlat16_16.x = (-u_xlat16_43) + u_xlat16_16.x;
    u_xlat16_46 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_46 + 1.0;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_16.x + u_xlat16_43;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_43;
    u_xlat16_16.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_16.x + -1.0;
    u_xlat16_16.x = _OcclusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_16.x;
    u_xlat49 = min(u_xlat16_43, 1.0);
    u_xlat8.x = min(u_xlat49, u_xlat16_8.z);
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat8.xxx + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat8.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.zxy;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_12.y = u_xlat16_11.y;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = u_xlat16_16.xxx * u_xlat16_13.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati8.x = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati22 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati8.x].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_43 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat8.xyw = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_5.xyz);
    u_xlat7.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_11.xyz, u_xlat8.xyw);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_5.w);
    u_xlat16_44 = u_xlat16_30.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_5.x = u_xlat16_44 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_30.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_35 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_30.x = u_xlat16_4.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_44 = (-u_xlat16_35) + u_xlat16_21;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_44 + u_xlat16_35;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_30.x;
    u_xlat7.x = u_xlat7.x * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat49 * 0.5;
    u_xlat16_30.x = (-u_xlat49) * 0.5 + 1.0;
    u_xlat16_16.x = u_xlat7.x * u_xlat16_30.x + u_xlat16_16.x;
    u_xlat16_30.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat16_44 = (-u_xlat16_16.x) * 2.0 + 1.0;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_44 + u_xlat16_30.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat49;
    u_xlat16_16.x = min(u_xlat16_16.x, u_xlat16_8.z);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat48) + (-u_xlat8.xyw);
    u_xlat6.xyz = vec3(u_xlat16_45) * u_xlat6.xyz + u_xlat8.xyw;
    u_xlat16_30.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_30.x);
    u_xlat16_2.xzw = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_43) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb6 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xxx * u_xlat16_2.xzw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_43 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_43;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_3.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_16.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_16.xyz + u_xlat16_1.xyz;
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
    u_xlat42 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat42);
    u_xlat3.x = u_xlat42 * 0.0625 + u_xlat3.y;
    u_xlat16_14.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_14.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_43 : u_xlat16_2.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_30;
float u_xlat36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
float u_xlat56;
bool u_xlatb56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
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
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_10.xy).x;
    u_xlat16_60 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_60 = u_xlat16_60 * 2.0 + -0.0599999987;
    u_xlat16_60 = u_xlat16_60 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_60), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_60 = u_xlat16_60 + -0.100000001;
    u_xlat16_60 = u_xlat16_60 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _ChangEdgeColor.zxy;
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _AlbedoChangColor.zxy + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat16_60) + u_xlat16_11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_64) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_2.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_2.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_2.zxy * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_10.xyz) + u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2.x = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * _laserColor.w;
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_64 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat56) * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat56) + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_60) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_60 = u_xlat1.x * u_xlat1.x;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_65 = u_xlat1.x * u_xlat16_60;
    u_xlat1.x = (-u_xlat16_60) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_4.x = u_xlat16_30.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = (-u_xlat16_25) + u_xlat16_7;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_25;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_12.x;
    u_xlat56 = u_xlat56 * u_xlat16_65;
    u_xlat16_65 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat56 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_12.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_65 = u_xlat0.y * u_xlat16_65;
    u_xlat16_65 = min(u_xlat16_2.z, u_xlat16_65);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_64) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_64 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_64);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
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
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
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
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_30;
float u_xlat36;
int u_xlati36;
float u_xlat37;
float u_xlat54;
float u_xlat56;
bool u_xlatb56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
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
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_10.xy).x;
    u_xlat16_60 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_60 = u_xlat16_60 * 2.0 + -0.0599999987;
    u_xlat16_60 = u_xlat16_60 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_60), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_60 = u_xlat16_60 + -0.100000001;
    u_xlat16_60 = u_xlat16_60 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _ChangEdgeColor.zxy;
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _AlbedoChangColor.zxy + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat16_60) + u_xlat16_11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_64) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_2.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_2.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_2.zxy * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_10.xyz) + u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2.x = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * _laserColor.w;
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_64 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat56) * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat56) + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_60) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_60 = u_xlat1.x * u_xlat1.x;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_65 = u_xlat1.x * u_xlat16_60;
    u_xlat1.x = (-u_xlat16_60) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.zxy;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_4.x = u_xlat16_30.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = (-u_xlat16_25) + u_xlat16_7;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_25;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_12.x;
    u_xlat56 = u_xlat56 * u_xlat16_65;
    u_xlat16_65 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat56 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_12.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_65 = u_xlat0.y * u_xlat16_65;
    u_xlat16_65 = min(u_xlat16_2.z, u_xlat16_65);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_64) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_64 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_64);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
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
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
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
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
int u_xlati18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat48;
float u_xlat54;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
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
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_54 = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_3.x = u_xlat16_3.x * 2.0 + -0.0599999987;
    u_xlat16_21.x = u_xlat16_3.x * _SoftChangColorShrink + u_xlat16_54;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorShrink + u_xlat16_54;
    u_xlat16_39 = u_xlat16_21.x + -0.100000001;
    u_xlat16_21.x = dot(u_xlat16_21.xx, vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_21.x = u_xlat16_21.x + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_21.xxx * _SoftChangEdgeColor.xyz;
    u_xlat16_21.x = u_xlat16_39 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_39;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_3.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xxx * _ChangEdgeColor.xyz;
    u_xlat16_59 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_59;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_3.xxx + u_xlat16_21.xyz;
    u_xlat16_6.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_6 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoChangColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xxx * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_21.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_57 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_5.xyz = vec3(u_xlat16_57) * u_xlat16_5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_57 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_57) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat54 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat16_57 = dot(u_xlat8.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_57) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_9.xyz = texture(_laserMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _laserColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat16_57 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat16_57 = u_xlat16_57 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_9.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_7.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_5.xyz;
    u_xlat58 = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat58) * vec3(u_xlat16_56) + u_xlat10.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat9.x = (-u_xlat62) * u_xlat16_19.x + u_xlat62;
    u_xlat9.x = u_xlat62 * u_xlat9.x + u_xlat16_19.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat62 + u_xlat9.x;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat9.w = u_xlat63 + u_xlat12.x;
    u_xlat9.xw = u_xlat9.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.w;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat9.x * u_xlat4.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat4.xxx * u_xlat10.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat13.xyz = u_xlat9.xxx * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat22 + 1.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat16_19.x / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.318309873;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat64 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat64 * u_xlat64;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_55 = u_xlat64 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat64 + 1.0;
    u_xlat13.xyz = u_xlat16_5.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat58) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat64 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat64) * u_xlat16_19.x + u_xlat64;
    u_xlat48 = u_xlat64 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat64 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat9.w * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat9.x = u_xlat9.x * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat9.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_55) * u_xlat10.xyz;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
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
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat18;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat16_1.x) * u_xlat18 + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat10.xyz = u_xlat16_5.xyz * u_xlat36.xxx;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_1.xxx + u_xlat10.xyz;
    u_xlat18 = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat18) * u_xlat16_19.x + u_xlat18;
    u_xlat36.x = u_xlat18 * u_xlat36.x + u_xlat16_19.x;
    u_xlat36.x = sqrt(u_xlat36.x);
    u_xlat36.x = u_xlat36.x + u_xlat18;
    u_xlat36.x = u_xlat36.x + 6.10351563e-05;
    u_xlat36.x = u_xlat36.x * u_xlat9.w;
    u_xlat0.z = float(1.0) / u_xlat36.x;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37 = float(1.0) / float(u_xlat16_37);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_37 = max(u_xlat16_16.x, u_xlat16_37);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_55 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_55, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat16_1.xzw * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_9.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18 = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat18) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati18 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati36 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat4.xyz = (-u_xlat8.xyz) * u_xlat16_2.xxx + (-u_xlat16_11.xyz);
    u_xlat18 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_15.xyz, u_xlat4.xyz);
    u_xlat16_2.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_8.w);
    u_xlat16_20.x = u_xlat16_2.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_8.x = u_xlat16_20.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_8.x = u_xlat16_2.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20.x = u_xlat16_36 + (-u_xlat16_58);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20.x + u_xlat16_58;
    u_xlat16_2.x = u_xlat16_57 * u_xlat16_2.x;
    u_xlat18 = u_xlat18 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat18 * u_xlat16_20.x + u_xlat16_2.x;
    u_xlat16_20.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_9.z);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat54) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat12.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_20.xyz : u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_20.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_20.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_11.yyy * vs_TEXCOORD8.xyz;
    u_xlat0.xyz = vs_TEXCOORD7.xyz * u_xlat16_11.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD9.xyz * u_xlat16_11.zzz + u_xlat0.xyz;
    u_xlat4.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat36.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat36.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat36.xy);
    u_xlat36.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_20.x = _GlitterScale * 0.681690156;
    u_xlat36.xy = u_xlat36.xy * u_xlat16_20.xx;
    u_xlat16_36 = texture(_MaskTex, u_xlat36.xy).y;
    u_xlat4.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_54 = texture(_MaskTex, u_xlat4.xy).y;
    u_xlat16_20.x = u_xlat16_36 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_20.x * _GlitterIntensity;
    u_xlat16_20.x = log2(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * _GlitterContrast;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_20.xyz = u_xlat16_20.xxx * _GlitterColor.xyz;
    u_xlat16_4.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_4.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb36 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_20.xy = (bool(u_xlatb36)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_5.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_20.xy = u_xlat16_20.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_20.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_20.xy = u_xlat16_20.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat36.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_20.xy;
    u_xlat16_6.xyz = texture(_FlowLightUpTex, u_xlat36.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_6.xyz * _FlowLightUpColor.xyz;
    u_xlat36.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_5.xy;
    u_xlat16_5.x = _FlowLightDownDepth * 0.5;
    u_xlat0.xy = (-u_xlat16_5.xx) * u_xlat0.xy + u_xlat36.xy;
    u_xlat16_0.xyz = texture(_FlowLightDownTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _FlowLightDownColor.xyz;
    u_xlat16_59 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zzz * u_xlat16_5.xyz;
    u_xlat16_59 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat16_59);
    u_xlat16_20.xyz = u_xlat16_4.yyy * u_xlat16_20.xyz;
    u_xlat16_20.xyz = max(u_xlat16_5.xyz, u_xlat16_20.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_20.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
ivec3 u_xlati4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
int u_xlati18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec2 u_xlat36;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat48;
float u_xlat54;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
float u_xlat62;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
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
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
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
    u_xlat16_20.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20.x, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_54 = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_3.x = u_xlat16_3.x * 2.0 + -0.0599999987;
    u_xlat16_21.x = u_xlat16_3.x * _SoftChangColorShrink + u_xlat16_54;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorShrink + u_xlat16_54;
    u_xlat16_39 = u_xlat16_21.x + -0.100000001;
    u_xlat16_21.x = dot(u_xlat16_21.xx, vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_21.x = u_xlat16_21.x + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_21.xxx * _SoftChangEdgeColor.xyz;
    u_xlat16_21.x = u_xlat16_39 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_39 = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_39;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_21.xxx * u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_3.xx, vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_3.x = u_xlat16_3.x + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xxx * _ChangEdgeColor.xyz;
    u_xlat16_59 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_59;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_3.xxx + u_xlat16_21.xyz;
    u_xlat16_6.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_6 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _AlbedoColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoChangColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_5.xyz = u_xlat16_3.xxx * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_21.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_57 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_5.xyz = vec3(u_xlat16_57) * u_xlat16_5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_57 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_57) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat54 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat8.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat16_57 = dot(u_xlat8.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_57) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_9.xyz = texture(_laserMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _laserColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat16_57 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_62;
    u_xlat16_57 = u_xlat16_57 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_9.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_7.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_5.xyz;
    u_xlat58 = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat58) * vec3(u_xlat16_56) + u_xlat10.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat9.x = (-u_xlat62) * u_xlat16_19.x + u_xlat62;
    u_xlat9.x = u_xlat62 * u_xlat9.x + u_xlat16_19.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat62 + u_xlat9.x;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat9.w = u_xlat63 + u_xlat12.x;
    u_xlat9.xw = u_xlat9.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.w;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat9.x * u_xlat4.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat62) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat4.xxx * u_xlat10.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat13.xyz = u_xlat9.xxx * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat22 + 1.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat16_19.x / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.318309873;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat64 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat64 * u_xlat64;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_37 = u_xlat64 * u_xlat16_37;
    u_xlat16_55 = u_xlat64 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat64 + 1.0;
    u_xlat13.xyz = u_xlat16_5.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat58) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat64 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat64) * u_xlat16_19.x + u_xlat64;
    u_xlat48 = u_xlat64 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat64 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat9.w * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat9.x = u_xlat9.x * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat9.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat64) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_55) * u_xlat10.xyz;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
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
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat18;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat16_1.x) * u_xlat18 + 1.0;
    u_xlat16_1.x = u_xlat18 * u_xlat16_1.x;
    u_xlat10.xyz = u_xlat16_5.xyz * u_xlat36.xxx;
    u_xlat10.xyz = vec3(u_xlat58) * u_xlat16_1.xxx + u_xlat10.xyz;
    u_xlat18 = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat36.x = (-u_xlat18) * u_xlat16_19.x + u_xlat18;
    u_xlat36.x = u_xlat18 * u_xlat36.x + u_xlat16_19.x;
    u_xlat36.x = sqrt(u_xlat36.x);
    u_xlat36.x = u_xlat36.x + u_xlat18;
    u_xlat36.x = u_xlat36.x + 6.10351563e-05;
    u_xlat36.x = u_xlat36.x * u_xlat9.w;
    u_xlat0.z = float(1.0) / u_xlat36.x;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat10.xyz = u_xlat10.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _DirectSpecularColor.xyz;
    u_xlat10.xyz = vec3(u_xlat18) * u_xlat10.xyz;
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37 = float(1.0) / float(u_xlat16_37);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_37 = max(u_xlat16_16.x, u_xlat16_37);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_55 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_55, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_37;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat10.xyz = u_xlat16_1.xzw * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_9.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat62) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat64) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * u_xlat16_3.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xzw = u_xlat4.zzz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat54) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _OcclusionScale * u_xlat16_59 + 1.0;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_7.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18 = min(u_xlat0.x, u_xlat16_9.z);
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat18) * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat18) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati18 = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati36 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_11.xyz), u_xlat8.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat4.xyz = (-u_xlat8.xyz) * u_xlat16_2.xxx + (-u_xlat16_11.xyz);
    u_xlat18 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_15.xyz, u_xlat4.xyz);
    u_xlat16_2.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_8.w);
    u_xlat16_20.x = u_xlat16_2.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_8.x = u_xlat16_20.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_8.x = u_xlat16_2.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20.x = u_xlat16_36 + (-u_xlat16_58);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20.x + u_xlat16_58;
    u_xlat16_2.x = u_xlat16_57 * u_xlat16_2.x;
    u_xlat18 = u_xlat18 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat18 * u_xlat16_20.x + u_xlat16_2.x;
    u_xlat16_20.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_9.z);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat54) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat3.y = u_xlat0.y;
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_19.x = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat12.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_19.x);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_20.xyz : u_xlat16_7.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_20.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_6.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_20.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_11.yyy * vs_TEXCOORD8.xyz;
    u_xlat0.xyz = vs_TEXCOORD7.xyz * u_xlat16_11.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD9.xyz * u_xlat16_11.zzz + u_xlat0.xyz;
    u_xlat4.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat36.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat36.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat36.xy);
    u_xlat36.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_20.x = _GlitterScale * 0.681690156;
    u_xlat36.xy = u_xlat36.xy * u_xlat16_20.xx;
    u_xlat16_36 = texture(_MaskTex, u_xlat36.xy).y;
    u_xlat4.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_54 = texture(_MaskTex, u_xlat4.xy).y;
    u_xlat16_20.x = u_xlat16_36 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_20.x * _GlitterIntensity;
    u_xlat16_20.x = log2(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * _GlitterContrast;
    u_xlat16_20.x = exp2(u_xlat16_20.x);
    u_xlat16_20.xyz = u_xlat16_20.xxx * _GlitterColor.xyz;
    u_xlat16_4.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_4.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb36 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_20.xy = (bool(u_xlatb36)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_5.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_20.xy = u_xlat16_20.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_20.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_20.xy = u_xlat16_20.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat36.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_20.xy;
    u_xlat16_6.xyz = texture(_FlowLightUpTex, u_xlat36.xy).xyz;
    u_xlat16_20.xyz = u_xlat16_6.xyz * _FlowLightUpColor.xyz;
    u_xlat36.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_5.xy;
    u_xlat16_5.x = _FlowLightDownDepth * 0.5;
    u_xlat0.xy = (-u_xlat16_5.xx) * u_xlat0.xy + u_xlat36.xy;
    u_xlat16_0.xyz = texture(_FlowLightDownTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * _FlowLightDownColor.xyz;
    u_xlat16_59 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zzz * u_xlat16_5.xyz;
    u_xlat16_59 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat16_59);
    u_xlat16_20.xyz = u_xlat16_4.yyy * u_xlat16_20.xyz;
    u_xlat16_20.xyz = max(u_xlat16_5.xyz, u_xlat16_20.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_20.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
vec2 u_xlat39;
mediump float u_xlat16_39;
int u_xlati39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_40;
float u_xlat47;
mediump float u_xlat16_49;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
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
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat16_6.xyz;
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
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat23.xyz);
    u_xlat64 = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 * _ShadowBias.z;
    u_xlat8.xyz = (-u_xlat7.xyz) * vec3(u_xlat64) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat8.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
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
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_2.x = texture(_ChangColorDissolveTex, u_xlat16_12.xy).x;
    u_xlat16_63 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_63 = u_xlat16_63 * 2.0 + -0.0599999987;
    u_xlat16_67 = u_xlat16_63 * _SoftChangColorShrink + u_xlat16_2.x;
    u_xlat16_63 = u_xlat16_63 * _ChangColorShrink + u_xlat16_2.x;
    u_xlat16_68 = u_xlat16_67 + -0.100000001;
    u_xlat16_67 = dot(vec2(u_xlat16_67), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_67 = u_xlat16_67 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_67) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * _SoftChangEdgeColor.xyz;
    u_xlat16_67 = u_xlat16_68 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * -2.0 + 3.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = min(u_xlat16_67, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
    u_xlat16_67 = dot(vec2(u_xlat16_63), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_63 = u_xlat16_63 + -0.100000001;
    u_xlat16_63 = u_xlat16_63 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_67) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_67) * _ChangEdgeColor.xyz;
    u_xlat16_67 = u_xlat16_63 * -2.0 + 3.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat16_63) + u_xlat16_12.xyz;
    u_xlat16_2.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = vec3(u_xlat16_67) * u_xlat16_13.xyz;
    u_xlat16_67 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_13.xy = vec2(u_xlat16_67) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_3.xyz = texture(_laserMap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_3.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_3.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _laserColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + u_xlat16_13.xyz;
    u_xlat16_67 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_59 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_59;
    u_xlat16_67 = u_xlat16_67 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_3.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat59 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat8.xyz = vec3(u_xlat59) * u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat60 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat60 * u_xlat60;
    u_xlat16_10.x = u_xlat60 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat60 * u_xlat16_10.x;
    u_xlat64 = (-u_xlat16_10.x) * u_xlat60 + 1.0;
    u_xlat16_10.x = u_xlat60 * u_xlat16_10.x;
    u_xlat8.xyz = u_xlat16_13.xyz * vec3(u_xlat64);
    u_xlat60 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat60) * u_xlat16_10.xxx + u_xlat8.xyz;
    u_xlat16_10.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat64 = (-u_xlat59) * u_xlat16_10.x + u_xlat59;
    u_xlat64 = u_xlat59 * u_xlat64 + u_xlat16_10.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat59 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_29.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat9.x) * u_xlat16_10.x + u_xlat9.x;
    u_xlat65 = u_xlat9.x * u_xlat65 + u_xlat16_10.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat9.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat65;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat47 = u_xlat16_10.x + -1.0;
    u_xlat3.x = u_xlat3.x * u_xlat47 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_10.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat3.x = u_xlat64 * u_xlat3.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat59) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_11.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat20.xxx * u_xlat8.xyz;
    u_xlat15.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat15.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat47 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_10.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat64 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat64 * u_xlat64;
    u_xlat16_68 = u_xlat64 * u_xlat16_68;
    u_xlat16_68 = u_xlat64 * u_xlat16_68;
    u_xlat16_69 = u_xlat64 * u_xlat16_68;
    u_xlat64 = (-u_xlat16_68) * u_xlat64 + 1.0;
    u_xlat15.xyz = u_xlat16_13.xyz * vec3(u_xlat64);
    u_xlat15.xyz = vec3(u_xlat60) * vec3(u_xlat16_69) + u_xlat15.xyz;
    u_xlat64 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat64) * u_xlat16_10.x + u_xlat64;
    u_xlat66 = u_xlat64 * u_xlat66 + u_xlat16_10.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat64 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat65 * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat66;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat64) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat47 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_10.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat21 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat21 * u_xlat21;
    u_xlat16_63 = u_xlat21 * u_xlat16_63;
    u_xlat16_63 = u_xlat21 * u_xlat16_63;
    u_xlat40 = (-u_xlat16_63) * u_xlat21 + 1.0;
    u_xlat16_63 = u_xlat21 * u_xlat16_63;
    u_xlat8.xyz = u_xlat16_13.xyz * vec3(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat60) * vec3(u_xlat16_63) + u_xlat8.xyz;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat40 = (-u_xlat21) * u_xlat16_10.x + u_xlat21;
    u_xlat40 = u_xlat21 * u_xlat40 + u_xlat16_10.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat21;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat65;
    u_xlat2.z = float(1.0) / u_xlat40;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_17.x, u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * u_xlat20.yyy + u_xlat16_14.xyz;
    u_xlat16_63 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat59) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat64) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat21) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_70 + 1.0;
    u_xlat16_63 = u_xlat16_4.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_4.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat1.xy = min(u_xlat1.xw, vec2(u_xlat16_63));
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat1.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat1.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat1.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat1.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati39 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati39].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati39 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati39].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_70 = dot((-u_xlat16_29.xyz), u_xlat7.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat1.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_70) + (-u_xlat16_29.xyz);
    u_xlat2.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat1.xzw);
    u_xlat16_11.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_7.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_7.x = u_xlat16_30.x * 16.0 + u_xlat16_7.z;
    u_xlat16_16.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_7.x = u_xlat16_11.x * 16.0 + u_xlat16_7.z;
    u_xlat16_16.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_40) + u_xlat16_21;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_40;
    u_xlat16_11.x = u_xlat16_68 * u_xlat16_11.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat1.y * 0.5;
    u_xlat16_30.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat2.x * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_30.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_49 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_49 + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat1.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_3.z, u_xlat16_11.x);
    u_xlat2.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat1.xzw);
    u_xlat1.xyz = u_xlat16_10.xxx * u_xlat2.xyz + u_xlat1.xzw;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat16.y = u_xlat1.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_10.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat9.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_30.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_10.x);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb1)) ? u_xlat16_17.xyz : u_xlat16_13.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_30.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_29.yyy * vs_TEXCOORD8.xyz;
    u_xlat1.xyz = vs_TEXCOORD7.xyz * u_xlat16_29.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz * u_xlat16_29.zzz + u_xlat1.xyz;
    u_xlat2.xy = u_xlat1.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat39.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat2.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat39.xy);
    u_xlat2.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat39.xy);
    u_xlat39.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_29.x = _GlitterScale * 0.681690156;
    u_xlat39.xy = u_xlat39.xy * u_xlat16_29.xx;
    u_xlat16_39 = texture(_MaskTex, u_xlat39.xy).y;
    u_xlat2.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_58 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_29.x = u_xlat16_39 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_29.x * _GlitterIntensity;
    u_xlat16_29.x = log2(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _GlitterContrast;
    u_xlat16_29.x = exp2(u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_29.xxx * _GlitterColor.xyz;
    u_xlat16_2.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb39 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_29.xy = (bool(u_xlatb39)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_11.xy = (bool(u_xlatb39)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_29.xy = u_xlat16_29.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_29.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_29.xy = u_xlat16_29.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat39.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_29.xy;
    u_xlat16_3.xyz = texture(_FlowLightUpTex, u_xlat39.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_3.xyz * _FlowLightUpColor.xyz;
    u_xlat39.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_11.xy;
    u_xlat16_11.x = _FlowLightDownDepth * 0.5;
    u_xlat1.xy = (-u_xlat16_11.xx) * u_xlat1.xy + u_xlat39.xy;
    u_xlat16_1.xyz = texture(_FlowLightDownTex, u_xlat1.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * _FlowLightDownColor.xyz;
    u_xlat16_68 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_68) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_68 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(u_xlat16_68);
    u_xlat16_29.xyz = u_xlat16_2.yyy * u_xlat16_29.xyz;
    u_xlat16_29.xyz = max(u_xlat16_11.xyz, u_xlat16_29.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_29.xyz;
    u_xlat16_29.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_63 : u_xlat16_10.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _SoftChangEdgeColor;
uniform 	mediump float _SoftChangColorShrink;
uniform 	mediump float _SoftChangColorRange;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightDownTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump float _FlowLightDownDepth;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FlowLightDownFactory;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightDownTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
vec2 u_xlat39;
mediump float u_xlat16_39;
int u_xlati39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_40;
float u_xlat47;
mediump float u_xlat16_49;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
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
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat16_6.xyz;
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
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat23.x = dot(u_xlat7.xyz, u_xlat23.xyz);
    u_xlat64 = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 * _ShadowBias.z;
    u_xlat8.xyz = (-u_xlat7.xyz) * vec3(u_xlat64) + vs_TEXCOORD0.xyz;
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat8.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20.x = (-u_xlat1.x) + u_xlat20.x;
    u_xlat0.z = _ShadowBias.y * u_xlat20.x + u_xlat1.x;
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
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_2.x = texture(_ChangColorDissolveTex, u_xlat16_12.xy).x;
    u_xlat16_63 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_63 = u_xlat16_63 * 2.0 + -0.0599999987;
    u_xlat16_67 = u_xlat16_63 * _SoftChangColorShrink + u_xlat16_2.x;
    u_xlat16_63 = u_xlat16_63 * _ChangColorShrink + u_xlat16_2.x;
    u_xlat16_68 = u_xlat16_67 + -0.100000001;
    u_xlat16_67 = dot(vec2(u_xlat16_67), vec2(vec2(_SoftChangColorRange, _SoftChangColorRange)));
    u_xlat16_67 = u_xlat16_67 + (-_SoftChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_67) + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * _SoftChangEdgeColor.xyz;
    u_xlat16_67 = u_xlat16_68 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_67 * -2.0 + 3.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = min(u_xlat16_67, 1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
    u_xlat16_67 = dot(vec2(u_xlat16_63), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_63 = u_xlat16_63 + -0.100000001;
    u_xlat16_63 = u_xlat16_63 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = (-u_xlat16_67) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_67) * _ChangEdgeColor.xyz;
    u_xlat16_67 = u_xlat16_63 * -2.0 + 3.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat16_63) + u_xlat16_12.xyz;
    u_xlat16_2.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _AlbedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_67 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_13.xyz = vec3(u_xlat16_67) * u_xlat16_13.xyz;
    u_xlat16_67 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_13.xy = vec2(u_xlat16_67) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_3.xyz = texture(_laserMap, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_3.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_3.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _laserColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + u_xlat16_13.xyz;
    u_xlat16_67 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_59 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_59;
    u_xlat16_67 = u_xlat16_67 * _laserColor.w;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_3.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat59 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat8.xyz = vec3(u_xlat59) * u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat60 = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat60 * u_xlat60;
    u_xlat16_10.x = u_xlat60 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat60 * u_xlat16_10.x;
    u_xlat64 = (-u_xlat16_10.x) * u_xlat60 + 1.0;
    u_xlat16_10.x = u_xlat60 * u_xlat16_10.x;
    u_xlat8.xyz = u_xlat16_13.xyz * vec3(u_xlat64);
    u_xlat60 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat60) * u_xlat16_10.xxx + u_xlat8.xyz;
    u_xlat16_10.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0078125);
    u_xlat64 = (-u_xlat59) * u_xlat16_10.x + u_xlat59;
    u_xlat64 = u_xlat59 * u_xlat64 + u_xlat16_10.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat59 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat16_29.xyz = u_xlat2.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat9.x) * u_xlat16_10.x + u_xlat9.x;
    u_xlat65 = u_xlat9.x * u_xlat65 + u_xlat16_10.x;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat65 + u_xlat9.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat64 = u_xlat64 * u_xlat65;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat47 = u_xlat16_10.x + -1.0;
    u_xlat3.x = u_xlat3.x * u_xlat47 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_10.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat3.x = u_xlat64 * u_xlat3.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat59) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_11.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat20.xxx * u_xlat8.xyz;
    u_xlat15.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat15.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat47 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_10.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat64 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat64 * u_xlat64;
    u_xlat16_68 = u_xlat64 * u_xlat16_68;
    u_xlat16_68 = u_xlat64 * u_xlat16_68;
    u_xlat16_69 = u_xlat64 * u_xlat16_68;
    u_xlat64 = (-u_xlat16_68) * u_xlat64 + 1.0;
    u_xlat15.xyz = u_xlat16_13.xyz * vec3(u_xlat64);
    u_xlat15.xyz = vec3(u_xlat60) * vec3(u_xlat16_69) + u_xlat15.xyz;
    u_xlat64 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat64) * u_xlat16_10.x + u_xlat64;
    u_xlat66 = u_xlat64 * u_xlat66 + u_xlat16_10.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat64 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat65 * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat66;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat64) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat8.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat47 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_10.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat21 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat21 * u_xlat21;
    u_xlat16_63 = u_xlat21 * u_xlat16_63;
    u_xlat16_63 = u_xlat21 * u_xlat16_63;
    u_xlat40 = (-u_xlat16_63) * u_xlat21 + 1.0;
    u_xlat16_63 = u_xlat21 * u_xlat16_63;
    u_xlat8.xyz = u_xlat16_13.xyz * vec3(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat60) * vec3(u_xlat16_63) + u_xlat8.xyz;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat40 = (-u_xlat21) * u_xlat16_10.x + u_xlat21;
    u_xlat40 = u_xlat21 * u_xlat40 + u_xlat16_10.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat21;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat65;
    u_xlat2.z = float(1.0) / u_xlat40;
    u_xlat2.xz = min(u_xlat2.xz, vec2(16.0, 16.0));
    u_xlat2.x = u_xlat2.z * u_xlat2.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_17.x, u_xlat16_68);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat16_16.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * u_xlat20.yyy + u_xlat16_14.xyz;
    u_xlat16_63 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat59) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat64) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat21) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_11.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_68 = (-u_xlat16_63) + u_xlat16_68;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _OcclusionScale * u_xlat16_70 + 1.0;
    u_xlat16_63 = u_xlat16_4.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_4.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _OcclusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat1.xy = min(u_xlat1.xw, vec2(u_xlat16_63));
    u_xlat1.x = min(u_xlat1.x, u_xlat16_3.z);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat1.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat1.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat1.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat1.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati39 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati39].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati39 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati39].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_70 = dot((-u_xlat16_29.xyz), u_xlat7.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat1.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_70) + (-u_xlat16_29.xyz);
    u_xlat2.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat1.xzw);
    u_xlat16_11.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_7.w);
    u_xlat16_30.x = u_xlat16_11.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_7.x = u_xlat16_30.x * 16.0 + u_xlat16_7.z;
    u_xlat16_16.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_7.x = u_xlat16_11.x * 16.0 + u_xlat16_7.z;
    u_xlat16_16.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_16.xy = u_xlat16_16.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_16.xy).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_30.x = (-u_xlat16_40) + u_xlat16_21;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_30.x + u_xlat16_40;
    u_xlat16_11.x = u_xlat16_68 * u_xlat16_11.x;
    u_xlat2.x = u_xlat2.x * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat1.y * 0.5;
    u_xlat16_30.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat2.x * u_xlat16_30.x + u_xlat16_11.x;
    u_xlat16_30.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_49 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_49 + u_xlat16_30.x;
    u_xlat16_11.x = u_xlat1.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_3.z, u_xlat16_11.x);
    u_xlat2.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat1.xzw);
    u_xlat1.xyz = u_xlat16_10.xxx * u_xlat2.xyz + u_xlat1.xzw;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat16.y = u_xlat1.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_10.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat9.y = u_xlat16_4.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_30.xyz = u_xlat16_13.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_10.x);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb1)) ? u_xlat16_17.xyz : u_xlat16_13.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_30.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_63 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_1.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * _EmissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_29.yyy * vs_TEXCOORD8.xyz;
    u_xlat1.xyz = vs_TEXCOORD7.xyz * u_xlat16_29.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz * u_xlat16_29.zzz + u_xlat1.xyz;
    u_xlat2.xy = u_xlat1.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat39.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat2.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat39.xy);
    u_xlat2.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat39.xy);
    u_xlat39.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_29.x = _GlitterScale * 0.681690156;
    u_xlat39.xy = u_xlat39.xy * u_xlat16_29.xx;
    u_xlat16_39 = texture(_MaskTex, u_xlat39.xy).y;
    u_xlat2.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_58 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_29.x = u_xlat16_39 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.x = min(max(u_xlat16_29.x, 0.0), 1.0);
#else
    u_xlat16_29.x = clamp(u_xlat16_29.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_29.x * _GlitterIntensity;
    u_xlat16_29.x = log2(u_xlat16_29.x);
    u_xlat16_29.x = u_xlat16_29.x * _GlitterContrast;
    u_xlat16_29.x = exp2(u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_29.xxx * _GlitterColor.xyz;
    u_xlat16_2.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xzw;
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb39 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_29.xy = (bool(u_xlatb39)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_11.xy = (bool(u_xlatb39)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_29.xy = u_xlat16_29.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = u_xlat16_29.xy * _FlowLightDownTex_ST.xy + _FlowLightDownTex_ST.zw;
    u_xlat16_29.xy = u_xlat16_29.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat39.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_29.xy;
    u_xlat16_3.xyz = texture(_FlowLightUpTex, u_xlat39.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_3.xyz * _FlowLightUpColor.xyz;
    u_xlat39.xy = _Time.yy * _FlowLightDownFactory.yz + u_xlat16_11.xy;
    u_xlat16_11.x = _FlowLightDownDepth * 0.5;
    u_xlat1.xy = (-u_xlat16_11.xx) * u_xlat1.xy + u_xlat39.xy;
    u_xlat16_1.xyz = texture(_FlowLightDownTex, u_xlat1.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * _FlowLightDownColor.xyz;
    u_xlat16_68 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_11.xyz = vec3(u_xlat16_68) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_68 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(u_xlat16_68);
    u_xlat16_29.xyz = u_xlat16_2.yyy * u_xlat16_29.xyz;
    u_xlat16_29.xyz = max(u_xlat16_11.xyz, u_xlat16_29.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_29.xyz;
    u_xlat16_29.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_29.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_63 : u_xlat16_10.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
ivec4 u_xlati8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_21;
float u_xlat22;
int u_xlati22;
float u_xlat28;
mediump vec2 u_xlat16_29;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_35;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
float u_xlat50;
bool u_xlatb50;
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
    u_xlat16_15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_29.xxx;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat16_29.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_29.yyy + u_xlat16_3.xyz;
    u_xlat16_43 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_15 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15 = float(1.0) / float(u_xlat16_15);
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_15 = u_xlat16_43 * u_xlat16_15;
    u_xlat16_15 = max(u_xlat16_29.x, u_xlat16_15);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_15;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_43 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_43 = u_xlat16_43 * 2.0 + -0.0599999987;
    u_xlat16_43 = u_xlat16_43 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_44 = dot(vec2(u_xlat16_43), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_43 = u_xlat16_43 + -0.100000001;
    u_xlat16_43 = u_xlat16_43 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = (-u_xlat16_44) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * _ChangEdgeColor.xyz;
    u_xlat16_44 = u_xlat16_43 * -2.0 + 3.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_44;
    u_xlat16_43 = min(u_xlat16_43, 1.0);
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_43) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_4.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_43 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_4.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_44 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_44) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat48);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat48 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = vec3(u_xlat48) * u_xlat6.xyz;
    u_xlat16_44 = dot(u_xlat7.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_44) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_8.xyz = texture(_laserMap, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _laserColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat16_44 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_49 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_49;
    u_xlat16_44 = u_xlat16_44 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_8.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_44 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat9.xxx;
    u_xlat49 = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat49);
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat49 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat49) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat9.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_16.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat16_16.x = max(u_xlat16_16.x, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_16.x);
    u_xlat16_5.xyz = u_xlat16_30.xxx * u_xlat9.xzw;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb50 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat16_30.xy = (bool(u_xlatb50)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_30.yyy + u_xlat16_10.xyz;
    u_xlat16_44 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_5.xyz);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_44);
    u_xlat16_44 = u_xlat16_16.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16.x = float(1.0) / float(u_xlat16_16.x);
    u_xlat16_44 = (-u_xlat16_44) * u_xlat16_44 + 1.0;
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_16.x = u_xlat16_44 * u_xlat16_16.x;
    u_xlat16_16.x = max(u_xlat16_30.x, u_xlat16_16.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_16.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat9.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat50) + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_45 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat8.x = (-u_xlat49) * u_xlat16_45 + u_xlat49;
    u_xlat8.x = u_xlat49 * u_xlat8.x + u_xlat16_45;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat49 + u_xlat8.x;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_43);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_45 + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_45;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat8.y = u_xlat22 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_43) + 1.0;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat28 = u_xlat16_45 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat28 + 1.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat16_45 / u_xlat14;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat14 = min(u_xlat14, 16.0);
    u_xlat14 = u_xlat8.x * u_xlat14;
    u_xlat16_43 = u_xlat0.x * u_xlat0.x;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_46 = u_xlat0.x * u_xlat16_43;
    u_xlat0.x = (-u_xlat16_43) * u_xlat0.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyw = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.xyw = u_xlat0.xxx * vec3(u_xlat16_46) + u_xlat8.xyw;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat49) * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_11.xyz = vec3(u_xlat16_43) * u_xlat16_11.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_43 * 0.5 + 0.5;
    u_xlat16_16.x = (-u_xlat16_43) + u_xlat16_16.x;
    u_xlat16_46 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_46 + 1.0;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_16.x + u_xlat16_43;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_43;
    u_xlat16_16.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_16.x + -1.0;
    u_xlat16_16.x = _OcclusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_16.x;
    u_xlat49 = min(u_xlat16_43, 1.0);
    u_xlat8.x = min(u_xlat49, u_xlat16_8.z);
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat8.xxx + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat8.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_12.y = u_xlat16_11.y;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = u_xlat16_16.xxx * u_xlat16_13.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati8.x = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati22 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati8.x].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_43 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat8.xyw = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_5.xyz);
    u_xlat7.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_11.xyz, u_xlat8.xyw);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_5.w);
    u_xlat16_44 = u_xlat16_30.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_5.x = u_xlat16_44 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_30.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_35 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_30.x = u_xlat16_4.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_44 = (-u_xlat16_35) + u_xlat16_21;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_44 + u_xlat16_35;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_30.x;
    u_xlat7.x = u_xlat7.x * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat49 * 0.5;
    u_xlat16_30.x = (-u_xlat49) * 0.5 + 1.0;
    u_xlat16_16.x = u_xlat7.x * u_xlat16_30.x + u_xlat16_16.x;
    u_xlat16_30.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat16_44 = (-u_xlat16_16.x) * 2.0 + 1.0;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_44 + u_xlat16_30.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat49;
    u_xlat16_16.x = min(u_xlat16_16.x, u_xlat16_8.z);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat48) + (-u_xlat8.xyw);
    u_xlat6.xyz = vec3(u_xlat16_45) * u_xlat6.xyz + u_xlat8.xyw;
    u_xlat16_30.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_30.x);
    u_xlat16_2.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_43) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb6 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xxx * u_xlat16_2.xzw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_43 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_43;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_16.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_16.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_43 : u_xlat16_2.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(9) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
ivec4 u_xlati8;
vec4 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
float u_xlat14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_21;
float u_xlat22;
int u_xlati22;
float u_xlat28;
mediump vec2 u_xlat16_29;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_35;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
float u_xlat50;
bool u_xlatb50;
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
    u_xlat16_15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 6.10351563e-05);
    u_xlat16_29.x = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_29.xxx;
    u_xlat16_29.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_29.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_29.x);
#endif
    u_xlat16_29.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_29.yyy + u_xlat16_3.xyz;
    u_xlat16_43 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_43 = u_xlat16_43 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_43);
    u_xlat16_43 = u_xlat16_15 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_15 = float(1.0) / float(u_xlat16_15);
    u_xlat16_43 = (-u_xlat16_43) * u_xlat16_43 + 1.0;
    u_xlat16_43 = max(u_xlat16_43, 0.0);
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_15 = u_xlat16_43 * u_xlat16_15;
    u_xlat16_15 = max(u_xlat16_29.x, u_xlat16_15);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_15;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_0.x = texture(_ChangColorDissolveTex, u_xlat16_3.xy).x;
    u_xlat16_43 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_43 = u_xlat16_43 * 2.0 + -0.0599999987;
    u_xlat16_43 = u_xlat16_43 * _ChangColorShrink + u_xlat16_0.x;
    u_xlat16_44 = dot(vec2(u_xlat16_43), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_43 = u_xlat16_43 + -0.100000001;
    u_xlat16_43 = u_xlat16_43 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = (-u_xlat16_44) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * _ChangEdgeColor.xyz;
    u_xlat16_44 = u_xlat16_43 * -2.0 + 3.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_44;
    u_xlat16_43 = min(u_xlat16_43, 1.0);
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_0.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _AlbedoChangColor.xyz + (-u_xlat16_5.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_43) * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_4.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_43 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_44 = inversesqrt(u_xlat16_44);
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_4.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_44 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_44) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat48);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat48 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat7.xyz = vec3(u_xlat48) * u_xlat6.xyz;
    u_xlat16_44 = dot(u_xlat7.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vec2(u_xlat16_44) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_8.xyz = texture(_laserMap, u_xlat16_4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _laserColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat16_44 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_49 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_49;
    u_xlat16_44 = u_xlat16_44 * _laserColor.w;
    u_xlat16_3.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + u_xlat16_3.xyz;
    u_xlat16_8.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_44 = (-u_xlat16_8.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_44) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat9.xy = u_xlat16_9.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat9.xxx;
    u_xlat49 = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat49);
    u_xlat16_2.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat49 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat49) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb50 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_2.x = (u_xlatb50) ? 1.0 : 0.0;
    u_xlat9.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_16.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat16_16.x = max(u_xlat16_16.x, 6.10351563e-05);
    u_xlat16_30.x = inversesqrt(u_xlat16_16.x);
    u_xlat16_5.xyz = u_xlat16_30.xxx * u_xlat9.xzw;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb50 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat16_30.xy = (bool(u_xlatb50)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_30.yyy + u_xlat16_10.xyz;
    u_xlat16_44 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_5.xyz);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_44 = min(max(u_xlat16_44, 0.0), 1.0);
#else
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_2.x = max(u_xlat16_2.x, u_xlat16_44);
    u_xlat16_44 = u_xlat16_16.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_16.x = float(1.0) / float(u_xlat16_16.x);
    u_xlat16_44 = (-u_xlat16_44) * u_xlat16_44 + 1.0;
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_44 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_16.x = u_xlat16_44 * u_xlat16_16.x;
    u_xlat16_16.x = max(u_xlat16_30.x, u_xlat16_16.x);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_16.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat9.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(u_xlat50) + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_8.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_45 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_45 = max(u_xlat16_45, 0.0078125);
    u_xlat8.x = (-u_xlat49) * u_xlat16_45 + u_xlat49;
    u_xlat8.x = u_xlat49 * u_xlat8.x + u_xlat16_45;
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat49 + u_xlat8.x;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_43);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_43) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_45 + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_45;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat8.y = u_xlat22 + u_xlat9.x;
    u_xlat8.xy = u_xlat8.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat8.x = u_xlat8.x * u_xlat8.y;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = min(u_xlat8.x, 16.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_43) + 1.0;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat28 = u_xlat16_45 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat28 + 1.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat16_45 / u_xlat14;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat14 = min(u_xlat14, 16.0);
    u_xlat14 = u_xlat8.x * u_xlat14;
    u_xlat16_43 = u_xlat0.x * u_xlat0.x;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_43 = u_xlat0.x * u_xlat16_43;
    u_xlat16_46 = u_xlat0.x * u_xlat16_43;
    u_xlat0.x = (-u_xlat16_43) * u_xlat0.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyw = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.xyw = u_xlat0.xxx * vec3(u_xlat16_46) + u_xlat8.xyw;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _DirectSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat49) * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = (-u_xlat6.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_11.xyz = vec3(u_xlat16_43) * u_xlat16_11.xyz;
    u_xlat16_43 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_43 * 0.5 + 0.5;
    u_xlat16_16.x = (-u_xlat16_43) + u_xlat16_16.x;
    u_xlat16_46 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_46 + 1.0;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_16.x + u_xlat16_43;
    u_xlat16_43 = u_xlat16_2.w * u_xlat16_43;
    u_xlat16_16.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.x = min(max(u_xlat16_16.x, 0.0), 1.0);
#else
    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
#endif
    u_xlat16_16.x = u_xlat16_16.x + -1.0;
    u_xlat16_16.x = _OcclusionScale * u_xlat16_16.x + 1.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_16.x;
    u_xlat49 = min(u_xlat16_43, 1.0);
    u_xlat8.x = min(u_xlat49, u_xlat16_8.z);
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat8.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat8.xxx * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat8.xxx + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat8.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_12.y = u_xlat16_11.y;
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati8.xyw = ivec3(uvec3(lessThan(u_xlat16_12.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = u_xlat16_16.xxx * u_xlat16_13.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_13.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati8.x = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati22 = (u_xlati8.w != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati8.x].xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_12.xyw;
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_43 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat8.xyw = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_5.xyz);
    u_xlat7.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_11.xyz, u_xlat8.xyw);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_30.x = floor(u_xlat16_5.w);
    u_xlat16_44 = u_xlat16_30.x + 1.0;
    u_xlat16_44 = min(u_xlat16_44, 15.0);
    u_xlat16_5.x = u_xlat16_44 * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_5.x = u_xlat16_30.x * 16.0 + u_xlat16_5.z;
    u_xlat16_4.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_35 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_30.x = u_xlat16_4.z * 15.0 + (-u_xlat16_30.x);
    u_xlat16_44 = (-u_xlat16_35) + u_xlat16_21;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_44 + u_xlat16_35;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_30.x;
    u_xlat7.x = u_xlat7.x * u_xlat16_16.x;
    u_xlat16_16.x = u_xlat49 * 0.5;
    u_xlat16_30.x = (-u_xlat49) * 0.5 + 1.0;
    u_xlat16_16.x = u_xlat7.x * u_xlat16_30.x + u_xlat16_16.x;
    u_xlat16_30.x = u_xlat16_16.x + u_xlat16_16.x;
    u_xlat16_44 = (-u_xlat16_16.x) * 2.0 + 1.0;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_44 + u_xlat16_30.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat49;
    u_xlat16_16.x = min(u_xlat16_16.x, u_xlat16_8.z);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat48) + (-u_xlat8.xyw);
    u_xlat6.xyz = vec3(u_xlat16_45) * u_xlat6.xyz + u_xlat8.xyw;
    u_xlat16_30.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat6.x = u_xlat16_30.x;
    u_xlat16_30.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_30.x);
    u_xlat16_2.xzw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat16_2.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xzw = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xyz = vec3(u_xlat16_43) * u_xlat16_2.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb6 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xzw = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_2.xzw;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xxx * u_xlat16_2.xzw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_43 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_43;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_16.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_16.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_43 : u_xlat16_2.x;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_30;
float u_xlat36;
int u_xlati36;
float u_xlat37;
float u_xlat56;
bool u_xlatb56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
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
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_10.xy).x;
    u_xlat16_60 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_60 = u_xlat16_60 * 2.0 + -0.0599999987;
    u_xlat16_60 = u_xlat16_60 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_60), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_60 = u_xlat16_60 + -0.100000001;
    u_xlat16_60 = u_xlat16_60 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _ChangEdgeColor.xyz;
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _AlbedoChangColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat16_60) + u_xlat16_11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_64) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_2.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_10.xyz) + u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2.x = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * _laserColor.w;
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_64 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat56) * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat56) + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_60) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_60 = u_xlat1.x * u_xlat1.x;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_65 = u_xlat1.x * u_xlat16_60;
    u_xlat1.x = (-u_xlat16_60) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.xyz;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_4.x = u_xlat16_30.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = (-u_xlat16_25) + u_xlat16_7;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_25;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_12.x;
    u_xlat56 = u_xlat56 * u_xlat16_65;
    u_xlat16_65 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat56 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_12.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_65 = u_xlat0.y * u_xlat16_65;
    u_xlat16_65 = min(u_xlat16_2.z, u_xlat16_65);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_64) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_64 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_64);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
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
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
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
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
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
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
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
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump vec3 u_xlat16_30;
float u_xlat36;
int u_xlati36;
float u_xlat37;
float u_xlat56;
bool u_xlatb56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
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
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
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
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
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
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_18.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_18.z * _ShadowStrength;
    u_xlat18.xy = u_xlat16_18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xy = min(max(u_xlat18.xy, 0.0), 1.0);
#else
    u_xlat18.xy = clamp(u_xlat18.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD3.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_1.x = texture(_ChangColorDissolveTex, u_xlat16_10.xy).x;
    u_xlat16_60 = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat16_60 = u_xlat16_60 * 2.0 + -0.0599999987;
    u_xlat16_60 = u_xlat16_60 * _ChangColorShrink + u_xlat16_1.x;
    u_xlat16_10.x = dot(vec2(u_xlat16_60), vec2(vec2(_ChangColorRange, _ChangColorRange)));
    u_xlat16_60 = u_xlat16_60 + -0.100000001;
    u_xlat16_60 = u_xlat16_60 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _ChangEdgeColor.xyz;
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_60 = min(u_xlat16_60, 1.0);
    u_xlat16_1.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _AlbedoChangColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(u_xlat16_60) + u_xlat16_11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat7.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vec2(u_xlat16_64) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_2.xyz = texture(_laserMap, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_2.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _laserColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = (-u_xlat16_10.xyz) + u_xlat16_11.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2.x = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_2.x;
    u_xlat16_64 = u_xlat16_64 * _laserColor.w;
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_64 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat56) * u_xlat16_13.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat18.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.yyy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat56) + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_64 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat36 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_64;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_64 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat56;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = min(u_xlat36, 16.0);
    u_xlat56 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat56);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_60) + 1.0;
    u_xlat19 = u_xlat56 * u_xlat56;
    u_xlat37 = u_xlat16_64 + -1.0;
    u_xlat19 = u_xlat19 * u_xlat37 + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat16_64 / u_xlat19;
    u_xlat19 = u_xlat19 * 0.318309873;
    u_xlat19 = min(u_xlat19, 16.0);
    u_xlat36 = u_xlat36 * u_xlat19;
    u_xlat16_60 = u_xlat1.x * u_xlat1.x;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_60 = u_xlat1.x * u_xlat16_60;
    u_xlat16_65 = u_xlat1.x * u_xlat16_60;
    u_xlat1.x = (-u_xlat16_60) * u_xlat1.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _DirectSpecularColor.xyz;
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_3.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_65) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_4.x = u_xlat16_30.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_7 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_30.xz = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = (-u_xlat16_25) + u_xlat16_7;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_25;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_12.x;
    u_xlat56 = u_xlat56 * u_xlat16_65;
    u_xlat16_65 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat56 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_12.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30.x = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_65 = u_xlat0.y * u_xlat16_65;
    u_xlat16_65 = min(u_xlat16_2.z, u_xlat16_65);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_64) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_64 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_64);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
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
    u_xlat16_24 = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24;
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
  GpuProgramID 75705
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_DoubleFlowLight_Glitter_ColorChangGUI"
}