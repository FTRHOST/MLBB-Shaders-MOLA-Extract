//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_FlowLight_Glitter_ButtonColorChang_Dissolve" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_MergeTex ("合并贴图", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,1,1,1)

_EnableChangColor ("启用换色", Float) = 0.0

_AlbedoChangTex ("换色后Albedo贴图", 2D) = "white" { }

_AlbedoChangColor ("换色后Albedo颜色", Color) = (1,1,1,1)

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("启用竖向溶解", Float) = 0.0

_DissolveDirSpeed ("溶解方向速度", Vector) = (1,0,0,0)

_DissolveTex ("溶解纹理", 2D) = "white" { }

_DissolveEdgeColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveEdgeShrink ("溶解边缘压缩", Float) = 6.0

_DissolveEdgeRange ("溶解边缘范围", Range(0.2, 10)) = 0.0

_Cutoff ("溶解进度", Range(-2, 2)) = 0.0

_anisoUse2U ("各向异性使用2U", Float) = 0.0

_anisotropicMap ("各向异性扰动贴图", 2D) = "white" { }

_sunShift ("主要各向异性扭曲", Float) = 1.0

_sunShiftOffset ("主要各向异性偏移", Float) = 1.0

_anisotropicMultiplier ("主要各项异性强度", Range(0, 1)) = 1.0

_sunShift2nd ("次要各向异性扭曲", Float) = 1.0

_sunShiftOffset2nd ("次要各向异性偏移", Float) = 1.0

_anisotropicMultiplier2nd ("次要各项异性强度", Range(0, 1)) = 1.0

_directSpecularColor ("主要各向异性高光颜色", Color) = (1,1,1,1)

_directSpecularColor2nd ("次要各向异性高光颜色", Color) = (1,1,1,1)

_ChangDirectSpecularColor ("换色后主要各向异性高光颜色", Color) = (1,1,1,1)

_ChangDirectSpecularColor2nd ("换色后次要各向异性高光颜色", Color) = (1,1,1,1)

_USE_MENDS_LIGHT ("补光开关", Float) = 0.0

_MendsLightDirection ("补光1方向", Vector) = (1,0,1,0)

_MendsLightColor ("补光1颜色", Color) = (1,1,1,1)

_MendsLightFallOff ("补光1衰减", Range(0, 1)) = 0.0

_MendsLightDirection2 ("补光2方向", Vector) = (1,0,1,0)

_MendsLightColor2 ("补光2颜色", Color) = (1,1,1,1)

_MendsLightFallOff2 ("补光2衰减", Range(0, 1)) = 0.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 1797
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
mediump vec2 u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
vec3 u_xlat35;
vec3 u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
bool u_xlatb50;
mediump vec2 u_xlat16_51;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat59;
float u_xlat75;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
float u_xlat85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_51.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_26.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_26.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_26.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_26.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_26.x = u_xlat16_26.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_26.x * -2.0 + 3.0;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_3.x;
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_3.x = u_xlat16_26.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb2.x = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat16_3.xyz = (-_directSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_3.xyz = vec3(_EnableChangColor) * u_xlat16_3.xyz + _directSpecularColor2nd.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_anisoUse2U);
#else
    u_xlatb2.x = 0.5<_anisoUse2U;
#endif
    u_xlat2.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat2.xy = u_xlat2.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_anisotropicMap, u_xlat2.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.y = u_xlat2.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat2.x = u_xlat2.x * _sunShift + _sunShiftOffset;
    u_xlat2.xy = u_xlat2.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb52 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat52 = (u_xlatb52) ? 1.0 : -1.0;
    u_xlat52 = u_xlat52 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_78 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat6.xyz = vec3(u_xlat77) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_5.xyz, u_xlat4.xyz);
    u_xlat8.x = u_xlat6.x;
    u_xlat8.y = u_xlat7.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat4.xyz;
    u_xlat79 = dot(u_xlat6.zxy, u_xlat7.xyz);
    u_xlat6.xyz = (-u_xlat7.yzx) * vec3(u_xlat79) + u_xlat6.xyz;
    u_xlat79 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat52) * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat9.xyz = vec3(u_xlat27) * u_xlat9.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_30.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat52 = u_xlat16_5.x * u_xlat16_80;
    u_xlat16_5.x = u_xlat16_5.x + -1.0;
    u_xlat79 = (-u_xlat16_5.x) + 1.0;
    u_xlat79 = u_xlat79 * u_xlat16_80;
    u_xlat79 = max(u_xlat79, 0.00100000005);
    u_xlat52 = max(u_xlat52, 0.00100000005);
    u_xlat13.y = u_xlat27 * u_xlat52;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat79 * u_xlat52;
    u_xlat13.z = u_xlat27 * u_xlat81;
    u_xlat16_5.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat13.x = u_xlat79 * u_xlat16_5.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.z = u_xlat79 * u_xlat82;
    u_xlat13.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.y = u_xlat52 * u_xlat16_14.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat13.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_39.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat83 = dot(u_xlat9.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat79 * u_xlat83;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_39.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat6.zxy, u_xlat16_39.xyz);
    u_xlat9.y = u_xlat52 * u_xlat79;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat9.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat52 * u_xlat82 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = u_xlat81 * u_xlat52;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat81 * u_xlat81;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_40 = u_xlat81 * u_xlat16_15.x;
    u_xlat81 = (-u_xlat16_15.x) * u_xlat81 + 1.0;
    u_xlat16_15.xzw = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_0.zxy * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_0.zxy * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _AlbedoChangColor.zxy + (-u_xlat16_15.xzw);
    u_xlat16_15.xzw = vec3(_EnableChangColor) * u_xlat16_16.xyz + u_xlat16_15.xzw;
    u_xlat16_16.xyz = u_xlat16_15.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_30.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat81) * u_xlat16_16.xyz;
    u_xlat81 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat81) * vec3(u_xlat16_40) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat17.xyz = u_xlat16_3.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat13.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat52 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat18.xyz = vec3(u_xlat52) * u_xlat18.xyz;
    u_xlat52 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_28 = u_xlat16_3.x + -1.0;
    u_xlat82 = u_xlat16_3.x * u_xlat16_80;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat83 = (-u_xlat16_28) + 1.0;
    u_xlat83 = u_xlat16_80 * u_xlat83;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat13.z = u_xlat52 * u_xlat83;
    u_xlat13.y = u_xlat16_14.x * u_xlat82;
    u_xlat52 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat13.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat83 * u_xlat84;
    u_xlat9.y = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat52 = u_xlat79 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat59 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat11.y = u_xlat82 * u_xlat59;
    u_xlat11.x = u_xlat16_5.x * u_xlat83;
    u_xlat59 = u_xlat82 * u_xlat83;
    u_xlat11.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat84 = u_xlat59 * 0.318309873;
    u_xlat27 = u_xlat27 * u_xlat84;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat27 = u_xlat52 * u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_19.xyz = vec3(_EnableChangColor) * u_xlat16_19.xyz + _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_19.xyz;
    u_xlat0.xyz = u_xlat13.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat17.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_3.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = (-u_xlat16_53) * u_xlat16_53 + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_5.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_20.xyz = u_xlat16_3.xxx * u_xlat11.xyz;
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_5.x;
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.zzz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_5.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_5.x);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_21.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat17.y = u_xlat27 * u_xlat82;
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat17.x = u_xlat16_3.x * u_xlat83;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat16_3.x) + 1.0;
    u_xlat17.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat84 * u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat16_20.xyz);
    u_xlat11.y = u_xlat16_3.x * u_xlat82;
    u_xlat11.z = u_xlat83 * u_xlat85;
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat11.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat79 * u_xlat85 + 6.10351563e-05;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat27 = u_xlat27 * u_xlat85;
    u_xlat16_3.x = u_xlat52 * u_xlat52;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_53 = u_xlat52 * u_xlat16_3.x;
    u_xlat52 = (-u_xlat16_3.x) * u_xlat52 + 1.0;
    u_xlat36.xyz = u_xlat16_16.xyz * vec3(u_xlat52);
    u_xlat36.xyz = vec3(u_xlat81) * vec3(u_xlat16_53) + u_xlat36.xyz;
    u_xlat36.xyz = vec3(u_xlat27) * u_xlat36.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_19.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat11.xxx * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat16_21.xyz * u_xlat36.xyz;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat27 = u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat36.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xyz * vec3(u_xlat16_53);
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.zzz + u_xlat16_23.xyz;
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_22.xyz;
    u_xlat52 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat52 = dot(u_xlat18.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat18.xyz, u_xlat16_22.xyz);
    u_xlat10.z = u_xlat83 * u_xlat10.x;
    u_xlat17.y = u_xlat52 * u_xlat82;
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat0.xyz);
    u_xlat17.x = u_xlat16_53 * u_xlat83;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(u_xlat16_22.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_53) + 1.0;
    u_xlat17.z = u_xlat52 * u_xlat59;
    u_xlat25 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat25 = max(u_xlat25, 6.10351563e-05);
    u_xlat25 = u_xlat59 / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat84 * u_xlat25;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat16_22.xyz);
    u_xlat10.y = u_xlat16_53 * u_xlat82;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat79 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25 = u_xlat50 * u_xlat25;
    u_xlat16_78 = u_xlat0.x * u_xlat0.x;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_55 = u_xlat0.x * u_xlat16_78;
    u_xlat0.x = (-u_xlat16_78) * u_xlat0.x + 1.0;
    u_xlat35.xyz = u_xlat16_16.xyz * u_xlat0.xxx;
    u_xlat35.xyz = vec3(u_xlat81) * vec3(u_xlat16_55) + u_xlat35.xyz;
    u_xlat0.xyz = vec3(u_xlat25) * u_xlat35.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_19.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_78 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_3.x = u_xlat16_78 * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_5.x, u_xlat16_3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_78, u_xlat16_53);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xzw;
    u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat27) + u_xlat16_20.xyz;
    u_xlat16_5.x = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_5.xxx * u_xlat16_15.xzw;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat16_15.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xzw = vec3(u_xlat27) * u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat27) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_19.xyz + u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat7.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * u_xlat16_21.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_5.x) + u_xlat16_55;
    u_xlat16_14.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_14.x + 1.0;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_55 + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_5.x;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_5.x = u_xlat16_55 * u_xlat16_5.x;
    u_xlat0.x = min(u_xlat16_5.x, 1.0);
    u_xlat25 = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat25) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * vec3(u_xlat25) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_55) * u_xlat16_24.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati50 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_3.xzw = u_xlat16_15.xyz * u_xlat16_20.xyz + u_xlat16_3.xzw;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_15.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat16_28>=0.0);
#else
    u_xlatb25 = u_xlat16_28>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb25)) ? u_xlat2.xyz : u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.zxy * u_xlat16_39.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.zxy * u_xlat2.yzx + (-u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + u_xlat2.xyz;
    u_xlat16_14.x = u_xlat16_80 * 8.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_28) * u_xlat16_14.x;
    u_xlat2.xyz = u_xlat16_14.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat25 = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat50 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat2.xyz = vec3(u_xlat50) * u_xlat2.xyz;
    u_xlat16_14.x = dot((-u_xlat16_39.xyz), u_xlat2.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_14.xxx + (-u_xlat16_39.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat77) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_80) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_28)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_28 = -abs(u_xlat16_28) * 0.800000012 + 1.0;
    u_xlat16_28 = u_xlat16_30.x * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_28);
    u_xlat50 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
    u_xlat16_47.y = u_xlat50 * 0.5;
    u_xlat16_80 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_80;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb50 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb50)) ? u_xlat16_20.xyz : u_xlat16_15.xyz;
    u_xlat9.y = u_xlat16_30.x;
    u_xlat16_47.x = u_xlat16_30.x * 1.09769487;
    u_xlat16_5.xyw = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyw = min(max(u_xlat16_5.xyw, 0.0), 1.0);
#else
    u_xlat16_5.xyw = clamp(u_xlat16_5.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_2.yzw = u_xlat16_5.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_2.w);
    u_xlat16_5.x = u_xlat16_28 + 1.0;
    u_xlat16_5.x = min(u_xlat16_5.x, 15.0);
    u_xlat16_2.x = u_xlat16_5.x * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_2.x = u_xlat16_28 * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_28 = u_xlat16_5.w * 15.0 + (-u_xlat16_28);
    u_xlat16_5.x = u_xlat16_50 + (-u_xlat16_4.x);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.x + u_xlat16_4.x;
    u_xlat16_28 = u_xlat16_55 * u_xlat16_28;
    u_xlat25 = u_xlat25 * u_xlat16_28;
    u_xlat16_28 = u_xlat0.x * 0.5;
    u_xlat16_5.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat25 * u_xlat16_5.x + u_xlat16_28;
    u_xlat16_5.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_30.x = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_30.x + u_xlat16_5.x;
    u_xlat16_28 = u_xlat0.x * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_28, u_xlat16_12.z);
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_15.xyz + u_xlat16_3.xzw;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_15.yzx + u_xlat16_19.yzx;
    u_xlat16_78 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w + u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_15.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_39.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_39.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_39.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_30.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_30.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_30.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(1.5, 1.5);
    u_xlat16_25.x = texture(_MergeTex, u_xlat16_30.xy).x;
    u_xlat16_30.x = u_xlat16_0.x * u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_30.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_30.xy = u_xlat16_30.xy + u_xlat16_14.xy;
    u_xlat16_30.xy = u_xlat16_30.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_30.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_30.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_14.xxx;
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_4.yyy + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_26.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
    u_xlat75 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_25.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_5.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
mediump vec2 u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
vec3 u_xlat35;
vec3 u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
bool u_xlatb50;
mediump vec2 u_xlat16_51;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat59;
float u_xlat75;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
float u_xlat85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_51.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_26.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_26.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_26.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_26.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_26.x = u_xlat16_26.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_26.x * -2.0 + 3.0;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_3.x;
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_3.x = u_xlat16_26.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb2.x = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat16_3.xyz = (-_directSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_3.xyz = vec3(_EnableChangColor) * u_xlat16_3.xyz + _directSpecularColor2nd.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_anisoUse2U);
#else
    u_xlatb2.x = 0.5<_anisoUse2U;
#endif
    u_xlat2.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat2.xy = u_xlat2.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_anisotropicMap, u_xlat2.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.y = u_xlat2.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat2.x = u_xlat2.x * _sunShift + _sunShiftOffset;
    u_xlat2.xy = u_xlat2.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb52 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat52 = (u_xlatb52) ? 1.0 : -1.0;
    u_xlat52 = u_xlat52 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_78 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat6.xyz = vec3(u_xlat77) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_5.xyz, u_xlat4.xyz);
    u_xlat8.x = u_xlat6.x;
    u_xlat8.y = u_xlat7.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat4.xyz;
    u_xlat79 = dot(u_xlat6.zxy, u_xlat7.xyz);
    u_xlat6.xyz = (-u_xlat7.yzx) * vec3(u_xlat79) + u_xlat6.xyz;
    u_xlat79 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat52) * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat9.xyz = vec3(u_xlat27) * u_xlat9.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_30.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat52 = u_xlat16_5.x * u_xlat16_80;
    u_xlat16_5.x = u_xlat16_5.x + -1.0;
    u_xlat79 = (-u_xlat16_5.x) + 1.0;
    u_xlat79 = u_xlat79 * u_xlat16_80;
    u_xlat79 = max(u_xlat79, 0.00100000005);
    u_xlat52 = max(u_xlat52, 0.00100000005);
    u_xlat13.y = u_xlat27 * u_xlat52;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat79 * u_xlat52;
    u_xlat13.z = u_xlat27 * u_xlat81;
    u_xlat16_5.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat13.x = u_xlat79 * u_xlat16_5.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.z = u_xlat79 * u_xlat82;
    u_xlat13.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.y = u_xlat52 * u_xlat16_14.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat13.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_39.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat83 = dot(u_xlat9.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat79 * u_xlat83;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_39.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat6.zxy, u_xlat16_39.xyz);
    u_xlat9.y = u_xlat52 * u_xlat79;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat9.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat52 * u_xlat82 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = u_xlat81 * u_xlat52;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat81 * u_xlat81;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_40 = u_xlat81 * u_xlat16_15.x;
    u_xlat81 = (-u_xlat16_15.x) * u_xlat81 + 1.0;
    u_xlat16_15.xzw = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_0.zxy * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_0.zxy * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _AlbedoChangColor.zxy + (-u_xlat16_15.xzw);
    u_xlat16_15.xzw = vec3(_EnableChangColor) * u_xlat16_16.xyz + u_xlat16_15.xzw;
    u_xlat16_16.xyz = u_xlat16_15.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_30.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat81) * u_xlat16_16.xyz;
    u_xlat81 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat81) * vec3(u_xlat16_40) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat17.xyz = u_xlat16_3.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat13.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat52 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat18.xyz = vec3(u_xlat52) * u_xlat18.xyz;
    u_xlat52 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_28 = u_xlat16_3.x + -1.0;
    u_xlat82 = u_xlat16_3.x * u_xlat16_80;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat83 = (-u_xlat16_28) + 1.0;
    u_xlat83 = u_xlat16_80 * u_xlat83;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat13.z = u_xlat52 * u_xlat83;
    u_xlat13.y = u_xlat16_14.x * u_xlat82;
    u_xlat52 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat13.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat83 * u_xlat84;
    u_xlat9.y = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat52 = u_xlat79 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat59 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat11.y = u_xlat82 * u_xlat59;
    u_xlat11.x = u_xlat16_5.x * u_xlat83;
    u_xlat59 = u_xlat82 * u_xlat83;
    u_xlat11.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat84 = u_xlat59 * 0.318309873;
    u_xlat27 = u_xlat27 * u_xlat84;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat27 = u_xlat52 * u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_19.xyz = vec3(_EnableChangColor) * u_xlat16_19.xyz + _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_19.xyz;
    u_xlat0.xyz = u_xlat13.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat17.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_3.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = (-u_xlat16_53) * u_xlat16_53 + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_5.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_20.xyz = u_xlat16_3.xxx * u_xlat11.xyz;
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_5.x;
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.zzz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_5.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_5.x);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_21.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat17.y = u_xlat27 * u_xlat82;
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat17.x = u_xlat16_3.x * u_xlat83;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat16_3.x) + 1.0;
    u_xlat17.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat84 * u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat16_20.xyz);
    u_xlat11.y = u_xlat16_3.x * u_xlat82;
    u_xlat11.z = u_xlat83 * u_xlat85;
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat11.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat79 * u_xlat85 + 6.10351563e-05;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat27 = u_xlat27 * u_xlat85;
    u_xlat16_3.x = u_xlat52 * u_xlat52;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_53 = u_xlat52 * u_xlat16_3.x;
    u_xlat52 = (-u_xlat16_3.x) * u_xlat52 + 1.0;
    u_xlat36.xyz = u_xlat16_16.xyz * vec3(u_xlat52);
    u_xlat36.xyz = vec3(u_xlat81) * vec3(u_xlat16_53) + u_xlat36.xyz;
    u_xlat36.xyz = vec3(u_xlat27) * u_xlat36.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_19.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat11.xxx * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat16_21.xyz * u_xlat36.xyz;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat27 = u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat36.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xyz * vec3(u_xlat16_53);
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.zzz + u_xlat16_23.xyz;
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_22.xyz;
    u_xlat52 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat52 = dot(u_xlat18.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat18.xyz, u_xlat16_22.xyz);
    u_xlat10.z = u_xlat83 * u_xlat10.x;
    u_xlat17.y = u_xlat52 * u_xlat82;
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat0.xyz);
    u_xlat17.x = u_xlat16_53 * u_xlat83;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(u_xlat16_22.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_53) + 1.0;
    u_xlat17.z = u_xlat52 * u_xlat59;
    u_xlat25 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat25 = max(u_xlat25, 6.10351563e-05);
    u_xlat25 = u_xlat59 / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat84 * u_xlat25;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat16_22.xyz);
    u_xlat10.y = u_xlat16_53 * u_xlat82;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat79 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25 = u_xlat50 * u_xlat25;
    u_xlat16_78 = u_xlat0.x * u_xlat0.x;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_55 = u_xlat0.x * u_xlat16_78;
    u_xlat0.x = (-u_xlat16_78) * u_xlat0.x + 1.0;
    u_xlat35.xyz = u_xlat16_16.xyz * u_xlat0.xxx;
    u_xlat35.xyz = vec3(u_xlat81) * vec3(u_xlat16_55) + u_xlat35.xyz;
    u_xlat0.xyz = vec3(u_xlat25) * u_xlat35.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_19.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_78 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_3.x = u_xlat16_78 * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_5.x, u_xlat16_3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_78, u_xlat16_53);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xzw;
    u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat27) + u_xlat16_20.xyz;
    u_xlat16_5.x = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_5.xxx * u_xlat16_15.xzw;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat16_15.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xzw = vec3(u_xlat27) * u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat27) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_19.xyz + u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat7.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * u_xlat16_21.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_5.x) + u_xlat16_55;
    u_xlat16_14.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_14.x + 1.0;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_55 + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_5.x;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_5.x = u_xlat16_55 * u_xlat16_5.x;
    u_xlat0.x = min(u_xlat16_5.x, 1.0);
    u_xlat25 = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat25) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * vec3(u_xlat25) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.zxy;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_55) * u_xlat16_24.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati50 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_3.xzw = u_xlat16_15.xyz * u_xlat16_20.xyz + u_xlat16_3.xzw;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_15.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat16_28>=0.0);
#else
    u_xlatb25 = u_xlat16_28>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb25)) ? u_xlat2.xyz : u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.zxy * u_xlat16_39.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.zxy * u_xlat2.yzx + (-u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + u_xlat2.xyz;
    u_xlat16_14.x = u_xlat16_80 * 8.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_28) * u_xlat16_14.x;
    u_xlat2.xyz = u_xlat16_14.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat25 = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat50 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat2.xyz = vec3(u_xlat50) * u_xlat2.xyz;
    u_xlat16_14.x = dot((-u_xlat16_39.xyz), u_xlat2.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_14.xxx + (-u_xlat16_39.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat77) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_80) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_28)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_28 = -abs(u_xlat16_28) * 0.800000012 + 1.0;
    u_xlat16_28 = u_xlat16_30.x * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_28);
    u_xlat50 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
    u_xlat16_47.y = u_xlat50 * 0.5;
    u_xlat16_80 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_80;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb50 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb50)) ? u_xlat16_20.xyz : u_xlat16_15.xyz;
    u_xlat9.y = u_xlat16_30.x;
    u_xlat16_47.x = u_xlat16_30.x * 1.09769487;
    u_xlat16_5.xyw = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyw = min(max(u_xlat16_5.xyw, 0.0), 1.0);
#else
    u_xlat16_5.xyw = clamp(u_xlat16_5.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_2.yzw = u_xlat16_5.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_2.w);
    u_xlat16_5.x = u_xlat16_28 + 1.0;
    u_xlat16_5.x = min(u_xlat16_5.x, 15.0);
    u_xlat16_2.x = u_xlat16_5.x * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_2.x = u_xlat16_28 * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_28 = u_xlat16_5.w * 15.0 + (-u_xlat16_28);
    u_xlat16_5.x = u_xlat16_50 + (-u_xlat16_4.x);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.x + u_xlat16_4.x;
    u_xlat16_28 = u_xlat16_55 * u_xlat16_28;
    u_xlat25 = u_xlat25 * u_xlat16_28;
    u_xlat16_28 = u_xlat0.x * 0.5;
    u_xlat16_5.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat25 * u_xlat16_5.x + u_xlat16_28;
    u_xlat16_5.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_30.x = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_30.x + u_xlat16_5.x;
    u_xlat16_28 = u_xlat0.x * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_28, u_xlat16_12.z);
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_15.xyz + u_xlat16_3.xzw;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_15.yzx + u_xlat16_19.yzx;
    u_xlat16_78 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w + u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_15.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_39.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_39.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_39.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_30.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_30.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_30.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(1.5, 1.5);
    u_xlat16_25.x = texture(_MergeTex, u_xlat16_30.xy).x;
    u_xlat16_30.x = u_xlat16_0.x * u_xlat16_25.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_30.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_30.xy = u_xlat16_30.xy + u_xlat16_14.xy;
    u_xlat16_30.xy = u_xlat16_30.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_30.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_30.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_14.xxx;
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_4.yyy + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_26.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
    u_xlat75 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_25.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_5.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(15) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_26;
mediump vec2 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
vec3 u_xlat41;
mediump vec3 u_xlat16_43;
mediump vec3 u_xlat16_48;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
bool u_xlatb52;
mediump vec2 u_xlat16_53;
float u_xlat56;
float u_xlat58;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat78;
float u_xlat80;
mediump float u_xlat16_80;
bool u_xlatb80;
float u_xlat83;
float u_xlat84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
float u_xlat89;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_94;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_53.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_53.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_27.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_27.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_27.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_27.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_27.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_27.x = u_xlat16_27.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat16_27.x * -2.0 + 3.0;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_3;
    u_xlat16_27.x = min(u_xlat16_27.x, 1.0);
    u_xlat16_3 = u_xlat16_27.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3<0.0);
#else
    u_xlatb2.x = u_xlat16_3<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat85 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat7.xyz = vec3(u_xlat85) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat11.xyz = vec3(u_xlat85) * u_xlat8.xyz;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb80)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat80 = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat80) + u_xlat3.z;
    u_xlat4.x = max((-u_xlat3.w), u_xlat80);
    u_xlat4.x = (-u_xlat80) + u_xlat4.x;
    u_xlat3.z = _ShadowBias.y * u_xlat4.x + u_xlat80;
    u_xlat4.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat28 = (-u_xlat16_9.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat28 + u_xlat16_9.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_28 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_9.x = u_xlat16_28 * _shadowStrength;
    u_xlat28 = u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_9.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_9.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat2.xxx * u_xlat16_9.xyz + _shadowColor.zxy;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-_directSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor2nd.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.5<_anisoUse2U);
#else
    u_xlatb80 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb80)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_80 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat80 = u_xlat16_80 * 2.0 + -1.0;
    u_xlat4.x = u_xlat80 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat80 = u_xlat80 * _sunShift + _sunShiftOffset;
    u_xlat80 = u_xlat80 + vs_TEXCOORD5;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat56 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat5.xyz = (-u_xlat11.yzx) * vec3(u_xlat56) + u_xlat10.xyz;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat11.xyz;
    u_xlat6.xyz = u_xlat11.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_87 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat10.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat10.xyz = u_xlat4.xxx * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat10.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_91 = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_14.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat83 = u_xlat16_91 * u_xlat16_66;
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat84 = (-u_xlat16_91) + 1.0;
    u_xlat84 = u_xlat84 * u_xlat16_66;
    u_xlat84 = max(u_xlat84, 0.00100000005);
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat15.y = u_xlat4.x * u_xlat83;
    u_xlat16_91 = dot(u_xlat5.zxy, u_xlat10.xyz);
    u_xlat15.x = u_xlat84 * u_xlat16_91;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat84 * u_xlat83;
    u_xlat15.z = u_xlat4.x * u_xlat86;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = max(u_xlat88, 6.10351563e-05);
    u_xlat88 = u_xlat86 / u_xlat88;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat86 = u_xlat86 * u_xlat88;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat88 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.z = u_xlat84 * u_xlat88;
    u_xlat15.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.y = u_xlat83 * u_xlat16_92;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat15.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_87);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat84;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat5.zxy, u_xlat16_16.xyz);
    u_xlat6.y = u_xlat83 * u_xlat84;
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat6.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat83 = u_xlat83 * u_xlat88 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat83 = u_xlat86 * u_xlat83;
    u_xlat16_94 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_94) + 1.0;
    u_xlat16_94 = u_xlat86 * u_xlat86;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_17.x = u_xlat86 * u_xlat16_94;
    u_xlat86 = (-u_xlat16_94) * u_xlat86 + 1.0;
    u_xlat16_43.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_43.xyz = u_xlat16_0.zxy * u_xlat16_43.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_43.xyz = u_xlat16_0.zxy * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoChangColor.zxy + (-u_xlat16_43.xyz);
    u_xlat16_43.xyz = vec3(_EnableChangColor) * u_xlat16_18.xyz + u_xlat16_43.xyz;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_14.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_18.xyz;
    u_xlat86 = u_xlat16_18.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_17.xxx + u_xlat0.xyz;
    u_xlat19.xyz = u_xlat0.xyz * vec3(u_xlat83);
    u_xlat19.xyz = u_xlat16_13.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat15.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat19.xyz = u_xlat16_9.xyz * u_xlat19.xyz;
    u_xlat20.xyz = vec3(u_xlat80) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat83 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat20.xyz = vec3(u_xlat83) * u_xlat20.xyz;
    u_xlat83 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_13.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_39.x = u_xlat16_13.x + -1.0;
    u_xlat88 = u_xlat16_13.x * u_xlat16_66;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat89 = (-u_xlat16_39.x) + 1.0;
    u_xlat89 = u_xlat89 * u_xlat16_66;
    u_xlat89 = max(u_xlat89, 0.00100000005);
    u_xlat15.z = u_xlat83 * u_xlat89;
    u_xlat15.y = u_xlat16_92 * u_xlat88;
    u_xlat83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat15.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat12.x = dot(u_xlat20.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat89 * u_xlat12.x;
    u_xlat6.y = u_xlat84 * u_xlat88;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat83 = u_xlat58 * u_xlat83 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat84 = dot(u_xlat20.xyz, u_xlat10.xyz);
    u_xlat10.y = u_xlat84 * u_xlat88;
    u_xlat10.x = u_xlat16_91 * u_xlat89;
    u_xlat84 = u_xlat88 * u_xlat89;
    u_xlat10.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat10.x = u_xlat84 * 0.318309873;
    u_xlat4.x = u_xlat4.x * u_xlat10.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat83 * u_xlat4.x;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xzw = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_13.xzw = vec3(_EnableChangColor) * u_xlat16_13.xzw + _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_9.xyz + u_xlat19.xyz;
    u_xlat41.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_40 = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = u_xlat16_40 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_92 = (-u_xlat16_92) * u_xlat16_92 + 1.0;
    u_xlat16_92 = max(u_xlat16_92, 0.0);
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
    u_xlat16_94 = float(1.0) / float(u_xlat16_40);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_21.xyz = vec3(u_xlat16_40) * u_xlat41.xyz;
    u_xlat16_40 = u_xlat16_92 * u_xlat16_94;
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_22.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_22.x);
    u_xlat16_22.xzw = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_22.xzw;
    u_xlat16_92 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_92 = u_xlat16_92 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_92 = max(u_xlat16_92, u_xlat16_94);
    u_xlat16_40 = u_xlat16_92 * u_xlat16_40;
    u_xlat16_22.xyz = vec3(u_xlat16_40) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat41.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_21.xyz;
    u_xlat4.x = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat41.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat88;
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat41.xyz);
    u_xlat19.x = u_xlat89 * u_xlat16_40;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_40 = dot(u_xlat16_21.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_40) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat19.x = dot(u_xlat11.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat20.xyz, u_xlat16_21.xyz);
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat19.y = u_xlat88 * u_xlat16_40;
    u_xlat19.z = u_xlat36 * u_xlat89;
    u_xlat36 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat19.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat58 * u_xlat36 + 6.10351563e-05;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat4.x = u_xlat4.x * u_xlat36;
    u_xlat16_40 = u_xlat83 * u_xlat83;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_92 = u_xlat83 * u_xlat16_40;
    u_xlat83 = (-u_xlat16_40) * u_xlat83 + 1.0;
    u_xlat41.xyz = u_xlat16_18.xyz * vec3(u_xlat83);
    u_xlat41.xyz = vec3(u_xlat86) * vec3(u_xlat16_92) + u_xlat41.xyz;
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xyz = min(max(u_xlat41.xyz, 0.0), 1.0);
#else
    u_xlat41.xyz = clamp(u_xlat41.xyz, 0.0, 1.0);
#endif
    u_xlat41.xyz = u_xlat16_13.xzw * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat19.xxx * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat16_22.xyz * u_xlat41.xyz;
    u_xlat16_21.xyz = u_xlat41.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = inversesqrt(u_xlat16_40);
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(u_xlat16_92);
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_23.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat0.xyz);
    u_xlat83 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat7.z = u_xlat83 * u_xlat89;
    u_xlat20.y = u_xlat4.x * u_xlat88;
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat20.x = u_xlat16_87 * u_xlat89;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_87) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat84;
    u_xlat26 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat26 = max(u_xlat26, 6.10351563e-05);
    u_xlat26 = u_xlat84 / u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat10.x * u_xlat26;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat16_23.xyz);
    u_xlat7.y = u_xlat16_87 * u_xlat88;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat7.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat58 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat26 = u_xlat52 * u_xlat26;
    u_xlat16_92 = u_xlat0.x * u_xlat0.x;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_94 = u_xlat0.x * u_xlat16_92;
    u_xlat0.x = (-u_xlat16_92) * u_xlat0.x + 1.0;
    u_xlat10.xyz = u_xlat16_18.xyz * u_xlat0.xxx;
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_94) + u_xlat10.xyz;
    u_xlat0.xyz = vec3(u_xlat26) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_13.xzw * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat16_13.x = u_xlat16_40 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_40);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_65;
    u_xlat16_13.x = max(u_xlat16_24.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_65);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_13.x;
    u_xlat16_13.xzw = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat28) + u_xlat16_21.xyz;
    u_xlat16_87 = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_43.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = vec3(u_xlat28) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat19.xxx * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat15.xxx + u_xlat16_22.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * u_xlat16_17.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xzw = vec3(u_xlat28) * u_xlat16_13.xzw;
    u_xlat16_9.xyz = u_xlat16_13.xzw * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_21.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xzw = (-u_xlat8.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xzw = vec3(_occlusionScale) * u_xlat16_13.xzw + u_xlat11.xyz;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat16_13.xzw);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat16_13.xzw = vec3(u_xlat16_87) * u_xlat16_13.xzw;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_87 * 0.5 + 0.5;
    u_xlat16_40 = (-u_xlat16_87) + u_xlat16_40;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_40 + u_xlat16_87;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_87;
    u_xlat16_40 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_40 + -1.0;
    u_xlat16_40 = _occlusionScale * u_xlat16_40 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_40;
    u_xlat0.xy = min(u_xlat2.xz, vec2(u_xlat16_87));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xw);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xw);
    u_xlat16_24.y = u_xlat16_13.z;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = vec3(u_xlat16_40) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati52 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_9.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat16_17.xyz + u_xlat30.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_39.x>=0.0);
#else
    u_xlatb0 = u_xlat16_39.x>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat16_16.yzx + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat2.yzx + (-u_xlat5.xyz);
    u_xlat2.xyz = (-u_xlat8.xyz) * vec3(u_xlat85) + u_xlat2.xyz;
    u_xlat16_92 = u_xlat16_66 * 8.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_92 = min(u_xlat16_92, 1.0);
    u_xlat16_92 = abs(u_xlat16_39.x) * u_xlat16_92;
    u_xlat2.xyz = vec3(u_xlat16_92) * u_xlat2.xyz + u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * u_xlat2.xyz;
    u_xlat16_92 = dot((-u_xlat16_16.xyz), u_xlat2.xyz);
    u_xlat16_92 = u_xlat16_92 + u_xlat16_92;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_92) + (-u_xlat16_16.xyz);
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat85) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_66) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(u_xlat16_39.xxx) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_39.x = -abs(u_xlat16_39.x) * 0.800000012 + 1.0;
    u_xlat16_39.x = u_xlat16_14.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat52 = dot(u_xlat16_13.xzw, u_xlat2.xyz);
    u_xlat16_48.y = u_xlat52 * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_13.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_39.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb52 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb52)) ? u_xlat16_17.xyz : u_xlat16_13.xyz;
    u_xlat6.y = u_xlat16_14.x;
    u_xlat16_48.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xzw = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xzw = min(max(u_xlat16_14.xzw, 0.0), 1.0);
#else
    u_xlat16_14.xzw = clamp(u_xlat16_14.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_14.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_87 = floor(u_xlat16_2.w);
    u_xlat16_91 = u_xlat16_87 + 1.0;
    u_xlat16_91 = min(u_xlat16_91, 15.0);
    u_xlat16_2.x = u_xlat16_91 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_2.x = u_xlat16_87 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_87 = u_xlat16_14.w * 15.0 + (-u_xlat16_87);
    u_xlat16_91 = u_xlat16_52 + (-u_xlat16_4.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_91 + u_xlat16_4.x;
    u_xlat16_87 = u_xlat16_40 * u_xlat16_87;
    u_xlat0.x = u_xlat0.x * u_xlat16_87;
    u_xlat16_87 = u_xlat0.y * 0.5;
    u_xlat16_91 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_87 = u_xlat0.x * u_xlat16_91 + u_xlat16_87;
    u_xlat16_91 = u_xlat16_87 + u_xlat16_87;
    u_xlat16_14.x = (-u_xlat16_87) * 2.0 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x + u_xlat16_91;
    u_xlat16_87 = u_xlat0.y * u_xlat16_87;
    u_xlat16_87 = min(u_xlat16_87, u_xlat16_12.z);
    u_xlat16_13.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.yzx * u_xlat16_14.yzx + u_xlat16_21.yzx;
    u_xlat16_87 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_0.w * _albedoColor.w + u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_39.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_39.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat0.xy = u_xlat16_16.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_16.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_16.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_39.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_39.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_39.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(1.5, 1.5);
    u_xlat16_26.x = texture(_MergeTex, u_xlat16_39.xy).x;
    u_xlat16_39.x = u_xlat16_0.x * u_xlat16_26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat16_39.x = u_xlat16_39.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_39.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_39.xy = u_xlat16_39.xy + u_xlat16_14.xy;
    u_xlat16_39.xy = u_xlat16_39.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_39.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_39.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_14.xxx;
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_4.yyy + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_27.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_1.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_26.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_87 : u_xlat16_13.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(15) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump vec3 u_xlat16_26;
mediump vec2 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
vec3 u_xlat41;
mediump vec3 u_xlat16_43;
mediump vec3 u_xlat16_48;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
bool u_xlatb52;
mediump vec2 u_xlat16_53;
float u_xlat56;
float u_xlat58;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat78;
float u_xlat80;
mediump float u_xlat16_80;
bool u_xlatb80;
float u_xlat83;
float u_xlat84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
float u_xlat89;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_94;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_53.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_53.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_27.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_27.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_27.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_27.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_27.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_27.x = u_xlat16_27.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat16_27.x * -2.0 + 3.0;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_3;
    u_xlat16_27.x = min(u_xlat16_27.x, 1.0);
    u_xlat16_3 = u_xlat16_27.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3<0.0);
#else
    u_xlatb2.x = u_xlat16_3<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat85 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat7.xyz = vec3(u_xlat85) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat11.xyz = vec3(u_xlat85) * u_xlat8.xyz;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb80)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat80 = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat80) + u_xlat3.z;
    u_xlat4.x = max((-u_xlat3.w), u_xlat80);
    u_xlat4.x = (-u_xlat80) + u_xlat4.x;
    u_xlat3.z = _ShadowBias.y * u_xlat4.x + u_xlat80;
    u_xlat4.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat28 = (-u_xlat16_9.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat28 + u_xlat16_9.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_28 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_9.x = u_xlat16_28 * _shadowStrength;
    u_xlat28 = u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_9.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_9.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat2.xxx * u_xlat16_9.xyz + _shadowColor.zxy;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-_directSpecularColor2nd.zxy) + _ChangDirectSpecularColor2nd.zxy;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor2nd.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.5<_anisoUse2U);
#else
    u_xlatb80 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb80)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_80 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat80 = u_xlat16_80 * 2.0 + -1.0;
    u_xlat4.x = u_xlat80 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat80 = u_xlat80 * _sunShift + _sunShiftOffset;
    u_xlat80 = u_xlat80 + vs_TEXCOORD5;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat56 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat5.xyz = (-u_xlat11.yzx) * vec3(u_xlat56) + u_xlat10.xyz;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat11.xyz;
    u_xlat6.xyz = u_xlat11.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_87 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat10.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat10.xyz = u_xlat4.xxx * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat10.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_91 = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_14.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat83 = u_xlat16_91 * u_xlat16_66;
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat84 = (-u_xlat16_91) + 1.0;
    u_xlat84 = u_xlat84 * u_xlat16_66;
    u_xlat84 = max(u_xlat84, 0.00100000005);
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat15.y = u_xlat4.x * u_xlat83;
    u_xlat16_91 = dot(u_xlat5.zxy, u_xlat10.xyz);
    u_xlat15.x = u_xlat84 * u_xlat16_91;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat84 * u_xlat83;
    u_xlat15.z = u_xlat4.x * u_xlat86;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = max(u_xlat88, 6.10351563e-05);
    u_xlat88 = u_xlat86 / u_xlat88;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat86 = u_xlat86 * u_xlat88;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat88 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.z = u_xlat84 * u_xlat88;
    u_xlat15.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.y = u_xlat83 * u_xlat16_92;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat15.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_87);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat84;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat5.zxy, u_xlat16_16.xyz);
    u_xlat6.y = u_xlat83 * u_xlat84;
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat6.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat83 = u_xlat83 * u_xlat88 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat83 = u_xlat86 * u_xlat83;
    u_xlat16_94 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_94) + 1.0;
    u_xlat16_94 = u_xlat86 * u_xlat86;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_17.x = u_xlat86 * u_xlat16_94;
    u_xlat86 = (-u_xlat16_94) * u_xlat86 + 1.0;
    u_xlat16_43.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_43.xyz = u_xlat16_0.zxy * u_xlat16_43.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_43.xyz = u_xlat16_0.zxy * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoChangColor.zxy + (-u_xlat16_43.xyz);
    u_xlat16_43.xyz = vec3(_EnableChangColor) * u_xlat16_18.xyz + u_xlat16_43.xyz;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_14.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_18.xyz;
    u_xlat86 = u_xlat16_18.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_17.xxx + u_xlat0.xyz;
    u_xlat19.xyz = u_xlat0.xyz * vec3(u_xlat83);
    u_xlat19.xyz = u_xlat16_13.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat15.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat19.xyz = u_xlat16_9.xyz * u_xlat19.xyz;
    u_xlat20.xyz = vec3(u_xlat80) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat83 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat20.xyz = vec3(u_xlat83) * u_xlat20.xyz;
    u_xlat83 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_13.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_39.x = u_xlat16_13.x + -1.0;
    u_xlat88 = u_xlat16_13.x * u_xlat16_66;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat89 = (-u_xlat16_39.x) + 1.0;
    u_xlat89 = u_xlat89 * u_xlat16_66;
    u_xlat89 = max(u_xlat89, 0.00100000005);
    u_xlat15.z = u_xlat83 * u_xlat89;
    u_xlat15.y = u_xlat16_92 * u_xlat88;
    u_xlat83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat15.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat12.x = dot(u_xlat20.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat89 * u_xlat12.x;
    u_xlat6.y = u_xlat84 * u_xlat88;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat83 = u_xlat58 * u_xlat83 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat84 = dot(u_xlat20.xyz, u_xlat10.xyz);
    u_xlat10.y = u_xlat84 * u_xlat88;
    u_xlat10.x = u_xlat16_91 * u_xlat89;
    u_xlat84 = u_xlat88 * u_xlat89;
    u_xlat10.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat10.x = u_xlat84 * 0.318309873;
    u_xlat4.x = u_xlat4.x * u_xlat10.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat83 * u_xlat4.x;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xzw = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_13.xzw = vec3(_EnableChangColor) * u_xlat16_13.xzw + _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_9.xyz + u_xlat19.xyz;
    u_xlat41.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_40 = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = u_xlat16_40 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_92 = (-u_xlat16_92) * u_xlat16_92 + 1.0;
    u_xlat16_92 = max(u_xlat16_92, 0.0);
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
    u_xlat16_94 = float(1.0) / float(u_xlat16_40);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_21.xyz = vec3(u_xlat16_40) * u_xlat41.xyz;
    u_xlat16_40 = u_xlat16_92 * u_xlat16_94;
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_22.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_22.x);
    u_xlat16_22.xzw = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_22.xzw;
    u_xlat16_92 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_92 = u_xlat16_92 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_92 = max(u_xlat16_92, u_xlat16_94);
    u_xlat16_40 = u_xlat16_92 * u_xlat16_40;
    u_xlat16_22.xyz = vec3(u_xlat16_40) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat41.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_21.xyz;
    u_xlat4.x = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat41.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat88;
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat41.xyz);
    u_xlat19.x = u_xlat89 * u_xlat16_40;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_40 = dot(u_xlat16_21.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_40) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat19.x = dot(u_xlat11.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat20.xyz, u_xlat16_21.xyz);
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat19.y = u_xlat88 * u_xlat16_40;
    u_xlat19.z = u_xlat36 * u_xlat89;
    u_xlat36 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat19.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat58 * u_xlat36 + 6.10351563e-05;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat4.x = u_xlat4.x * u_xlat36;
    u_xlat16_40 = u_xlat83 * u_xlat83;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_92 = u_xlat83 * u_xlat16_40;
    u_xlat83 = (-u_xlat16_40) * u_xlat83 + 1.0;
    u_xlat41.xyz = u_xlat16_18.xyz * vec3(u_xlat83);
    u_xlat41.xyz = vec3(u_xlat86) * vec3(u_xlat16_92) + u_xlat41.xyz;
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xyz = min(max(u_xlat41.xyz, 0.0), 1.0);
#else
    u_xlat41.xyz = clamp(u_xlat41.xyz, 0.0, 1.0);
#endif
    u_xlat41.xyz = u_xlat16_13.xzw * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat19.xxx * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat16_22.xyz * u_xlat41.xyz;
    u_xlat16_21.xyz = u_xlat41.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = inversesqrt(u_xlat16_40);
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(u_xlat16_92);
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_23.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat0.xyz);
    u_xlat83 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat7.z = u_xlat83 * u_xlat89;
    u_xlat20.y = u_xlat4.x * u_xlat88;
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat20.x = u_xlat16_87 * u_xlat89;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_87) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat84;
    u_xlat26 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat26 = max(u_xlat26, 6.10351563e-05);
    u_xlat26 = u_xlat84 / u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat10.x * u_xlat26;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat16_23.xyz);
    u_xlat7.y = u_xlat16_87 * u_xlat88;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat7.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat58 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat26 = u_xlat52 * u_xlat26;
    u_xlat16_92 = u_xlat0.x * u_xlat0.x;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_94 = u_xlat0.x * u_xlat16_92;
    u_xlat0.x = (-u_xlat16_92) * u_xlat0.x + 1.0;
    u_xlat10.xyz = u_xlat16_18.xyz * u_xlat0.xxx;
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_94) + u_xlat10.xyz;
    u_xlat0.xyz = vec3(u_xlat26) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_13.xzw * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat16_13.x = u_xlat16_40 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_40);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_65;
    u_xlat16_13.x = max(u_xlat16_24.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_65);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_13.x;
    u_xlat16_13.xzw = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat28) + u_xlat16_21.xyz;
    u_xlat16_87 = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_43.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = vec3(u_xlat28) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat19.xxx * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat15.xxx + u_xlat16_22.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * u_xlat16_17.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xzw = vec3(u_xlat28) * u_xlat16_13.xzw;
    u_xlat16_9.xyz = u_xlat16_13.xzw * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_21.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xzw = (-u_xlat8.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xzw = vec3(_occlusionScale) * u_xlat16_13.xzw + u_xlat11.xyz;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat16_13.xzw);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat16_13.xzw = vec3(u_xlat16_87) * u_xlat16_13.xzw;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_87 * 0.5 + 0.5;
    u_xlat16_40 = (-u_xlat16_87) + u_xlat16_40;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_40 + u_xlat16_87;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_87;
    u_xlat16_40 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_40 + -1.0;
    u_xlat16_40 = _occlusionScale * u_xlat16_40 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_40;
    u_xlat0.xy = min(u_xlat2.xz, vec2(u_xlat16_87));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.zxy;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xw);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xw);
    u_xlat16_24.y = u_xlat16_13.z;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = vec3(u_xlat16_40) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati52 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_9.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat16_17.xyz + u_xlat30.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_39.x>=0.0);
#else
    u_xlatb0 = u_xlat16_39.x>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat16_16.yzx + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat2.yzx + (-u_xlat5.xyz);
    u_xlat2.xyz = (-u_xlat8.xyz) * vec3(u_xlat85) + u_xlat2.xyz;
    u_xlat16_92 = u_xlat16_66 * 8.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_92 = min(u_xlat16_92, 1.0);
    u_xlat16_92 = abs(u_xlat16_39.x) * u_xlat16_92;
    u_xlat2.xyz = vec3(u_xlat16_92) * u_xlat2.xyz + u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * u_xlat2.xyz;
    u_xlat16_92 = dot((-u_xlat16_16.xyz), u_xlat2.xyz);
    u_xlat16_92 = u_xlat16_92 + u_xlat16_92;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_92) + (-u_xlat16_16.xyz);
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat85) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_66) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(u_xlat16_39.xxx) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_39.x = -abs(u_xlat16_39.x) * 0.800000012 + 1.0;
    u_xlat16_39.x = u_xlat16_14.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat52 = dot(u_xlat16_13.xzw, u_xlat2.xyz);
    u_xlat16_48.y = u_xlat52 * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_13.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_39.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb52 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb52)) ? u_xlat16_17.xyz : u_xlat16_13.xyz;
    u_xlat6.y = u_xlat16_14.x;
    u_xlat16_48.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xzw = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xzw = min(max(u_xlat16_14.xzw, 0.0), 1.0);
#else
    u_xlat16_14.xzw = clamp(u_xlat16_14.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_14.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_87 = floor(u_xlat16_2.w);
    u_xlat16_91 = u_xlat16_87 + 1.0;
    u_xlat16_91 = min(u_xlat16_91, 15.0);
    u_xlat16_2.x = u_xlat16_91 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_2.x = u_xlat16_87 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_87 = u_xlat16_14.w * 15.0 + (-u_xlat16_87);
    u_xlat16_91 = u_xlat16_52 + (-u_xlat16_4.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_91 + u_xlat16_4.x;
    u_xlat16_87 = u_xlat16_40 * u_xlat16_87;
    u_xlat0.x = u_xlat0.x * u_xlat16_87;
    u_xlat16_87 = u_xlat0.y * 0.5;
    u_xlat16_91 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_87 = u_xlat0.x * u_xlat16_91 + u_xlat16_87;
    u_xlat16_91 = u_xlat16_87 + u_xlat16_87;
    u_xlat16_14.x = (-u_xlat16_87) * 2.0 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x + u_xlat16_91;
    u_xlat16_87 = u_xlat0.y * u_xlat16_87;
    u_xlat16_87 = min(u_xlat16_87, u_xlat16_12.z);
    u_xlat16_13.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.yzx * u_xlat16_14.yzx + u_xlat16_21.yzx;
    u_xlat16_87 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_0.w * _albedoColor.w + u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_39.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_39.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat0.xy = u_xlat16_16.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_16.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_16.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_39.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_39.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_39.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(1.5, 1.5);
    u_xlat16_26.x = texture(_MergeTex, u_xlat16_39.xy).x;
    u_xlat16_39.x = u_xlat16_0.x * u_xlat16_26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat16_39.x = u_xlat16_39.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_39.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_39.xy = u_xlat16_39.xy + u_xlat16_14.xy;
    u_xlat16_39.xy = u_xlat16_39.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_39.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_39.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_14.xxx;
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_4.yyy + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_27.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_1.xyz;
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
    u_xlat78 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat78);
    u_xlat1.x = u_xlat78 * 0.0625 + u_xlat1.y;
    u_xlat16_26.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_26.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_26.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_87 : u_xlat16_13.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
float u_xlat21;
vec3 u_xlat23;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
float u_xlat38;
mediump float u_xlat16_38;
bool u_xlatb38;
mediump vec2 u_xlat16_39;
mediump vec2 u_xlat16_40;
int u_xlati40;
bool u_xlatb40;
float u_xlat57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb60 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb60)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_9.xyz = u_xlat16_39.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat10.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat6.zxy * u_xlat16_9.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat6.xyz * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat6.yzx + (-u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_39.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_12.x = u_xlat16_66 * 8.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_20.x) * u_xlat16_12.x;
    u_xlat6.xyz = u_xlat16_12.xxx * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_9.xyz), u_xlat6.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat6.xyz = (-u_xlat6.xyz) * u_xlat16_12.xxx + (-u_xlat16_9.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_69 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = max(u_xlat16_69, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_69) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_69 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat16_66;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_66;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_39.x * u_xlat16_69;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_10.www * u_xlat16_10.zxy;
    u_xlat10.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat16_12.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_15.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _occlusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_15.xyw;
    u_xlat16_20.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_20.xxx * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat10.x;
    u_xlat11.y = u_xlat16_39.x;
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_16.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_0.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_0.zxy * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _AlbedoChangColor.zxy + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = vec3(_EnableChangColor) * u_xlat16_17.xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_39.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20.x = u_xlat16_39.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_20.y = u_xlat0.x * 0.5;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_20.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_18.xyz = u_xlat16_20.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_6.w);
    u_xlat16_39.x = u_xlat16_20.x + 1.0;
    u_xlat16_39.x = min(u_xlat16_39.x, 15.0);
    u_xlat16_6.x = u_xlat16_39.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_20.x = u_xlat16_18.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_39.x = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_39.x + u_xlat16_19.x;
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_39.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_39.x * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat16_39.x) + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x + u_xlat16_39.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat19.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat19.x * 0.5;
    u_xlat16_20.x = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_20.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_39.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39.x + u_xlat16_20.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat0.x = min(u_xlat19.x, u_xlat16_7.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_7.z);
    u_xlat16_20.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat16_9.xyz);
    u_xlat19.y = dot(u_xlat3.zxy, u_xlat16_9.xyz);
    u_xlat10.yz = u_xlat19.yx * u_xlat2.yx;
    u_xlat19.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat11.x;
    u_xlat38 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.z = u_xlat38 * u_xlat2.x;
    u_xlat16_1.x = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.y = u_xlat16_1.x * u_xlat2.y;
    u_xlat7.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat19.y = u_xlat38 + u_xlat7.x;
    u_xlat19.xy = u_xlat19.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.y + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat26.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat26.xyz);
    u_xlat5.y = u_xlat38 * u_xlat2.y;
    u_xlat38 = u_xlat2.x * u_xlat2.y;
    u_xlat16_1.x = dot(u_xlat3.zxy, u_xlat26.xyz);
    u_xlat5.x = u_xlat16_1.x * u_xlat2.x;
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat16_1.x) + 1.0;
    u_xlat5.z = u_xlat38 * u_xlat2.x;
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat38 / u_xlat2.x;
    u_xlat38 = u_xlat38 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat38 = u_xlat38 * u_xlat2.x;
    u_xlat38 = min(u_xlat38, 16.0);
    u_xlat19.x = u_xlat19.x * u_xlat38;
    u_xlat16_1.x = u_xlat21 * u_xlat21;
    u_xlat16_1.x = u_xlat21 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat21 * u_xlat16_1.x;
    u_xlat16_9.x = u_xlat21 * u_xlat16_1.x;
    u_xlat38 = (-u_xlat16_1.x) * u_xlat21 + 1.0;
    u_xlat2.xyz = u_xlat16_17.xyz * vec3(u_xlat38);
    u_xlat38 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_9.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_9.xyz = vec3(_EnableChangColor) * u_xlat16_9.xyz + _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_9.xyz;
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_9.xyz = u_xlat3.xyz * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.yyy + u_xlat16_16.xyz;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = u_xlat16_9.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_28.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_28.x = (-u_xlat16_28.x) * u_xlat16_28.x + 1.0;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_28.x;
    u_xlat16_1.x = max(u_xlat16_14.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb38 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28.x = (u_xlatb38) ? 1.0 : 0.0;
    u_xlat16_9.x = max(u_xlat16_28.x, u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_9.xyz = u_xlat16_20.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat38 = u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat19.xxx * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat16_14.xyz * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_69;
    u_xlat16_1.x = max(u_xlat16_16.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb59 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb59) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_69);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_66;
    u_xlat16_14.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat38) * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_14.xyz * u_xlat19.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat2.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.yzx;
    u_xlat16_58 = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_0.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_28.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_28.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_28.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_28.xyz + u_xlat16_1.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_9.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
mediump vec3 u_xlat16_20;
float u_xlat21;
vec3 u_xlat23;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
float u_xlat38;
mediump float u_xlat16_38;
bool u_xlatb38;
mediump vec2 u_xlat16_39;
mediump vec2 u_xlat16_40;
int u_xlati40;
bool u_xlatb40;
float u_xlat57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_69;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb60 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb60)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_9.xyz = u_xlat16_39.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat10.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat6.zxy * u_xlat16_9.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat6.xyz * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat6.yzx + (-u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_39.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_12.x = u_xlat16_66 * 8.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_20.x) * u_xlat16_12.x;
    u_xlat6.xyz = u_xlat16_12.xxx * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_9.xyz), u_xlat6.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat6.xyz = (-u_xlat6.xyz) * u_xlat16_12.xxx + (-u_xlat16_9.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_69 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = max(u_xlat16_69, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_69) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_69 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat16_66;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_66;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_39.x * u_xlat16_69;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_10.www * u_xlat16_10.zxy;
    u_xlat10.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat16_12.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_15.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _occlusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_15.xyw;
    u_xlat16_20.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_20.xxx * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat10.x;
    u_xlat11.y = u_xlat16_39.x;
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_16.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.zxy * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_0.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_0.zxy * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _AlbedoChangColor.zxy + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = vec3(_EnableChangColor) * u_xlat16_17.xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_39.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20.x = u_xlat16_39.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_20.y = u_xlat0.x * 0.5;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_20.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_18.xyz = u_xlat16_20.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_6.w);
    u_xlat16_39.x = u_xlat16_20.x + 1.0;
    u_xlat16_39.x = min(u_xlat16_39.x, 15.0);
    u_xlat16_6.x = u_xlat16_39.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_20.x = u_xlat16_18.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_39.x = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_39.x + u_xlat16_19.x;
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat0.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_39.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_39.x * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat16_39.x) + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x + u_xlat16_39.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat19.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat19.x * 0.5;
    u_xlat16_20.x = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_20.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_39.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39.x + u_xlat16_20.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat0.x = min(u_xlat19.x, u_xlat16_7.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_7.z);
    u_xlat16_20.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_16.xyz;
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat16_9.xyz);
    u_xlat19.y = dot(u_xlat3.zxy, u_xlat16_9.xyz);
    u_xlat10.yz = u_xlat19.yx * u_xlat2.yx;
    u_xlat19.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat11.x;
    u_xlat38 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.z = u_xlat38 * u_xlat2.x;
    u_xlat16_1.x = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.y = u_xlat16_1.x * u_xlat2.y;
    u_xlat7.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat19.y = u_xlat38 + u_xlat7.x;
    u_xlat19.xy = u_xlat19.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.y + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat26.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat26.xyz);
    u_xlat5.y = u_xlat38 * u_xlat2.y;
    u_xlat38 = u_xlat2.x * u_xlat2.y;
    u_xlat16_1.x = dot(u_xlat3.zxy, u_xlat26.xyz);
    u_xlat5.x = u_xlat16_1.x * u_xlat2.x;
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat16_1.x) + 1.0;
    u_xlat5.z = u_xlat38 * u_xlat2.x;
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat38 / u_xlat2.x;
    u_xlat38 = u_xlat38 * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat38 = u_xlat38 * u_xlat2.x;
    u_xlat38 = min(u_xlat38, 16.0);
    u_xlat19.x = u_xlat19.x * u_xlat38;
    u_xlat16_1.x = u_xlat21 * u_xlat21;
    u_xlat16_1.x = u_xlat21 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat21 * u_xlat16_1.x;
    u_xlat16_9.x = u_xlat21 * u_xlat16_1.x;
    u_xlat38 = (-u_xlat16_1.x) * u_xlat21 + 1.0;
    u_xlat2.xyz = u_xlat16_17.xyz * vec3(u_xlat38);
    u_xlat38 = u_xlat16_17.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat38) * u_xlat16_9.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat19.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_9.xyz = vec3(_EnableChangColor) * u_xlat16_9.xyz + _directSpecularColor.zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_9.xyz;
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_9.xyz = u_xlat3.xyz * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.yyy + u_xlat16_16.xyz;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = u_xlat16_9.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_28.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_28.x = (-u_xlat16_28.x) * u_xlat16_28.x + 1.0;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_28.x;
    u_xlat16_1.x = max(u_xlat16_14.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb38 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28.x = (u_xlatb38) ? 1.0 : 0.0;
    u_xlat16_9.x = max(u_xlat16_28.x, u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_9.xyz = u_xlat16_20.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat38 = u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat19.xxx * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat16_14.xyz * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_69;
    u_xlat16_1.x = max(u_xlat16_16.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb59 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb59) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_69);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_66;
    u_xlat16_14.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_20.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat38) * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_14.xyz * u_xlat19.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat2.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.yzx;
    u_xlat16_58 = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_0.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_28.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_28.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_12.xyz + u_xlat16_1.xyz;
    u_xlat16_28.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_28.xyz + u_xlat16_1.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_9.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
ivec3 u_xlati5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec2 u_xlat16_27;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
vec2 u_xlat44;
float u_xlat45;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat63;
float u_xlat65;
bool u_xlatb65;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
mediump float u_xlat16_67;
int u_xlati67;
bool u_xlatb67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
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
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat9.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat9.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat23 = max((-u_xlat1.w), u_xlat2.x);
    u_xlat23 = (-u_xlat2.x) + u_xlat23;
    u_xlat1.z = _ShadowBias.y * u_xlat23 + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat23 = (-u_xlat16_7.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23 + u_xlat16_7.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_23 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_23 * _shadowStrength;
    u_xlat23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_7.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat44.x = u_xlat2.x + -1.0;
    u_xlat44.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat44.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_occlusionScale) * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_70) + u_xlat16_11.x;
    u_xlat16_32.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_32.x + 1.0;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_11.x + u_xlat16_70;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_70;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_11.x;
    u_xlat44.xy = min(u_xlat44.xy, vec2(u_xlat16_70));
    u_xlat16_70 = u_xlat44.y * 0.5;
    u_xlat16_12.x = (-u_xlat44.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_anisoUse2U);
#else
    u_xlatb3 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_3 = texture(_anisotropicMap, u_xlat3.xy).x;
    u_xlat3.x = u_xlat16_3 * 2.0 + -1.0;
    u_xlat3.x = u_xlat3.x * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_33.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_33.xyz = u_xlat16_33.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat45 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat45) + u_xlat8.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat3.xxx * u_xlat16_33.xyz + u_xlat24.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_8.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_33.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_54 = u_xlat16_33.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_54>=0.0);
#else
    u_xlatb66 = u_xlat16_54>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(u_xlat16_75);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.xyz = u_xlat5.xyz * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat16_13.yzx + (-u_xlat14.xyz);
    u_xlat15.xyz = u_xlat5.xyz * u_xlat14.xyz;
    u_xlat5.xyz = u_xlat14.zxy * u_xlat5.yzx + (-u_xlat15.xyz);
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_16.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_75 = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_75 = max(u_xlat16_75, 0.0078125);
    u_xlat16_76 = u_xlat16_75 * 8.0;
    u_xlat16_76 = min(u_xlat16_76, 1.0);
    u_xlat16_76 = abs(u_xlat16_54) * u_xlat16_76;
    u_xlat5.xyz = vec3(u_xlat16_76) * u_xlat5.xyz + u_xlat9.xyz;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_76 = dot((-u_xlat16_13.xyz), u_xlat5.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_76) + (-u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat5.xyz);
    u_xlat16_32.y = u_xlat66 * 0.5;
    u_xlat16_32.x = u_xlat16_16.x * 1.09769487;
    u_xlat16_32.xyz = u_xlat16_32.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_32.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_1.w);
    u_xlat16_53 = u_xlat16_32.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_1.x = u_xlat16_53 * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_1.x = u_xlat16_32.x * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_32.x = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_53 = u_xlat16_66 + (-u_xlat16_67);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_53 + u_xlat16_67;
    u_xlat16_32.x = u_xlat16_11.x * u_xlat16_32.x;
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat16_32.x;
    u_xlat16_70 = u_xlat66 * u_xlat16_12.x + u_xlat16_70;
    u_xlat16_32.x = u_xlat16_70 + u_xlat16_70;
    u_xlat16_53 = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_70 = u_xlat44.y * u_xlat16_70;
    u_xlat44.x = min(u_xlat44.x, u_xlat16_8.z);
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_8.z);
    u_xlat16_32.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat16_53 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat6.xyz = vec3(u_xlat16_53) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_54)) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat17.y = u_xlat5.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_53 = -abs(u_xlat16_54) * 0.800000012 + 1.0;
    u_xlat65 = (-u_xlat16_54) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat16_75;
    u_xlat66 = u_xlat16_33.x * u_xlat16_75;
    u_xlat66 = max(u_xlat66, 0.00100000005);
    u_xlat65 = max(u_xlat65, 0.00100000005);
    u_xlat16_53 = u_xlat16_16.x * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_53);
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_53);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat5.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_7.xyz = u_xlat16_11.xxx * u_xlat16_7.xyz;
    u_xlati67 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_11.xzw = u_xlat16_7.yyy * _IrradianceACCoeffs[u_xlati67].xyz;
    u_xlati67 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_11.xzw = u_xlat16_7.xxx * _IrradianceACCoeffs[u_xlati67].xyz + u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_7.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_11.xzw;
    u_xlat16_11.x = dot(u_xlat16_7.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_11.xzw = u_xlat16_11.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb67)) ? u_xlat16_11.xzw : u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x;
    u_xlat6.y = u_xlat16_16.x;
    u_xlat16_27.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_12.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xzw = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xzw = u_xlat16_0.zxy * u_xlat16_16.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xzw = u_xlat16_0.zxy * u_xlat16_16.xzw;
    u_xlat16_16.xzw = u_xlat16_16.xzw * _AlbedoChangColor.zxy + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = vec3(_EnableChangColor) * u_xlat16_16.xzw + u_xlat16_12.xyz;
    u_xlat16_16.xzw = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_32.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_16.yyy * u_xlat16_16.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_27.xxx + u_xlat16_27.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat16_13.xyz);
    u_xlat24.x = dot(u_xlat4.zxy, u_xlat16_13.xyz);
    u_xlat5.y = u_xlat24.x * u_xlat66;
    u_xlat5.z = u_xlat65 * u_xlat3.x;
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat6.x;
    u_xlat24.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.z = u_xlat65 * u_xlat24.x;
    u_xlat16_70 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.y = u_xlat66 * u_xlat16_70;
    u_xlat5.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat3.y = u_xlat24.x + u_xlat5.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat24.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat26.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat26.xyz);
    u_xlat0.y = u_xlat0.x * u_xlat66;
    u_xlat24.x = u_xlat65 * u_xlat66;
    u_xlat16_70 = dot(u_xlat4.zxy, u_xlat26.xyz);
    u_xlat0.x = u_xlat65 * u_xlat16_70;
    u_xlat65 = dot(u_xlat9.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16_70) + 1.0;
    u_xlat0.z = u_xlat65 * u_xlat24.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat24.x / u_xlat0.x;
    u_xlat21 = u_xlat24.x * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat16_70 = u_xlat45 * u_xlat45;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_74 = u_xlat45 * u_xlat16_70;
    u_xlat21 = (-u_xlat16_70) * u_xlat45 + 1.0;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat21) * vec3(u_xlat16_74) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat5.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz + _shadowColor.zxy;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.w = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_12.w = u_xlat16_75 * u_xlat16_75;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_12;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_7.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat5.xxx + u_xlat16_18.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_75;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_70);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat16_13.xyz + u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat44.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat44.xxx + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_12.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat0.yzx * u_xlat16_13.yzx + u_xlat16_11.yzx;
    u_xlat16_70 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_32.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_7.xyz;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_21.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_21.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_11.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
ivec3 u_xlati5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
mediump vec3 u_xlat16_21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec2 u_xlat16_27;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
vec2 u_xlat44;
float u_xlat45;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat63;
float u_xlat65;
bool u_xlatb65;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
mediump float u_xlat16_67;
int u_xlati67;
bool u_xlatb67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
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
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat9.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat9.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat23 = max((-u_xlat1.w), u_xlat2.x);
    u_xlat23 = (-u_xlat2.x) + u_xlat23;
    u_xlat1.z = _ShadowBias.y * u_xlat23 + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat23 = (-u_xlat16_7.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23 + u_xlat16_7.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_23 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_23 * _shadowStrength;
    u_xlat23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_7.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat44.x = u_xlat2.x + -1.0;
    u_xlat44.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat44.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_occlusionScale) * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_70) + u_xlat16_11.x;
    u_xlat16_32.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_32.x + 1.0;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_11.x + u_xlat16_70;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_70;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_11.x;
    u_xlat44.xy = min(u_xlat44.xy, vec2(u_xlat16_70));
    u_xlat16_70 = u_xlat44.y * 0.5;
    u_xlat16_12.x = (-u_xlat44.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_anisoUse2U);
#else
    u_xlatb3 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_3 = texture(_anisotropicMap, u_xlat3.xy).x;
    u_xlat3.x = u_xlat16_3 * 2.0 + -1.0;
    u_xlat3.x = u_xlat3.x * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_33.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_33.xyz = u_xlat16_33.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat45 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat45) + u_xlat8.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat3.xxx * u_xlat16_33.xyz + u_xlat24.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_8.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_33.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_54 = u_xlat16_33.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_54>=0.0);
#else
    u_xlatb66 = u_xlat16_54>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(u_xlat16_75);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.xyz = u_xlat5.xyz * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat16_13.yzx + (-u_xlat14.xyz);
    u_xlat15.xyz = u_xlat5.xyz * u_xlat14.xyz;
    u_xlat5.xyz = u_xlat14.zxy * u_xlat5.yzx + (-u_xlat15.xyz);
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_16.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_75 = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_75 = max(u_xlat16_75, 0.0078125);
    u_xlat16_76 = u_xlat16_75 * 8.0;
    u_xlat16_76 = min(u_xlat16_76, 1.0);
    u_xlat16_76 = abs(u_xlat16_54) * u_xlat16_76;
    u_xlat5.xyz = vec3(u_xlat16_76) * u_xlat5.xyz + u_xlat9.xyz;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_76 = dot((-u_xlat16_13.xyz), u_xlat5.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_76) + (-u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat5.xyz);
    u_xlat16_32.y = u_xlat66 * 0.5;
    u_xlat16_32.x = u_xlat16_16.x * 1.09769487;
    u_xlat16_32.xyz = u_xlat16_32.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_32.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_1.w);
    u_xlat16_53 = u_xlat16_32.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_1.x = u_xlat16_53 * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_1.x = u_xlat16_32.x * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_32.x = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_53 = u_xlat16_66 + (-u_xlat16_67);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_53 + u_xlat16_67;
    u_xlat16_32.x = u_xlat16_11.x * u_xlat16_32.x;
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat16_32.x;
    u_xlat16_70 = u_xlat66 * u_xlat16_12.x + u_xlat16_70;
    u_xlat16_32.x = u_xlat16_70 + u_xlat16_70;
    u_xlat16_53 = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_70 = u_xlat44.y * u_xlat16_70;
    u_xlat44.x = min(u_xlat44.x, u_xlat16_8.z);
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_8.z);
    u_xlat16_32.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat16_53 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat6.xyz = vec3(u_xlat16_53) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_54)) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat17.y = u_xlat5.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_53 = -abs(u_xlat16_54) * 0.800000012 + 1.0;
    u_xlat65 = (-u_xlat16_54) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat16_75;
    u_xlat66 = u_xlat16_33.x * u_xlat16_75;
    u_xlat66 = max(u_xlat66, 0.00100000005);
    u_xlat65 = max(u_xlat65, 0.00100000005);
    u_xlat16_53 = u_xlat16_16.x * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_53);
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_53);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat5.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_7.xyz = u_xlat16_11.xxx * u_xlat16_7.xyz;
    u_xlati67 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_11.xzw = u_xlat16_7.yyy * _IrradianceACCoeffs[u_xlati67].xyz;
    u_xlati67 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_11.xzw = u_xlat16_7.xxx * _IrradianceACCoeffs[u_xlati67].xyz + u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_7.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_11.xzw;
    u_xlat16_11.x = dot(u_xlat16_7.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_11.xzw = u_xlat16_11.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb67)) ? u_xlat16_11.xzw : u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x;
    u_xlat6.y = u_xlat16_16.x;
    u_xlat16_27.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_12.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.zxy * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _albedoColor.zxy;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xzw = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xzw = u_xlat16_0.zxy * u_xlat16_16.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xzw = u_xlat16_0.zxy * u_xlat16_16.xzw;
    u_xlat16_16.xzw = u_xlat16_16.xzw * _AlbedoChangColor.zxy + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = vec3(_EnableChangColor) * u_xlat16_16.xzw + u_xlat16_12.xyz;
    u_xlat16_16.xzw = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_32.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_16.yyy * u_xlat16_16.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_27.xxx + u_xlat16_27.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat16_13.xyz);
    u_xlat24.x = dot(u_xlat4.zxy, u_xlat16_13.xyz);
    u_xlat5.y = u_xlat24.x * u_xlat66;
    u_xlat5.z = u_xlat65 * u_xlat3.x;
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat6.x;
    u_xlat24.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.z = u_xlat65 * u_xlat24.x;
    u_xlat16_70 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.y = u_xlat66 * u_xlat16_70;
    u_xlat5.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat3.y = u_xlat24.x + u_xlat5.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat24.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat26.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat26.xyz);
    u_xlat0.y = u_xlat0.x * u_xlat66;
    u_xlat24.x = u_xlat65 * u_xlat66;
    u_xlat16_70 = dot(u_xlat4.zxy, u_xlat26.xyz);
    u_xlat0.x = u_xlat65 * u_xlat16_70;
    u_xlat65 = dot(u_xlat9.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16_70) + 1.0;
    u_xlat0.z = u_xlat65 * u_xlat24.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat24.x / u_xlat0.x;
    u_xlat21 = u_xlat24.x * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat16_70 = u_xlat45 * u_xlat45;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_74 = u_xlat45 * u_xlat16_70;
    u_xlat21 = (-u_xlat16_70) * u_xlat45 + 1.0;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat21) * vec3(u_xlat16_74) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_directSpecularColor.zxy) + _ChangDirectSpecularColor.zxy;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat5.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz + _shadowColor.zxy;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.w = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_12.w = u_xlat16_75 * u_xlat16_75;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_12;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_7.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat5.xxx + u_xlat16_18.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_75;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_70);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat16_13.xyz + u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat44.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat44.xxx + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_12.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat0.yzx * u_xlat16_13.yzx + u_xlat16_11.yzx;
    u_xlat16_70 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_32.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_7.xyz;
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
    u_xlat63 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat63);
    u_xlat1.x = u_xlat63 * 0.0625 + u_xlat1.y;
    u_xlat16_21.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_21.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_21.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_11.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump float u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
mediump vec2 u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
vec3 u_xlat35;
vec3 u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
bool u_xlatb50;
mediump vec2 u_xlat16_51;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat59;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
float u_xlat85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_51.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_26.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_26.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_26.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_26.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_26.x = u_xlat16_26.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_26.x * -2.0 + 3.0;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_3.x;
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_3.x = u_xlat16_26.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb2.x = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat16_3.xyz = (-_directSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_3.xyz = vec3(_EnableChangColor) * u_xlat16_3.xyz + _directSpecularColor2nd.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_anisoUse2U);
#else
    u_xlatb2.x = 0.5<_anisoUse2U;
#endif
    u_xlat2.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat2.xy = u_xlat2.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_anisotropicMap, u_xlat2.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.y = u_xlat2.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat2.x = u_xlat2.x * _sunShift + _sunShiftOffset;
    u_xlat2.xy = u_xlat2.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb52 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat52 = (u_xlatb52) ? 1.0 : -1.0;
    u_xlat52 = u_xlat52 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_78 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat6.xyz = vec3(u_xlat77) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_5.xyz, u_xlat4.xyz);
    u_xlat8.x = u_xlat6.x;
    u_xlat8.y = u_xlat7.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat4.xyz;
    u_xlat79 = dot(u_xlat6.zxy, u_xlat7.xyz);
    u_xlat6.xyz = (-u_xlat7.yzx) * vec3(u_xlat79) + u_xlat6.xyz;
    u_xlat79 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat52) * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat9.xyz = vec3(u_xlat27) * u_xlat9.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_30.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat52 = u_xlat16_5.x * u_xlat16_80;
    u_xlat16_5.x = u_xlat16_5.x + -1.0;
    u_xlat79 = (-u_xlat16_5.x) + 1.0;
    u_xlat79 = u_xlat79 * u_xlat16_80;
    u_xlat79 = max(u_xlat79, 0.00100000005);
    u_xlat52 = max(u_xlat52, 0.00100000005);
    u_xlat13.y = u_xlat27 * u_xlat52;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat79 * u_xlat52;
    u_xlat13.z = u_xlat27 * u_xlat81;
    u_xlat16_5.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat13.x = u_xlat79 * u_xlat16_5.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.z = u_xlat79 * u_xlat82;
    u_xlat13.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.y = u_xlat52 * u_xlat16_14.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat13.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_39.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat83 = dot(u_xlat9.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat79 * u_xlat83;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_39.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat6.zxy, u_xlat16_39.xyz);
    u_xlat9.y = u_xlat52 * u_xlat79;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat9.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat52 * u_xlat82 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = u_xlat81 * u_xlat52;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat81 * u_xlat81;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_40 = u_xlat81 * u_xlat16_15.x;
    u_xlat81 = (-u_xlat16_15.x) * u_xlat81 + 1.0;
    u_xlat16_15.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_0.xyz * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_0.xyz * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _AlbedoChangColor.xyz + (-u_xlat16_15.xzw);
    u_xlat16_15.xzw = vec3(_EnableChangColor) * u_xlat16_16.xyz + u_xlat16_15.xzw;
    u_xlat16_16.xyz = u_xlat16_15.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_30.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat81) * u_xlat16_16.xyz;
    u_xlat81 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat81) * vec3(u_xlat16_40) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat17.xyz = u_xlat16_3.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat13.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat52 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat18.xyz = vec3(u_xlat52) * u_xlat18.xyz;
    u_xlat52 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_28 = u_xlat16_3.x + -1.0;
    u_xlat82 = u_xlat16_3.x * u_xlat16_80;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat83 = (-u_xlat16_28) + 1.0;
    u_xlat83 = u_xlat16_80 * u_xlat83;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat13.z = u_xlat52 * u_xlat83;
    u_xlat13.y = u_xlat16_14.x * u_xlat82;
    u_xlat52 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat13.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat83 * u_xlat84;
    u_xlat9.y = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat52 = u_xlat79 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat59 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat11.y = u_xlat82 * u_xlat59;
    u_xlat11.x = u_xlat16_5.x * u_xlat83;
    u_xlat59 = u_xlat82 * u_xlat83;
    u_xlat11.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat84 = u_xlat59 * 0.318309873;
    u_xlat27 = u_xlat27 * u_xlat84;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat27 = u_xlat52 * u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_19.xyz = vec3(_EnableChangColor) * u_xlat16_19.xyz + _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_19.xyz;
    u_xlat0.xyz = u_xlat13.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat17.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_3.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = (-u_xlat16_53) * u_xlat16_53 + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_5.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_20.xyz = u_xlat16_3.xxx * u_xlat11.xyz;
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_5.x;
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.zzz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_5.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_5.x);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_21.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat17.y = u_xlat27 * u_xlat82;
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat17.x = u_xlat16_3.x * u_xlat83;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat16_3.x) + 1.0;
    u_xlat17.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat84 * u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat16_20.xyz);
    u_xlat11.y = u_xlat16_3.x * u_xlat82;
    u_xlat11.z = u_xlat83 * u_xlat85;
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat11.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat79 * u_xlat85 + 6.10351563e-05;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat27 = u_xlat27 * u_xlat85;
    u_xlat16_3.x = u_xlat52 * u_xlat52;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_53 = u_xlat52 * u_xlat16_3.x;
    u_xlat52 = (-u_xlat16_3.x) * u_xlat52 + 1.0;
    u_xlat36.xyz = u_xlat16_16.xyz * vec3(u_xlat52);
    u_xlat36.xyz = vec3(u_xlat81) * vec3(u_xlat16_53) + u_xlat36.xyz;
    u_xlat36.xyz = vec3(u_xlat27) * u_xlat36.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_19.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat11.xxx * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat16_21.xyz * u_xlat36.xyz;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat27 = u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat36.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xyz * vec3(u_xlat16_53);
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.zzz + u_xlat16_23.xyz;
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_22.xyz;
    u_xlat52 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat52 = dot(u_xlat18.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat18.xyz, u_xlat16_22.xyz);
    u_xlat10.z = u_xlat83 * u_xlat10.x;
    u_xlat17.y = u_xlat52 * u_xlat82;
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat0.xyz);
    u_xlat17.x = u_xlat16_53 * u_xlat83;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(u_xlat16_22.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_53) + 1.0;
    u_xlat17.z = u_xlat52 * u_xlat59;
    u_xlat25 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat25 = max(u_xlat25, 6.10351563e-05);
    u_xlat25 = u_xlat59 / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat84 * u_xlat25;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat16_22.xyz);
    u_xlat10.y = u_xlat16_53 * u_xlat82;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat79 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25 = u_xlat50 * u_xlat25;
    u_xlat16_78 = u_xlat0.x * u_xlat0.x;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_55 = u_xlat0.x * u_xlat16_78;
    u_xlat0.x = (-u_xlat16_78) * u_xlat0.x + 1.0;
    u_xlat35.xyz = u_xlat16_16.xyz * u_xlat0.xxx;
    u_xlat35.xyz = vec3(u_xlat81) * vec3(u_xlat16_55) + u_xlat35.xyz;
    u_xlat0.xyz = vec3(u_xlat25) * u_xlat35.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_19.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_78 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_3.x = u_xlat16_78 * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_5.x, u_xlat16_3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_78, u_xlat16_53);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xzw;
    u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat27) + u_xlat16_20.xyz;
    u_xlat16_5.x = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_5.xxx * u_xlat16_15.xzw;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat16_15.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xzw = vec3(u_xlat27) * u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat27) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_19.xyz + u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat7.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * u_xlat16_21.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_5.x) + u_xlat16_55;
    u_xlat16_14.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_14.x + 1.0;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_55 + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_5.x;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_5.x = u_xlat16_55 * u_xlat16_5.x;
    u_xlat0.x = min(u_xlat16_5.x, 1.0);
    u_xlat25 = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat25) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * vec3(u_xlat25) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_55) * u_xlat16_24.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati50 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_3.xzw = u_xlat16_15.xyz * u_xlat16_20.xyz + u_xlat16_3.xzw;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_15.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat16_28>=0.0);
#else
    u_xlatb25 = u_xlat16_28>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb25)) ? u_xlat2.xyz : u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.zxy * u_xlat16_39.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.zxy * u_xlat2.yzx + (-u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + u_xlat2.xyz;
    u_xlat16_14.x = u_xlat16_80 * 8.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_28) * u_xlat16_14.x;
    u_xlat2.xyz = u_xlat16_14.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat25 = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat50 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat2.xyz = vec3(u_xlat50) * u_xlat2.xyz;
    u_xlat16_14.x = dot((-u_xlat16_39.xyz), u_xlat2.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_14.xxx + (-u_xlat16_39.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat77) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_80) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_28)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_28 = -abs(u_xlat16_28) * 0.800000012 + 1.0;
    u_xlat16_28 = u_xlat16_30.x * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_28);
    u_xlat50 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
    u_xlat16_47.y = u_xlat50 * 0.5;
    u_xlat16_80 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_80;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb50 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb50)) ? u_xlat16_20.xyz : u_xlat16_15.xyz;
    u_xlat9.y = u_xlat16_30.x;
    u_xlat16_47.x = u_xlat16_30.x * 1.09769487;
    u_xlat16_5.xyw = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyw = min(max(u_xlat16_5.xyw, 0.0), 1.0);
#else
    u_xlat16_5.xyw = clamp(u_xlat16_5.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_2.yzw = u_xlat16_5.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_2.w);
    u_xlat16_5.x = u_xlat16_28 + 1.0;
    u_xlat16_5.x = min(u_xlat16_5.x, 15.0);
    u_xlat16_2.x = u_xlat16_5.x * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_2.x = u_xlat16_28 * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_28 = u_xlat16_5.w * 15.0 + (-u_xlat16_28);
    u_xlat16_5.x = u_xlat16_50 + (-u_xlat16_4.x);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.x + u_xlat16_4.x;
    u_xlat16_28 = u_xlat16_55 * u_xlat16_28;
    u_xlat25 = u_xlat25 * u_xlat16_28;
    u_xlat16_28 = u_xlat0.x * 0.5;
    u_xlat16_5.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat25 * u_xlat16_5.x + u_xlat16_28;
    u_xlat16_5.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_30.x = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_30.x + u_xlat16_5.x;
    u_xlat16_28 = u_xlat0.x * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_28, u_xlat16_12.z);
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_15.xyz + u_xlat16_3.xzw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_78 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w + u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_15.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_39.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_39.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_39.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_30.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_30.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_30.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(1.5, 1.5);
    u_xlat16_25 = texture(_MergeTex, u_xlat16_30.xy).x;
    u_xlat16_30.x = u_xlat16_0.x * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_30.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.xyz;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_30.xy = u_xlat16_30.xy + u_xlat16_14.xy;
    u_xlat16_30.xy = u_xlat16_30.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_30.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_30.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_14.xxx;
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_4.yyy + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_26.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_5.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec4 u_xlat16_23;
mediump vec3 u_xlat16_24;
float u_xlat25;
mediump float u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
mediump vec2 u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_30;
vec3 u_xlat35;
vec3 u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
mediump vec3 u_xlat16_47;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
bool u_xlatb50;
mediump vec2 u_xlat16_51;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat59;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
float u_xlat82;
float u_xlat83;
float u_xlat84;
float u_xlat85;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_51.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_51.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_26.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_26.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_26.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_26.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_26.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_26.x = u_xlat16_26.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.x = min(max(u_xlat16_26.x, 0.0), 1.0);
#else
    u_xlat16_26.x = clamp(u_xlat16_26.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_26.x * -2.0 + 3.0;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_3.x;
    u_xlat16_26.x = min(u_xlat16_26.x, 1.0);
    u_xlat16_3.x = u_xlat16_26.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb2.x = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat16_3.xyz = (-_directSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_3.xyz = vec3(_EnableChangColor) * u_xlat16_3.xyz + _directSpecularColor2nd.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_anisoUse2U);
#else
    u_xlatb2.x = 0.5<_anisoUse2U;
#endif
    u_xlat2.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat2.xy = u_xlat2.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_anisotropicMap, u_xlat2.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.y = u_xlat2.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat2.x = u_xlat2.x * _sunShift + _sunShiftOffset;
    u_xlat2.xy = u_xlat2.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb52 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat52 = (u_xlatb52) ? 1.0 : -1.0;
    u_xlat52 = u_xlat52 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_78 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat6.xyz = vec3(u_xlat77) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat7.x;
    u_xlat4.x = u_xlat6.z;
    u_xlat16_8.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_5.xyz, u_xlat4.xyz);
    u_xlat8.x = u_xlat6.x;
    u_xlat8.y = u_xlat7.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_5.xyz, u_xlat8.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_5.xyz, u_xlat7.xyz);
    u_xlat77 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat4.xyz;
    u_xlat79 = dot(u_xlat6.zxy, u_xlat7.xyz);
    u_xlat6.xyz = (-u_xlat7.yzx) * vec3(u_xlat79) + u_xlat6.xyz;
    u_xlat79 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat52) * u_xlat8.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat9.xyz = vec3(u_xlat27) * u_xlat9.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_78 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.x = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_30.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_80 = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat52 = u_xlat16_5.x * u_xlat16_80;
    u_xlat16_5.x = u_xlat16_5.x + -1.0;
    u_xlat79 = (-u_xlat16_5.x) + 1.0;
    u_xlat79 = u_xlat79 * u_xlat16_80;
    u_xlat79 = max(u_xlat79, 0.00100000005);
    u_xlat52 = max(u_xlat52, 0.00100000005);
    u_xlat13.y = u_xlat27 * u_xlat52;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat79 * u_xlat52;
    u_xlat13.z = u_xlat27 * u_xlat81;
    u_xlat16_5.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat13.x = u_xlat79 * u_xlat16_5.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = max(u_xlat82, 6.10351563e-05);
    u_xlat82 = u_xlat81 / u_xlat82;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat82 = u_xlat82 * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat82;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat82 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.z = u_xlat79 * u_xlat82;
    u_xlat13.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat6.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat13.y = u_xlat52 * u_xlat16_14.x;
    u_xlat82 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 + u_xlat13.x;
    u_xlat82 = u_xlat82 + 6.10351563e-05;
    u_xlat16_39.xyz = vec3(u_xlat16_78) * u_xlat10.xyz;
    u_xlat83 = dot(u_xlat9.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat79 * u_xlat83;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_39.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat6.zxy, u_xlat16_39.xyz);
    u_xlat9.y = u_xlat52 * u_xlat79;
    u_xlat52 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat9.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat52 * u_xlat82 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = u_xlat81 * u_xlat52;
    u_xlat16_15.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.x = min(max(u_xlat16_15.x, 0.0), 1.0);
#else
    u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_15.x) + 1.0;
    u_xlat16_15.x = u_xlat81 * u_xlat81;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat81 * u_xlat16_15.x;
    u_xlat16_40 = u_xlat81 * u_xlat16_15.x;
    u_xlat81 = (-u_xlat16_15.x) * u_xlat81 + 1.0;
    u_xlat16_15.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xzw = u_xlat16_0.xyz * u_xlat16_15.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xzw = u_xlat16_0.xyz * u_xlat16_15.xzw;
    u_xlat16_15.xzw = u_xlat16_15.xzw * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _AlbedoChangColor.xyz + (-u_xlat16_15.xzw);
    u_xlat16_15.xzw = vec3(_EnableChangColor) * u_xlat16_16.xyz + u_xlat16_15.xzw;
    u_xlat16_16.xyz = u_xlat16_15.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = u_xlat16_30.yyy * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat81) * u_xlat16_16.xyz;
    u_xlat81 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat81) * vec3(u_xlat16_40) + u_xlat0.xyz;
    u_xlat17.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat17.xyz = u_xlat16_3.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat13.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat18.xyz = u_xlat2.xxx * u_xlat7.xyz + u_xlat8.zxy;
    u_xlat52 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat18.xyz = vec3(u_xlat52) * u_xlat18.xyz;
    u_xlat52 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_28 = u_xlat16_3.x + -1.0;
    u_xlat82 = u_xlat16_3.x * u_xlat16_80;
    u_xlat82 = max(u_xlat82, 0.00100000005);
    u_xlat83 = (-u_xlat16_28) + 1.0;
    u_xlat83 = u_xlat16_80 * u_xlat83;
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat13.z = u_xlat52 * u_xlat83;
    u_xlat13.y = u_xlat16_14.x * u_xlat82;
    u_xlat52 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat13.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat84 = dot(u_xlat18.xyz, u_xlat16_39.xyz);
    u_xlat9.z = u_xlat83 * u_xlat84;
    u_xlat9.y = u_xlat79 * u_xlat82;
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat52 = u_xlat79 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat59 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat11.y = u_xlat82 * u_xlat59;
    u_xlat11.x = u_xlat16_5.x * u_xlat83;
    u_xlat59 = u_xlat82 * u_xlat83;
    u_xlat11.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat84 = u_xlat59 * 0.318309873;
    u_xlat27 = u_xlat27 * u_xlat84;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat27 = u_xlat52 * u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_19.xyz = vec3(_EnableChangColor) * u_xlat16_19.xyz + _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_19.xyz;
    u_xlat0.xyz = u_xlat13.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat17.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_3.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = (-u_xlat16_53) * u_xlat16_53 + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_5.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_20.xyz = u_xlat16_3.xxx * u_xlat11.xyz;
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_5.x;
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb27 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb27)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_5.zzz + u_xlat16_21.xyz;
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb27 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_5.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_5.x);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_21.xyz = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_20.xyz;
    u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
    u_xlat27 = dot(u_xlat18.xyz, u_xlat11.xyz);
    u_xlat17.y = u_xlat27 * u_xlat82;
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat11.xyz);
    u_xlat17.x = u_xlat16_3.x * u_xlat83;
    u_xlat27 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_20.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat16_3.x) + 1.0;
    u_xlat17.z = u_xlat27 * u_xlat59;
    u_xlat27 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat27 = max(u_xlat27, 6.10351563e-05);
    u_xlat27 = u_xlat59 / u_xlat27;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat84 * u_xlat27;
    u_xlat27 = min(u_xlat27, 16.0);
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat85 = dot(u_xlat18.xyz, u_xlat16_20.xyz);
    u_xlat16_3.x = dot(u_xlat6.zxy, u_xlat16_20.xyz);
    u_xlat11.y = u_xlat16_3.x * u_xlat82;
    u_xlat11.z = u_xlat83 * u_xlat85;
    u_xlat85 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat11.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat79 * u_xlat85 + 6.10351563e-05;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat27 = u_xlat27 * u_xlat85;
    u_xlat16_3.x = u_xlat52 * u_xlat52;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat52 * u_xlat16_3.x;
    u_xlat16_53 = u_xlat52 * u_xlat16_3.x;
    u_xlat52 = (-u_xlat16_3.x) * u_xlat52 + 1.0;
    u_xlat36.xyz = u_xlat16_16.xyz * vec3(u_xlat52);
    u_xlat36.xyz = vec3(u_xlat81) * vec3(u_xlat16_53) + u_xlat36.xyz;
    u_xlat36.xyz = vec3(u_xlat27) * u_xlat36.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat36.xyz = min(max(u_xlat36.xyz, 0.0), 1.0);
#else
    u_xlat36.xyz = clamp(u_xlat36.xyz, 0.0, 1.0);
#endif
    u_xlat36.xyz = u_xlat16_19.xyz * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat11.xxx * u_xlat36.xyz;
    u_xlat36.xyz = u_xlat16_21.xyz * u_xlat36.xyz;
    u_xlat16_27 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat27 = u_xlat16_27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat36.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 6.10351563e-05);
    u_xlat16_53 = inversesqrt(u_xlat16_3.x);
    u_xlat16_22.xyz = u_xlat0.xyz * vec3(u_xlat16_53);
    u_xlat16_53 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_53));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_53);
#endif
    u_xlat16_5.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_5.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.zzz + u_xlat16_23.xyz;
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat16_78) + u_xlat16_22.xyz;
    u_xlat52 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat52);
    u_xlat52 = dot(u_xlat18.xyz, u_xlat0.xyz);
    u_xlat10.x = dot(u_xlat18.xyz, u_xlat16_22.xyz);
    u_xlat10.z = u_xlat83 * u_xlat10.x;
    u_xlat17.y = u_xlat52 * u_xlat82;
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat0.xyz);
    u_xlat17.x = u_xlat16_53 * u_xlat83;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(u_xlat16_22.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_53) + 1.0;
    u_xlat17.z = u_xlat52 * u_xlat59;
    u_xlat25 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat25 = max(u_xlat25, 6.10351563e-05);
    u_xlat25 = u_xlat59 / u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat84 * u_xlat25;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat16_53 = dot(u_xlat6.zxy, u_xlat16_22.xyz);
    u_xlat10.y = u_xlat16_53 * u_xlat82;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_22.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat50 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat50 = sqrt(u_xlat50);
    u_xlat50 = u_xlat50 + u_xlat10.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat79 * u_xlat50 + 6.10351563e-05;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat25 = u_xlat50 * u_xlat25;
    u_xlat16_78 = u_xlat0.x * u_xlat0.x;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.x * u_xlat16_78;
    u_xlat16_55 = u_xlat0.x * u_xlat16_78;
    u_xlat0.x = (-u_xlat16_78) * u_xlat0.x + 1.0;
    u_xlat35.xyz = u_xlat16_16.xyz * u_xlat0.xxx;
    u_xlat35.xyz = vec3(u_xlat81) * vec3(u_xlat16_55) + u_xlat35.xyz;
    u_xlat0.xyz = vec3(u_xlat25) * u_xlat35.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_19.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10.xxx * u_xlat0.xyz;
    u_xlat16_78 = u_xlat16_3.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = float(1.0) / float(u_xlat16_3.x);
    u_xlat16_78 = (-u_xlat16_78) * u_xlat16_78 + 1.0;
    u_xlat16_78 = max(u_xlat16_78, 0.0);
    u_xlat16_78 = u_xlat16_78 * u_xlat16_78;
    u_xlat16_3.x = u_xlat16_78 * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_5.x, u_xlat16_3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb52 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_78 = (u_xlatb52) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_78, u_xlat16_53);
    u_xlat16_3.x = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xzw;
    u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat27) + u_xlat16_20.xyz;
    u_xlat16_5.x = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_5.xxx * u_xlat16_15.xzw;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat16_15.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xzw = vec3(u_xlat27) * u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat16_15.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat27) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat11.xxx * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = u_xlat16_21.xyz * u_xlat13.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * u_xlat10.xxx + u_xlat16_20.xyz;
    u_xlat16_3.xzw = u_xlat16_19.xyz + u_xlat16_3.xzw;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(_occlusionScale) * u_xlat16_21.xyz + u_xlat7.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_21.xyz = u_xlat16_5.xxx * u_xlat16_21.xyz;
    u_xlat16_5.x = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_5.x) + u_xlat16_55;
    u_xlat16_14.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_47.z = _occlusionScale * u_xlat16_14.x + 1.0;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_55 + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_47.z * u_xlat16_5.x;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_5.x = u_xlat16_55 * u_xlat16_5.x;
    u_xlat0.x = min(u_xlat16_5.x, 1.0);
    u_xlat25 = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat25) * u_xlat16_20.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat25) * u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat25) + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_20.xyz = u_xlat16_23.xyz * vec3(u_xlat25) + u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_23.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_23.y = u_xlat16_21.y;
    u_xlat16_24.xyz = u_xlat16_23.xyz * u_xlat16_23.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_23.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_23.xyz = vec3(u_xlat16_55) * u_xlat16_24.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_24.xyz = u_xlat16_23.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati25 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati50 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_23.xyw = u_xlat16_23.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_23.xyw;
    u_xlat16_24.xyz = u_xlat16_23.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.x = dot(u_xlat16_23.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.xyz;
    u_xlat16_3.xzw = u_xlat16_15.xyz * u_xlat16_20.xyz + u_xlat16_3.xzw;
    u_xlat16_14.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_14.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_15.xyz = u_xlat16_14.xxx * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat16_28>=0.0);
#else
    u_xlatb25 = u_xlat16_28>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb25)) ? u_xlat2.xyz : u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_39.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.zxy * u_xlat16_39.yzx + (-u_xlat6.xyz);
    u_xlat8.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat6.zxy * u_xlat2.yzx + (-u_xlat8.xyz);
    u_xlat2.xyz = (-u_xlat4.xyz) * vec3(u_xlat77) + u_xlat2.xyz;
    u_xlat16_14.x = u_xlat16_80 * 8.0;
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_14.x = min(u_xlat16_14.x, 1.0);
    u_xlat16_14.x = abs(u_xlat16_28) * u_xlat16_14.x;
    u_xlat2.xyz = u_xlat16_14.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat25 = dot(u_xlat16_21.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat50 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat2.xyz = vec3(u_xlat50) * u_xlat2.xyz;
    u_xlat16_14.x = dot((-u_xlat16_39.xyz), u_xlat2.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat16_14.xxx + (-u_xlat16_39.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat77) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_80) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(vec3(u_xlat16_28)) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_28 = -abs(u_xlat16_28) * 0.800000012 + 1.0;
    u_xlat16_28 = u_xlat16_30.x * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_28);
    u_xlat50 = dot(u_xlat16_21.xyz, u_xlat2.xyz);
    u_xlat16_47.y = u_xlat50 * 0.5;
    u_xlat16_80 = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_80;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_20.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb50 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb50)) ? u_xlat16_20.xyz : u_xlat16_15.xyz;
    u_xlat9.y = u_xlat16_30.x;
    u_xlat16_47.x = u_xlat16_30.x * 1.09769487;
    u_xlat16_5.xyw = u_xlat16_47.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyw = min(max(u_xlat16_5.xyw, 0.0), 1.0);
#else
    u_xlat16_5.xyw = clamp(u_xlat16_5.xyw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_2.yzw = u_xlat16_5.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_2.w);
    u_xlat16_5.x = u_xlat16_28 + 1.0;
    u_xlat16_5.x = min(u_xlat16_5.x, 15.0);
    u_xlat16_2.x = u_xlat16_5.x * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_50 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_2.x = u_xlat16_28 * 16.0 + u_xlat16_2.z;
    u_xlat16_5.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_28 = u_xlat16_5.w * 15.0 + (-u_xlat16_28);
    u_xlat16_5.x = u_xlat16_50 + (-u_xlat16_4.x);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.x + u_xlat16_4.x;
    u_xlat16_28 = u_xlat16_55 * u_xlat16_28;
    u_xlat25 = u_xlat25 * u_xlat16_28;
    u_xlat16_28 = u_xlat0.x * 0.5;
    u_xlat16_5.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat25 * u_xlat16_5.x + u_xlat16_28;
    u_xlat16_5.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_30.x = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_30.x + u_xlat16_5.x;
    u_xlat16_28 = u_xlat0.x * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_28, u_xlat16_12.z);
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_15.xyz + u_xlat16_3.xzw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_15.xyz + u_xlat16_19.xyz;
    u_xlat16_78 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_0.w * _albedoColor.w + u_xlat16_78;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_15.xyz = u_xlat16_30.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_15.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_39.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_39.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_39.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_30.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_30.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_30.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_30.xy = u_xlat16_30.xy * vec2(1.5, 1.5);
    u_xlat16_25 = texture(_MergeTex, u_xlat16_30.xy).x;
    u_xlat16_30.x = u_xlat16_0.x * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_30.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.xyz;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_30.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_30.xy = u_xlat16_30.xy + u_xlat16_14.xy;
    u_xlat16_30.xy = u_xlat16_30.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_30.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_30.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_14.xxx;
    u_xlat16_3.xyz = u_xlat16_30.xyz * u_xlat16_4.yyy + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_26.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_5.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump float u_xlat16_26;
mediump vec2 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
vec3 u_xlat41;
mediump vec3 u_xlat16_43;
mediump vec3 u_xlat16_48;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
bool u_xlatb52;
mediump vec2 u_xlat16_53;
float u_xlat56;
float u_xlat58;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat80;
mediump float u_xlat16_80;
bool u_xlatb80;
float u_xlat83;
float u_xlat84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
float u_xlat89;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_94;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_53.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_53.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_27.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_27.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_27.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_27.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_27.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_27.x = u_xlat16_27.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat16_27.x * -2.0 + 3.0;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_3;
    u_xlat16_27.x = min(u_xlat16_27.x, 1.0);
    u_xlat16_3 = u_xlat16_27.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3<0.0);
#else
    u_xlatb2.x = u_xlat16_3<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat85 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat7.xyz = vec3(u_xlat85) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat11.xyz = vec3(u_xlat85) * u_xlat8.xyz;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb80)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat80 = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat80) + u_xlat3.z;
    u_xlat4.x = max((-u_xlat3.w), u_xlat80);
    u_xlat4.x = (-u_xlat80) + u_xlat4.x;
    u_xlat3.z = _ShadowBias.y * u_xlat4.x + u_xlat80;
    u_xlat4.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat28 = (-u_xlat16_9.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat28 + u_xlat16_9.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_28 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_9.x = u_xlat16_28 * _shadowStrength;
    u_xlat28 = u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_9.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_9.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat2.xxx * u_xlat16_9.xyz + _shadowColor.xyz;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-_directSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor2nd.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.5<_anisoUse2U);
#else
    u_xlatb80 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb80)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_80 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat80 = u_xlat16_80 * 2.0 + -1.0;
    u_xlat4.x = u_xlat80 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat80 = u_xlat80 * _sunShift + _sunShiftOffset;
    u_xlat80 = u_xlat80 + vs_TEXCOORD5;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat56 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat5.xyz = (-u_xlat11.yzx) * vec3(u_xlat56) + u_xlat10.xyz;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat11.xyz;
    u_xlat6.xyz = u_xlat11.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_87 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat10.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat10.xyz = u_xlat4.xxx * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat10.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_91 = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_14.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat83 = u_xlat16_91 * u_xlat16_66;
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat84 = (-u_xlat16_91) + 1.0;
    u_xlat84 = u_xlat84 * u_xlat16_66;
    u_xlat84 = max(u_xlat84, 0.00100000005);
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat15.y = u_xlat4.x * u_xlat83;
    u_xlat16_91 = dot(u_xlat5.zxy, u_xlat10.xyz);
    u_xlat15.x = u_xlat84 * u_xlat16_91;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat84 * u_xlat83;
    u_xlat15.z = u_xlat4.x * u_xlat86;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = max(u_xlat88, 6.10351563e-05);
    u_xlat88 = u_xlat86 / u_xlat88;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat86 = u_xlat86 * u_xlat88;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat88 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.z = u_xlat84 * u_xlat88;
    u_xlat15.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.y = u_xlat83 * u_xlat16_92;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat15.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_87);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat84;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat5.zxy, u_xlat16_16.xyz);
    u_xlat6.y = u_xlat83 * u_xlat84;
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat6.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat83 = u_xlat83 * u_xlat88 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat83 = u_xlat86 * u_xlat83;
    u_xlat16_94 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_94) + 1.0;
    u_xlat16_94 = u_xlat86 * u_xlat86;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_17.x = u_xlat86 * u_xlat16_94;
    u_xlat86 = (-u_xlat16_94) * u_xlat86 + 1.0;
    u_xlat16_43.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_43.xyz = u_xlat16_0.xyz * u_xlat16_43.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_43.xyz = u_xlat16_0.xyz * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoChangColor.xyz + (-u_xlat16_43.xyz);
    u_xlat16_43.xyz = vec3(_EnableChangColor) * u_xlat16_18.xyz + u_xlat16_43.xyz;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_14.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_18.xyz;
    u_xlat86 = u_xlat16_18.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_17.xxx + u_xlat0.xyz;
    u_xlat19.xyz = u_xlat0.xyz * vec3(u_xlat83);
    u_xlat19.xyz = u_xlat16_13.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat15.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xyz = u_xlat16_9.xyz * u_xlat19.xyz;
    u_xlat20.xyz = vec3(u_xlat80) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat83 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat20.xyz = vec3(u_xlat83) * u_xlat20.xyz;
    u_xlat83 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_13.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_39.x = u_xlat16_13.x + -1.0;
    u_xlat88 = u_xlat16_13.x * u_xlat16_66;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat89 = (-u_xlat16_39.x) + 1.0;
    u_xlat89 = u_xlat89 * u_xlat16_66;
    u_xlat89 = max(u_xlat89, 0.00100000005);
    u_xlat15.z = u_xlat83 * u_xlat89;
    u_xlat15.y = u_xlat16_92 * u_xlat88;
    u_xlat83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat15.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat12.x = dot(u_xlat20.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat89 * u_xlat12.x;
    u_xlat6.y = u_xlat84 * u_xlat88;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat83 = u_xlat58 * u_xlat83 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat84 = dot(u_xlat20.xyz, u_xlat10.xyz);
    u_xlat10.y = u_xlat84 * u_xlat88;
    u_xlat10.x = u_xlat16_91 * u_xlat89;
    u_xlat84 = u_xlat88 * u_xlat89;
    u_xlat10.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat10.x = u_xlat84 * 0.318309873;
    u_xlat4.x = u_xlat4.x * u_xlat10.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat83 * u_xlat4.x;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xzw = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_13.xzw = vec3(_EnableChangColor) * u_xlat16_13.xzw + _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_9.xyz + u_xlat19.xyz;
    u_xlat41.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_40 = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = u_xlat16_40 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_92 = (-u_xlat16_92) * u_xlat16_92 + 1.0;
    u_xlat16_92 = max(u_xlat16_92, 0.0);
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
    u_xlat16_94 = float(1.0) / float(u_xlat16_40);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_21.xyz = vec3(u_xlat16_40) * u_xlat41.xyz;
    u_xlat16_40 = u_xlat16_92 * u_xlat16_94;
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_22.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_22.x);
    u_xlat16_22.xzw = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_22.xzw;
    u_xlat16_92 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_92 = u_xlat16_92 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_92 = max(u_xlat16_92, u_xlat16_94);
    u_xlat16_40 = u_xlat16_92 * u_xlat16_40;
    u_xlat16_22.xyz = vec3(u_xlat16_40) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat41.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_21.xyz;
    u_xlat4.x = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat41.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat88;
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat41.xyz);
    u_xlat19.x = u_xlat89 * u_xlat16_40;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_40 = dot(u_xlat16_21.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_40) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat19.x = dot(u_xlat11.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat20.xyz, u_xlat16_21.xyz);
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat19.y = u_xlat88 * u_xlat16_40;
    u_xlat19.z = u_xlat36 * u_xlat89;
    u_xlat36 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat19.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat58 * u_xlat36 + 6.10351563e-05;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat4.x = u_xlat4.x * u_xlat36;
    u_xlat16_40 = u_xlat83 * u_xlat83;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_92 = u_xlat83 * u_xlat16_40;
    u_xlat83 = (-u_xlat16_40) * u_xlat83 + 1.0;
    u_xlat41.xyz = u_xlat16_18.xyz * vec3(u_xlat83);
    u_xlat41.xyz = vec3(u_xlat86) * vec3(u_xlat16_92) + u_xlat41.xyz;
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xyz = min(max(u_xlat41.xyz, 0.0), 1.0);
#else
    u_xlat41.xyz = clamp(u_xlat41.xyz, 0.0, 1.0);
#endif
    u_xlat41.xyz = u_xlat16_13.xzw * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat19.xxx * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat16_22.xyz * u_xlat41.xyz;
    u_xlat16_21.xyz = u_xlat41.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = inversesqrt(u_xlat16_40);
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(u_xlat16_92);
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_23.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat0.xyz);
    u_xlat83 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat7.z = u_xlat83 * u_xlat89;
    u_xlat20.y = u_xlat4.x * u_xlat88;
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat20.x = u_xlat16_87 * u_xlat89;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_87) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat84;
    u_xlat26 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat26 = max(u_xlat26, 6.10351563e-05);
    u_xlat26 = u_xlat84 / u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat10.x * u_xlat26;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat16_23.xyz);
    u_xlat7.y = u_xlat16_87 * u_xlat88;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat7.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat58 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat26 = u_xlat52 * u_xlat26;
    u_xlat16_92 = u_xlat0.x * u_xlat0.x;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_94 = u_xlat0.x * u_xlat16_92;
    u_xlat0.x = (-u_xlat16_92) * u_xlat0.x + 1.0;
    u_xlat10.xyz = u_xlat16_18.xyz * u_xlat0.xxx;
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_94) + u_xlat10.xyz;
    u_xlat0.xyz = vec3(u_xlat26) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_13.xzw * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat16_13.x = u_xlat16_40 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_40);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_65;
    u_xlat16_13.x = max(u_xlat16_24.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_65);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_13.x;
    u_xlat16_13.xzw = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat28) + u_xlat16_21.xyz;
    u_xlat16_87 = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_43.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = vec3(u_xlat28) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat19.xxx * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat15.xxx + u_xlat16_22.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * u_xlat16_17.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xzw = vec3(u_xlat28) * u_xlat16_13.xzw;
    u_xlat16_9.xyz = u_xlat16_13.xzw * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_21.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xzw = (-u_xlat8.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xzw = vec3(_occlusionScale) * u_xlat16_13.xzw + u_xlat11.xyz;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat16_13.xzw);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat16_13.xzw = vec3(u_xlat16_87) * u_xlat16_13.xzw;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_87 * 0.5 + 0.5;
    u_xlat16_40 = (-u_xlat16_87) + u_xlat16_40;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_40 + u_xlat16_87;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_87;
    u_xlat16_40 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_40 + -1.0;
    u_xlat16_40 = _occlusionScale * u_xlat16_40 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_40;
    u_xlat0.xy = min(u_xlat2.xz, vec2(u_xlat16_87));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xw);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xw);
    u_xlat16_24.y = u_xlat16_13.z;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = vec3(u_xlat16_40) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati52 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_9.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat16_17.xyz + u_xlat30.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_39.x>=0.0);
#else
    u_xlatb0 = u_xlat16_39.x>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat16_16.yzx + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat2.yzx + (-u_xlat5.xyz);
    u_xlat2.xyz = (-u_xlat8.xyz) * vec3(u_xlat85) + u_xlat2.xyz;
    u_xlat16_92 = u_xlat16_66 * 8.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_92 = min(u_xlat16_92, 1.0);
    u_xlat16_92 = abs(u_xlat16_39.x) * u_xlat16_92;
    u_xlat2.xyz = vec3(u_xlat16_92) * u_xlat2.xyz + u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * u_xlat2.xyz;
    u_xlat16_92 = dot((-u_xlat16_16.xyz), u_xlat2.xyz);
    u_xlat16_92 = u_xlat16_92 + u_xlat16_92;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_92) + (-u_xlat16_16.xyz);
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat85) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_66) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(u_xlat16_39.xxx) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_39.x = -abs(u_xlat16_39.x) * 0.800000012 + 1.0;
    u_xlat16_39.x = u_xlat16_14.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat52 = dot(u_xlat16_13.xzw, u_xlat2.xyz);
    u_xlat16_48.y = u_xlat52 * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_13.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_39.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb52 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb52)) ? u_xlat16_17.xyz : u_xlat16_13.xyz;
    u_xlat6.y = u_xlat16_14.x;
    u_xlat16_48.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xzw = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xzw = min(max(u_xlat16_14.xzw, 0.0), 1.0);
#else
    u_xlat16_14.xzw = clamp(u_xlat16_14.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_14.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_87 = floor(u_xlat16_2.w);
    u_xlat16_91 = u_xlat16_87 + 1.0;
    u_xlat16_91 = min(u_xlat16_91, 15.0);
    u_xlat16_2.x = u_xlat16_91 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_2.x = u_xlat16_87 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_87 = u_xlat16_14.w * 15.0 + (-u_xlat16_87);
    u_xlat16_91 = u_xlat16_52 + (-u_xlat16_4.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_91 + u_xlat16_4.x;
    u_xlat16_87 = u_xlat16_40 * u_xlat16_87;
    u_xlat0.x = u_xlat0.x * u_xlat16_87;
    u_xlat16_87 = u_xlat0.y * 0.5;
    u_xlat16_91 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_87 = u_xlat0.x * u_xlat16_91 + u_xlat16_87;
    u_xlat16_91 = u_xlat16_87 + u_xlat16_87;
    u_xlat16_14.x = (-u_xlat16_87) * 2.0 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x + u_xlat16_91;
    u_xlat16_87 = u_xlat0.y * u_xlat16_87;
    u_xlat16_87 = min(u_xlat16_87, u_xlat16_12.z);
    u_xlat16_13.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_21.xyz;
    u_xlat16_87 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_0.w * _albedoColor.w + u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_39.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_39.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat0.xy = u_xlat16_16.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_16.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_16.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_39.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_39.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_39.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(1.5, 1.5);
    u_xlat16_26 = texture(_MergeTex, u_xlat16_39.xy).x;
    u_xlat16_39.x = u_xlat16_0.x * u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat16_39.x = u_xlat16_39.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_39.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.xyz;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_39.xy = u_xlat16_39.xy + u_xlat16_14.xy;
    u_xlat16_39.xy = u_xlat16_39.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_39.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_39.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_14.xxx;
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_4.yyy + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_27.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_87 : u_xlat16_13.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _DissolveTex;
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
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec3 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
bool u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
float u_xlat26;
mediump float u_xlat16_26;
mediump vec2 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
vec3 u_xlat30;
bool u_xlatb30;
float u_xlat36;
mediump vec3 u_xlat16_39;
mediump float u_xlat16_40;
vec3 u_xlat41;
mediump vec3 u_xlat16_43;
mediump vec3 u_xlat16_48;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
bool u_xlatb52;
mediump vec2 u_xlat16_53;
float u_xlat56;
float u_xlat58;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
float u_xlat80;
mediump float u_xlat16_80;
bool u_xlatb80;
float u_xlat83;
float u_xlat84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
float u_xlat89;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_94;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2.x = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlatb2.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb2.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_53.xy = (u_xlatb2.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_53.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb2.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_27.x = (u_xlatb2.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_27.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat2.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_27.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_27.xy;
    u_xlat16_2.x = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_2.x;
    u_xlat16_27.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_27.x = u_xlat16_27.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27.x = min(max(u_xlat16_27.x, 0.0), 1.0);
#else
    u_xlat16_27.x = clamp(u_xlat16_27.x, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat16_27.x * -2.0 + 3.0;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_3;
    u_xlat16_27.x = min(u_xlat16_27.x, 1.0);
    u_xlat16_3 = u_xlat16_27.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3<0.0);
#else
    u_xlatb2.x = u_xlat16_3<0.0;
#endif
    if(u_xlatb2.x){discard;}
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat85 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat7.xyz = vec3(u_xlat85) * u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_9.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_9.xxx + vs_TEXCOORD2.yzx;
    u_xlat85 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat10.xyz = vec3(u_xlat85) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat11.x;
    u_xlat8.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_9.xyz, u_xlat8.xyz);
    u_xlat12.x = u_xlat10.x;
    u_xlat12.y = u_xlat11.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_9.xyz, u_xlat12.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat85 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat85 = max(u_xlat85, 1.17549435e-38);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat11.xyz = vec3(u_xlat85) * u_xlat8.xyz;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat7.xyz);
    u_xlat7.x = (-u_xlat7.x) * u_xlat7.x + 1.0;
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _ShadowBias.z;
    u_xlat7.xyz = (-u_xlat11.xyz) * u_xlat7.xxx + vs_TEXCOORD0.xyz;
    u_xlat7.xyz = (bool(u_xlatb80)) ? u_xlat7.xyz : vs_TEXCOORD0.xyz;
    u_xlat6 = u_xlat6 * u_xlat7.yyyy;
    u_xlat5 = u_xlat5 * u_xlat7.xxxx + u_xlat6;
    u_xlat4 = u_xlat4 * u_xlat7.zzzz + u_xlat5;
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat80 = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat80) + u_xlat3.z;
    u_xlat4.x = max((-u_xlat3.w), u_xlat80);
    u_xlat4.x = (-u_xlat80) + u_xlat4.x;
    u_xlat3.z = _ShadowBias.y * u_xlat4.x + u_xlat80;
    u_xlat4.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyw;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlat28 = (-u_xlat16_9.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat28 + u_xlat16_9.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_28 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_9.x = u_xlat16_28 * _shadowStrength;
    u_xlat28 = u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_9.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_9.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat2.xxx * u_xlat16_9.xyz + _shadowColor.xyz;
    u_xlat2.x = u_xlat2.x + -1.0;
    u_xlat2.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat2.xx + vec2(1.0, 1.0);
    u_xlat16_13.xyz = (-_directSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor2nd.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(0.5<_anisoUse2U);
#else
    u_xlatb80 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb80)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_80 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat80 = u_xlat16_80 * 2.0 + -1.0;
    u_xlat4.x = u_xlat80 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat80 = u_xlat80 * _sunShift + _sunShiftOffset;
    u_xlat80 = u_xlat80 + vs_TEXCOORD5;
    u_xlat4.x = u_xlat4.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb30 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat30.x = (u_xlatb30) ? 1.0 : -1.0;
    u_xlat30.x = u_xlat30.x * vs_TEXCOORD2.w;
    u_xlat56 = dot(u_xlat10.zxy, u_xlat11.xyz);
    u_xlat5.xyz = (-u_xlat11.yzx) * vec3(u_xlat56) + u_xlat10.xyz;
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat5.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat5.yzx * u_xlat11.xyz;
    u_xlat6.xyz = u_xlat11.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat30.xyz = u_xlat30.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat4.xxx * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat6.xyz = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_87 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat10.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat10.xyz = u_xlat4.xxx * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat10.xyz);
    u_xlat16_12.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_91 = dot(vec2(vec2(_anisotropicMultiplier2nd, _anisotropicMultiplier2nd)), u_xlat16_12.zz);
    u_xlat16_14.xy = u_xlat16_12.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat83 = u_xlat16_91 * u_xlat16_66;
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat84 = (-u_xlat16_91) + 1.0;
    u_xlat84 = u_xlat84 * u_xlat16_66;
    u_xlat84 = max(u_xlat84, 0.00100000005);
    u_xlat83 = max(u_xlat83, 0.00100000005);
    u_xlat15.y = u_xlat4.x * u_xlat83;
    u_xlat16_91 = dot(u_xlat5.zxy, u_xlat10.xyz);
    u_xlat15.x = u_xlat84 * u_xlat16_91;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat84 * u_xlat83;
    u_xlat15.z = u_xlat4.x * u_xlat86;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = max(u_xlat88, 6.10351563e-05);
    u_xlat88 = u_xlat86 / u_xlat88;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat86 = u_xlat86 * u_xlat88;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat88 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.z = u_xlat84 * u_xlat88;
    u_xlat15.x = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat15.y = u_xlat83 * u_xlat16_92;
    u_xlat88 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat15.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_87);
    u_xlat6.x = dot(u_xlat6.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat6.x * u_xlat84;
    u_xlat6.x = dot(u_xlat11.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat84 = dot(u_xlat5.zxy, u_xlat16_16.xyz);
    u_xlat6.y = u_xlat83 * u_xlat84;
    u_xlat83 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat6.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat83 = u_xlat83 * u_xlat88 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat83 = u_xlat86 * u_xlat83;
    u_xlat16_94 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat86 = (-u_xlat16_94) + 1.0;
    u_xlat16_94 = u_xlat86 * u_xlat86;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_94 = u_xlat86 * u_xlat16_94;
    u_xlat16_17.x = u_xlat86 * u_xlat16_94;
    u_xlat86 = (-u_xlat16_94) * u_xlat86 + 1.0;
    u_xlat16_43.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_43.xyz = u_xlat16_0.xyz * u_xlat16_43.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_43.xyz = u_xlat16_0.xyz * u_xlat16_43.xyz;
    u_xlat16_43.xyz = u_xlat16_43.xyz * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoChangColor.xyz + (-u_xlat16_43.xyz);
    u_xlat16_43.xyz = vec3(_EnableChangColor) * u_xlat16_18.xyz + u_xlat16_43.xyz;
    u_xlat16_18.xyz = u_xlat16_43.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_14.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_18.xyz;
    u_xlat86 = u_xlat16_18.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat0.xyz = vec3(u_xlat86) * u_xlat16_17.xxx + u_xlat0.xyz;
    u_xlat19.xyz = u_xlat0.xyz * vec3(u_xlat83);
    u_xlat19.xyz = u_xlat16_13.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat15.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xyz = u_xlat16_9.xyz * u_xlat19.xyz;
    u_xlat20.xyz = vec3(u_xlat80) * u_xlat11.xyz + u_xlat30.zxy;
    u_xlat83 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat20.xyz = vec3(u_xlat83) * u_xlat20.xyz;
    u_xlat83 = dot(u_xlat20.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_13.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_12.zz);
    u_xlat16_39.x = u_xlat16_13.x + -1.0;
    u_xlat88 = u_xlat16_13.x * u_xlat16_66;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat89 = (-u_xlat16_39.x) + 1.0;
    u_xlat89 = u_xlat89 * u_xlat16_66;
    u_xlat89 = max(u_xlat89, 0.00100000005);
    u_xlat15.z = u_xlat83 * u_xlat89;
    u_xlat15.y = u_xlat16_92 * u_xlat88;
    u_xlat83 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat15.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat12.x = dot(u_xlat20.xyz, u_xlat16_16.xyz);
    u_xlat6.z = u_xlat89 * u_xlat12.x;
    u_xlat6.y = u_xlat84 * u_xlat88;
    u_xlat58 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat6.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat83 = u_xlat58 * u_xlat83 + 6.10351563e-05;
    u_xlat83 = float(1.0) / u_xlat83;
    u_xlat84 = dot(u_xlat20.xyz, u_xlat10.xyz);
    u_xlat10.y = u_xlat84 * u_xlat88;
    u_xlat10.x = u_xlat16_91 * u_xlat89;
    u_xlat84 = u_xlat88 * u_xlat89;
    u_xlat10.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat10.x = u_xlat84 * 0.318309873;
    u_xlat4.x = u_xlat4.x * u_xlat10.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat83 * u_xlat4.x;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xzw = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_13.xzw = vec3(_EnableChangColor) * u_xlat16_13.xzw + _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat0.xyz = u_xlat15.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_9.xyz + u_xlat19.xyz;
    u_xlat41.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_40 = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = u_xlat16_40 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_92 = (-u_xlat16_92) * u_xlat16_92 + 1.0;
    u_xlat16_92 = max(u_xlat16_92, 0.0);
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
    u_xlat16_94 = float(1.0) / float(u_xlat16_40);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_21.xyz = vec3(u_xlat16_40) * u_xlat41.xyz;
    u_xlat16_40 = u_xlat16_92 * u_xlat16_94;
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_22.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_22.x);
    u_xlat16_22.xzw = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.yyy + u_xlat16_22.xzw;
    u_xlat16_92 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
    u_xlat16_92 = u_xlat16_92 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 * u_xlat16_92;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_92 = max(u_xlat16_92, u_xlat16_94);
    u_xlat16_40 = u_xlat16_92 * u_xlat16_40;
    u_xlat16_22.xyz = vec3(u_xlat16_40) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat41.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_21.xyz;
    u_xlat4.x = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat41.xyz);
    u_xlat19.y = u_xlat4.x * u_xlat88;
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat41.xyz);
    u_xlat19.x = u_xlat89 * u_xlat16_40;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_40 = dot(u_xlat16_21.xyz, u_xlat41.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat16_40) + 1.0;
    u_xlat19.z = u_xlat4.x * u_xlat84;
    u_xlat4.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat4.x = max(u_xlat4.x, 6.10351563e-05);
    u_xlat4.x = u_xlat84 / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat19.x = dot(u_xlat11.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat20.xyz, u_xlat16_21.xyz);
    u_xlat16_40 = dot(u_xlat5.zxy, u_xlat16_21.xyz);
    u_xlat19.y = u_xlat88 * u_xlat16_40;
    u_xlat19.z = u_xlat36 * u_xlat89;
    u_xlat36 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat19.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat58 * u_xlat36 + 6.10351563e-05;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat4.x = u_xlat4.x * u_xlat36;
    u_xlat16_40 = u_xlat83 * u_xlat83;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_40 = u_xlat83 * u_xlat16_40;
    u_xlat16_92 = u_xlat83 * u_xlat16_40;
    u_xlat83 = (-u_xlat16_40) * u_xlat83 + 1.0;
    u_xlat41.xyz = u_xlat16_18.xyz * vec3(u_xlat83);
    u_xlat41.xyz = vec3(u_xlat86) * vec3(u_xlat16_92) + u_xlat41.xyz;
    u_xlat41.xyz = u_xlat4.xxx * u_xlat41.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat41.xyz = min(max(u_xlat41.xyz, 0.0), 1.0);
#else
    u_xlat41.xyz = clamp(u_xlat41.xyz, 0.0, 1.0);
#endif
    u_xlat41.xyz = u_xlat16_13.xzw * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat19.xxx * u_xlat41.xyz;
    u_xlat41.xyz = u_xlat16_22.xyz * u_xlat41.xyz;
    u_xlat16_21.xyz = u_xlat41.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_40 = max(u_xlat16_40, 6.10351563e-05);
    u_xlat16_92 = inversesqrt(u_xlat16_40);
    u_xlat16_23.xyz = u_xlat0.xyz * vec3(u_xlat16_92);
    u_xlat16_92 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_92));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_92);
#endif
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat16_87) + u_xlat16_23.xyz;
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat4.x = dot(u_xlat20.xyz, u_xlat0.xyz);
    u_xlat83 = dot(u_xlat20.xyz, u_xlat16_23.xyz);
    u_xlat7.z = u_xlat83 * u_xlat89;
    u_xlat20.y = u_xlat4.x * u_xlat88;
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat0.xyz);
    u_xlat20.x = u_xlat16_87 * u_xlat89;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(u_xlat16_23.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_87) + 1.0;
    u_xlat20.z = u_xlat4.x * u_xlat84;
    u_xlat26 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat26 = max(u_xlat26, 6.10351563e-05);
    u_xlat26 = u_xlat84 / u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat10.x * u_xlat26;
    u_xlat26 = min(u_xlat26, 16.0);
    u_xlat16_87 = dot(u_xlat5.zxy, u_xlat16_23.xyz);
    u_xlat7.y = u_xlat16_87 * u_xlat88;
    u_xlat7.x = dot(u_xlat11.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_23.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat52 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat52 = sqrt(u_xlat52);
    u_xlat52 = u_xlat52 + u_xlat7.x;
    u_xlat52 = u_xlat52 + 6.10351563e-05;
    u_xlat52 = u_xlat58 * u_xlat52 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat26 = u_xlat52 * u_xlat26;
    u_xlat16_92 = u_xlat0.x * u_xlat0.x;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_92 = u_xlat0.x * u_xlat16_92;
    u_xlat16_94 = u_xlat0.x * u_xlat16_92;
    u_xlat0.x = (-u_xlat16_92) * u_xlat0.x + 1.0;
    u_xlat10.xyz = u_xlat16_18.xyz * u_xlat0.xxx;
    u_xlat10.xyz = vec3(u_xlat86) * vec3(u_xlat16_94) + u_xlat10.xyz;
    u_xlat0.xyz = vec3(u_xlat26) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_13.xzw * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xyz;
    u_xlat16_13.x = u_xlat16_40 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_40);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_65;
    u_xlat16_13.x = max(u_xlat16_24.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_65);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_13.x;
    u_xlat16_13.xzw = vec3(u_xlat16_87) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xzw;
    u_xlat16_21.xyz = u_xlat0.xyz * vec3(u_xlat28) + u_xlat16_21.xyz;
    u_xlat16_87 = (-u_xlat16_12.y) * _metallicMultiplier + 1.0;
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_43.xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_23.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_17.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_22.xyz = vec3(u_xlat28) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat19.xxx * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat15.xxx + u_xlat16_22.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * u_xlat16_17.xyz;
    u_xlat16_13.xzw = u_xlat16_13.xzw * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xzw = vec3(u_xlat28) * u_xlat16_13.xzw;
    u_xlat16_9.xyz = u_xlat16_13.xzw * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_21.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xzw = (-u_xlat8.xyz) * vec3(u_xlat85) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xzw = vec3(_occlusionScale) * u_xlat16_13.xzw + u_xlat11.xyz;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat16_13.xzw);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat16_13.xzw = vec3(u_xlat16_87) * u_xlat16_13.xzw;
    u_xlat16_87 = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_87 * 0.5 + 0.5;
    u_xlat16_40 = (-u_xlat16_87) + u_xlat16_40;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_40 + u_xlat16_87;
    u_xlat16_87 = u_xlat16_48.z * u_xlat16_87;
    u_xlat16_40 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_40 + -1.0;
    u_xlat16_40 = _occlusionScale * u_xlat16_40 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_40;
    u_xlat0.xy = min(u_xlat2.xz, vec2(u_xlat16_87));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_12.z);
    u_xlat16_23.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat0.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat0.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xw);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xw);
    u_xlat16_24.y = u_xlat16_13.z;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_24.xyz = vec3(u_xlat16_40) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_25.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati52 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_24.xyw;
    u_xlat16_25.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_87 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_9.xyz = u_xlat16_17.xyz * u_xlat16_23.xyz + u_xlat16_9.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat2.xyz = vec3(u_xlat80) * u_xlat16_17.xyz + u_xlat30.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_39.x>=0.0);
#else
    u_xlatb0 = u_xlat16_39.x>=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat16_16.yzx + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat2.yzx + (-u_xlat5.xyz);
    u_xlat2.xyz = (-u_xlat8.xyz) * vec3(u_xlat85) + u_xlat2.xyz;
    u_xlat16_92 = u_xlat16_66 * 8.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_92 = min(u_xlat16_92, 1.0);
    u_xlat16_92 = abs(u_xlat16_39.x) * u_xlat16_92;
    u_xlat2.xyz = vec3(u_xlat16_92) * u_xlat2.xyz + u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat16_13.xzw, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * u_xlat2.xyz;
    u_xlat16_92 = dot((-u_xlat16_16.xyz), u_xlat2.xyz);
    u_xlat16_92 = u_xlat16_92 + u_xlat16_92;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat16_92) + (-u_xlat16_16.xyz);
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat85) + (-u_xlat2.xyz);
    u_xlat4.xyz = vec3(u_xlat16_66) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat5.xyz = u_xlat2.xyz + (-u_xlat4.xyz);
    u_xlat4.xyz = abs(u_xlat16_39.xxx) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat16_39.x = -abs(u_xlat16_39.x) * 0.800000012 + 1.0;
    u_xlat16_39.x = u_xlat16_14.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_39.x);
    u_xlat52 = dot(u_xlat16_13.xzw, u_xlat2.xyz);
    u_xlat16_48.y = u_xlat52 * 0.5;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_13.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_39.x);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb52 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb52)) ? u_xlat16_17.xyz : u_xlat16_13.xyz;
    u_xlat6.y = u_xlat16_14.x;
    u_xlat16_48.x = u_xlat16_14.x * 1.09769487;
    u_xlat16_14.xzw = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xzw = min(max(u_xlat16_14.xzw, 0.0), 1.0);
#else
    u_xlat16_14.xzw = clamp(u_xlat16_14.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_2.yzw = u_xlat16_14.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_87 = floor(u_xlat16_2.w);
    u_xlat16_91 = u_xlat16_87 + 1.0;
    u_xlat16_91 = min(u_xlat16_91, 15.0);
    u_xlat16_2.x = u_xlat16_91 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_2.x = u_xlat16_87 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xz = u_xlat16_14.xz * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xz).x;
    u_xlat16_87 = u_xlat16_14.w * 15.0 + (-u_xlat16_87);
    u_xlat16_91 = u_xlat16_52 + (-u_xlat16_4.x);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_91 + u_xlat16_4.x;
    u_xlat16_87 = u_xlat16_40 * u_xlat16_87;
    u_xlat0.x = u_xlat0.x * u_xlat16_87;
    u_xlat16_87 = u_xlat0.y * 0.5;
    u_xlat16_91 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_87 = u_xlat0.x * u_xlat16_91 + u_xlat16_87;
    u_xlat16_91 = u_xlat16_87 + u_xlat16_87;
    u_xlat16_14.x = (-u_xlat16_87) * 2.0 + 1.0;
    u_xlat16_87 = u_xlat16_87 * u_xlat16_14.x + u_xlat16_91;
    u_xlat16_87 = u_xlat0.y * u_xlat16_87;
    u_xlat16_87 = min(u_xlat16_87, u_xlat16_12.z);
    u_xlat16_13.xyz = vec3(u_xlat16_87) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_21.xyz;
    u_xlat16_87 = dot(u_xlat16_13.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_0.w * _albedoColor.w + u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_39.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_39.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat0.xy = u_xlat16_16.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_16.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_16.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_39.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_39.xx;
    u_xlat16_0.x = texture(_MergeTex, u_xlat0.xy).x;
    u_xlat16_39.xy = vs_TEXCOORD3.zw * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(1.5, 1.5);
    u_xlat16_26 = texture(_MergeTex, u_xlat16_39.xy).x;
    u_xlat16_39.x = u_xlat16_0.x * u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat16_39.x = u_xlat16_39.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_39.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.xyz;
    u_xlat16_4.xy = texture(_MergeTex, vs_TEXCOORD3.xy).yz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_4.xxx + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_14.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_39.xy = u_xlat16_39.xy + u_xlat16_14.xy;
    u_xlat16_39.xy = u_xlat16_39.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_39.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_39.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_14.x = max(_FlowLightFactory.x, 0.0);
    u_xlat16_39.xyz = u_xlat16_39.xyz * u_xlat16_14.xxx;
    u_xlat16_9.xyz = u_xlat16_39.xyz * u_xlat16_4.yyy + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_27.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_87 : u_xlat16_13.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
bool u_xlatb22;
vec3 u_xlat23;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
float u_xlat38;
mediump vec2 u_xlat16_39;
float u_xlat40;
mediump vec2 u_xlat16_40;
int u_xlati40;
bool u_xlatb40;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb60 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb60)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_9.xyz = u_xlat16_39.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat10.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat6.zxy * u_xlat16_9.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat6.xyz * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat6.yzx + (-u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_39.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_12.x = u_xlat16_66 * 8.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_20.x) * u_xlat16_12.x;
    u_xlat6.xyz = u_xlat16_12.xxx * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_9.xyz), u_xlat6.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat6.xyz = (-u_xlat6.xyz) * u_xlat16_12.xxx + (-u_xlat16_9.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_69 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = max(u_xlat16_69, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_69) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_69 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat16_66;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_66;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_39.x * u_xlat16_69;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_10.www * u_xlat16_10.xyz;
    u_xlat10.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat16_12.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_15.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _occlusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_15.xyw;
    u_xlat16_20.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_20.xxx * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat10.x;
    u_xlat11.y = u_xlat16_39.x;
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_16.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _AlbedoChangColor.xyz + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = vec3(_EnableChangColor) * u_xlat16_17.xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_39.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20.x = u_xlat16_39.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat0 = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_20.y = u_xlat0 * 0.5;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_20.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_18.xyz = u_xlat16_20.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_6.w);
    u_xlat16_39.x = u_xlat16_20.x + 1.0;
    u_xlat16_39.x = min(u_xlat16_39.x, 15.0);
    u_xlat16_6.x = u_xlat16_39.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_20.x = u_xlat16_18.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_39.x = (-u_xlat16_19) + u_xlat16_0.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_39.x + u_xlat16_19;
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat0 = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_39.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_39.x * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat16_39.x) + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x + u_xlat16_39.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat19.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat19.x * 0.5;
    u_xlat16_20.x = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat0 * u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_20.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_39.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39.x + u_xlat16_20.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat0 = min(u_xlat19.x, u_xlat16_7.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_7.z);
    u_xlat16_20.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat16_9.xyz);
    u_xlat19.y = dot(u_xlat3.zxy, u_xlat16_9.xyz);
    u_xlat10.yz = u_xlat19.yx * u_xlat2.yx;
    u_xlat19.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat11.x;
    u_xlat38 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.z = u_xlat38 * u_xlat2.x;
    u_xlat16_1.x = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.y = u_xlat16_1.x * u_xlat2.y;
    u_xlat7.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat19.y = u_xlat38 + u_xlat7.x;
    u_xlat19.xy = u_xlat19.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.y + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat40 = inversesqrt(u_xlat38);
    u_xlat26.xyz = vec3(u_xlat40) * u_xlat8.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat26.xyz);
    u_xlat5.y = u_xlat40 * u_xlat2.y;
    u_xlat21.x = u_xlat2.x * u_xlat2.y;
    u_xlat16_1.x = dot(u_xlat3.zxy, u_xlat26.xyz);
    u_xlat5.x = u_xlat16_1.x * u_xlat2.x;
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_1.x) + 1.0;
    u_xlat5.z = u_xlat2.x * u_xlat21.x;
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat21.x / u_xlat2.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat21.x * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat19.x * u_xlat2.x;
    u_xlat16_1.x = u_xlat40 * u_xlat40;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_9.x = u_xlat40 * u_xlat16_1.x;
    u_xlat21.x = (-u_xlat16_1.x) * u_xlat40 + 1.0;
    u_xlat21.xyz = u_xlat16_17.xyz * u_xlat21.xxx;
    u_xlat3.x = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat3.xxx * u_xlat16_9.xxx + u_xlat21.xyz;
    u_xlat2.xyz = u_xlat21.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_9.xyz = vec3(_EnableChangColor) * u_xlat16_9.xyz + _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_9.xyz;
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_9.xyz = u_xlat3.xyz * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat59 = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_9.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = u_xlat16_9.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_28.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_28.x = (-u_xlat16_28.x) * u_xlat16_28.x + 1.0;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_28.x;
    u_xlat16_1.x = max(u_xlat16_16.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_9.x = max(u_xlat16_28.x, u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat3.x = u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat3.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat59) * u_xlat16_9.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat16_16.xyz * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = u_xlat22.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_17.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat59 = dot(u_xlat23.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_71 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_1.x = max(u_xlat16_17.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_66;
    u_xlat16_16.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat3.xxx * u_xlat16_16.xyz;
    u_xlat16_9.xyz = u_xlat16_16.xyz * vec3(u_xlat59) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat0) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat0) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat0) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat0) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat0) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat0) + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
    u_xlat16_58 = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_0.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_28.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_28.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_14.xyz + u_xlat16_1.xyz;
    u_xlat16_28.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_28.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_58 : u_xlat16_9.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
bool u_xlatb22;
vec3 u_xlat23;
vec3 u_xlat26;
mediump vec3 u_xlat16_28;
float u_xlat38;
mediump vec2 u_xlat16_39;
float u_xlat40;
mediump vec2 u_xlat16_40;
int u_xlati40;
bool u_xlatb40;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
bool u_xlatb59;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat59);
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat59 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.5<_anisoUse2U);
#else
    u_xlatb60 = 0.5<_anisoUse2U;
#endif
    u_xlat4.xy = (bool(u_xlatb60)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_60 = texture(_anisotropicMap, u_xlat4.xy).x;
    u_xlat60 = u_xlat16_60 * 2.0 + -1.0;
    u_xlat60 = u_xlat60 * _sunShift + _sunShiftOffset;
    u_xlat60 = u_xlat60 + vs_TEXCOORD5;
    u_xlat16_1.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb4 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat4.x = (u_xlatb4) ? 1.0 : -1.0;
    u_xlat4.x = u_xlat4.x * vs_TEXCOORD2.w;
    u_xlat23.xyz = vec3(u_xlat59) * u_xlat2.xyz;
    u_xlat5.x = dot(u_xlat3.zxy, u_xlat23.xyz);
    u_xlat3.xyz = (-u_xlat23.yzx) * u_xlat5.xxx + u_xlat3.xyz;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat23.xyz;
    u_xlat5.xyz = u_xlat23.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat16_1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat60) * u_xlat23.xyz + u_xlat5.zxy;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_7.zz);
    u_xlat16_20.x = u_xlat16_1.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_20.x>=0.0);
#else
    u_xlatb60 = u_xlat16_20.x>=0.0;
#endif
    u_xlat6.xyz = (bool(u_xlatb60)) ? u_xlat6.xyz : u_xlat3.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39.x = inversesqrt(u_xlat16_39.x);
    u_xlat16_9.xyz = u_xlat16_39.xxx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_39.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat10.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat6.zxy * u_xlat16_9.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat6.xyz * u_xlat10.xyz;
    u_xlat6.xyz = u_xlat10.zxy * u_xlat6.yzx + (-u_xlat11.xyz);
    u_xlat6.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + u_xlat6.xyz;
    u_xlat16_39.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_66 = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_66 = max(u_xlat16_66, 0.0078125);
    u_xlat16_12.x = u_xlat16_66 * 8.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_20.x) * u_xlat16_12.x;
    u_xlat6.xyz = u_xlat16_12.xxx * u_xlat6.xyz + u_xlat23.xyz;
    u_xlat60 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_9.xyz), u_xlat6.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat6.xyz = (-u_xlat6.xyz) * u_xlat16_12.xxx + (-u_xlat16_9.xyz);
    u_xlat10.xyz = u_xlat2.xyz * vec3(u_xlat59) + (-u_xlat6.xyz);
    u_xlat16_12.xyz = (-u_xlat2.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(_occlusionScale) * u_xlat16_12.xyz + u_xlat23.xyz;
    u_xlat16_69 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = max(u_xlat16_69, 0.0078125);
    u_xlat2.xyz = vec3(u_xlat16_69) * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat10.xyz = (-u_xlat2.xyz) + u_xlat6.xyz;
    u_xlat2.xyz = abs(u_xlat16_20.xxx) * u_xlat10.xyz + u_xlat2.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat13.y = u_xlat2.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_69 = -abs(u_xlat16_20.x) * 0.800000012 + 1.0;
    u_xlat2.x = (-u_xlat16_20.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat16_66;
    u_xlat2.y = u_xlat16_1.x * u_xlat16_66;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat16_1.x = u_xlat16_39.x * u_xlat16_69;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat16_10 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_1.x);
    u_xlat16_14.xyz = u_xlat16_10.www * u_xlat16_10.xyz;
    u_xlat10.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat10.xyz * u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat16_12.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_15.y = u_xlat16_12.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_1.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _occlusionScale * u_xlat16_1.x + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati40 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati59 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_15.xyw;
    u_xlat16_20.x = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_16.xyz = u_xlat16_20.xxx * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb40 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb40)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat10.x;
    u_xlat11.y = u_xlat16_39.x;
    u_xlat16_40.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_16.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_0.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_0.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _AlbedoChangColor.xyz + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = vec3(_EnableChangColor) * u_xlat16_17.xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_17.xyz = u_xlat16_39.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_20.x = u_xlat16_39.x * 1.09769487;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_40.xxx + u_xlat16_40.yyy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat0 = dot(u_xlat16_12.xyz, u_xlat6.xyz);
    u_xlat16_20.y = u_xlat0 * 0.5;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_20.z = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_18.xyz = u_xlat16_20.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.xyz = min(max(u_xlat16_18.xyz, 0.0), 1.0);
#else
    u_xlat16_18.xyz = clamp(u_xlat16_18.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_18.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.x = floor(u_xlat16_6.w);
    u_xlat16_39.x = u_xlat16_20.x + 1.0;
    u_xlat16_39.x = min(u_xlat16_39.x, 15.0);
    u_xlat16_6.x = u_xlat16_39.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_18.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_18.xy = u_xlat16_18.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19 = texture(_SpecularOcclusionLut3D, u_xlat16_18.xy).x;
    u_xlat16_20.x = u_xlat16_18.z * 15.0 + (-u_xlat16_20.x);
    u_xlat16_39.x = (-u_xlat16_19) + u_xlat16_0.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_39.x + u_xlat16_19;
    u_xlat16_20.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat0 = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_39.x = dot(u_xlat16_12.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_39.x * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat16_39.x) + u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x + u_xlat16_39.x;
    u_xlat16_20.x = u_xlat16_20.z * u_xlat16_20.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20.x;
    u_xlat19.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat19.x * 0.5;
    u_xlat16_20.x = (-u_xlat19.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat0 * u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_20.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_39.x = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_39.x + u_xlat16_20.x;
    u_xlat16_1.x = u_xlat19.x * u_xlat16_1.x;
    u_xlat0 = min(u_xlat19.x, u_xlat16_7.z);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_7.z);
    u_xlat16_20.x = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_20.xyz = u_xlat16_20.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_1.xxx * u_xlat16_14.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat19.x = inversesqrt(u_xlat19.x);
    u_xlat5.xyz = u_xlat19.xxx * u_xlat5.xyz;
    u_xlat19.x = dot(u_xlat5.xyz, u_xlat16_9.xyz);
    u_xlat19.y = dot(u_xlat3.zxy, u_xlat16_9.xyz);
    u_xlat10.yz = u_xlat19.yx * u_xlat2.yx;
    u_xlat19.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat19.x = u_xlat19.x + u_xlat11.x;
    u_xlat38 = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.z = u_xlat38 * u_xlat2.x;
    u_xlat16_1.x = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.y = u_xlat16_1.x * u_xlat2.y;
    u_xlat7.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat38 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat19.y = u_xlat38 + u_xlat7.x;
    u_xlat19.xy = u_xlat19.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat19.x = u_xlat19.x * u_xlat19.y + 6.10351563e-05;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat40 = inversesqrt(u_xlat38);
    u_xlat26.xyz = vec3(u_xlat40) * u_xlat8.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat26.xyz);
    u_xlat5.y = u_xlat40 * u_xlat2.y;
    u_xlat21.x = u_xlat2.x * u_xlat2.y;
    u_xlat16_1.x = dot(u_xlat3.zxy, u_xlat26.xyz);
    u_xlat5.x = u_xlat16_1.x * u_xlat2.x;
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_1.x) + 1.0;
    u_xlat5.z = u_xlat2.x * u_xlat21.x;
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat2.x = max(u_xlat2.x, 6.10351563e-05);
    u_xlat2.x = u_xlat21.x / u_xlat2.x;
    u_xlat21.x = u_xlat21.x * 0.318309873;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat21.x * u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat19.x * u_xlat2.x;
    u_xlat16_1.x = u_xlat40 * u_xlat40;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat40 * u_xlat16_1.x;
    u_xlat16_9.x = u_xlat40 * u_xlat16_1.x;
    u_xlat21.x = (-u_xlat16_1.x) * u_xlat40 + 1.0;
    u_xlat21.xyz = u_xlat16_17.xyz * u_xlat21.xxx;
    u_xlat3.x = u_xlat16_17.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat3.xxx * u_xlat16_9.xxx + u_xlat21.xyz;
    u_xlat2.xyz = u_xlat21.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_9.xyz = vec3(_EnableChangColor) * u_xlat16_9.xyz + _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_9.xyz;
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_9.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_9.xyz = u_xlat3.xyz * u_xlat16_9.xxx;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat59 = dot(u_xlat23.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_9.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_9.xyz);
    u_xlat16_9.x = u_xlat16_9.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_28.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_28.x = (-u_xlat16_28.x) * u_xlat16_28.x + 1.0;
    u_xlat16_28.x = max(u_xlat16_28.x, 0.0);
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_28.x;
    u_xlat16_1.x = max(u_xlat16_16.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_28.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_9.x = max(u_xlat16_28.x, u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_9.xyz = u_xlat16_20.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat3.x = u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat3.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat59) * u_xlat16_9.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat16_16.xyz * u_xlat7.xxx + u_xlat16_9.xyz;
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_1.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = u_xlat22.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb59 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_17.xy = (bool(u_xlatb59)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_18.xyz;
    u_xlat59 = dot(u_xlat23.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_71 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_71;
    u_xlat16_1.x = max(u_xlat16_17.x, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_71);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_66;
    u_xlat16_16.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat3.xxx * u_xlat16_16.xyz;
    u_xlat16_9.xyz = u_xlat16_16.xyz * vec3(u_xlat59) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
    u_xlat16_16.xyz = u_xlat16_20.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat0) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat0) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_20.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat0) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat0) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat0) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_20.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_1.xyz = u_xlat16_20.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * vec3(u_xlat0) + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_15.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat2.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_9.xyz;
    u_xlat16_58 = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_0.w * _albedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_28.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_28.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_28.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_28.xyz * u_xlat16_14.xyz + u_xlat16_1.xyz;
    u_xlat16_28.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_28.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_58 : u_xlat16_9.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
ivec3 u_xlati5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec2 u_xlat16_27;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
vec2 u_xlat44;
float u_xlat45;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat65;
bool u_xlatb65;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
mediump float u_xlat16_67;
int u_xlati67;
bool u_xlatb67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
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
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat9.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat9.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat23 = max((-u_xlat1.w), u_xlat2.x);
    u_xlat23 = (-u_xlat2.x) + u_xlat23;
    u_xlat1.z = _ShadowBias.y * u_xlat23 + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat23 = (-u_xlat16_7.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23 + u_xlat16_7.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_23 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_23 * _shadowStrength;
    u_xlat23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_7.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat44.x = u_xlat2.x + -1.0;
    u_xlat44.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat44.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_occlusionScale) * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_70) + u_xlat16_11.x;
    u_xlat16_32.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_32.x + 1.0;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_11.x + u_xlat16_70;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_70;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_11.x;
    u_xlat44.xy = min(u_xlat44.xy, vec2(u_xlat16_70));
    u_xlat16_70 = u_xlat44.y * 0.5;
    u_xlat16_12.x = (-u_xlat44.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_anisoUse2U);
#else
    u_xlatb3 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_3 = texture(_anisotropicMap, u_xlat3.xy).x;
    u_xlat3.x = u_xlat16_3 * 2.0 + -1.0;
    u_xlat3.x = u_xlat3.x * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_33.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_33.xyz = u_xlat16_33.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat45 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat45) + u_xlat8.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat3.xxx * u_xlat16_33.xyz + u_xlat24.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_8.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_33.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_54 = u_xlat16_33.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_54>=0.0);
#else
    u_xlatb66 = u_xlat16_54>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(u_xlat16_75);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.xyz = u_xlat5.xyz * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat16_13.yzx + (-u_xlat14.xyz);
    u_xlat15.xyz = u_xlat5.xyz * u_xlat14.xyz;
    u_xlat5.xyz = u_xlat14.zxy * u_xlat5.yzx + (-u_xlat15.xyz);
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_16.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_75 = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_75 = max(u_xlat16_75, 0.0078125);
    u_xlat16_76 = u_xlat16_75 * 8.0;
    u_xlat16_76 = min(u_xlat16_76, 1.0);
    u_xlat16_76 = abs(u_xlat16_54) * u_xlat16_76;
    u_xlat5.xyz = vec3(u_xlat16_76) * u_xlat5.xyz + u_xlat9.xyz;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_76 = dot((-u_xlat16_13.xyz), u_xlat5.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_76) + (-u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat5.xyz);
    u_xlat16_32.y = u_xlat66 * 0.5;
    u_xlat16_32.x = u_xlat16_16.x * 1.09769487;
    u_xlat16_32.xyz = u_xlat16_32.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_32.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_1.w);
    u_xlat16_53 = u_xlat16_32.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_1.x = u_xlat16_53 * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_1.x = u_xlat16_32.x * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_32.x = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_53 = u_xlat16_66 + (-u_xlat16_67);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_53 + u_xlat16_67;
    u_xlat16_32.x = u_xlat16_11.x * u_xlat16_32.x;
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat16_32.x;
    u_xlat16_70 = u_xlat66 * u_xlat16_12.x + u_xlat16_70;
    u_xlat16_32.x = u_xlat16_70 + u_xlat16_70;
    u_xlat16_53 = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_70 = u_xlat44.y * u_xlat16_70;
    u_xlat44.x = min(u_xlat44.x, u_xlat16_8.z);
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_8.z);
    u_xlat16_32.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat16_53 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat6.xyz = vec3(u_xlat16_53) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_54)) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat17.y = u_xlat5.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_53 = -abs(u_xlat16_54) * 0.800000012 + 1.0;
    u_xlat65 = (-u_xlat16_54) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat16_75;
    u_xlat66 = u_xlat16_33.x * u_xlat16_75;
    u_xlat66 = max(u_xlat66, 0.00100000005);
    u_xlat65 = max(u_xlat65, 0.00100000005);
    u_xlat16_53 = u_xlat16_16.x * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_53);
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_53);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat5.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_7.xyz = u_xlat16_11.xxx * u_xlat16_7.xyz;
    u_xlati67 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_11.xzw = u_xlat16_7.yyy * _IrradianceACCoeffs[u_xlati67].xyz;
    u_xlati67 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_11.xzw = u_xlat16_7.xxx * _IrradianceACCoeffs[u_xlati67].xyz + u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_7.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_11.xzw;
    u_xlat16_11.x = dot(u_xlat16_7.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_11.xzw = u_xlat16_11.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb67)) ? u_xlat16_11.xzw : u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x;
    u_xlat6.y = u_xlat16_16.x;
    u_xlat16_27.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xzw = u_xlat16_0.xyz * u_xlat16_16.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xzw = u_xlat16_0.xyz * u_xlat16_16.xzw;
    u_xlat16_16.xzw = u_xlat16_16.xzw * _AlbedoChangColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = vec3(_EnableChangColor) * u_xlat16_16.xzw + u_xlat16_12.xyz;
    u_xlat16_16.xzw = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_32.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_16.yyy * u_xlat16_16.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_27.xxx + u_xlat16_27.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat16_13.xyz);
    u_xlat24.x = dot(u_xlat4.zxy, u_xlat16_13.xyz);
    u_xlat5.y = u_xlat24.x * u_xlat66;
    u_xlat5.z = u_xlat65 * u_xlat3.x;
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat6.x;
    u_xlat24.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.z = u_xlat65 * u_xlat24.x;
    u_xlat16_70 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.y = u_xlat66 * u_xlat16_70;
    u_xlat5.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat3.y = u_xlat24.x + u_xlat5.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat24.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat26.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat26.xyz);
    u_xlat0.y = u_xlat0.x * u_xlat66;
    u_xlat24.x = u_xlat65 * u_xlat66;
    u_xlat16_70 = dot(u_xlat4.zxy, u_xlat26.xyz);
    u_xlat0.x = u_xlat65 * u_xlat16_70;
    u_xlat65 = dot(u_xlat9.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16_70) + 1.0;
    u_xlat0.z = u_xlat65 * u_xlat24.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat24.x / u_xlat0.x;
    u_xlat21 = u_xlat24.x * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat16_70 = u_xlat45 * u_xlat45;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_74 = u_xlat45 * u_xlat16_70;
    u_xlat21 = (-u_xlat16_70) * u_xlat45 + 1.0;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat21) * vec3(u_xlat16_74) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat5.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz + _shadowColor.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.w = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_12.w = u_xlat16_75 * u_xlat16_75;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_12;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_7.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat5.xxx + u_xlat16_18.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_75;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_70);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat16_13.xyz + u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat44.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat44.xxx + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_12.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_70 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_32.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_11.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump float _cutoff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _anisoUse2U;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec3 u_xlat5;
ivec3 u_xlati5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
float u_xlat21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
bool u_xlatb24;
vec3 u_xlat26;
mediump vec2 u_xlat16_27;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
vec2 u_xlat44;
float u_xlat45;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat65;
bool u_xlatb65;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
mediump float u_xlat16_67;
int u_xlati67;
bool u_xlatb67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
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
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat9.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat9.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat23 = max((-u_xlat1.w), u_xlat2.x);
    u_xlat23 = (-u_xlat2.x) + u_xlat23;
    u_xlat1.z = _ShadowBias.y * u_xlat23 + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat23 = (-u_xlat16_7.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat23 + u_xlat16_7.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat16_23 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_7.x = u_xlat16_23 * _shadowStrength;
    u_xlat23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_7.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat44.x = u_xlat2.x + -1.0;
    u_xlat44.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat44.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_occlusionScale) * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_7.xyz = vec3(u_xlat16_70) * u_xlat16_7.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_70) + u_xlat16_11.x;
    u_xlat16_32.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_32.x + 1.0;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_11.x + u_xlat16_70;
    u_xlat16_70 = u_xlat16_32.z * u_xlat16_70;
    u_xlat16_11.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -1.0;
    u_xlat16_11.x = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_11.x;
    u_xlat44.xy = min(u_xlat44.xy, vec2(u_xlat16_70));
    u_xlat16_70 = u_xlat44.y * 0.5;
    u_xlat16_12.x = (-u_xlat44.y) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_anisoUse2U);
#else
    u_xlatb3 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xy = (bool(u_xlatb3)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_3 = texture(_anisotropicMap, u_xlat3.xy).x;
    u_xlat3.x = u_xlat16_3 * 2.0 + -1.0;
    u_xlat3.x = u_xlat3.x * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_33.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_33.xyz = u_xlat16_33.xxx * vs_TEXCOORD1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24.x = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat24.x = u_xlat24.x * vs_TEXCOORD2.w;
    u_xlat45 = dot(u_xlat8.zxy, u_xlat9.xyz);
    u_xlat4.xyz = (-u_xlat9.yzx) * vec3(u_xlat45) + u_xlat8.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.yzx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat9.zxy * u_xlat4.zxy + (-u_xlat5.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat3.xxx * u_xlat16_33.xyz + u_xlat24.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat24.zxy;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_8.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_33.x = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_8.zz);
    u_xlat16_54 = u_xlat16_33.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat16_54>=0.0);
#else
    u_xlatb66 = u_xlat16_54>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_13.xyz = u_xlat10.xyz * vec3(u_xlat16_75);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.xyz = u_xlat5.xyz * u_xlat16_13.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat16_13.yzx + (-u_xlat14.xyz);
    u_xlat15.xyz = u_xlat5.xyz * u_xlat14.xyz;
    u_xlat5.xyz = u_xlat14.zxy * u_xlat5.yzx + (-u_xlat15.xyz);
    u_xlat5.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + u_xlat5.xyz;
    u_xlat16_16.xy = u_xlat16_8.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_75 = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_75 = max(u_xlat16_75, 0.0078125);
    u_xlat16_76 = u_xlat16_75 * 8.0;
    u_xlat16_76 = min(u_xlat16_76, 1.0);
    u_xlat16_76 = abs(u_xlat16_54) * u_xlat16_76;
    u_xlat5.xyz = vec3(u_xlat16_76) * u_xlat5.xyz + u_xlat9.xyz;
    u_xlat66 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat5.xyz;
    u_xlat16_76 = dot((-u_xlat16_13.xyz), u_xlat5.xyz);
    u_xlat16_76 = u_xlat16_76 + u_xlat16_76;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(u_xlat16_76) + (-u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat5.xyz);
    u_xlat16_32.y = u_xlat66 * 0.5;
    u_xlat16_32.x = u_xlat16_16.x * 1.09769487;
    u_xlat16_32.xyz = u_xlat16_32.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_32.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_1.w);
    u_xlat16_53 = u_xlat16_32.x + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_1.x = u_xlat16_53 * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_1.x = u_xlat16_32.x * 16.0 + u_xlat16_1.z;
    u_xlat16_58.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_58.xy = u_xlat16_58.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_58.xy).x;
    u_xlat16_32.x = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_53 = u_xlat16_66 + (-u_xlat16_67);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_53 + u_xlat16_67;
    u_xlat16_32.x = u_xlat16_11.x * u_xlat16_32.x;
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat16_32.x;
    u_xlat16_70 = u_xlat66 * u_xlat16_12.x + u_xlat16_70;
    u_xlat16_32.x = u_xlat16_70 + u_xlat16_70;
    u_xlat16_53 = (-u_xlat16_70) * 2.0 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_53 + u_xlat16_32.x;
    u_xlat16_70 = u_xlat44.y * u_xlat16_70;
    u_xlat44.x = min(u_xlat44.x, u_xlat16_8.z);
    u_xlat16_70 = min(u_xlat16_70, u_xlat16_8.z);
    u_xlat16_32.x = (-u_xlat16_8.y) * _metallicMultiplier + 1.0;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat69) + (-u_xlat5.xyz);
    u_xlat16_53 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat6.xyz = vec3(u_xlat16_53) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat5.xyz = abs(vec3(u_xlat16_54)) * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat17.y = u_xlat5.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_53 = -abs(u_xlat16_54) * 0.800000012 + 1.0;
    u_xlat65 = (-u_xlat16_54) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat16_75;
    u_xlat66 = u_xlat16_33.x * u_xlat16_75;
    u_xlat66 = max(u_xlat66, 0.00100000005);
    u_xlat65 = max(u_xlat65, 0.00100000005);
    u_xlat16_53 = u_xlat16_16.x * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_53);
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_53);
    u_xlat16_12.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat5.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_18.y = u_xlat16_7.y;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_7.xyz = u_xlat16_11.xxx * u_xlat16_7.xyz;
    u_xlati67 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_11.xzw = u_xlat16_7.yyy * _IrradianceACCoeffs[u_xlati67].xyz;
    u_xlati67 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_11.xzw = u_xlat16_7.xxx * _IrradianceACCoeffs[u_xlati67].xyz + u_xlat16_11.xzw;
    u_xlat16_7.xyz = u_xlat16_7.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_11.xzw;
    u_xlat16_11.x = dot(u_xlat16_7.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_11.xzw = u_xlat16_11.xxx * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb67 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xzw = (bool(u_xlatb67)) ? u_xlat16_11.xzw : u_xlat16_12.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat5.x;
    u_xlat6.y = u_xlat16_16.x;
    u_xlat16_27.xy = texture(_DfgTexture, u_xlat6.xy).xy;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _albedoColor.xyz;
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xzw = u_xlat16_0.xyz * u_xlat16_16.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xzw = u_xlat16_0.xyz * u_xlat16_16.xzw;
    u_xlat16_16.xzw = u_xlat16_16.xzw * _AlbedoChangColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_12.xyz = vec3(_EnableChangColor) * u_xlat16_16.xzw + u_xlat16_12.xyz;
    u_xlat16_16.xzw = u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_32.xxx * u_xlat16_12.xyz;
    u_xlat16_16.xyz = u_xlat16_16.yyy * u_xlat16_16.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_27.xxx + u_xlat16_27.yyy;
    u_xlat16_11.xyz = u_xlat16_11.xzw * u_xlat16_18.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat16_13.xyz);
    u_xlat24.x = dot(u_xlat4.zxy, u_xlat16_13.xyz);
    u_xlat5.y = u_xlat24.x * u_xlat66;
    u_xlat5.z = u_xlat65 * u_xlat3.x;
    u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat6.x;
    u_xlat24.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.z = u_xlat65 * u_xlat24.x;
    u_xlat16_70 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat5.y = u_xlat66 * u_xlat16_70;
    u_xlat5.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat3.y = u_xlat24.x + u_xlat5.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat24.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat26.xyz = u_xlat24.xxx * u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat26.xyz);
    u_xlat0.y = u_xlat0.x * u_xlat66;
    u_xlat24.x = u_xlat65 * u_xlat66;
    u_xlat16_70 = dot(u_xlat4.zxy, u_xlat26.xyz);
    u_xlat0.x = u_xlat65 * u_xlat16_70;
    u_xlat65 = dot(u_xlat9.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_70 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat16_70) + 1.0;
    u_xlat0.z = u_xlat65 * u_xlat24.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat24.x / u_xlat0.x;
    u_xlat21 = u_xlat24.x * 0.318309873;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat16_70 = u_xlat45 * u_xlat45;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_70 = u_xlat45 * u_xlat16_70;
    u_xlat16_74 = u_xlat45 * u_xlat16_70;
    u_xlat21 = (-u_xlat16_70) * u_xlat45 + 1.0;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat21);
    u_xlat21 = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat21) * vec3(u_xlat16_74) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_directSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + _directSpecularColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat5.xxx * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz + _shadowColor.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.w = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_12.w = u_xlat16_75 * u_xlat16_75;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_12;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_7.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat2.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat5.xxx + u_xlat16_18.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_70 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_70 = max(u_xlat16_70, 6.10351563e-05);
    u_xlat16_74 = inversesqrt(u_xlat16_70);
    u_xlat16_18.xyz = u_xlat3.xyz * vec3(u_xlat16_74);
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat16_19.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat2.x = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_75 = u_xlat16_70 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = float(1.0) / float(u_xlat16_70);
    u_xlat16_75 = (-u_xlat16_75) * u_xlat16_75 + 1.0;
    u_xlat16_75 = max(u_xlat16_75, 0.0);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_75;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_75;
    u_xlat16_70 = max(u_xlat16_19.x, u_xlat16_70);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_75 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_75);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_74;
    u_xlat16_18.xyz = vec3(u_xlat16_70) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = vec3(u_xlat23) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat2.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat16_13.xyz + u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat44.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat44.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat44.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat44.xxx + u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_12.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_70 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat16_32.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_11.x;
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
  GpuProgramID 85516
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_FlowLight_Glitter_ButtonColorChang_DissolveGUI"
}