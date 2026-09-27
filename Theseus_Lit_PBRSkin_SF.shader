//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Skin)_SF" {
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

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_UseShadowMask ("启用补光遮罩", Float) = 0.0

_UseRenderInfo01Mask ("启用RenderInfo补光1遮罩", Float) = 0.0

_UseRenderInfo02Mask ("启用RenderInfo补光2遮罩", Float) = 0.0

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

[Tex] _skinMap ("RG:SSS根据动态法线强度混合RG, B:changed roughness", 2D) = "black" { }

_sssColorBase ("sssColor0", Color) = (1,1,1,1)

_sssColorBack ("sssColor1", Color) = (1,1,1,1)

_sssColorOcc ("sssColor2", Color) = (1,1,1,1)

_sssIntensity ("sssIntensity", Range(0, 3)) = 0.0

[Tex] _sweatNormalMap ("RGB:第二套法线贴图", 2D) = "bump" { }

[Tex] _sweatMaskMap ("RGB:动态法线1/2/3遮罩, A:汗水遮罩", 2D) = "white" { }

[Tex] _sweatDetailMap ("RG:细节法线贴图, B:细节法线遮罩（深浅为强度）, A：青筋颜色遮罩", 2D) = "white" { }

_sweatNormalStrengthA ("动态法线1强度", Range(0, 2)) = 0.5

_sweatNormalStrengthB ("动态法线2强度", Range(0, 2)) = 0.5

_sweatNormalStrengthC ("动态法线3强度", Range(0, 2)) = 0.5

_sweatNormalColor ("青筋颜色", Color) = (0.4,0.6,0.7,1)

_sweatStrength ("汗水强度", Range(0, 1)) = 0.0

_detailNormalMapTiling ("xy:细节法线贴图缩放,z:细节法线贴图强度", Vector) = (1,1,1,1)

_ShadeDetailTex ("暗部细节贴图", 2D) = "white" { }

_ShadeDetailMask ("暗部细节遮罩(R:绘制; G:擦除;)", 2D) = "black" { }

_DetailRange ("细节范围", Float) = 0.0

_ShadeRange ("暗部范围", Float) = 0.0

_ShadeDetail ("暗部细节显隐", Range(0, 1)) = 1.0

_UseAdjustColor ("启用调色", Float) = 0.0

_PostExposure ("亮度", Float) = 0.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_Saturation ("饱和度", Range(0, 3)) = 1.0

_SansheSaturation ("光源饱和度", Range(0, 3)) = 1.0

_HueShift ("色相", Range(0, 1)) = 0.0

_UseSansheMask ("启用补光遮罩", Float) = 0.0

_SansheMask ("补光遮罩贴图(R:补光1;G:补光2;B:平行光)", 2D) = "white" { }

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0.001, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_color ("补光2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("补光2范围", Range(0.001, 10)) = 1.0

_Sanshe2_Power ("补光2强度", Float) = 0.0

_Sanshe2_X ("补光2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("补光2Y轴偏移", Range(-1, 1)) = 0.0

_UseDirectionalMask ("启用平行光遮罩", Float) = 0.0

_DirectionalColor ("平行光颜色", Color) = (1,1,1,1)

_DirectionalIntensity ("平行光强度", Float) = 0.0

_DirectionalDir ("平行光方向", Vector) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR_Skin_SF"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 5376
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat10_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
bool u_xlatb26;
mediump vec3 u_xlat16_27;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
float u_xlat30;
mediump float u_xlat16_30;
int u_xlati30;
vec3 u_xlat32;
mediump vec2 u_xlat16_32;
mediump vec2 u_xlat10_32;
float u_xlat33;
mediump vec3 u_xlat16_35;
float u_xlat52;
mediump vec2 u_xlat16_53;
mediump float u_xlat16_55;
vec2 u_xlat58;
float u_xlat59;
float u_xlat64;
float u_xlat65;
float u_xlat78;
int u_xlati78;
bool u_xlatb78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
float u_xlat84;
mediump float u_xlat16_84;
float u_xlat86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_93;
mediump float u_xlat16_95;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_27.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = (-u_xlat16_27.x) * u_xlat16_27.x + 1.0;
    u_xlat16_27.x = max(u_xlat16_27.x, 0.0);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_53.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_27.x * u_xlat16_53.x;
    u_xlat16_27.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_27.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_27.x);
#endif
    u_xlat16_27.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_27.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_27.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_27.xyz = u_xlat16_2.xyz * u_xlat16_27.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_27.xyz);
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
    u_xlat16_28 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_28, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat78 = (-_ShadeRange) + _DetailRange;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_4.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_4.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_80 = u_xlat16_4.x * _detailNormalMapTiling.z;
    u_xlat16_55 = u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_80) * u_xlat16_3.xy;
    u_xlat16_5.z = u_xlat16_55 * u_xlat16_1.x + 1.0;
    u_xlat4.xzw = u_xlat16_5.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_6.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat16_6 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_6.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_80 = _sweatStrength * (-u_xlat16_6.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat84 = dot(u_xlat6.xyz, u_xlat4.xzw);
    u_xlat4.xzw = u_xlat4.xzw * u_xlat6.zzz;
    u_xlat4.xzw = vec3(u_xlat84) * u_xlat6.xyz + (-u_xlat4.xzw);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat84 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat84 = max(u_xlat84, 1.17549435e-38);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat84);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat6.x = dot(u_xlat4.xzw, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat4.xzw, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat4.xzw, u_xlat8.xyz);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_3.x = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_3.xxx * u_xlat4.xzw;
    u_xlat6.x = dot(u_xlat16_29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat32.x = u_xlat6.x + (-_ShadeRange);
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat78 = u_xlat78 * u_xlat32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat32.x = u_xlat78 * -2.0 + 3.0;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat32.x;
    u_xlat16_32.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat32.xy = (-u_xlat16_32.xy) + vec2(1.0, 1.0);
    u_xlat16_5.x = min(u_xlat78, u_xlat32.x);
    u_xlat16_5.x = u_xlat16_5.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_1.x * u_xlat16_4.y;
    u_xlat16_9.x = u_xlat16_9.x * _sweatNormalColor.w;
    u_xlat16_35.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_35.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat10_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat10_7.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_7.zxy * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat10_8.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + (-u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_5.xxx * u_xlat16_11.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat32.yyy * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_87 = u_xlat10_8.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_87) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_87 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat32.xyz = u_xlat26.xyz * vec3(u_xlat16_87) + u_xlat16_27.xyz;
    u_xlat30 = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat32.xyz = vec3(u_xlat30) * u_xlat32.xyz;
    u_xlat16_88 = dot(u_xlat16_27.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat30 = dot(u_xlat16_29.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat32.x = dot(u_xlat16_29.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat32.x = min(max(u_xlat32.x, 0.0), 1.0);
#else
    u_xlat32.x = clamp(u_xlat32.x, 0.0, 1.0);
#endif
    u_xlat32.x = u_xlat32.x * u_xlat32.x;
    u_xlat58.x = (-u_xlat16_88) + 1.0;
    u_xlat16_27.x = u_xlat58.x * u_xlat58.x;
    u_xlat16_27.x = u_xlat58.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat58.x * u_xlat16_27.x;
    u_xlat84 = (-u_xlat16_27.x) * u_xlat58.x + 1.0;
    u_xlat16_27.x = u_xlat58.x * u_xlat16_27.x;
    u_xlat7.xyz = u_xlat16_10.xyz * vec3(u_xlat84);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_27.xxx + u_xlat7.xyz;
    u_xlat16_12.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.x = (-u_xlat10_8.x) + u_xlat16_12.z;
    u_xlat16_27.x = u_xlat16_1.x * u_xlat16_27.x + u_xlat10_8.x;
    u_xlat16_27.x = u_xlat16_80 * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * _roughnessMultiplier;
    u_xlat16_80 = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat58.x = (-u_xlat30) * u_xlat16_80 + u_xlat30;
    u_xlat58.x = u_xlat30 * u_xlat58.x + u_xlat16_80;
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat30 + u_xlat58.x;
    u_xlat16_11.xyz = u_xlat26.xyz * vec3(u_xlat16_87);
    u_xlat13.x = dot(u_xlat16_29.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat13.x) * u_xlat16_80 + u_xlat13.x;
    u_xlat84 = u_xlat13.x * u_xlat84 + u_xlat16_80;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat58.y = u_xlat84 + u_xlat13.x;
    u_xlat58.xy = u_xlat58.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat58.x = u_xlat58.x * u_xlat58.y;
    u_xlat32.y = float(1.0) / u_xlat58.x;
    u_xlat8.x = u_xlat16_80 + -1.0;
    u_xlat32.x = u_xlat32.x * u_xlat8.x + 1.0;
    u_xlat32.x = u_xlat32.x * u_xlat32.x;
    u_xlat32.x = u_xlat16_80 / u_xlat32.x;
    u_xlat32.x = u_xlat32.x * 0.318309873;
    u_xlat32.xy = min(u_xlat32.xy, vec2(16.0, 16.0));
    u_xlat32.x = u_xlat32.y * u_xlat32.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat32.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlatb5 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_5.x = (u_xlatb5.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat16_5.z = (u_xlatb5.z) ? float(1.0) : float(0.0);
    u_xlat16_5.w = (u_xlatb5.w) ? float(0.0) : float(1.0);
    u_xlat10_32.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat32.xy = u_xlat10_32.xy * u_xlat16_5.xz + u_xlat16_5.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xy = min(max(u_xlat32.xy, 0.0), 1.0);
#else
    u_xlat32.xy = clamp(u_xlat32.xy, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat32.xxx * u_xlat7.xyz;
    u_xlat14.xyz = u_xlat26.xyz * vec3(u_xlat16_87) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat86 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat14.xyz = vec3(u_xlat86) * u_xlat14.xyz;
    u_xlat16_88 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_29.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat8.x + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_80 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat64 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat64 * u_xlat64;
    u_xlat16_88 = u_xlat64 * u_xlat16_88;
    u_xlat16_88 = u_xlat64 * u_xlat16_88;
    u_xlat90 = (-u_xlat16_88) * u_xlat64 + 1.0;
    u_xlat16_88 = u_xlat64 * u_xlat16_88;
    u_xlat14.xyz = u_xlat16_10.xyz * vec3(u_xlat90);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_88) + u_xlat14.xyz;
    u_xlat64 = (-u_xlat6.x) * u_xlat16_80 + u_xlat6.x;
    u_xlat65 = u_xlat6.x * u_xlat64 + u_xlat16_80;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat6.x + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat58.y * u_xlat65;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat86 = u_xlat86 * u_xlat65;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_89 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_93 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_88);
    u_xlat16_88 = u_xlat16_89 * u_xlat16_93;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_93);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat7.xyz = u_xlat26.xyz * vec3(u_xlat16_87) + u_xlat16_16.xyz;
    u_xlat78 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat7.xyz = vec3(u_xlat78) * u_xlat7.xyz;
    u_xlat16_88 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat78 = dot(u_xlat16_29.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_29.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat8.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_80 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat33 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat33 * u_xlat33;
    u_xlat16_88 = u_xlat33 * u_xlat16_88;
    u_xlat16_88 = u_xlat33 * u_xlat16_88;
    u_xlat59 = (-u_xlat16_88) * u_xlat33 + 1.0;
    u_xlat16_88 = u_xlat33 * u_xlat16_88;
    u_xlat14.xyz = u_xlat16_10.xyz * vec3(u_xlat59);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_88) + u_xlat14.xyz;
    u_xlat0.x = (-u_xlat78) * u_xlat16_80 + u_xlat78;
    u_xlat0.x = u_xlat78 * u_xlat0.x + u_xlat16_80;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat78;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat58.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = u_xlat14.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat78) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_17.xyz * u_xlat7.xyz;
    u_xlat16_15.xyz = u_xlat7.xyz * u_xlat32.yyy + u_xlat16_15.xyz;
    u_xlat16_88 = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_88 + u_xlat16_12.x;
    u_xlat16_88 = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_88;
    u_xlat16_88 = (-u_xlat10_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat16_88);
    u_xlat16_88 = sqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_16.xyz + (-u_xlat16_18.xyz);
    u_xlat16_20.xyz = vec3(u_xlat30) * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = (-u_xlat4.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_21.xyz + u_xlat16_29.xyz;
    u_xlat16_89 = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz;
    u_xlat16_89 = dot(u_xlat16_21.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_89 * 0.5 + 0.5;
    u_xlat16_93 = (-u_xlat16_89) + u_xlat16_93;
    u_xlat16_95 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_95 + 1.0;
    u_xlat16_89 = u_xlat16_27.z * u_xlat16_93 + u_xlat16_89;
    u_xlat16_89 = u_xlat16_27.z * u_xlat16_89;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_93;
    u_xlat16_95 = sqrt(u_xlat16_89);
    u_xlat0.x = min(u_xlat16_89, 1.0);
    u_xlat16_22.xy = u_xlat32.xy * vec2(u_xlat16_95);
    u_xlat16_23.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_88) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = u_xlat16_22.yyy * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_95) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.xzw + (-vec3(u_xlat30));
    u_xlat16_20.xyz = vec3(u_xlat16_88) * u_xlat16_20.xyz + vec3(u_xlat30);
    u_xlat16_20.xyz = u_xlat16_9.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat32.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat6.xxx * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat78) * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + (-vec3(u_xlat78));
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz + vec3(u_xlat78);
    u_xlat16_18.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_20.xyz * u_xlat16_23.xyz + (-u_xlat6.xxx);
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz + u_xlat6.xxx;
    u_xlat16_18.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat32.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_29.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_29.xz);
    u_xlat16_17.y = u_xlat16_29.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_18.y = u_xlat16_21.y;
    u_xlat78 = dot(u_xlat16_18.xyz, u_xlat16_17.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat6.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat6.xyz = vec3(u_xlat78) * u_xlat6.xyz + _sssColorBack.zxy;
    u_xlat16_17.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_27.zzz * u_xlat16_17.xyz + _sssColorOcc.zxy;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat6.xyz * u_xlat16_9.xyz + (-u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat78 = min(u_xlat0.x, u_xlat10_8.z);
    u_xlat16_17.xyz = vec3(u_xlat78) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat78) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat78) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat78) * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat78) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_19.xyz * vec3(u_xlat78) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_93) * u_xlat16_19.xyz;
    u_xlati78 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati78].xyz;
    u_xlati78 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati30 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati78].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati30].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat78 = dot(u_xlat16_21.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_9.x = dot((-u_xlat16_11.xyz), u_xlat16_29.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat6.xyz = (-u_xlat16_29.xyz) * u_xlat16_9.xxx + (-u_xlat16_11.xyz);
    u_xlat16_27.y = dot(u_xlat16_21.xyz, u_xlat6.xyz);
    u_xlat16_9.xyz = u_xlat16_27.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_53.x = floor(u_xlat16_5.w);
    u_xlat16_79 = u_xlat16_53.x + 1.0;
    u_xlat16_79 = min(u_xlat16_79, 15.0);
    u_xlat16_5.x = u_xlat16_79 * 16.0 + u_xlat16_5.z;
    u_xlat16_9.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_5.x = u_xlat16_53.x * 16.0 + u_xlat16_5.z;
    u_xlat16_9.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_84 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_53.x = u_xlat16_9.z * 15.0 + (-u_xlat16_53.x);
    u_xlat16_79 = u_xlat16_30 + (-u_xlat16_84);
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_79 + u_xlat16_84;
    u_xlat16_53.x = u_xlat16_93 * u_xlat16_53.x;
    u_xlat78 = u_xlat78 * u_xlat16_53.x;
    u_xlat16_53.x = u_xlat0.x * 0.5;
    u_xlat16_79 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_53.x = u_xlat78 * u_xlat16_79 + u_xlat16_53.x;
    u_xlat16_79 = u_xlat16_53.x + u_xlat16_53.x;
    u_xlat16_9.x = (-u_xlat16_53.x) * 2.0 + 1.0;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_9.x + u_xlat16_79;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_53.x;
    u_xlat16_53.x = min(u_xlat16_53.x, u_xlat10_8.z);
    u_xlat16_79 = u_xlat16_27.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_27.x);
    u_xlat13.y = u_xlat16_27.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat4.xyz = u_xlat4.xzw * u_xlat16_3.xxx + (-u_xlat6.xyz);
    u_xlat4.xyz = vec3(u_xlat16_80) * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat10.y = u_xlat4.y;
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_79);
    u_xlat16_11.xyw = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat4.xyz = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyw = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_11.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_53.xxx * u_xlat16_1.xyw;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_9.yzx + u_xlat16_15.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat10_7.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat10_7.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_29.xyz, u_xlat16_29.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_29.xyz;
    u_xlat6.x = u_xlat26.x * u_xlat16_87 + _Sanshe_X;
    u_xlat6.y = u_xlat26.y * u_xlat16_87 + _Sanshe_Y;
    u_xlat6.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb78 = _UseSansheMask>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_53.xy = u_xlat16_7.xy * u_xlat16_53.xx + u_xlat16_53.yy;
    u_xlat6.x = u_xlat26.x * u_xlat16_87 + _Sanshe2_X;
    u_xlat6.y = u_xlat26.y * u_xlat16_87 + _Sanshe2_Y;
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = max(u_xlat26.x, 0.00048828125);
    u_xlat26.x = log2(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _Sanshe2_Fw;
    u_xlat26.x = exp2(u_xlat26.x);
    u_xlat0.y = u_xlat26.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_53.xy;
    u_xlat4.xyz = u_xlat0.yyy * _Sanshe2_color.zxy;
    u_xlat26.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat0.xxx * _Sanshe_color.zxy + u_xlat4.xyz;
    u_xlat16_53.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_53.x = inversesqrt(u_xlat16_53.x);
    u_xlat16_11.xyz = u_xlat16_53.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat16_29.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.zxy;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_53.x = u_xlat16_7.z * u_xlat16_53.x + u_xlat16_53.y;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat16_53.xxx + u_xlat16_9.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_2.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat52 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat78 = u_xlat4.x * 15.0 + (-u_xlat52);
    u_xlat2.x = u_xlat52 * 0.0625 + u_xlat2.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_4.xyz) + u_xlat16_6.xyz;
    u_xlat4.xyz = vec3(u_xlat78) * u_xlat6.xyz + u_xlat16_4.xyz;
    u_xlat16_53.x = exp2(_PostExposure);
    u_xlat6.xyz = u_xlat4.xyz * u_xlat16_53.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat6.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat6.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat6.xyz = (-vec3(u_xlat52)) + u_xlat6.xyz;
    u_xlat78 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat78;
    u_xlat0.x = max(u_xlat0.x, u_xlat26.x);
    u_xlat16_53.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_53.x + _Saturation;
    u_xlat0.xyz = u_xlat16_53.xxx * u_xlat6.xyz + vec3(u_xlat52);
    u_xlat16_53.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb78 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_3.x = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_3.xx * u_xlat16_53.xy + u_xlat0.zy;
    u_xlat16_5.w = (-u_xlat0.x);
    u_xlat16_53.x = float(1.0);
    u_xlat16_53.y = float(-1.0);
    u_xlat16_2.zw = u_xlat16_3.xx * u_xlat16_53.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_2.xyw);
    u_xlat16_3.yzw = u_xlat16_2.yzx + u_xlat16_5.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb26 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat16_53.x = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat16_79 = u_xlat16_53.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_3.xyz = u_xlat16_53.xxx * u_xlat16_3.xyz + u_xlat16_2.xyw;
    u_xlat16_53.x = min(u_xlat16_79, u_xlat16_3.y);
    u_xlat16_79 = u_xlat16_79 + (-u_xlat16_3.y);
    u_xlat16_53.x = (-u_xlat16_53.x) + u_xlat16_3.x;
    u_xlat16_29.x = u_xlat16_53.x * 6.0 + 9.99999975e-05;
    u_xlat16_79 = u_xlat16_79 / u_xlat16_29.x;
    u_xlat16_79 = u_xlat16_79 + u_xlat16_3.z;
    u_xlat16_79 = abs(u_xlat16_79) + _HueShift;
    u_xlat16_29.xyz = vec3(u_xlat16_79) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_29.xyz = fract(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_29.xyz = abs(u_xlat16_29.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_79 = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_53.x = u_xlat16_53.x / u_xlat16_79;
    u_xlat16_29.xyz = u_xlat16_53.xxx * u_xlat16_29.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_29.xyz * u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_53.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat16_53.yyy + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_27.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat10_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
bool u_xlatb26;
mediump vec3 u_xlat16_27;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
float u_xlat30;
mediump float u_xlat16_30;
int u_xlati30;
vec3 u_xlat32;
mediump vec2 u_xlat16_32;
mediump vec2 u_xlat10_32;
float u_xlat33;
mediump vec3 u_xlat16_35;
float u_xlat52;
mediump vec2 u_xlat16_53;
mediump float u_xlat16_55;
vec2 u_xlat58;
float u_xlat59;
float u_xlat64;
float u_xlat65;
float u_xlat78;
int u_xlati78;
bool u_xlatb78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
float u_xlat84;
mediump float u_xlat16_84;
float u_xlat86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_93;
mediump float u_xlat16_95;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_27.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_27.x = (-u_xlat16_27.x) * u_xlat16_27.x + 1.0;
    u_xlat16_27.x = max(u_xlat16_27.x, 0.0);
    u_xlat16_27.x = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_53.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_27.x * u_xlat16_53.x;
    u_xlat16_27.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_27.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_27.x);
#endif
    u_xlat16_27.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_27.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_27.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_27.xyz = u_xlat16_2.xyz * u_xlat16_27.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_27.xyz);
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
    u_xlat16_28 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_28, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).zxy;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat78 = (-_ShadeRange) + _DetailRange;
    u_xlat78 = float(1.0) / u_xlat78;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_4.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_4.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_80 = u_xlat16_4.x * _detailNormalMapTiling.z;
    u_xlat16_55 = u_xlat16_80;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_80) * u_xlat16_3.xy;
    u_xlat16_5.z = u_xlat16_55 * u_xlat16_1.x + 1.0;
    u_xlat4.xzw = u_xlat16_5.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_6.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat16_6 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_6.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_80 = _sweatStrength * (-u_xlat16_6.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat84 = dot(u_xlat6.xyz, u_xlat4.xzw);
    u_xlat4.xzw = u_xlat4.xzw * u_xlat6.zzz;
    u_xlat4.xzw = vec3(u_xlat84) * u_xlat6.xyz + (-u_xlat4.xzw);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat84 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat84 = max(u_xlat84, 1.17549435e-38);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat84);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat6.x = dot(u_xlat4.xzw, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat4.xzw, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat4.xzw, u_xlat8.xyz);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_3.x = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_29.xyz = u_xlat16_3.xxx * u_xlat4.xzw;
    u_xlat6.x = dot(u_xlat16_29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat32.x = u_xlat6.x + (-_ShadeRange);
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat78 = u_xlat78 * u_xlat32.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat32.x = u_xlat78 * -2.0 + 3.0;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat32.x;
    u_xlat16_32.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat32.xy = (-u_xlat16_32.xy) + vec2(1.0, 1.0);
    u_xlat16_5.x = min(u_xlat78, u_xlat32.x);
    u_xlat16_5.x = u_xlat16_5.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_1.x * u_xlat16_4.y;
    u_xlat16_9.x = u_xlat16_9.x * _sweatNormalColor.w;
    u_xlat16_35.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * u_xlat16_35.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat10_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat10_7.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_7.zxy * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat10_8.www * u_xlat16_10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + (-u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_5.xxx * u_xlat16_11.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = (-u_xlat16_9.xyz) * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat32.yyy * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_87 = u_xlat10_8.y * _metallicMultiplier;
    u_xlat16_10.xyz = vec3(u_xlat16_87) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_87 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat16_87 = inversesqrt(u_xlat16_87);
    u_xlat32.xyz = u_xlat26.xyz * vec3(u_xlat16_87) + u_xlat16_27.xyz;
    u_xlat30 = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat32.xyz = vec3(u_xlat30) * u_xlat32.xyz;
    u_xlat16_88 = dot(u_xlat16_27.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat30 = dot(u_xlat16_29.xyz, u_xlat16_27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat32.x = dot(u_xlat16_29.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat32.x = min(max(u_xlat32.x, 0.0), 1.0);
#else
    u_xlat32.x = clamp(u_xlat32.x, 0.0, 1.0);
#endif
    u_xlat32.x = u_xlat32.x * u_xlat32.x;
    u_xlat58.x = (-u_xlat16_88) + 1.0;
    u_xlat16_27.x = u_xlat58.x * u_xlat58.x;
    u_xlat16_27.x = u_xlat58.x * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat58.x * u_xlat16_27.x;
    u_xlat84 = (-u_xlat16_27.x) * u_xlat58.x + 1.0;
    u_xlat16_27.x = u_xlat58.x * u_xlat16_27.x;
    u_xlat7.xyz = u_xlat16_10.xyz * vec3(u_xlat84);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_27.xxx + u_xlat7.xyz;
    u_xlat16_12.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.x = (-u_xlat10_8.x) + u_xlat16_12.z;
    u_xlat16_27.x = u_xlat16_1.x * u_xlat16_27.x + u_xlat10_8.x;
    u_xlat16_27.x = u_xlat16_80 * u_xlat16_27.x;
    u_xlat16_27.x = u_xlat16_27.x * _roughnessMultiplier;
    u_xlat16_80 = u_xlat16_27.x * u_xlat16_27.x;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_80 = max(u_xlat16_80, 0.0078125);
    u_xlat58.x = (-u_xlat30) * u_xlat16_80 + u_xlat30;
    u_xlat58.x = u_xlat30 * u_xlat58.x + u_xlat16_80;
    u_xlat58.x = sqrt(u_xlat58.x);
    u_xlat58.x = u_xlat30 + u_xlat58.x;
    u_xlat16_11.xyz = u_xlat26.xyz * vec3(u_xlat16_87);
    u_xlat13.x = dot(u_xlat16_29.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat13.x) * u_xlat16_80 + u_xlat13.x;
    u_xlat84 = u_xlat13.x * u_xlat84 + u_xlat16_80;
    u_xlat84 = sqrt(u_xlat84);
    u_xlat58.y = u_xlat84 + u_xlat13.x;
    u_xlat58.xy = u_xlat58.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat58.x = u_xlat58.x * u_xlat58.y;
    u_xlat32.y = float(1.0) / u_xlat58.x;
    u_xlat8.x = u_xlat16_80 + -1.0;
    u_xlat32.x = u_xlat32.x * u_xlat8.x + 1.0;
    u_xlat32.x = u_xlat32.x * u_xlat32.x;
    u_xlat32.x = u_xlat16_80 / u_xlat32.x;
    u_xlat32.x = u_xlat32.x * 0.318309873;
    u_xlat32.xy = min(u_xlat32.xy, vec2(16.0, 16.0));
    u_xlat32.x = u_xlat32.y * u_xlat32.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat32.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlatb5 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_5.x = (u_xlatb5.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat16_5.z = (u_xlatb5.z) ? float(1.0) : float(0.0);
    u_xlat16_5.w = (u_xlatb5.w) ? float(0.0) : float(1.0);
    u_xlat10_32.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat32.xy = u_xlat10_32.xy * u_xlat16_5.xz + u_xlat16_5.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.xy = min(max(u_xlat32.xy, 0.0), 1.0);
#else
    u_xlat32.xy = clamp(u_xlat32.xy, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat32.xxx * u_xlat7.xyz;
    u_xlat14.xyz = u_xlat26.xyz * vec3(u_xlat16_87) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat86 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat14.xyz = vec3(u_xlat86) * u_xlat14.xyz;
    u_xlat16_88 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_29.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat8.x + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_80 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat64 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat64 * u_xlat64;
    u_xlat16_88 = u_xlat64 * u_xlat16_88;
    u_xlat16_88 = u_xlat64 * u_xlat16_88;
    u_xlat90 = (-u_xlat16_88) * u_xlat64 + 1.0;
    u_xlat16_88 = u_xlat64 * u_xlat16_88;
    u_xlat14.xyz = u_xlat16_10.xyz * vec3(u_xlat90);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_88) + u_xlat14.xyz;
    u_xlat64 = (-u_xlat6.x) * u_xlat16_80 + u_xlat6.x;
    u_xlat65 = u_xlat6.x * u_xlat64 + u_xlat16_80;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat6.x + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat58.y * u_xlat65;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat86 = u_xlat86 * u_xlat65;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_89 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_93 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_88);
    u_xlat16_88 = u_xlat16_89 * u_xlat16_93;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_88 = max(u_xlat16_88, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_89 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_89 = max(u_xlat16_89, u_xlat16_93);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_89;
    u_xlat16_17.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat7.xyz = u_xlat26.xyz * vec3(u_xlat16_87) + u_xlat16_16.xyz;
    u_xlat78 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat7.xyz = vec3(u_xlat78) * u_xlat7.xyz;
    u_xlat16_88 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat78 = dot(u_xlat16_29.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_29.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat8.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_80 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat33 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat33 * u_xlat33;
    u_xlat16_88 = u_xlat33 * u_xlat16_88;
    u_xlat16_88 = u_xlat33 * u_xlat16_88;
    u_xlat59 = (-u_xlat16_88) * u_xlat33 + 1.0;
    u_xlat16_88 = u_xlat33 * u_xlat16_88;
    u_xlat14.xyz = u_xlat16_10.xyz * vec3(u_xlat59);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_88) + u_xlat14.xyz;
    u_xlat0.x = (-u_xlat78) * u_xlat16_80 + u_xlat78;
    u_xlat0.x = u_xlat78 * u_xlat0.x + u_xlat16_80;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat78;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat58.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = u_xlat14.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat78) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_17.xyz * u_xlat7.xyz;
    u_xlat16_15.xyz = u_xlat7.xyz * u_xlat32.yyy + u_xlat16_15.xyz;
    u_xlat16_88 = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_88 + u_xlat16_12.x;
    u_xlat16_88 = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_88;
    u_xlat16_88 = (-u_xlat10_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat16_88);
    u_xlat16_88 = sqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_16.xyz + (-u_xlat16_18.xyz);
    u_xlat16_20.xyz = vec3(u_xlat30) * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = (-u_xlat4.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_21.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_21.xyz + u_xlat16_29.xyz;
    u_xlat16_89 = dot(u_xlat16_21.xyz, u_xlat16_21.xyz);
    u_xlat16_89 = inversesqrt(u_xlat16_89);
    u_xlat16_21.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz;
    u_xlat16_89 = dot(u_xlat16_21.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_89 * 0.5 + 0.5;
    u_xlat16_93 = (-u_xlat16_89) + u_xlat16_93;
    u_xlat16_95 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_27.z = _occlusionScale * u_xlat16_95 + 1.0;
    u_xlat16_89 = u_xlat16_27.z * u_xlat16_93 + u_xlat16_89;
    u_xlat16_89 = u_xlat16_27.z * u_xlat16_89;
    u_xlat16_93 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 + -1.0;
    u_xlat16_93 = _occlusionScale * u_xlat16_93 + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_93;
    u_xlat16_95 = sqrt(u_xlat16_89);
    u_xlat0.x = min(u_xlat16_89, 1.0);
    u_xlat16_22.xy = u_xlat32.xy * vec2(u_xlat16_95);
    u_xlat16_23.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_88) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xzw = u_xlat16_22.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = u_xlat16_22.yyy * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_95) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_22.xzw + (-vec3(u_xlat30));
    u_xlat16_20.xyz = vec3(u_xlat16_88) * u_xlat16_20.xyz + vec3(u_xlat30);
    u_xlat16_20.xyz = u_xlat16_9.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat32.xxx * u_xlat16_2.xyz;
    u_xlat16_20.xyz = u_xlat6.xxx * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat78) * u_xlat16_19.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + (-vec3(u_xlat78));
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz + vec3(u_xlat78);
    u_xlat16_18.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_20.xyz * u_xlat16_23.xyz + (-u_xlat6.xxx);
    u_xlat16_18.xyz = vec3(u_xlat16_88) * u_xlat16_18.xyz + u_xlat6.xxx;
    u_xlat16_18.xyz = u_xlat16_9.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_2.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat32.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_29.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_29.xz);
    u_xlat16_17.y = u_xlat16_29.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_21.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_21.xz);
    u_xlat16_18.y = u_xlat16_21.y;
    u_xlat78 = dot(u_xlat16_18.xyz, u_xlat16_17.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat6.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat6.xyz = vec3(u_xlat78) * u_xlat6.xyz + _sssColorBack.zxy;
    u_xlat16_17.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_27.zzz * u_xlat16_17.xyz + _sssColorOcc.zxy;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat6.xyz * u_xlat16_9.xyz + (-u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_17.xyz + u_xlat16_9.xyz;
    u_xlat16_17.xyz = u_xlat16_9.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat78 = min(u_xlat0.x, u_xlat10_8.z);
    u_xlat16_17.xyz = vec3(u_xlat78) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat78) * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_9.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat78) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat78) * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat78) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_9.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_19.xyz * vec3(u_xlat78) + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_93) * u_xlat16_19.xyz;
    u_xlati78 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati78].xyz;
    u_xlati78 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati30 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati78].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati30].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat78 = dot(u_xlat16_21.xyz, u_xlat16_29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_9.x = dot((-u_xlat16_11.xyz), u_xlat16_29.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat6.xyz = (-u_xlat16_29.xyz) * u_xlat16_9.xxx + (-u_xlat16_11.xyz);
    u_xlat16_27.y = dot(u_xlat16_21.xyz, u_xlat6.xyz);
    u_xlat16_9.xyz = u_xlat16_27.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_53.x = floor(u_xlat16_5.w);
    u_xlat16_79 = u_xlat16_53.x + 1.0;
    u_xlat16_79 = min(u_xlat16_79, 15.0);
    u_xlat16_5.x = u_xlat16_79 * 16.0 + u_xlat16_5.z;
    u_xlat16_9.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_5.x = u_xlat16_53.x * 16.0 + u_xlat16_5.z;
    u_xlat16_9.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_9.xy = u_xlat16_9.xy * vec2(0.00390625, 0.0625);
    u_xlat16_84 = texture(_SpecularOcclusionLut3D, u_xlat16_9.xy).x;
    u_xlat16_53.x = u_xlat16_9.z * 15.0 + (-u_xlat16_53.x);
    u_xlat16_79 = u_xlat16_30 + (-u_xlat16_84);
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_79 + u_xlat16_84;
    u_xlat16_53.x = u_xlat16_93 * u_xlat16_53.x;
    u_xlat78 = u_xlat78 * u_xlat16_53.x;
    u_xlat16_53.x = u_xlat0.x * 0.5;
    u_xlat16_79 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_53.x = u_xlat78 * u_xlat16_79 + u_xlat16_53.x;
    u_xlat16_79 = u_xlat16_53.x + u_xlat16_53.x;
    u_xlat16_9.x = (-u_xlat16_53.x) * 2.0 + 1.0;
    u_xlat16_53.x = u_xlat16_53.x * u_xlat16_9.x + u_xlat16_79;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_53.x;
    u_xlat16_53.x = min(u_xlat16_53.x, u_xlat10_8.z);
    u_xlat16_79 = u_xlat16_27.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_27.x);
    u_xlat13.y = u_xlat16_27.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat4.xyz = u_xlat4.xzw * u_xlat16_3.xxx + (-u_xlat6.xyz);
    u_xlat4.xyz = vec3(u_xlat16_80) * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat10.y = u_xlat4.y;
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_79);
    u_xlat16_11.xyw = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat4.xyz = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyw = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_11.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_53.xxx * u_xlat16_1.xyw;
    u_xlat16_9.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.yzx * u_xlat16_9.yzx + u_xlat16_15.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat10_7.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat10_7.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_29.xyz, u_xlat16_29.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_29.xyz;
    u_xlat6.x = u_xlat26.x * u_xlat16_87 + _Sanshe_X;
    u_xlat6.y = u_xlat26.y * u_xlat16_87 + _Sanshe_Y;
    u_xlat6.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb78 = _UseSansheMask>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb78)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_53.xy = u_xlat16_7.xy * u_xlat16_53.xx + u_xlat16_53.yy;
    u_xlat6.x = u_xlat26.x * u_xlat16_87 + _Sanshe2_X;
    u_xlat6.y = u_xlat26.y * u_xlat16_87 + _Sanshe2_Y;
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = (-u_xlat26.x) + 1.0;
    u_xlat26.x = max(u_xlat26.x, 0.0);
    u_xlat26.x = max(u_xlat26.x, 0.00048828125);
    u_xlat26.x = log2(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _Sanshe2_Fw;
    u_xlat26.x = exp2(u_xlat26.x);
    u_xlat0.y = u_xlat26.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_53.xy;
    u_xlat4.xyz = u_xlat0.yyy * _Sanshe2_color.zxy;
    u_xlat26.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat0.xxx * _Sanshe_color.zxy + u_xlat4.xyz;
    u_xlat16_53.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_53.x = inversesqrt(u_xlat16_53.x);
    u_xlat16_11.xyz = u_xlat16_53.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat16_29.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.zxy;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_53.x = u_xlat16_7.z * u_xlat16_53.x + u_xlat16_53.y;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat16_53.xxx + u_xlat16_9.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_2.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat52 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat78 = u_xlat4.x * 15.0 + (-u_xlat52);
    u_xlat2.x = u_xlat52 * 0.0625 + u_xlat2.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_4.xyz) + u_xlat16_6.xyz;
    u_xlat4.xyz = vec3(u_xlat78) * u_xlat6.xyz + u_xlat16_4.xyz;
    u_xlat16_53.x = exp2(_PostExposure);
    u_xlat6.xyz = u_xlat4.xyz * u_xlat16_53.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat6.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat6.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat52 = dot(u_xlat6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat6.xyz = (-vec3(u_xlat52)) + u_xlat6.xyz;
    u_xlat78 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat78;
    u_xlat0.x = max(u_xlat0.x, u_xlat26.x);
    u_xlat16_53.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_53.x = u_xlat0.x * u_xlat16_53.x + _Saturation;
    u_xlat0.xyz = u_xlat16_53.xxx * u_xlat6.xyz + vec3(u_xlat52);
    u_xlat16_53.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb78 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_3.x = (u_xlatb78) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_3.xx * u_xlat16_53.xy + u_xlat0.zy;
    u_xlat16_5.w = (-u_xlat0.x);
    u_xlat16_53.x = float(1.0);
    u_xlat16_53.y = float(-1.0);
    u_xlat16_2.zw = u_xlat16_3.xx * u_xlat16_53.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_2.xyw);
    u_xlat16_3.yzw = u_xlat16_2.yzx + u_xlat16_5.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb26 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat16_53.x = (u_xlatb26) ? 1.0 : 0.0;
    u_xlat16_79 = u_xlat16_53.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_3.xyz = u_xlat16_53.xxx * u_xlat16_3.xyz + u_xlat16_2.xyw;
    u_xlat16_53.x = min(u_xlat16_79, u_xlat16_3.y);
    u_xlat16_79 = u_xlat16_79 + (-u_xlat16_3.y);
    u_xlat16_53.x = (-u_xlat16_53.x) + u_xlat16_3.x;
    u_xlat16_29.x = u_xlat16_53.x * 6.0 + 9.99999975e-05;
    u_xlat16_79 = u_xlat16_79 / u_xlat16_29.x;
    u_xlat16_79 = u_xlat16_79 + u_xlat16_3.z;
    u_xlat16_79 = abs(u_xlat16_79) + _HueShift;
    u_xlat16_29.xyz = vec3(u_xlat16_79) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_29.xyz = fract(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_29.xyz = abs(u_xlat16_29.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_79 = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_53.x = u_xlat16_53.x / u_xlat16_79;
    u_xlat16_29.xyz = u_xlat16_53.xxx * u_xlat16_29.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_29.xyz * u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_53.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_53.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat16_53.yyy + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_27.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(16) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
mediump vec3 u_xlat10_28;
int u_xlati28;
bvec3 u_xlatb28;
float u_xlat29;
float u_xlat30;
mediump vec3 u_xlat16_33;
float u_xlat34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_41;
float u_xlat56;
mediump float u_xlat16_56;
vec2 u_xlat58;
mediump vec2 u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_61;
mediump float u_xlat16_69;
float u_xlat84;
bool u_xlatb84;
float u_xlat86;
bool u_xlatb86;
float u_xlat87;
float u_xlat88;
bool u_xlatb88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
mediump float u_xlat16_96;
mediump float u_xlat16_97;
mediump float u_xlat16_98;
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
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb88 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb88)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat29 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat29 = (-u_xlat1.x) + u_xlat29;
    u_xlat0.z = _ShadowBias.y * u_xlat29 + u_xlat1.x;
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
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb28.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb28.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb28.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb28.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb28.y) ? float(0.0) : float(1.0);
    u_xlat16_33.xy = (u_xlatb28.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xy = u_xlat10_28.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat28.x = u_xlat10_28.z * u_xlat16_33.x + u_xlat16_33.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_12.x * _shadowStrength;
    u_xlat56 = u_xlat16_12.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_33.x = max(u_xlat16_33.x, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33.x);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = max(u_xlat16_33.x, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_33.x;
    u_xlat16_14.xyz = u_xlat16_33.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_33.x = u_xlat16_33.x * _sweatNormalColor.w;
    u_xlat16_15.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_33.xxx * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat10_1.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat10_1.zxy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat2.x = (-_ShadeRange) + _DetailRange;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat30 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat58.x = u_xlat30 + (-_ShadeRange);
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat58.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
    u_xlat16_58.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat58.xy = (-u_xlat16_58.xy) + vec2(1.0, 1.0);
    u_xlat16_33.x = min(u_xlat58.x, u_xlat2.x);
    u_xlat16_33.x = u_xlat16_33.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat2.xz = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xz = u_xlat2.xz * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_3.xyz = texture(_ShadeDetailTex, u_xlat2.xz).zxy;
    u_xlat3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_4.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat3.xyz);
    u_xlat16_17.xyz = u_xlat16_33.xxx * u_xlat16_17.xyz + u_xlat3.xyz;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat58.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_33.x = u_xlat10_4.y * _metallicMultiplier;
    u_xlat16_16.xyz = u_xlat16_33.xxx * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.x = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_33.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat58.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58.x = inversesqrt(u_xlat58.x);
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat16_61 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat87 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat87;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat88 = (-u_xlat16_61) * u_xlat87 + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat9.xyz = u_xlat16_16.xyz * vec3(u_xlat88);
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_61) + u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_61 = (-u_xlat10_4.x) + u_xlat16_10.z;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat10_4.x;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat16_41.x = u_xlat16_61 * _roughnessMultiplier;
    u_xlat16_61 = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat87 = (-u_xlat58.x) * u_xlat16_61 + u_xlat58.x;
    u_xlat87 = u_xlat58.x * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat58.x + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat16_33.xxx;
    u_xlat11.x = dot(u_xlat16_7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat11.x) * u_xlat16_61 + u_xlat11.x;
    u_xlat4.x = u_xlat11.x * u_xlat4.x + u_xlat16_61;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat11.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat4.x;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat88 = u_xlat16_61 + -1.0;
    u_xlat86 = u_xlat86 * u_xlat88 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat86 = u_xlat87 * u_xlat86;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat18.xyz = u_xlat3.xyz * u_xlat16_33.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat86 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat18.xyz = vec3(u_xlat86) * u_xlat18.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat88 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat34 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat18.xyz = u_xlat16_16.xyz * vec3(u_xlat34);
    u_xlat18.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat18.xyz;
    u_xlat87 = (-u_xlat30) * u_xlat16_61 + u_xlat30;
    u_xlat87 = u_xlat30 * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat30 + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat4.x;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat86 = u_xlat86 * u_xlat87;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat30) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat18.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat9.xyz;
    u_xlat16_91 = u_xlat16_96 * u_xlat16_13.x;
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb86 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_21.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_91 = max(u_xlat16_91, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb86 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb86) ? 1.0 : 0.0;
    u_xlat16_96 = max(u_xlat16_96, u_xlat16_13.x);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_21.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_20.xyz;
    u_xlat86 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat88 + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_61 / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat88 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat9.xyz = u_xlat16_16.xyz * vec3(u_xlat88);
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat9.xyz;
    u_xlat2.x = (-u_xlat86) * u_xlat16_61 + u_xlat86;
    u_xlat2.x = u_xlat86 * u_xlat2.x + u_xlat16_61;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat86;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat4.x;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat59;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_21.xyz * u_xlat9.xyz;
    u_xlat16_19.xyz = u_xlat9.xyz * u_xlat28.xxx + u_xlat16_19.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_91 * 0.5 + 0.5;
    u_xlat16_96 = (-u_xlat16_91) + u_xlat16_96;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_96 + u_xlat16_91;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_13.x = sqrt(u_xlat16_91);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_91));
    u_xlat16_22.xyz = u_xlat16_12.xyz * u_xlat16_13.xxx;
    u_xlat16_91 = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91 + u_xlat16_10.x;
    u_xlat16_91 = _sssIntensity * _sssIntensity;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_91 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = sqrt(u_xlat16_89);
    u_xlat16_23.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_91) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_91) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat30) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xyz = u_xlat16_27.xyz * u_xlat16_22.xyz + (-vec3(u_xlat30));
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(u_xlat30);
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat58.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_98 = u_xlat56 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat28.x * u_xlat16_13.x;
    u_xlat16_26.xyz = u_xlat16_13.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_98) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat58.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + u_xlat58.xxx;
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat56) * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-vec3(u_xlat86));
    u_xlat16_14.xyz = vec3(u_xlat16_91) * u_xlat16_14.xyz + vec3(u_xlat86);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat28.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz + u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_14.y = u_xlat16_7.y;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_21.xyz, u_xlat16_14.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat2.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat2.xyz = u_xlat28.xxx * u_xlat2.xyz + _sssColorBack.zxy;
    u_xlat16_14.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_41.zzz * u_xlat16_14.xyz + _sssColorOcc.zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat16_15.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_89) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_96) * u_xlat16_22.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_89 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_91 = u_xlat0.w * 0.5;
    u_xlat16_13.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot((-u_xlat16_17.xyz), u_xlat16_7.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat2.xyz = (-u_xlat16_7.xyz) * u_xlat16_14.xxx + (-u_xlat16_17.xyz);
    u_xlat16_41.y = dot(u_xlat16_20.xyz, u_xlat2.xyz);
    u_xlat16_14.xyz = u_xlat16_41.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_8.w);
    u_xlat16_97 = u_xlat16_69 + 1.0;
    u_xlat16_97 = min(u_xlat16_97, 15.0);
    u_xlat16_8.x = u_xlat16_97 * 16.0 + u_xlat16_8.z;
    u_xlat16_14.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_8.x = u_xlat16_69 * 16.0 + u_xlat16_8.z;
    u_xlat16_14.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_69 = u_xlat16_14.z * 15.0 + (-u_xlat16_69);
    u_xlat16_97 = (-u_xlat16_56) + u_xlat16_28;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_97 + u_xlat16_56;
    u_xlat16_96 = u_xlat16_96 * u_xlat16_69;
    u_xlat0.x = u_xlat0.x * u_xlat16_96;
    u_xlat16_91 = u_xlat0.x * u_xlat16_13.x + u_xlat16_91;
    u_xlat16_96 = u_xlat16_91 + u_xlat16_91;
    u_xlat16_13.x = (-u_xlat16_91) * 2.0 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_13.x + u_xlat16_96;
    u_xlat16_91 = u_xlat0.w * u_xlat16_91;
    u_xlat16_91 = min(u_xlat10_4.z, u_xlat16_91);
    u_xlat16_96 = u_xlat16_41.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_41.x);
    u_xlat11.y = u_xlat16_41.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat0.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat2.xyz);
    u_xlat0.xyz = vec3(u_xlat16_61) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_96);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xzw = vec3(u_xlat16_89) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xzw = (bool(u_xlatb0)) ? u_xlat16_5.xzw : u_xlat16_15.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_13.xyz;
    u_xlat16_5.xzw = vec3(u_xlat16_91) * u_xlat16_5.xzw;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_5.xzw * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_5.xzw = u_xlat16_5.zwx * u_xlat16_13.yzx + u_xlat16_19.yzx;
    u_xlat16_5.x = dot(u_xlat16_5.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat10_1.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat10_1.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_17.z;
    u_xlat84 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = (-u_xlat84) + 1.0;
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = max(u_xlat84, 0.00048828125);
    u_xlat84 = log2(u_xlat84);
    u_xlat84 = u_xlat84 * _Sanshe_Fw;
    u_xlat84 = exp2(u_xlat84);
    u_xlat0.w = u_xlat84 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb86 = _UseSansheMask>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_4.xy * u_xlat16_13.xx + u_xlat16_13.yy;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe2_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_13.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_33.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_15.xyz = u_xlat16_33.xxx * _DirectionalDir.xyz;
    u_xlat28.x = dot(u_xlat16_15.xyz, u_xlat16_7.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.xyz = u_xlat28.xxx * _DirectionalColor.zxy;
    u_xlat28.xyz = u_xlat28.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb2 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = u_xlat16_4.z * u_xlat16_33.x + u_xlat16_33.z;
    u_xlat16_7.xyz = u_xlat28.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_12.xyz;
    u_xlat28.x = dot(u_xlat16_12.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat28.x = u_xlat28.x + -0.25;
    u_xlat28.x = u_xlat28.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat2.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat56 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat84 = u_xlat2.x * 15.0 + (-u_xlat56);
    u_xlat1.x = u_xlat56 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = vec3(u_xlat84) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat16_33.x = exp2(_PostExposure);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat16_33.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = (-vec3(u_xlat56)) + u_xlat3.xyz;
    u_xlat84 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat84;
    u_xlat0.x = max(u_xlat28.x, u_xlat0.x);
    u_xlat16_33.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_33.x + _Saturation;
    u_xlat0.xyz = u_xlat16_33.xxx * u_xlat3.xyz + vec3(u_xlat56);
    u_xlat16_33.xz = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb84 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb84 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_7.x = (u_xlatb84) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_7.xx * u_xlat16_33.xz + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_33.x = float(1.0);
    u_xlat16_33.z = float(-1.0);
    u_xlat16_1.zw = u_xlat16_7.xx * u_xlat16_33.xz + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb28.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_33.x = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_89 = u_xlat16_33.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_7.xyz = u_xlat16_33.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_33.x = min(u_xlat16_89, u_xlat16_7.y);
    u_xlat16_89 = u_xlat16_89 + (-u_xlat16_7.y);
    u_xlat16_33.x = (-u_xlat16_33.x) + u_xlat16_7.x;
    u_xlat16_35.x = u_xlat16_33.x * 6.0 + 9.99999975e-05;
    u_xlat16_89 = u_xlat16_89 / u_xlat16_35.x;
    u_xlat16_89 = u_xlat16_89 + u_xlat16_7.z;
    u_xlat16_89 = abs(u_xlat16_89) + _HueShift;
    u_xlat16_35.xyz = vec3(u_xlat16_89) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_35.xyz = fract(u_xlat16_35.xyz);
    u_xlat16_35.xyz = u_xlat16_35.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_35.xyz = abs(u_xlat16_35.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.xyz = min(max(u_xlat16_35.xyz, 0.0), 1.0);
#else
    u_xlat16_35.xyz = clamp(u_xlat16_35.xyz, 0.0, 1.0);
#endif
    u_xlat16_35.xyz = u_xlat16_35.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_89 = u_xlat16_7.x + 9.99999975e-05;
    u_xlat16_33.x = u_xlat16_33.x / u_xlat16_89;
    u_xlat16_35.xyz = u_xlat16_33.xxx * u_xlat16_35.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_35.xyz * u_xlat16_7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_33.xxx * u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_33.zzz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_61;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(12) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(16) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
mediump vec3 u_xlat10_28;
int u_xlati28;
bvec3 u_xlatb28;
float u_xlat29;
float u_xlat30;
mediump vec3 u_xlat16_33;
float u_xlat34;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_41;
float u_xlat56;
mediump float u_xlat16_56;
vec2 u_xlat58;
mediump vec2 u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_61;
mediump float u_xlat16_69;
float u_xlat84;
bool u_xlatb84;
float u_xlat86;
bool u_xlatb86;
float u_xlat87;
float u_xlat88;
bool u_xlatb88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
mediump float u_xlat16_96;
mediump float u_xlat16_97;
mediump float u_xlat16_98;
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
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb88 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb88)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat29 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat29 = (-u_xlat1.x) + u_xlat29;
    u_xlat0.z = _ShadowBias.y * u_xlat29 + u_xlat1.x;
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
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb28.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb28.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb28.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb28.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb28.y) ? float(0.0) : float(1.0);
    u_xlat16_33.xy = (u_xlatb28.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xy = u_xlat10_28.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat28.x = u_xlat10_28.z * u_xlat16_33.x + u_xlat16_33.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_12.x * _shadowStrength;
    u_xlat56 = u_xlat16_12.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_33.x = max(u_xlat16_33.x, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33.x);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = max(u_xlat16_33.x, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_33.x;
    u_xlat16_14.xyz = u_xlat16_33.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_33.x = u_xlat16_33.x * _sweatNormalColor.w;
    u_xlat16_15.xyz = _sweatNormalColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_33.xxx * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat10_1.zxy * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat10_1.zxy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat2.x = (-_ShadeRange) + _DetailRange;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat30 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat58.x = u_xlat30 + (-_ShadeRange);
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat58.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
    u_xlat16_58.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat58.xy = (-u_xlat16_58.xy) + vec2(1.0, 1.0);
    u_xlat16_33.x = min(u_xlat58.x, u_xlat2.x);
    u_xlat16_33.x = u_xlat16_33.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat2.xz = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xz = u_xlat2.xz * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_3.xyz = texture(_ShadeDetailTex, u_xlat2.xz).zxy;
    u_xlat3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_4.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat3.xyz);
    u_xlat16_17.xyz = u_xlat16_33.xxx * u_xlat16_17.xyz + u_xlat3.xyz;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat58.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_33.x = u_xlat10_4.y * _metallicMultiplier;
    u_xlat16_16.xyz = u_xlat16_33.xxx * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.x = u_xlat16_16.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_33.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat58.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58.x = inversesqrt(u_xlat58.x);
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat16_61 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat87 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat87;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat88 = (-u_xlat16_61) * u_xlat87 + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat9.xyz = u_xlat16_16.xyz * vec3(u_xlat88);
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_61) + u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_61 = (-u_xlat10_4.x) + u_xlat16_10.z;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat10_4.x;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat16_41.x = u_xlat16_61 * _roughnessMultiplier;
    u_xlat16_61 = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat87 = (-u_xlat58.x) * u_xlat16_61 + u_xlat58.x;
    u_xlat87 = u_xlat58.x * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat58.x + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat16_33.xxx;
    u_xlat11.x = dot(u_xlat16_7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat11.x) * u_xlat16_61 + u_xlat11.x;
    u_xlat4.x = u_xlat11.x * u_xlat4.x + u_xlat16_61;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat11.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat4.x;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat88 = u_xlat16_61 + -1.0;
    u_xlat86 = u_xlat86 * u_xlat88 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat86 = u_xlat87 * u_xlat86;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat18.xyz = u_xlat3.xyz * u_xlat16_33.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat86 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat18.xyz = vec3(u_xlat86) * u_xlat18.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat88 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat34 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat18.xyz = u_xlat16_16.xyz * vec3(u_xlat34);
    u_xlat18.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat18.xyz;
    u_xlat87 = (-u_xlat30) * u_xlat16_61 + u_xlat30;
    u_xlat87 = u_xlat30 * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat30 + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat4.x;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat86 = u_xlat86 * u_xlat87;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.zxy;
    u_xlat18.xyz = vec3(u_xlat30) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_19.xyz = u_xlat18.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat9.xyz;
    u_xlat16_91 = u_xlat16_96 * u_xlat16_13.x;
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb86 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_21.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_91 = max(u_xlat16_91, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb86 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb86) ? 1.0 : 0.0;
    u_xlat16_96 = max(u_xlat16_96, u_xlat16_13.x);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_21.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_20.xyz;
    u_xlat86 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat88 + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_61 / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat88 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat9.xyz = u_xlat16_16.xyz * vec3(u_xlat88);
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat9.xyz;
    u_xlat2.x = (-u_xlat86) * u_xlat16_61 + u_xlat86;
    u_xlat2.x = u_xlat86 * u_xlat2.x + u_xlat16_61;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat86;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat4.x;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat59;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_21.xyz * u_xlat9.xyz;
    u_xlat16_19.xyz = u_xlat9.xyz * u_xlat28.xxx + u_xlat16_19.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_91 * 0.5 + 0.5;
    u_xlat16_96 = (-u_xlat16_91) + u_xlat16_96;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_96 + u_xlat16_91;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_13.x = sqrt(u_xlat16_91);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_91));
    u_xlat16_22.xyz = u_xlat16_12.xyz * u_xlat16_13.xxx;
    u_xlat16_91 = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91 + u_xlat16_10.x;
    u_xlat16_91 = _sssIntensity * _sssIntensity;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_91 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = sqrt(u_xlat16_89);
    u_xlat16_23.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_91) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_91) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat30) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xyz = u_xlat16_27.xyz * u_xlat16_22.xyz + (-vec3(u_xlat30));
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(u_xlat30);
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat58.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_98 = u_xlat56 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat28.x * u_xlat16_13.x;
    u_xlat16_26.xyz = u_xlat16_13.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_98) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_23.xyz + (-u_xlat58.xxx);
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + u_xlat58.xxx;
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat56) * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-vec3(u_xlat86));
    u_xlat16_14.xyz = vec3(u_xlat16_91) * u_xlat16_14.xyz + vec3(u_xlat86);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat28.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz + u_xlat16_12.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_14.y = u_xlat16_7.y;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_21.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_21.xyz, u_xlat16_14.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat2.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat2.xyz = u_xlat28.xxx * u_xlat2.xyz + _sssColorBack.zxy;
    u_xlat16_14.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_41.zzz * u_xlat16_14.xyz + _sssColorOcc.zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat16_15.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_89) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat0.xxx * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_22.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_22.xyz = u_xlat16_21.xyz * u_xlat16_21.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_21.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_21.xyz = vec3(u_xlat16_96) * u_xlat16_22.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_21.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_21.xyw = u_xlat16_21.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_21.xyw;
    u_xlat16_22.xyz = u_xlat16_21.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_89 = dot(u_xlat16_21.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_22.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_91 = u_xlat0.w * 0.5;
    u_xlat16_13.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot((-u_xlat16_17.xyz), u_xlat16_7.xyz);
    u_xlat16_14.x = u_xlat16_14.x + u_xlat16_14.x;
    u_xlat2.xyz = (-u_xlat16_7.xyz) * u_xlat16_14.xxx + (-u_xlat16_17.xyz);
    u_xlat16_41.y = dot(u_xlat16_20.xyz, u_xlat2.xyz);
    u_xlat16_14.xyz = u_xlat16_41.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_8.w);
    u_xlat16_97 = u_xlat16_69 + 1.0;
    u_xlat16_97 = min(u_xlat16_97, 15.0);
    u_xlat16_8.x = u_xlat16_97 * 16.0 + u_xlat16_8.z;
    u_xlat16_14.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_8.x = u_xlat16_69 * 16.0 + u_xlat16_8.z;
    u_xlat16_14.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_69 = u_xlat16_14.z * 15.0 + (-u_xlat16_69);
    u_xlat16_97 = (-u_xlat16_56) + u_xlat16_28;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_97 + u_xlat16_56;
    u_xlat16_96 = u_xlat16_96 * u_xlat16_69;
    u_xlat0.x = u_xlat0.x * u_xlat16_96;
    u_xlat16_91 = u_xlat0.x * u_xlat16_13.x + u_xlat16_91;
    u_xlat16_96 = u_xlat16_91 + u_xlat16_91;
    u_xlat16_13.x = (-u_xlat16_91) * 2.0 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_13.x + u_xlat16_96;
    u_xlat16_91 = u_xlat0.w * u_xlat16_91;
    u_xlat16_91 = min(u_xlat10_4.z, u_xlat16_91);
    u_xlat16_96 = u_xlat16_41.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_41.x);
    u_xlat11.y = u_xlat16_41.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat0.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat2.xyz);
    u_xlat0.xyz = vec3(u_xlat16_61) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_96);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xzw = vec3(u_xlat16_89) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xzw = (bool(u_xlatb0)) ? u_xlat16_5.xzw : u_xlat16_15.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_13.xyz;
    u_xlat16_5.xzw = vec3(u_xlat16_91) * u_xlat16_5.xzw;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_5.xzw * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_5.xzw = u_xlat16_5.zwx * u_xlat16_13.yzx + u_xlat16_19.yzx;
    u_xlat16_5.x = dot(u_xlat16_5.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat10_1.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat10_1.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_17.z;
    u_xlat84 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = (-u_xlat84) + 1.0;
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = max(u_xlat84, 0.00048828125);
    u_xlat84 = log2(u_xlat84);
    u_xlat84 = u_xlat84 * _Sanshe_Fw;
    u_xlat84 = exp2(u_xlat84);
    u_xlat0.w = u_xlat84 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb86 = _UseSansheMask>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_4.xy * u_xlat16_13.xx + u_xlat16_13.yy;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe2_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_13.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat2.xyz;
    u_xlat16_33.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_15.xyz = u_xlat16_33.xxx * _DirectionalDir.xyz;
    u_xlat28.x = dot(u_xlat16_15.xyz, u_xlat16_7.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.xyz = u_xlat28.xxx * _DirectionalColor.zxy;
    u_xlat28.xyz = u_xlat28.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb2 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = u_xlat16_4.z * u_xlat16_33.x + u_xlat16_33.z;
    u_xlat16_7.xyz = u_xlat28.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_12.xyz;
    u_xlat28.x = dot(u_xlat16_12.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat28.x = u_xlat28.x + -0.25;
    u_xlat28.x = u_xlat28.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat2.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat56 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat84 = u_xlat2.x * 15.0 + (-u_xlat56);
    u_xlat1.x = u_xlat56 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = vec3(u_xlat84) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat16_33.x = exp2(_PostExposure);
    u_xlat3.xyz = u_xlat2.xyz * u_xlat16_33.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat3.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = (-vec3(u_xlat56)) + u_xlat3.xyz;
    u_xlat84 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat84;
    u_xlat0.x = max(u_xlat28.x, u_xlat0.x);
    u_xlat16_33.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_33.x + _Saturation;
    u_xlat0.xyz = u_xlat16_33.xxx * u_xlat3.xyz + vec3(u_xlat56);
    u_xlat16_33.xz = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb84 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb84 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_7.x = (u_xlatb84) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_7.xx * u_xlat16_33.xz + u_xlat0.zy;
    u_xlat16_3.w = (-u_xlat0.x);
    u_xlat16_33.x = float(1.0);
    u_xlat16_33.z = float(-1.0);
    u_xlat16_1.zw = u_xlat16_7.xx * u_xlat16_33.xz + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb28.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_33.x = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_89 = u_xlat16_33.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_7.xyz = u_xlat16_33.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_33.x = min(u_xlat16_89, u_xlat16_7.y);
    u_xlat16_89 = u_xlat16_89 + (-u_xlat16_7.y);
    u_xlat16_33.x = (-u_xlat16_33.x) + u_xlat16_7.x;
    u_xlat16_35.x = u_xlat16_33.x * 6.0 + 9.99999975e-05;
    u_xlat16_89 = u_xlat16_89 / u_xlat16_35.x;
    u_xlat16_89 = u_xlat16_89 + u_xlat16_7.z;
    u_xlat16_89 = abs(u_xlat16_89) + _HueShift;
    u_xlat16_35.xyz = vec3(u_xlat16_89) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_35.xyz = fract(u_xlat16_35.xyz);
    u_xlat16_35.xyz = u_xlat16_35.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_35.xyz = abs(u_xlat16_35.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.xyz = min(max(u_xlat16_35.xyz, 0.0), 1.0);
#else
    u_xlat16_35.xyz = clamp(u_xlat16_35.xyz, 0.0, 1.0);
#endif
    u_xlat16_35.xyz = u_xlat16_35.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_89 = u_xlat16_7.x + 9.99999975e-05;
    u_xlat16_33.x = u_xlat16_33.x / u_xlat16_89;
    u_xlat16_35.xyz = u_xlat16_33.xxx * u_xlat16_35.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_35.xyz * u_xlat16_7.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_33.xxx * u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat16_33.zzz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_61;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(7) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat10_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec4 u_xlat10_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_29;
int u_xlati29;
mediump vec3 u_xlat16_30;
vec3 u_xlat31;
mediump vec2 u_xlat16_31;
mediump vec2 u_xlat10_31;
float u_xlat32;
float u_xlat50;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_53;
vec2 u_xlat56;
float u_xlat57;
float u_xlat61;
float u_xlat75;
int u_xlati75;
bool u_xlatb75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_80;
float u_xlat81;
mediump float u_xlat16_81;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
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
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat75 = (-_ShadeRange) + _DetailRange;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_4.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_4.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_77 = u_xlat16_4.x * _detailNormalMapTiling.z;
    u_xlat16_53 = u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_77) * u_xlat16_3.xy;
    u_xlat16_5.z = u_xlat16_53 * u_xlat16_1.x + 1.0;
    u_xlat4.xzw = u_xlat16_5.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_6.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat16_6 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_6.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_77 = _sweatStrength * (-u_xlat16_6.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat81 = dot(u_xlat6.xyz, u_xlat4.xzw);
    u_xlat4.xzw = u_xlat4.xzw * u_xlat6.zzz;
    u_xlat4.xzw = vec3(u_xlat81) * u_xlat6.xyz + (-u_xlat4.xzw);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat81 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat81 = max(u_xlat81, 1.17549435e-38);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat81);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat6.x = dot(u_xlat4.xzw, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat4.xzw, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat4.xzw, u_xlat8.xyz);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_3.x = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_3.xxx * u_xlat4.xzw;
    u_xlat6.x = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat31.x = u_xlat6.x + (-_ShadeRange);
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat75 = u_xlat75 * u_xlat31.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat31.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat31.x;
    u_xlat16_31.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat31.xy = (-u_xlat16_31.xy) + vec2(1.0, 1.0);
    u_xlat16_5.x = min(u_xlat75, u_xlat31.x);
    u_xlat16_5.x = u_xlat16_5.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * u_xlat16_4.y;
    u_xlat16_30.x = u_xlat16_30.x * _sweatNormalColor.w;
    u_xlat16_9.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_9.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat10_8.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_30.xyz * u_xlat16_9.xyz + (-u_xlat0.xyz);
    u_xlat16_10.xyz = u_xlat16_5.xxx * u_xlat16_10.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_30.xyz) * u_xlat16_9.xyz + u_xlat16_10.xyz;
    u_xlat16_5.xyz = u_xlat16_30.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat31.yyy * u_xlat16_10.xyz + u_xlat16_5.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_80 = u_xlat10_8.y * _metallicMultiplier;
    u_xlat16_9.xyz = vec3(u_xlat16_80) * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat31.xyz = u_xlat25.xyz * vec3(u_xlat16_80) + u_xlat16_26.xyz;
    u_xlat29 = dot(u_xlat31.xyz, u_xlat31.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat31.xyz = vec3(u_xlat29) * u_xlat31.xyz;
    u_xlat16_84 = dot(u_xlat16_26.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat16_28.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat31.x = dot(u_xlat16_28.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat56.x = (-u_xlat16_84) + 1.0;
    u_xlat16_26.x = u_xlat56.x * u_xlat56.x;
    u_xlat16_26.x = u_xlat56.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat56.x * u_xlat16_26.x;
    u_xlat81 = (-u_xlat16_26.x) * u_xlat56.x + 1.0;
    u_xlat16_26.x = u_xlat56.x * u_xlat16_26.x;
    u_xlat7.xyz = u_xlat16_9.xyz * vec3(u_xlat81);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_26.xxx + u_xlat7.xyz;
    u_xlat16_11.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.x = (-u_xlat10_8.x) + u_xlat16_11.z;
    u_xlat16_26.x = u_xlat16_1.x * u_xlat16_26.x + u_xlat10_8.x;
    u_xlat16_26.x = u_xlat16_77 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _roughnessMultiplier;
    u_xlat16_77 = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat56.x = (-u_xlat29) * u_xlat16_77 + u_xlat29;
    u_xlat56.x = u_xlat29 * u_xlat56.x + u_xlat16_77;
    u_xlat56.x = sqrt(u_xlat56.x);
    u_xlat56.x = u_xlat29 + u_xlat56.x;
    u_xlat16_10.xyz = u_xlat25.xyz * vec3(u_xlat16_80);
    u_xlat12.x = dot(u_xlat16_28.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat12.x) * u_xlat16_77 + u_xlat12.x;
    u_xlat81 = u_xlat12.x * u_xlat81 + u_xlat16_77;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat56.y = u_xlat81 + u_xlat12.x;
    u_xlat56.xy = u_xlat56.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat56.x = u_xlat56.x * u_xlat56.y;
    u_xlat31.y = float(1.0) / u_xlat56.x;
    u_xlat8.x = u_xlat16_77 + -1.0;
    u_xlat31.x = u_xlat31.x * u_xlat8.x + 1.0;
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat31.x = u_xlat16_77 / u_xlat31.x;
    u_xlat31.x = u_xlat31.x * 0.318309873;
    u_xlat31.xy = min(u_xlat31.xy, vec2(16.0, 16.0));
    u_xlat31.x = u_xlat31.y * u_xlat31.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat31.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat29) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlatb13 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_13.x = (u_xlatb13.x) ? float(1.0) : float(0.0);
    u_xlat16_13.y = (u_xlatb13.y) ? float(0.0) : float(1.0);
    u_xlat16_13.z = (u_xlatb13.z) ? float(1.0) : float(0.0);
    u_xlat16_13.w = (u_xlatb13.w) ? float(0.0) : float(1.0);
    u_xlat10_31.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat31.xy = u_xlat10_31.xy * u_xlat16_13.xz + u_xlat16_13.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.xy = min(max(u_xlat31.xy, 0.0), 1.0);
#else
    u_xlat31.xy = clamp(u_xlat31.xy, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat31.xxx * u_xlat7.xyz;
    u_xlat14.xyz = u_xlat25.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat83 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat14.xyz = vec3(u_xlat83) * u_xlat14.xyz;
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat83 = dot(u_xlat16_28.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat83 = min(max(u_xlat83, 0.0), 1.0);
#else
    u_xlat83 = clamp(u_xlat83, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat83 * u_xlat83;
    u_xlat83 = u_xlat83 * u_xlat8.x + 1.0;
    u_xlat83 = u_xlat83 * u_xlat83;
    u_xlat83 = u_xlat16_77 / u_xlat83;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat61 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat61 * u_xlat61;
    u_xlat16_84 = u_xlat61 * u_xlat16_84;
    u_xlat16_84 = u_xlat61 * u_xlat16_84;
    u_xlat86 = (-u_xlat16_84) * u_xlat61 + 1.0;
    u_xlat16_84 = u_xlat61 * u_xlat16_84;
    u_xlat14.xyz = u_xlat16_9.xyz * vec3(u_xlat86);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_84) + u_xlat14.xyz;
    u_xlat61 = (-u_xlat6.x) * u_xlat16_77 + u_xlat6.x;
    u_xlat61 = u_xlat6.x * u_xlat61 + u_xlat16_77;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat6.x + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat56.y * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat83 = u_xlat83 * u_xlat61;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat83);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_90 = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_90;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_90 = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_90);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_85;
    u_xlat16_17.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat7.xyz = u_xlat25.xyz * vec3(u_xlat16_80) + u_xlat16_16.xyz;
    u_xlat75 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat7.xyz = vec3(u_xlat75) * u_xlat7.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat16_28.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_28.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat8.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_77 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat32 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat32 * u_xlat32;
    u_xlat16_84 = u_xlat32 * u_xlat16_84;
    u_xlat16_84 = u_xlat32 * u_xlat16_84;
    u_xlat57 = (-u_xlat16_84) * u_xlat32 + 1.0;
    u_xlat16_84 = u_xlat32 * u_xlat16_84;
    u_xlat14.xyz = u_xlat16_9.xyz * vec3(u_xlat57);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_84) + u_xlat14.xyz;
    u_xlat0.x = (-u_xlat75) * u_xlat16_77 + u_xlat75;
    u_xlat0.x = u_xlat75 * u_xlat0.x + u_xlat16_77;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat75;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat56.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = u_xlat14.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat75) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_17.xyz * u_xlat7.xyz;
    u_xlat16_15.xyz = u_xlat7.xyz * u_xlat31.yyy + u_xlat16_15.xyz;
    u_xlat16_84 = (-u_xlat16_11.x) + u_xlat16_11.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_84 + u_xlat16_11.x;
    u_xlat16_84 = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_84;
    u_xlat16_84 = (-u_xlat10_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = sqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_84) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_18.xyz);
    u_xlat16_19.xyz = vec3(u_xlat29) * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat4.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat16_28.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_90 = (-u_xlat16_85) + u_xlat16_90;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_26.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_90 + u_xlat16_85;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_85;
    u_xlat16_90 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 + -1.0;
    u_xlat16_90 = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_90;
    u_xlat16_91 = sqrt(u_xlat16_85);
    u_xlat0.x = min(u_xlat16_85, 1.0);
    u_xlat16_21.xy = u_xlat31.xy * vec2(u_xlat16_91);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_84) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xzw = u_xlat16_21.xxx * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_21.yyy * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xzw + (-vec3(u_xlat29));
    u_xlat16_19.xyz = vec3(u_xlat16_84) * u_xlat16_19.xyz + vec3(u_xlat29);
    u_xlat16_19.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat31.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat6.xxx * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = vec3(u_xlat75) * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_24.xyz + (-vec3(u_xlat75));
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz + vec3(u_xlat75);
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_22.xyz + (-u_xlat6.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_84) * u_xlat16_17.xyz + u_xlat6.xxx;
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat31.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_28.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_28.xz);
    u_xlat16_16.y = u_xlat16_28.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_17.y = u_xlat16_20.y;
    u_xlat75 = dot(u_xlat16_17.xyz, u_xlat16_16.xyz);
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat6.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat6.xyz = vec3(u_xlat75) * u_xlat6.xyz + _sssColorBack.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_26.zzz * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat6.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz + u_xlat16_5.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat75 = min(u_xlat0.x, u_xlat10_8.z);
    u_xlat16_16.xyz = vec3(u_xlat75) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat75) * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat75) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat75) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat75) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(u_xlat75) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlati75 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati29 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati29].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat75 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot((-u_xlat16_10.xyz), u_xlat16_28.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat6.xyz = (-u_xlat16_28.xyz) * u_xlat16_5.xxx + (-u_xlat16_10.xyz);
    u_xlat16_26.y = dot(u_xlat16_20.xyz, u_xlat6.xyz);
    u_xlat16_5.xyz = u_xlat16_26.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_51.x = floor(u_xlat16_11.w);
    u_xlat16_76 = u_xlat16_51.x + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_11.x = u_xlat16_76 * 16.0 + u_xlat16_11.z;
    u_xlat16_5.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_11.x = u_xlat16_51.x * 16.0 + u_xlat16_11.z;
    u_xlat16_5.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_51.x = u_xlat16_5.z * 15.0 + (-u_xlat16_51.x);
    u_xlat16_76 = u_xlat16_29 + (-u_xlat16_81);
    u_xlat16_51.x = u_xlat16_51.x * u_xlat16_76 + u_xlat16_81;
    u_xlat16_51.x = u_xlat16_90 * u_xlat16_51.x;
    u_xlat75 = u_xlat75 * u_xlat16_51.x;
    u_xlat16_51.x = u_xlat0.x * 0.5;
    u_xlat16_76 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_51.x = u_xlat75 * u_xlat16_76 + u_xlat16_51.x;
    u_xlat16_76 = u_xlat16_51.x + u_xlat16_51.x;
    u_xlat16_5.x = (-u_xlat16_51.x) * 2.0 + 1.0;
    u_xlat16_51.x = u_xlat16_51.x * u_xlat16_5.x + u_xlat16_76;
    u_xlat16_51.x = u_xlat0.x * u_xlat16_51.x;
    u_xlat16_51.x = min(u_xlat16_51.x, u_xlat10_8.z);
    u_xlat16_76 = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat12.y = u_xlat16_26.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat4.xyz = u_xlat4.xzw * u_xlat16_3.xxx + (-u_xlat6.xyz);
    u_xlat4.xyz = vec3(u_xlat16_77) * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat9.y = u_xlat4.y;
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_76);
    u_xlat16_10.xyw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_10.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyw = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_10.xyw = u_xlat16_10.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_10.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_10.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_51.xxx * u_xlat16_1.xyw;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat10_7.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat10_7.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat6.x = u_xlat25.x * u_xlat16_80 + _Sanshe_X;
    u_xlat6.y = u_xlat25.y * u_xlat16_80 + _Sanshe_Y;
    u_xlat6.z = u_xlat16_10.z;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb75 = _UseSansheMask>=0.5;
#endif
    u_xlat16_51.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_51.xy = u_xlat16_7.xy * u_xlat16_51.xx + u_xlat16_51.yy;
    u_xlat6.x = u_xlat25.x * u_xlat16_80 + _Sanshe2_X;
    u_xlat6.y = u_xlat25.y * u_xlat16_80 + _Sanshe2_Y;
    u_xlat25.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat25.x = (-u_xlat25.x) + 1.0;
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat25.x = max(u_xlat25.x, 0.00048828125);
    u_xlat25.x = log2(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _Sanshe2_Fw;
    u_xlat25.x = exp2(u_xlat25.x);
    u_xlat0.y = u_xlat25.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_51.xy;
    u_xlat4.xyz = u_xlat0.yyy * _Sanshe2_color.xyz;
    u_xlat25.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat0.xxx * _Sanshe_color.xyz + u_xlat4.xyz;
    u_xlat16_51.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_51.x = inversesqrt(u_xlat16_51.x);
    u_xlat16_10.xyz = u_xlat16_51.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.xyz;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_51.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_51.x = u_xlat16_7.z * u_xlat16_51.x + u_xlat16_51.y;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat16_51.xxx + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_51.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat16_51.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat50 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat50)) + u_xlat4.xyz;
    u_xlat75 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat75;
    u_xlat0.x = max(u_xlat0.x, u_xlat25.x);
    u_xlat16_51.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_51.x = u_xlat0.x * u_xlat16_51.x + _Saturation;
    u_xlat0.xyz = u_xlat16_51.xxx * u_xlat4.xyz + vec3(u_xlat50);
    u_xlat16_51.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb75 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_77 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_3.xy = vec2(u_xlat16_77) * u_xlat16_51.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_51.x = float(1.0);
    u_xlat16_51.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_77) * u_xlat16_51.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb25 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_51.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_76 = u_xlat16_51.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_3.xyz = u_xlat16_51.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_51.x = min(u_xlat16_76, u_xlat16_3.y);
    u_xlat16_76 = u_xlat16_76 + (-u_xlat16_3.y);
    u_xlat16_51.x = (-u_xlat16_51.x) + u_xlat16_3.x;
    u_xlat16_77 = u_xlat16_51.x * 6.0 + 9.99999975e-05;
    u_xlat16_76 = u_xlat16_76 / u_xlat16_77;
    u_xlat16_76 = u_xlat16_76 + u_xlat16_3.z;
    u_xlat16_76 = abs(u_xlat16_76) + _HueShift;
    u_xlat16_28.xyz = vec3(u_xlat16_76) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_28.xyz = fract(u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_28.xyz = abs(u_xlat16_28.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_51.x = u_xlat16_51.x / u_xlat16_76;
    u_xlat16_28.xyz = u_xlat16_51.xxx * u_xlat16_28.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_28.xyz * u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_51.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_51.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_51.yyy + u_xlat16_3.xyz;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(7) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
ivec3 u_xlati6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat10_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec4 u_xlat10_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
bool u_xlatb25;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_29;
int u_xlati29;
mediump vec3 u_xlat16_30;
vec3 u_xlat31;
mediump vec2 u_xlat16_31;
mediump vec2 u_xlat10_31;
float u_xlat32;
float u_xlat50;
mediump vec2 u_xlat16_51;
mediump float u_xlat16_53;
vec2 u_xlat56;
float u_xlat57;
float u_xlat61;
float u_xlat75;
int u_xlati75;
bool u_xlatb75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_80;
float u_xlat81;
mediump float u_xlat16_81;
float u_xlat83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
float u_xlat86;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
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
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_0.xyz = texture(_ShadeDetailTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat75 = (-_ShadeRange) + _DetailRange;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_4.xy = texture(_sweatDetailMap, u_xlat16_3.xy).xy;
    u_xlat16_3.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_4.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_77 = u_xlat16_4.x * _detailNormalMapTiling.z;
    u_xlat16_53 = u_xlat16_77;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vec2(u_xlat16_77) * u_xlat16_3.xy;
    u_xlat16_5.z = u_xlat16_53 * u_xlat16_1.x + 1.0;
    u_xlat4.xzw = u_xlat16_5.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_6.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat16_6 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_1.x = dot(u_xlat16_6.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_77 = _sweatStrength * (-u_xlat16_6.w) + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat16_3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat81 = dot(u_xlat6.xyz, u_xlat4.xzw);
    u_xlat4.xzw = u_xlat4.xzw * u_xlat6.zzz;
    u_xlat4.xzw = vec3(u_xlat81) * u_xlat6.xyz + (-u_xlat4.xzw);
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat81 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat81 = max(u_xlat81, 1.17549435e-38);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat81);
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat8.x;
    u_xlat6.x = u_xlat7.z;
    u_xlat6.x = dot(u_xlat4.xzw, u_xlat6.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat4.xzw, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat4.xzw, u_xlat8.xyz);
    u_xlat4.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz;
    u_xlat16_3.x = dot(u_xlat4.xzw, u_xlat4.xzw);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_28.xyz = u_xlat16_3.xxx * u_xlat4.xzw;
    u_xlat6.x = dot(u_xlat16_28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat31.x = u_xlat6.x + (-_ShadeRange);
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat75 = u_xlat75 * u_xlat31.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat31.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat31.x;
    u_xlat16_31.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat31.xy = (-u_xlat16_31.xy) + vec2(1.0, 1.0);
    u_xlat16_5.x = min(u_xlat75, u_xlat31.x);
    u_xlat16_5.x = u_xlat16_5.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * u_xlat16_4.y;
    u_xlat16_30.x = u_xlat16_30.x * _sweatNormalColor.w;
    u_xlat16_9.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30.xyz = u_xlat16_30.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_7 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_9.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_8 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_9.xyz = u_xlat10_8.www * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_30.xyz * u_xlat16_9.xyz + (-u_xlat0.xyz);
    u_xlat16_10.xyz = u_xlat16_5.xxx * u_xlat16_10.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_30.xyz) * u_xlat16_9.xyz + u_xlat16_10.xyz;
    u_xlat16_5.xyz = u_xlat16_30.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat31.yyy * u_xlat16_10.xyz + u_xlat16_5.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_80 = u_xlat10_8.y * _metallicMultiplier;
    u_xlat16_9.xyz = vec3(u_xlat16_80) * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_9.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_80 = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat31.xyz = u_xlat25.xyz * vec3(u_xlat16_80) + u_xlat16_26.xyz;
    u_xlat29 = dot(u_xlat31.xyz, u_xlat31.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat31.xyz = vec3(u_xlat29) * u_xlat31.xyz;
    u_xlat16_84 = dot(u_xlat16_26.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat29 = dot(u_xlat16_28.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat31.x = dot(u_xlat16_28.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat56.x = (-u_xlat16_84) + 1.0;
    u_xlat16_26.x = u_xlat56.x * u_xlat56.x;
    u_xlat16_26.x = u_xlat56.x * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat56.x * u_xlat16_26.x;
    u_xlat81 = (-u_xlat16_26.x) * u_xlat56.x + 1.0;
    u_xlat16_26.x = u_xlat56.x * u_xlat16_26.x;
    u_xlat7.xyz = u_xlat16_9.xyz * vec3(u_xlat81);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_26.xxx + u_xlat7.xyz;
    u_xlat16_11.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_26.x = (-u_xlat10_8.x) + u_xlat16_11.z;
    u_xlat16_26.x = u_xlat16_1.x * u_xlat16_26.x + u_xlat10_8.x;
    u_xlat16_26.x = u_xlat16_77 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * _roughnessMultiplier;
    u_xlat16_77 = u_xlat16_26.x * u_xlat16_26.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat56.x = (-u_xlat29) * u_xlat16_77 + u_xlat29;
    u_xlat56.x = u_xlat29 * u_xlat56.x + u_xlat16_77;
    u_xlat56.x = sqrt(u_xlat56.x);
    u_xlat56.x = u_xlat29 + u_xlat56.x;
    u_xlat16_10.xyz = u_xlat25.xyz * vec3(u_xlat16_80);
    u_xlat12.x = dot(u_xlat16_28.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat12.x) * u_xlat16_77 + u_xlat12.x;
    u_xlat81 = u_xlat12.x * u_xlat81 + u_xlat16_77;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat56.y = u_xlat81 + u_xlat12.x;
    u_xlat56.xy = u_xlat56.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat56.x = u_xlat56.x * u_xlat56.y;
    u_xlat31.y = float(1.0) / u_xlat56.x;
    u_xlat8.x = u_xlat16_77 + -1.0;
    u_xlat31.x = u_xlat31.x * u_xlat8.x + 1.0;
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat31.x = u_xlat16_77 / u_xlat31.x;
    u_xlat31.x = u_xlat31.x * 0.318309873;
    u_xlat31.xy = min(u_xlat31.xy, vec2(16.0, 16.0));
    u_xlat31.x = u_xlat31.y * u_xlat31.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat31.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat29) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz;
    u_xlatb13 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_13.x = (u_xlatb13.x) ? float(1.0) : float(0.0);
    u_xlat16_13.y = (u_xlatb13.y) ? float(0.0) : float(1.0);
    u_xlat16_13.z = (u_xlatb13.z) ? float(1.0) : float(0.0);
    u_xlat16_13.w = (u_xlatb13.w) ? float(0.0) : float(1.0);
    u_xlat10_31.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat31.xy = u_xlat10_31.xy * u_xlat16_13.xz + u_xlat16_13.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat31.xy = min(max(u_xlat31.xy, 0.0), 1.0);
#else
    u_xlat31.xy = clamp(u_xlat31.xy, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat31.xxx * u_xlat7.xyz;
    u_xlat14.xyz = u_xlat25.xyz * vec3(u_xlat16_80) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat83 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat83 = inversesqrt(u_xlat83);
    u_xlat14.xyz = vec3(u_xlat83) * u_xlat14.xyz;
    u_xlat16_84 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat83 = dot(u_xlat16_28.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat83 = min(max(u_xlat83, 0.0), 1.0);
#else
    u_xlat83 = clamp(u_xlat83, 0.0, 1.0);
#endif
    u_xlat83 = u_xlat83 * u_xlat83;
    u_xlat83 = u_xlat83 * u_xlat8.x + 1.0;
    u_xlat83 = u_xlat83 * u_xlat83;
    u_xlat83 = u_xlat16_77 / u_xlat83;
    u_xlat83 = u_xlat83 * 0.318309873;
    u_xlat83 = min(u_xlat83, 16.0);
    u_xlat61 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat61 * u_xlat61;
    u_xlat16_84 = u_xlat61 * u_xlat16_84;
    u_xlat16_84 = u_xlat61 * u_xlat16_84;
    u_xlat86 = (-u_xlat16_84) * u_xlat61 + 1.0;
    u_xlat16_84 = u_xlat61 * u_xlat16_84;
    u_xlat14.xyz = u_xlat16_9.xyz * vec3(u_xlat86);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_84) + u_xlat14.xyz;
    u_xlat61 = (-u_xlat6.x) * u_xlat16_77 + u_xlat6.x;
    u_xlat61 = u_xlat6.x * u_xlat61 + u_xlat16_77;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat6.x + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat56.y * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat83 = u_xlat83 * u_xlat61;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat83);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat6.xxx * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat7.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_84 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_84 = max(u_xlat16_84, 6.10351563e-05);
    u_xlat16_85 = u_xlat16_84 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_90 = float(1.0) / float(u_xlat16_84);
    u_xlat16_84 = inversesqrt(u_xlat16_84);
    u_xlat16_16.xyz = u_xlat7.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = u_xlat16_85 * u_xlat16_90;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat16_17.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb7 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_90 = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_85 = max(u_xlat16_85, u_xlat16_90);
    u_xlat16_84 = u_xlat16_84 * u_xlat16_85;
    u_xlat16_17.xyz = vec3(u_xlat16_84) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat7.xyz = u_xlat25.xyz * vec3(u_xlat16_80) + u_xlat16_16.xyz;
    u_xlat75 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat7.xyz = vec3(u_xlat75) * u_xlat7.xyz;
    u_xlat16_84 = dot(u_xlat16_16.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_84 = min(max(u_xlat16_84, 0.0), 1.0);
#else
    u_xlat16_84 = clamp(u_xlat16_84, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat16_28.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_28.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat8.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat16_77 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.318309873;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat32 = (-u_xlat16_84) + 1.0;
    u_xlat16_84 = u_xlat32 * u_xlat32;
    u_xlat16_84 = u_xlat32 * u_xlat16_84;
    u_xlat16_84 = u_xlat32 * u_xlat16_84;
    u_xlat57 = (-u_xlat16_84) * u_xlat32 + 1.0;
    u_xlat16_84 = u_xlat32 * u_xlat16_84;
    u_xlat14.xyz = u_xlat16_9.xyz * vec3(u_xlat57);
    u_xlat14.xyz = u_xlat0.xxx * vec3(u_xlat16_84) + u_xlat14.xyz;
    u_xlat0.x = (-u_xlat75) * u_xlat16_77 + u_xlat75;
    u_xlat0.x = u_xlat75 * u_xlat0.x + u_xlat16_77;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat75;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat56.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = u_xlat14.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat75) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_17.xyz * u_xlat7.xyz;
    u_xlat16_15.xyz = u_xlat7.xyz * u_xlat31.yyy + u_xlat16_15.xyz;
    u_xlat16_84 = (-u_xlat16_11.x) + u_xlat16_11.y;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_84 + u_xlat16_11.x;
    u_xlat16_84 = _sssIntensity * _sssIntensity;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_84;
    u_xlat16_84 = (-u_xlat10_8.y) * _metallicMultiplier + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_84;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_84);
    u_xlat16_84 = sqrt(u_xlat16_1.x);
    u_xlat16_16.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = vec3(u_xlat16_84) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz + (-u_xlat16_18.xyz);
    u_xlat16_19.xyz = vec3(u_xlat29) * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = (-u_xlat4.xzw) * u_xlat16_3.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat16_28.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_85 = inversesqrt(u_xlat16_85);
    u_xlat16_20.xyz = vec3(u_xlat16_85) * u_xlat16_20.xyz;
    u_xlat16_85 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_85 * 0.5 + 0.5;
    u_xlat16_90 = (-u_xlat16_85) + u_xlat16_90;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_26.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_90 + u_xlat16_85;
    u_xlat16_85 = u_xlat16_26.z * u_xlat16_85;
    u_xlat16_90 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16_90 = u_xlat16_90 + -1.0;
    u_xlat16_90 = _occlusionScale * u_xlat16_90 + 1.0;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_90;
    u_xlat16_91 = sqrt(u_xlat16_85);
    u_xlat0.x = min(u_xlat16_85, 1.0);
    u_xlat16_21.xy = u_xlat31.xy * vec2(u_xlat16_91);
    u_xlat16_22.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_84) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_22.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xzw = u_xlat16_21.xxx * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_24.xyz = u_xlat16_21.yyy * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat16_22.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_21.xzw + (-vec3(u_xlat29));
    u_xlat16_19.xyz = vec3(u_xlat16_84) * u_xlat16_19.xyz + vec3(u_xlat29);
    u_xlat16_19.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat31.xxx * u_xlat16_2.xyz;
    u_xlat16_19.xyz = u_xlat6.xxx * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = vec3(u_xlat75) * u_xlat16_16.xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_24.xyz + (-vec3(u_xlat75));
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat16_16.xyz + vec3(u_xlat75);
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_22.xyz + (-u_xlat6.xxx);
    u_xlat16_17.xyz = vec3(u_xlat16_84) * u_xlat16_17.xyz + u_xlat6.xxx;
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat31.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_28.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_28.xz);
    u_xlat16_16.y = u_xlat16_28.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_17.y = u_xlat16_20.y;
    u_xlat75 = dot(u_xlat16_17.xyz, u_xlat16_16.xyz);
    u_xlat75 = max(u_xlat75, 0.0);
    u_xlat6.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat6.xyz = vec3(u_xlat75) * u_xlat6.xyz + _sssColorBack.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_26.zzz * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat6.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_16.xyz + u_xlat16_5.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat75 = min(u_xlat0.x, u_xlat10_8.z);
    u_xlat16_16.xyz = vec3(u_xlat75) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat75) * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat75) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat75) * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat75) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(u_xlat75) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_90) * u_xlat16_18.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlati75 = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati29 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati29].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_1.x = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat75 = dot(u_xlat16_20.xyz, u_xlat16_28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot((-u_xlat16_10.xyz), u_xlat16_28.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat6.xyz = (-u_xlat16_28.xyz) * u_xlat16_5.xxx + (-u_xlat16_10.xyz);
    u_xlat16_26.y = dot(u_xlat16_20.xyz, u_xlat6.xyz);
    u_xlat16_5.xyz = u_xlat16_26.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_51.x = floor(u_xlat16_11.w);
    u_xlat16_76 = u_xlat16_51.x + 1.0;
    u_xlat16_76 = min(u_xlat16_76, 15.0);
    u_xlat16_11.x = u_xlat16_76 * 16.0 + u_xlat16_11.z;
    u_xlat16_5.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_11.x = u_xlat16_51.x * 16.0 + u_xlat16_11.z;
    u_xlat16_5.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_81 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_51.x = u_xlat16_5.z * 15.0 + (-u_xlat16_51.x);
    u_xlat16_76 = u_xlat16_29 + (-u_xlat16_81);
    u_xlat16_51.x = u_xlat16_51.x * u_xlat16_76 + u_xlat16_81;
    u_xlat16_51.x = u_xlat16_90 * u_xlat16_51.x;
    u_xlat75 = u_xlat75 * u_xlat16_51.x;
    u_xlat16_51.x = u_xlat0.x * 0.5;
    u_xlat16_76 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_51.x = u_xlat75 * u_xlat16_76 + u_xlat16_51.x;
    u_xlat16_76 = u_xlat16_51.x + u_xlat16_51.x;
    u_xlat16_5.x = (-u_xlat16_51.x) * 2.0 + 1.0;
    u_xlat16_51.x = u_xlat16_51.x * u_xlat16_5.x + u_xlat16_76;
    u_xlat16_51.x = u_xlat0.x * u_xlat16_51.x;
    u_xlat16_51.x = min(u_xlat16_51.x, u_xlat10_8.z);
    u_xlat16_76 = u_xlat16_26.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_26.x);
    u_xlat12.y = u_xlat16_26.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat4.xyz = u_xlat4.xzw * u_xlat16_3.xxx + (-u_xlat6.xyz);
    u_xlat4.xyz = vec3(u_xlat16_77) * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat9.y = u_xlat4.y;
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_76);
    u_xlat16_10.xyw = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_10.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyw = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_10.xyw = u_xlat16_10.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_1.xyw = u_xlat16_1.xxx * u_xlat16_10.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_1.xyw = (bool(u_xlatb0)) ? u_xlat16_1.xyw : u_xlat16_10.xyw;
    u_xlat16_1.xyw = u_xlat16_1.xyw * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_51.xxx * u_xlat16_1.xyw;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_15.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat10_7.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_26.x = u_xlat10_7.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_28.xyz, u_xlat16_28.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat6.x = u_xlat25.x * u_xlat16_80 + _Sanshe_X;
    u_xlat6.y = u_xlat25.y * u_xlat16_80 + _Sanshe_Y;
    u_xlat6.z = u_xlat16_10.z;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb75 = _UseSansheMask>=0.5;
#endif
    u_xlat16_51.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_7.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_51.xy = u_xlat16_7.xy * u_xlat16_51.xx + u_xlat16_51.yy;
    u_xlat6.x = u_xlat25.x * u_xlat16_80 + _Sanshe2_X;
    u_xlat6.y = u_xlat25.y * u_xlat16_80 + _Sanshe2_Y;
    u_xlat25.x = dot(u_xlat4.xyz, u_xlat6.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat25.x = (-u_xlat25.x) + 1.0;
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat25.x = max(u_xlat25.x, 0.00048828125);
    u_xlat25.x = log2(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _Sanshe2_Fw;
    u_xlat25.x = exp2(u_xlat25.x);
    u_xlat0.y = u_xlat25.x * _Sanshe2_Power;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_51.xy;
    u_xlat4.xyz = u_xlat0.yyy * _Sanshe2_color.xyz;
    u_xlat25.x = u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat0.xxx * _Sanshe_color.xyz + u_xlat4.xyz;
    u_xlat16_51.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_51.x = inversesqrt(u_xlat16_51.x);
    u_xlat16_10.xyz = u_xlat16_51.xxx * _DirectionalDir.xyz;
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat16_28.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xzw = u_xlat0.xxx * _DirectionalColor.xyz;
    u_xlat0.xzw = u_xlat0.xzw * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_51.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_51.x = u_xlat16_7.z * u_xlat16_51.x + u_xlat16_51.y;
    u_xlat16_3.xyz = u_xlat0.xzw * u_xlat16_51.xxx + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat0.x = u_xlat0.x + -0.25;
    u_xlat0.x = u_xlat0.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_51.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat16_51.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat50 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat50)) + u_xlat4.xyz;
    u_xlat75 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat75;
    u_xlat0.x = max(u_xlat0.x, u_xlat25.x);
    u_xlat16_51.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_51.x = u_xlat0.x * u_xlat16_51.x + _Saturation;
    u_xlat0.xyz = u_xlat16_51.xxx * u_xlat4.xyz + vec3(u_xlat50);
    u_xlat16_51.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb75 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_77 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_3.xy = vec2(u_xlat16_77) * u_xlat16_51.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_51.x = float(1.0);
    u_xlat16_51.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_77) * u_xlat16_51.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb25 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_51.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_76 = u_xlat16_51.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_3.xyz = u_xlat16_51.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_51.x = min(u_xlat16_76, u_xlat16_3.y);
    u_xlat16_76 = u_xlat16_76 + (-u_xlat16_3.y);
    u_xlat16_51.x = (-u_xlat16_51.x) + u_xlat16_3.x;
    u_xlat16_77 = u_xlat16_51.x * 6.0 + 9.99999975e-05;
    u_xlat16_76 = u_xlat16_76 / u_xlat16_77;
    u_xlat16_76 = u_xlat16_76 + u_xlat16_3.z;
    u_xlat16_76 = abs(u_xlat16_76) + _HueShift;
    u_xlat16_28.xyz = vec3(u_xlat16_76) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_28.xyz = fract(u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_28.xyz = abs(u_xlat16_28.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_51.x = u_xlat16_51.x / u_xlat16_76;
    u_xlat16_28.xyz = u_xlat16_51.xxx * u_xlat16_28.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_28.xyz * u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_51.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_51.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_51.yyy + u_xlat16_3.xyz;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
mediump vec3 u_xlat10_28;
int u_xlati28;
bvec3 u_xlatb28;
float u_xlat30;
mediump vec3 u_xlat16_33;
float u_xlat34;
mediump vec3 u_xlat16_41;
float u_xlat56;
mediump float u_xlat16_56;
vec2 u_xlat58;
mediump vec2 u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_61;
float u_xlat66;
mediump float u_xlat16_69;
float u_xlat84;
bool u_xlatb84;
float u_xlat86;
bool u_xlatb86;
float u_xlat87;
float u_xlat88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
float u_xlat93;
bool u_xlatb93;
mediump float u_xlat16_96;
mediump float u_xlat16_97;
mediump float u_xlat16_98;
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
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb93 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb93 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (bool(u_xlatb93)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat9.yyyy;
    u_xlat2 = u_xlat2 * u_xlat9.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat9.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat30 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat30 = (-u_xlat2.x) + u_xlat30;
    u_xlat0.z = _ShadowBias.y * u_xlat30 + u_xlat2.x;
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
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb28.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb28.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb28.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb28.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb28.y) ? float(0.0) : float(1.0);
    u_xlat16_33.xy = (u_xlatb28.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xy = u_xlat10_28.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat28.x = u_xlat10_28.z * u_xlat16_33.x + u_xlat16_33.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_12.x * _shadowStrength;
    u_xlat56 = u_xlat16_12.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_33.x = max(u_xlat16_33.x, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33.x);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = max(u_xlat16_33.x, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_33.x;
    u_xlat16_14.xyz = u_xlat16_33.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_33.x = u_xlat16_33.x * _sweatNormalColor.w;
    u_xlat16_15.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_33.xxx * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat10_1.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat10_1.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat2.x = (-_ShadeRange) + _DetailRange;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat30 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat58.x = u_xlat30 + (-_ShadeRange);
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat58.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
    u_xlat16_58.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat58.xy = (-u_xlat16_58.xy) + vec2(1.0, 1.0);
    u_xlat16_33.x = min(u_xlat58.x, u_xlat2.x);
    u_xlat16_33.x = u_xlat16_33.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat2.xz = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xz = u_xlat2.xz * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_3.xyz = texture(_ShadeDetailTex, u_xlat2.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_4.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat3.xyz);
    u_xlat16_17.xyz = u_xlat16_33.xxx * u_xlat16_17.xyz + u_xlat3.xyz;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat58.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_33.x = u_xlat10_4.y * _metallicMultiplier;
    u_xlat16_16.xyz = u_xlat16_33.xxx * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.x = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_33.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat58.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58.x = inversesqrt(u_xlat58.x);
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat16_61 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat87 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat87;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat34 = (-u_xlat16_61) * u_xlat87 + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat9.xyz = u_xlat16_16.xyz * vec3(u_xlat34);
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_61) + u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_61 = (-u_xlat10_4.x) + u_xlat16_10.z;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat10_4.x;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat16_41.x = u_xlat16_61 * _roughnessMultiplier;
    u_xlat16_61 = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat87 = (-u_xlat58.x) * u_xlat16_61 + u_xlat58.x;
    u_xlat87 = u_xlat58.x * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat58.x + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat16_33.xxx;
    u_xlat11.x = dot(u_xlat16_7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat34 = (-u_xlat11.x) * u_xlat16_61 + u_xlat11.x;
    u_xlat34 = u_xlat11.x * u_xlat34 + u_xlat16_61;
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 + u_xlat11.x;
    u_xlat34 = u_xlat34 + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat34;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat93 = u_xlat16_61 + -1.0;
    u_xlat86 = u_xlat86 * u_xlat93 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat86 = u_xlat87 * u_xlat86;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat18.xyz = u_xlat3.xyz * u_xlat16_33.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat86 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat18.xyz = vec3(u_xlat86) * u_xlat18.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat93 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat66 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat18.xyz = u_xlat16_16.xyz * vec3(u_xlat66);
    u_xlat18.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat18.xyz;
    u_xlat87 = (-u_xlat30) * u_xlat16_61 + u_xlat30;
    u_xlat87 = u_xlat30 * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat30 + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat34;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat86 = u_xlat86 * u_xlat87;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat30) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat18.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat9.xyz;
    u_xlat16_91 = u_xlat16_96 * u_xlat16_13.x;
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb86 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_21.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_91 = max(u_xlat16_91, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb86 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb86) ? 1.0 : 0.0;
    u_xlat16_96 = max(u_xlat16_96, u_xlat16_13.x);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_21.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_20.xyz;
    u_xlat86 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat93 + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_61 / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat9.x = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat9.xyz = u_xlat16_16.xyz * u_xlat9.xxx;
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat9.xyz;
    u_xlat2.x = (-u_xlat86) * u_xlat16_61 + u_xlat86;
    u_xlat2.x = u_xlat86 * u_xlat2.x + u_xlat16_61;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat86;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat34;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat59;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_21.xyz * u_xlat9.xyz;
    u_xlat16_19.xyz = u_xlat9.xyz * u_xlat28.xxx + u_xlat16_19.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_91 * 0.5 + 0.5;
    u_xlat16_96 = (-u_xlat16_91) + u_xlat16_96;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_96 + u_xlat16_91;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_13.x = sqrt(u_xlat16_91);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_91));
    u_xlat16_22.xyz = u_xlat16_12.xyz * u_xlat16_13.xxx;
    u_xlat16_91 = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91 + u_xlat16_10.x;
    u_xlat16_91 = _sssIntensity * _sssIntensity;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_91 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = sqrt(u_xlat16_89);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_91) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_91) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat30) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xyz = u_xlat16_27.xyz * u_xlat16_22.xyz + (-vec3(u_xlat30));
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(u_xlat30);
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xyz * u_xlat16_22.xyz;
    u_xlat16_27.xyz = u_xlat58.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_98 = u_xlat56 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat28.x * u_xlat16_13.x;
    u_xlat16_26.xyz = u_xlat16_13.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_98) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_27.xyz * u_xlat16_23.xyz + (-u_xlat58.xxx);
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat58.xxx;
    u_xlat16_23.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat56) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_22.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-vec3(u_xlat86));
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(u_xlat86);
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat28.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_19.xyz + u_xlat16_14.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_21.y = u_xlat16_7.y;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_22.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_22.xyz, u_xlat16_21.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat2.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat2.xyz = u_xlat28.xxx * u_xlat2.xyz + _sssColorBack.xyz;
    u_xlat16_21.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_41.zzz * u_xlat16_21.xyz + _sssColorOcc.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat2.xyz * u_xlat16_15.xyz + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_96) * u_xlat16_23.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_89 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_14.xyz;
    u_xlat16_91 = u_xlat0.w * 0.5;
    u_xlat16_13.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_98 = dot((-u_xlat16_17.xyz), u_xlat16_7.xyz);
    u_xlat16_98 = u_xlat16_98 + u_xlat16_98;
    u_xlat2.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_98) + (-u_xlat16_17.xyz);
    u_xlat16_41.y = dot(u_xlat16_20.xyz, u_xlat2.xyz);
    u_xlat16_15.xyz = u_xlat16_41.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_8.w);
    u_xlat16_97 = u_xlat16_69 + 1.0;
    u_xlat16_97 = min(u_xlat16_97, 15.0);
    u_xlat16_8.x = u_xlat16_97 * 16.0 + u_xlat16_8.z;
    u_xlat16_15.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_8.x = u_xlat16_69 * 16.0 + u_xlat16_8.z;
    u_xlat16_15.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_69 = u_xlat16_15.z * 15.0 + (-u_xlat16_69);
    u_xlat16_97 = (-u_xlat16_56) + u_xlat16_28;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_97 + u_xlat16_56;
    u_xlat16_69 = u_xlat16_96 * u_xlat16_69;
    u_xlat0.x = u_xlat0.x * u_xlat16_69;
    u_xlat16_91 = u_xlat0.x * u_xlat16_13.x + u_xlat16_91;
    u_xlat16_13.x = u_xlat16_91 + u_xlat16_91;
    u_xlat16_69 = (-u_xlat16_91) * 2.0 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_69 + u_xlat16_13.x;
    u_xlat16_91 = u_xlat0.w * u_xlat16_91;
    u_xlat16_91 = min(u_xlat10_4.z, u_xlat16_91);
    u_xlat16_13.x = u_xlat16_41.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_41.x);
    u_xlat11.y = u_xlat16_41.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_41.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat0.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat2.xyz);
    u_xlat0.xyz = vec3(u_xlat16_61) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_13.x);
    u_xlat16_16.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xzw = vec3(u_xlat16_89) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xzw = (bool(u_xlatb0)) ? u_xlat16_5.xzw : u_xlat16_16.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_41.xyz;
    u_xlat16_5.xzw = vec3(u_xlat16_91) * u_xlat16_5.xzw;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_5.xzw * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_13.xyz + u_xlat16_19.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat10_1.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat10_1.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_17.z;
    u_xlat84 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = (-u_xlat84) + 1.0;
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = max(u_xlat84, 0.00048828125);
    u_xlat84 = log2(u_xlat84);
    u_xlat84 = u_xlat84 * _Sanshe_Fw;
    u_xlat84 = exp2(u_xlat84);
    u_xlat0.w = u_xlat84 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb86 = _UseSansheMask>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_6.xy * u_xlat16_13.xx + u_xlat16_13.yy;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe2_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_13.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_33.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_16.xyz = u_xlat16_33.xxx * _DirectionalDir.xyz;
    u_xlat28.x = dot(u_xlat16_16.xyz, u_xlat16_7.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.xyz = u_xlat28.xxx * _DirectionalColor.xyz;
    u_xlat28.xyz = u_xlat28.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb2 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = u_xlat16_6.z * u_xlat16_33.x + u_xlat16_33.z;
    u_xlat16_7.xyz = u_xlat28.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat28.x = dot(u_xlat16_14.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat28.x = u_xlat28.x + -0.25;
    u_xlat28.x = u_xlat28.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_13.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_33.x = exp2(_PostExposure);
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat16_33.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat56)) + u_xlat2.xyz;
    u_xlat84 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat84;
    u_xlat0.x = max(u_xlat28.x, u_xlat0.x);
    u_xlat16_33.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_33.x + _Saturation;
    u_xlat0.xyz = u_xlat16_33.xxx * u_xlat2.xyz + vec3(u_xlat56);
    u_xlat16_33.xz = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb84 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb84 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_91 = (u_xlatb84) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_91) * u_xlat16_33.xz + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_33.x = float(1.0);
    u_xlat16_33.z = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_91) * u_xlat16_33.xz + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb28.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_33.x = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_89 = u_xlat16_33.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_13.xyz = u_xlat16_33.xxx * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_33.x = min(u_xlat16_89, u_xlat16_13.y);
    u_xlat16_89 = u_xlat16_89 + (-u_xlat16_13.y);
    u_xlat16_33.x = (-u_xlat16_33.x) + u_xlat16_13.x;
    u_xlat16_91 = u_xlat16_33.x * 6.0 + 9.99999975e-05;
    u_xlat16_89 = u_xlat16_89 / u_xlat16_91;
    u_xlat16_89 = u_xlat16_89 + u_xlat16_13.z;
    u_xlat16_89 = abs(u_xlat16_89) + _HueShift;
    u_xlat16_41.xyz = vec3(u_xlat16_89) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_41.xyz = fract(u_xlat16_41.xyz);
    u_xlat16_41.xyz = u_xlat16_41.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_41.xyz = abs(u_xlat16_41.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.xyz = min(max(u_xlat16_41.xyz, 0.0), 1.0);
#else
    u_xlat16_41.xyz = clamp(u_xlat16_41.xyz, 0.0, 1.0);
#endif
    u_xlat16_41.xyz = u_xlat16_41.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_89 = u_xlat16_13.x + 9.99999975e-05;
    u_xlat16_33.x = u_xlat16_33.x / u_xlat16_89;
    u_xlat16_41.xyz = u_xlat16_33.xxx * u_xlat16_41.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_41.xyz * u_xlat16_13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_33.xxx * u_xlat16_13.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_33.zzz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_61;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump vec4 _sweatNormalColor;
uniform 	mediump vec4 _detailNormalMapTiling;
uniform 	mediump float _sweatNormalStrengthA;
uniform 	mediump float _sweatNormalStrengthB;
uniform 	mediump float _sweatNormalStrengthC;
uniform 	mediump float _sweatStrength;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _ShadeDetailTex_ST;
uniform 	mediump float _DetailRange;
uniform 	mediump float _ShadeRange;
uniform 	mediump float _ShadeDetail;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _sweatNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _sweatMaskMap;
UNITY_LOCATION(11) uniform mediump sampler2D _sweatDetailMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec4 u_xlat16_21;
mediump vec4 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump float u_xlat16_28;
mediump vec3 u_xlat10_28;
int u_xlati28;
bvec3 u_xlatb28;
float u_xlat30;
mediump vec3 u_xlat16_33;
float u_xlat34;
mediump vec3 u_xlat16_41;
float u_xlat56;
mediump float u_xlat16_56;
vec2 u_xlat58;
mediump vec2 u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_61;
float u_xlat66;
mediump float u_xlat16_69;
float u_xlat84;
bool u_xlatb84;
float u_xlat86;
bool u_xlatb86;
float u_xlat87;
float u_xlat88;
mediump float u_xlat16_89;
mediump float u_xlat16_91;
float u_xlat93;
bool u_xlatb93;
mediump float u_xlat16_96;
mediump float u_xlat16_97;
mediump float u_xlat16_98;
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
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat88 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat4.xyz = vec3(u_xlat88) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _detailNormalMapTiling.xy;
    u_xlat16_6.xy = texture(_sweatDetailMap, u_xlat16_5.xy).xy;
    u_xlat16_5.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_61 = dot(u_xlat16_5.xy, u_xlat16_5.xy);
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = sqrt(u_xlat16_61);
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_6.xy = texture(_sweatDetailMap, vs_TEXCOORD3.xy).zw;
    u_xlat16_89 = u_xlat16_6.x * _detailNormalMapTiling.z;
    u_xlat16_7.x = u_xlat16_89;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.xy = vec2(u_xlat16_89) * u_xlat16_5.xy;
    u_xlat16_8.z = u_xlat16_7.x * u_xlat16_61 + 1.0;
    u_xlat6.xzw = u_xlat16_8.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat16_9.xyz = texture(_sweatNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_8 = texture(_sweatMaskMap, vs_TEXCOORD3.xy);
    u_xlat16_89 = dot(u_xlat16_8.xyz, vec3(_sweatNormalStrengthA, _sweatNormalStrengthB, _sweatNormalStrengthC));
    u_xlat16_91 = _sweatStrength * (-u_xlat16_8.w) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_89) * u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat6.xzw);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat9.zzz;
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz + (-u_xlat6.xzw);
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat88 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat10.xyz = vec3(u_xlat88) * u_xlat16_5.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat11.x;
    u_xlat9.x = u_xlat10.z;
    u_xlat9.x = dot(u_xlat6.xzw, u_xlat9.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat6.xzw, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat6.xzw, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat88 = max(u_xlat88, 1.17549435e-38);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat6.xzw = vec3(u_xlat88) * u_xlat9.xyz;
    u_xlat16_5.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat6.xzw;
    u_xlat4.x = dot(u_xlat16_7.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat16_7.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb93 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb93 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (bool(u_xlatb93)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat9.yyyy;
    u_xlat2 = u_xlat2 * u_xlat9.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat9.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat30 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat30 = (-u_xlat2.x) + u_xlat30;
    u_xlat0.z = _ShadowBias.y * u_xlat30 + u_xlat2.x;
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
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat28.x = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat28.x + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb28.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb28.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb28.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb28.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb28.y) ? float(0.0) : float(1.0);
    u_xlat16_33.xy = (u_xlatb28.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_28.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xy = u_xlat10_28.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat28.x = u_xlat10_28.z * u_xlat16_33.x + u_xlat16_33.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_12.x * _shadowStrength;
    u_xlat56 = u_xlat16_12.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_33.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat0.xxx * u_xlat16_12.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_33.x = max(u_xlat16_33.x, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_33.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_96 = float(1.0) / float(u_xlat16_33.x);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_96;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_14.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = max(u_xlat16_33.x, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_96 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_96);
    u_xlat16_33.x = u_xlat16_61 * u_xlat16_33.x;
    u_xlat16_14.xyz = u_xlat16_33.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_33.x = u_xlat16_89 * u_xlat16_6.y;
    u_xlat16_33.x = u_xlat16_33.x * _sweatNormalColor.w;
    u_xlat16_15.xyz = _sweatNormalColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = u_xlat16_33.xxx * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat10_1.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat10_1.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat2.x = (-_ShadeRange) + _DetailRange;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat30 = dot(u_xlat16_7.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat30 = max(u_xlat30, 0.0);
    u_xlat58.x = u_xlat30 + (-_ShadeRange);
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat58.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat58.x;
    u_xlat16_58.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat58.xy = (-u_xlat16_58.xy) + vec2(1.0, 1.0);
    u_xlat16_33.x = min(u_xlat58.x, u_xlat2.x);
    u_xlat16_33.x = u_xlat16_33.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat2.xz = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xz = u_xlat2.xz * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_3.xyz = texture(_ShadeDetailTex, u_xlat2.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_16.xyz = u_xlat10_4.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + (-u_xlat3.xyz);
    u_xlat16_17.xyz = u_xlat16_33.xxx * u_xlat16_17.xyz + u_xlat3.xyz;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) * u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat58.yyy * u_xlat16_17.xyz + u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_33.x = u_xlat10_4.y * _metallicMultiplier;
    u_xlat16_16.xyz = u_xlat16_33.xxx * u_xlat16_16.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.x = u_xlat16_16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_33.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat58.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58.x = inversesqrt(u_xlat58.x);
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat16_61 = dot(u_xlat16_13.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat58.x = dot(u_xlat16_7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58.x = min(max(u_xlat58.x, 0.0), 1.0);
#else
    u_xlat58.x = clamp(u_xlat58.x, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat87 = (-u_xlat16_61) + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat87;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat34 = (-u_xlat16_61) * u_xlat87 + 1.0;
    u_xlat16_61 = u_xlat87 * u_xlat16_61;
    u_xlat9.xyz = u_xlat16_16.xyz * vec3(u_xlat34);
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_61) + u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_skinMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_61 = (-u_xlat10_4.x) + u_xlat16_10.z;
    u_xlat16_61 = u_xlat16_89 * u_xlat16_61 + u_xlat10_4.x;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat16_41.x = u_xlat16_61 * _roughnessMultiplier;
    u_xlat16_61 = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat87 = (-u_xlat58.x) * u_xlat16_61 + u_xlat58.x;
    u_xlat87 = u_xlat58.x * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat58.x + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat16_33.xxx;
    u_xlat11.x = dot(u_xlat16_7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat34 = (-u_xlat11.x) * u_xlat16_61 + u_xlat11.x;
    u_xlat34 = u_xlat11.x * u_xlat34 + u_xlat16_61;
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 + u_xlat11.x;
    u_xlat34 = u_xlat34 + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat34;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat93 = u_xlat16_61 + -1.0;
    u_xlat86 = u_xlat86 * u_xlat93 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat86 = u_xlat87 * u_xlat86;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat58.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat18.xyz = u_xlat3.xyz * u_xlat16_33.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat86 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat18.xyz = vec3(u_xlat86) * u_xlat18.xyz;
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat86 * u_xlat93 + 1.0;
    u_xlat86 = u_xlat86 * u_xlat86;
    u_xlat86 = u_xlat16_61 / u_xlat86;
    u_xlat86 = u_xlat86 * 0.318309873;
    u_xlat86 = min(u_xlat86, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat66 = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat18.xyz = u_xlat16_16.xyz * vec3(u_xlat66);
    u_xlat18.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat18.xyz;
    u_xlat87 = (-u_xlat30) * u_xlat16_61 + u_xlat30;
    u_xlat87 = u_xlat30 * u_xlat87 + u_xlat16_61;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat30 + u_xlat87;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat87 * u_xlat34;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat86 = u_xlat86 * u_xlat87;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat86);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat18.xyz * _directSpecularColor.xyz;
    u_xlat18.xyz = vec3(u_xlat30) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat18.xyz * u_xlat16_12.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_96 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_96 = (-u_xlat16_96) * u_xlat16_96 + 1.0;
    u_xlat16_96 = max(u_xlat16_96, 0.0);
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat9.xyz;
    u_xlat16_91 = u_xlat16_96 * u_xlat16_13.x;
    u_xlat16_96 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.00100000005>=abs(u_xlat16_96));
#else
    u_xlatb86 = 0.00100000005>=abs(u_xlat16_96);
#endif
    u_xlat16_21.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_91 = max(u_xlat16_91, u_xlat16_21.x);
    u_xlat16_21.xzw = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_21.xzw;
    u_xlat16_96 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_96 = u_xlat16_96 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 * u_xlat16_96;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb86 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb86) ? 1.0 : 0.0;
    u_xlat16_96 = max(u_xlat16_96, u_xlat16_13.x);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_21.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat3.xyz * u_xlat16_33.xxx + u_xlat16_20.xyz;
    u_xlat86 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat86 = inversesqrt(u_xlat86);
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat86 = dot(u_xlat16_7.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat86 = min(max(u_xlat86, 0.0), 1.0);
#else
    u_xlat86 = clamp(u_xlat86, 0.0, 1.0);
#endif
    u_xlat59 = dot(u_xlat16_7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat59 * u_xlat93 + 1.0;
    u_xlat59 = u_xlat59 * u_xlat59;
    u_xlat59 = u_xlat16_61 / u_xlat59;
    u_xlat59 = u_xlat59 * 0.318309873;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat87 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat87;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat9.x = (-u_xlat16_91) * u_xlat87 + 1.0;
    u_xlat16_91 = u_xlat87 * u_xlat16_91;
    u_xlat9.xyz = u_xlat16_16.xyz * u_xlat9.xxx;
    u_xlat9.xyz = u_xlat2.xxx * vec3(u_xlat16_91) + u_xlat9.xyz;
    u_xlat2.x = (-u_xlat86) * u_xlat16_61 + u_xlat86;
    u_xlat2.x = u_xlat86 * u_xlat2.x + u_xlat16_61;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat86;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat34;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat59;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat86) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_21.xyz * u_xlat9.xyz;
    u_xlat16_19.xyz = u_xlat9.xyz * u_xlat28.xxx + u_xlat16_19.xyz;
    u_xlat16_20.xyz = (-u_xlat6.xzw) * u_xlat16_5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_20.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_20.xyz + u_xlat16_7.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_20.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_20.xyz = vec3(u_xlat16_91) * u_xlat16_20.xyz;
    u_xlat16_91 = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_91 * 0.5 + 0.5;
    u_xlat16_96 = (-u_xlat16_91) + u_xlat16_96;
    u_xlat16_13.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_96 + u_xlat16_91;
    u_xlat16_91 = u_xlat16_41.z * u_xlat16_91;
    u_xlat16_96 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_96 = min(max(u_xlat16_96, 0.0), 1.0);
#else
    u_xlat16_96 = clamp(u_xlat16_96, 0.0, 1.0);
#endif
    u_xlat16_96 = u_xlat16_96 + -1.0;
    u_xlat16_96 = _occlusionScale * u_xlat16_96 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_96;
    u_xlat16_13.x = sqrt(u_xlat16_91);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_91));
    u_xlat16_22.xyz = u_xlat16_12.xyz * u_xlat16_13.xxx;
    u_xlat16_91 = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91 + u_xlat16_10.x;
    u_xlat16_91 = _sssIntensity * _sssIntensity;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_91 = (-u_xlat10_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = vec3(u_xlat16_91) * u_xlat16_15.xyz;
    u_xlat16_91 = sqrt(u_xlat16_89);
    u_xlat16_23.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = (-u_xlat16_23.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_25.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_25.xyz = vec3(u_xlat16_91) * u_xlat16_25.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_26.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.xyz = vec3(u_xlat16_91) * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz + (-u_xlat16_26.xyz);
    u_xlat16_27.xyz = vec3(u_xlat30) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_22.xyz = u_xlat16_27.xyz * u_xlat16_22.xyz + (-vec3(u_xlat30));
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(u_xlat30);
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_22.xyz = u_xlat16_12.xyz * u_xlat16_22.xyz;
    u_xlat16_27.xyz = u_xlat58.xxx * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_25.xyz = vec3(u_xlat86) * u_xlat16_25.xyz + u_xlat16_26.xyz;
    u_xlat16_98 = u_xlat56 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat28.x * u_xlat16_13.x;
    u_xlat16_26.xyz = u_xlat16_13.xxx * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_98) * u_xlat16_24.xyz + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_27.xyz * u_xlat16_23.xyz + (-u_xlat58.xxx);
    u_xlat16_23.xyz = vec3(u_xlat16_91) * u_xlat16_23.xyz + u_xlat58.xxx;
    u_xlat16_23.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat56) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_22.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_22.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz + (-vec3(u_xlat86));
    u_xlat16_22.xyz = vec3(u_xlat16_91) * u_xlat16_22.xyz + vec3(u_xlat86);
    u_xlat16_22.xyz = u_xlat16_15.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_21.xyz * u_xlat28.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_19.xyz + u_xlat16_14.xyz;
    u_xlat16_21.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_21.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_21.y = u_xlat16_7.y;
    u_xlat16_22.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_20.xz);
    u_xlat16_22.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_20.xz);
    u_xlat16_22.y = u_xlat16_20.y;
    u_xlat28.x = dot(u_xlat16_22.xyz, u_xlat16_21.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat2.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat2.xyz = u_xlat28.xxx * u_xlat2.xyz + _sssColorBack.xyz;
    u_xlat16_21.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_41.zzz * u_xlat16_21.xyz + _sssColorOcc.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat2.xyz * u_xlat16_15.xyz + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_89) * u_xlat16_21.xyz + u_xlat16_15.xyz;
    u_xlat16_21.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat10_4.z);
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat0.xxx * u_xlat16_21.xyz;
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat0.xxx * u_xlat16_23.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat0.xxx + (-u_xlat16_23.xyz);
    u_xlat16_23.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_23.xyz * u_xlat0.xxx + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_23.xyz = u_xlat16_22.xyz * u_xlat16_22.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_22.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_22.xyz = vec3(u_xlat16_96) * u_xlat16_23.xyz;
    u_xlati28 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_23.xyz = u_xlat16_22.yyy * _IrradianceACCoeffs[u_xlati28].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati28 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_22.xyw = u_xlat16_22.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat16_22.zzz * _IrradianceACCoeffs[u_xlati28].xyz + u_xlat16_22.xyw;
    u_xlat16_23.xyz = u_xlat16_22.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_89 = dot(u_xlat16_22.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_23.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz + u_xlat16_14.xyz;
    u_xlat16_91 = u_xlat0.w * 0.5;
    u_xlat16_13.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_20.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_98 = dot((-u_xlat16_17.xyz), u_xlat16_7.xyz);
    u_xlat16_98 = u_xlat16_98 + u_xlat16_98;
    u_xlat2.xyz = (-u_xlat16_7.xyz) * vec3(u_xlat16_98) + (-u_xlat16_17.xyz);
    u_xlat16_41.y = dot(u_xlat16_20.xyz, u_xlat2.xyz);
    u_xlat16_15.xyz = u_xlat16_41.xyz * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_69 = floor(u_xlat16_8.w);
    u_xlat16_97 = u_xlat16_69 + 1.0;
    u_xlat16_97 = min(u_xlat16_97, 15.0);
    u_xlat16_8.x = u_xlat16_97 * 16.0 + u_xlat16_8.z;
    u_xlat16_15.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_8.x = u_xlat16_69 * 16.0 + u_xlat16_8.z;
    u_xlat16_15.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_69 = u_xlat16_15.z * 15.0 + (-u_xlat16_69);
    u_xlat16_97 = (-u_xlat16_56) + u_xlat16_28;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_97 + u_xlat16_56;
    u_xlat16_69 = u_xlat16_96 * u_xlat16_69;
    u_xlat0.x = u_xlat0.x * u_xlat16_69;
    u_xlat16_91 = u_xlat0.x * u_xlat16_13.x + u_xlat16_91;
    u_xlat16_13.x = u_xlat16_91 + u_xlat16_91;
    u_xlat16_69 = (-u_xlat16_91) * 2.0 + 1.0;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_69 + u_xlat16_13.x;
    u_xlat16_91 = u_xlat0.w * u_xlat16_91;
    u_xlat16_91 = min(u_xlat10_4.z, u_xlat16_91);
    u_xlat16_13.x = u_xlat16_41.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_41.x);
    u_xlat11.y = u_xlat16_41.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_41.xyz = u_xlat16_16.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat0.xyz = u_xlat6.xzw * u_xlat16_5.xxx + (-u_xlat2.xyz);
    u_xlat0.xyz = vec3(u_xlat16_61) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_13.x);
    u_xlat16_16.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_5.xzw = vec3(u_xlat16_89) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_5.xzw = (bool(u_xlatb0)) ? u_xlat16_5.xzw : u_xlat16_16.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_41.xyz;
    u_xlat16_5.xzw = vec3(u_xlat16_91) * u_xlat16_5.xzw;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_5.xzw * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_5.xzw = u_xlat16_5.xzw * u_xlat16_13.xyz + u_xlat16_19.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat10_1.w * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat10_1.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe_Y;
    u_xlat2.z = u_xlat16_17.z;
    u_xlat84 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = (-u_xlat84) + 1.0;
    u_xlat84 = max(u_xlat84, 0.0);
    u_xlat84 = max(u_xlat84, 0.00048828125);
    u_xlat84 = log2(u_xlat84);
    u_xlat84 = u_xlat84 * _Sanshe_Fw;
    u_xlat84 = exp2(u_xlat84);
    u_xlat0.w = u_xlat84 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb86 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb86 = _UseSansheMask>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb86)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xy = u_xlat16_6.xy * u_xlat16_13.xx + u_xlat16_13.yy;
    u_xlat2.x = u_xlat3.x * u_xlat16_33.x + _Sanshe2_X;
    u_xlat2.y = u_xlat3.y * u_xlat16_33.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_13.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_33.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_33.x = inversesqrt(u_xlat16_33.x);
    u_xlat16_16.xyz = u_xlat16_33.xxx * _DirectionalDir.xyz;
    u_xlat28.x = dot(u_xlat16_16.xyz, u_xlat16_7.xyz);
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.xyz = u_xlat28.xxx * _DirectionalColor.xyz;
    u_xlat28.xyz = u_xlat28.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb2 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_33.x = u_xlat16_6.z * u_xlat16_33.x + u_xlat16_33.z;
    u_xlat16_7.xyz = u_xlat28.xyz * u_xlat16_33.xxx + u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat28.x = dot(u_xlat16_14.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat28.x = u_xlat28.x + -0.25;
    u_xlat28.x = u_xlat28.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_13.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_13.xyz + u_xlat16_7.xyz;
    u_xlat16_33.x = exp2(_PostExposure);
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat16_33.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat56)) + u_xlat2.xyz;
    u_xlat84 = u_xlat28.x * -2.0 + 3.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat84;
    u_xlat0.x = max(u_xlat28.x, u_xlat0.x);
    u_xlat16_33.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_33.x + _Saturation;
    u_xlat0.xyz = u_xlat16_33.xxx * u_xlat2.xyz + vec3(u_xlat56);
    u_xlat16_33.xz = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb84 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb84 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_91 = (u_xlatb84) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_91) * u_xlat16_33.xz + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_33.x = float(1.0);
    u_xlat16_33.z = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_91) * u_xlat16_33.xz + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb28.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_33.x = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_89 = u_xlat16_33.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_13.xyz = u_xlat16_33.xxx * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_33.x = min(u_xlat16_89, u_xlat16_13.y);
    u_xlat16_89 = u_xlat16_89 + (-u_xlat16_13.y);
    u_xlat16_33.x = (-u_xlat16_33.x) + u_xlat16_13.x;
    u_xlat16_91 = u_xlat16_33.x * 6.0 + 9.99999975e-05;
    u_xlat16_89 = u_xlat16_89 / u_xlat16_91;
    u_xlat16_89 = u_xlat16_89 + u_xlat16_13.z;
    u_xlat16_89 = abs(u_xlat16_89) + _HueShift;
    u_xlat16_41.xyz = vec3(u_xlat16_89) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_41.xyz = fract(u_xlat16_41.xyz);
    u_xlat16_41.xyz = u_xlat16_41.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_41.xyz = abs(u_xlat16_41.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.xyz = min(max(u_xlat16_41.xyz, 0.0), 1.0);
#else
    u_xlat16_41.xyz = clamp(u_xlat16_41.xyz, 0.0, 1.0);
#endif
    u_xlat16_41.xyz = u_xlat16_41.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_89 = u_xlat16_13.x + 9.99999975e-05;
    u_xlat16_33.x = u_xlat16_33.x / u_xlat16_89;
    u_xlat16_41.xyz = u_xlat16_33.xxx * u_xlat16_41.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_41.xyz * u_xlat16_13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_33.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_33.xxx * u_xlat16_13.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_33.zzz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_61;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
bvec4 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
ivec3 u_xlati22;
vec3 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat29;
mediump vec2 u_xlat10_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
float u_xlat52;
float u_xlat66;
mediump float u_xlat16_66;
int u_xlati66;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
int u_xlati73;
bool u_xlatb73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat87;
float u_xlat89;
mediump float u_xlat16_89;
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
    u_xlat16_24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 6.10351563e-05);
    u_xlat16_47.x = inversesqrt(u_xlat16_24);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_47.xxx;
    u_xlat16_47.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_47.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_47.x);
#endif
    u_xlat16_47.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_47.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_47.yyy + u_xlat16_3.xyz;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_70);
    u_xlat16_70 = u_xlat16_24 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24 = float(1.0) / float(u_xlat16_24);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_24 = u_xlat16_70 * u_xlat16_24;
    u_xlat16_24 = max(u_xlat16_47.x, u_xlat16_24);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_24;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_70 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_70) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat16_3.xyz;
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
    u_xlat69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat0.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_70 = _sssIntensity * _sssIntensity;
    u_xlat16_70 = u_xlat16_5.x * u_xlat16_70;
    u_xlat10_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_71 = (-u_xlat10_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_70);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_30.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_30.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_10.xyz = vec3(u_xlat16_77) * u_xlat16_10.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_78 = (-u_xlat16_77) + u_xlat16_78;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_78 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_77;
    u_xlat16_78 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_78 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_77);
    u_xlat6 = min(u_xlat16_77, 1.0);
    u_xlatb12 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_12.x = (u_xlatb12.x) ? float(1.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb12.y) ? float(0.0) : float(1.0);
    u_xlat16_12.z = (u_xlatb12.z) ? float(1.0) : float(0.0);
    u_xlat16_12.w = (u_xlatb12.w) ? float(0.0) : float(1.0);
    u_xlat10_29.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat29.xy = u_xlat10_29.xy * u_xlat16_12.xz + u_xlat16_12.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xy = min(max(u_xlat29.xy, 0.0), 1.0);
#else
    u_xlat29.xy = clamp(u_xlat29.xy, 0.0, 1.0);
#endif
    u_xlat16_34.xy = u_xlat29.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_34.xyz = u_xlat16_34.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + (-vec3(u_xlat73));
    u_xlat16_14.xyz = u_xlat16_7.xxx * u_xlat16_14.xyz + vec3(u_xlat73);
    u_xlat10_9 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat10_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat10_9.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat10_9.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat10_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat29.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat73) * u_xlat16_1.xyz;
    u_xlat73 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + (-vec3(u_xlat73));
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz + vec3(u_xlat73);
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb29 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_11.xxx * u_xlat18.xyz;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb29 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb29)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.yyy + u_xlat16_19.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat29.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_11.x;
    u_xlat16_77 = max(u_xlat16_17.x, u_xlat16_77);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_77;
    u_xlat16_14.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat29.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xyz + (-u_xlat29.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat29.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat29.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat10_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat29.x = (-u_xlat73) * u_xlat16_2.x + u_xlat73;
    u_xlat29.x = u_xlat73 * u_xlat29.x + u_xlat16_2.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat73 + u_xlat29.x;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_8.xyz = u_xlat16_25.xxx * u_xlat18.xyz;
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat20.x) * u_xlat16_2.x + u_xlat20.x;
    u_xlat52 = u_xlat20.x * u_xlat52 + u_xlat16_2.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat29.y = u_xlat52 + u_xlat20.x;
    u_xlat29.xy = u_xlat29.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.x * u_xlat29.y;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat87 = min(u_xlat29.x, 16.0);
    u_xlat21.xyz = u_xlat18.xyz * u_xlat16_25.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat21.xyz = vec3(u_xlat66) * u_xlat21.xyz;
    u_xlat66 = dot(u_xlat4.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_48.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48.x = min(max(u_xlat16_48.x, 0.0), 1.0);
#else
    u_xlat16_48.x = clamp(u_xlat16_48.x, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_48.x) + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat21.x = u_xlat16_2.x + -1.0;
    u_xlat66 = u_xlat66 * u_xlat21.x + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_2.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat66 = u_xlat87 * u_xlat66;
    u_xlat16_48.x = u_xlat89 * u_xlat89;
    u_xlat16_48.x = u_xlat89 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat89 * u_xlat16_48.x;
    u_xlat16_71 = u_xlat89 * u_xlat16_48.x;
    u_xlat89 = (-u_xlat16_48.x) * u_xlat89 + 1.0;
    u_xlat16_11.xyz = u_xlat16_5.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat16_11.xyz * vec3(u_xlat89);
    u_xlat89 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat89) * vec3(u_xlat16_71) + u_xlat21.xyz;
    u_xlat21.xyz = vec3(u_xlat66) * u_xlat21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.zxy;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat16_1.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_14.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_14.xyz + _sssColorOcc.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat4.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat73 = dot(u_xlat16_17.xyz, u_xlat15.xyz);
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat22.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat22.xyz = vec3(u_xlat73) * u_xlat22.xyz + _sssColorBack.zxy;
    u_xlat22.xyz = u_xlat16_14.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_14.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat73 = min(u_xlat10_3.z, u_xlat6);
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat73) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_19.xyz * vec3(u_xlat73) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati73 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati73].xyz;
    u_xlati73 = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati66 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati73].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_1.xyz;
    u_xlat16_48.x = dot((-u_xlat16_8.xyz), u_xlat4.xyz);
    u_xlat16_48.x = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat22.xyz = (-u_xlat4.xyz) * u_xlat16_48.xxx + (-u_xlat16_8.xyz);
    u_xlat16_5.z = dot(u_xlat16_10.xyz, u_xlat22.xyz);
    u_xlat73 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_8.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48.x = floor(u_xlat16_7.w);
    u_xlat16_71 = u_xlat16_48.x + 1.0;
    u_xlat16_71 = min(u_xlat16_71, 15.0);
    u_xlat16_7.x = u_xlat16_71 * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_7.x = u_xlat16_48.x * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_89 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_48.x = u_xlat16_8.w * 15.0 + (-u_xlat16_48.x);
    u_xlat16_71 = (-u_xlat16_89) + u_xlat16_66;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_71 + u_xlat16_89;
    u_xlat16_48.x = u_xlat16_79 * u_xlat16_48.x;
    u_xlat73 = u_xlat73 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat6 * 0.5;
    u_xlat16_71 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_48.x = u_xlat73 * u_xlat16_71 + u_xlat16_48.x;
    u_xlat16_71 = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat16_8.x = (-u_xlat16_48.x) * 2.0 + 1.0;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_8.x + u_xlat16_71;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat6;
    u_xlat16_48.x = min(u_xlat16_48.x, u_xlat10_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat69) + (-u_xlat22.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat22.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat20.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_8.xyw = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_2.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_11.xyz;
    u_xlat16_2.xzw = u_xlat16_48.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xzw * u_xlat16_8.xyw + u_xlat16_1.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_8.xyw;
    u_xlat16_2.xzw = u_xlat21.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.zwx;
    u_xlat16_70 = dot(u_xlat16_2.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat10_9.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat10_9.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat20.x = u_xlat18.x * u_xlat16_25.x + _Sanshe_X;
    u_xlat20.y = u_xlat18.y * u_xlat16_25.x + _Sanshe_Y;
    u_xlat20.z = u_xlat16_8.z;
    u_xlat69 = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = max(u_xlat69, 0.00048828125);
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Fw;
    u_xlat69 = exp2(u_xlat69);
    u_xlat0.w = u_xlat69 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb73 = _UseSansheMask>=0.5;
#endif
    u_xlat16_48.xy = (bool(u_xlatb73)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_48.xy = u_xlat16_21.xy * u_xlat16_48.xx + u_xlat16_48.yy;
    u_xlat20.x = u_xlat18.x * u_xlat16_25.x + _Sanshe2_X;
    u_xlat20.y = u_xlat18.y * u_xlat16_25.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_48.yx;
    u_xlat20.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_25.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat20.xyz;
    u_xlat16_8.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_8.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _DirectionalDir.xyz;
    u_xlat23.x = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.xyz = u_xlat23.xxx * _DirectionalColor.zxy;
    u_xlat23.xyz = u_xlat23.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.x = u_xlat16_21.z * u_xlat16_8.x + u_xlat16_8.y;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat16_8.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_1.xyz + u_xlat16_25.xyz;
    u_xlat23.x = dot(u_xlat16_1.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat23.x = u_xlat23.x + -0.25;
    u_xlat23.x = u_xlat23.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = max(u_xlat16_25.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_25.xyz + u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat46 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat69 = u_xlat4.x * 15.0 + (-u_xlat46);
    u_xlat3.x = u_xlat46 * 0.0625 + u_xlat3.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat20.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat20.xy, 0.0).xyz;
    u_xlat20.xyz = (-u_xlat16_4.xyz) + u_xlat16_20.xyz;
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat20.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = exp2(_PostExposure);
    u_xlat20.xyz = u_xlat4.xyz * u_xlat16_1.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat20.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat20.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat20.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat20.xyz = (-vec3(u_xlat46)) + u_xlat20.xyz;
    u_xlat69 = u_xlat23.x * -2.0 + 3.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat69;
    u_xlat0.x = max(u_xlat23.x, u_xlat0.x);
    u_xlat16_1.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x + _Saturation;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat20.xyz + vec3(u_xlat46);
    u_xlat16_1.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb69 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_47.x = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_47.xx * u_xlat16_1.xy + u_xlat0.zy;
    u_xlat16_5.w = (-u_xlat0.x);
    u_xlat16_1.x = float(1.0);
    u_xlat16_1.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_47.xx * u_xlat16_1.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_3.xyw);
    u_xlat16_6.yzw = u_xlat16_3.yzx + u_xlat16_5.yzw;
    u_xlat16_6.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb23 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_1.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_24 = u_xlat16_1.x * u_xlat16_6.w + u_xlat0.x;
    u_xlat16_25.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz + u_xlat16_3.xyw;
    u_xlat16_1.x = min(u_xlat16_24, u_xlat16_25.y);
    u_xlat16_24 = u_xlat16_24 + (-u_xlat16_25.y);
    u_xlat16_1.x = (-u_xlat16_1.x) + u_xlat16_25.x;
    u_xlat16_47.x = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_24 = u_xlat16_24 / u_xlat16_47.x;
    u_xlat16_24 = u_xlat16_24 + u_xlat16_25.z;
    u_xlat16_24 = abs(u_xlat16_24) + _HueShift;
    u_xlat16_8.xyz = vec3(u_xlat16_24) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = u_xlat16_25.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_24;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_25.xxx;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat16_25.yyy + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_2.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
bvec4 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
ivec3 u_xlati22;
vec3 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat29;
mediump vec2 u_xlat10_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
float u_xlat52;
float u_xlat66;
mediump float u_xlat16_66;
int u_xlati66;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
int u_xlati73;
bool u_xlatb73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat87;
float u_xlat89;
mediump float u_xlat16_89;
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
    u_xlat16_24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 6.10351563e-05);
    u_xlat16_47.x = inversesqrt(u_xlat16_24);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_47.xxx;
    u_xlat16_47.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_47.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_47.x);
#endif
    u_xlat16_47.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_47.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_47.yyy + u_xlat16_3.xyz;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_70);
    u_xlat16_70 = u_xlat16_24 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24 = float(1.0) / float(u_xlat16_24);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_24 = u_xlat16_70 * u_xlat16_24;
    u_xlat16_24 = max(u_xlat16_47.x, u_xlat16_24);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_24;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_70 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_70) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat16_3.xyz;
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
    u_xlat69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat0.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_70 = _sssIntensity * _sssIntensity;
    u_xlat16_70 = u_xlat16_5.x * u_xlat16_70;
    u_xlat10_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_71 = (-u_xlat10_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_70);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_30.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_30.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_10.xyz = vec3(u_xlat16_77) * u_xlat16_10.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_78 = (-u_xlat16_77) + u_xlat16_78;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_78 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_77;
    u_xlat16_78 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_78 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_77);
    u_xlat6 = min(u_xlat16_77, 1.0);
    u_xlatb12 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_12.x = (u_xlatb12.x) ? float(1.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb12.y) ? float(0.0) : float(1.0);
    u_xlat16_12.z = (u_xlatb12.z) ? float(1.0) : float(0.0);
    u_xlat16_12.w = (u_xlatb12.w) ? float(0.0) : float(1.0);
    u_xlat10_29.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat29.xy = u_xlat10_29.xy * u_xlat16_12.xz + u_xlat16_12.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xy = min(max(u_xlat29.xy, 0.0), 1.0);
#else
    u_xlat29.xy = clamp(u_xlat29.xy, 0.0, 1.0);
#endif
    u_xlat16_34.xy = u_xlat29.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_34.xyz = u_xlat16_34.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + (-vec3(u_xlat73));
    u_xlat16_14.xyz = u_xlat16_7.xxx * u_xlat16_14.xyz + vec3(u_xlat73);
    u_xlat10_9 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat10_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat10_9.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat10_9.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat10_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat29.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat73) * u_xlat16_1.xyz;
    u_xlat73 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + (-vec3(u_xlat73));
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz + vec3(u_xlat73);
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb29 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_11.xxx * u_xlat18.xyz;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb29 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb29)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.yyy + u_xlat16_19.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat29.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_11.x;
    u_xlat16_77 = max(u_xlat16_17.x, u_xlat16_77);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_77;
    u_xlat16_14.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_2.xyz = u_xlat29.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xyz + (-u_xlat29.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat29.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat29.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat10_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat29.x = (-u_xlat73) * u_xlat16_2.x + u_xlat73;
    u_xlat29.x = u_xlat73 * u_xlat29.x + u_xlat16_2.x;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat73 + u_xlat29.x;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_8.xyz = u_xlat16_25.xxx * u_xlat18.xyz;
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat20.x) * u_xlat16_2.x + u_xlat20.x;
    u_xlat52 = u_xlat20.x * u_xlat52 + u_xlat16_2.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat29.y = u_xlat52 + u_xlat20.x;
    u_xlat29.xy = u_xlat29.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat29.x = u_xlat29.x * u_xlat29.y;
    u_xlat29.x = float(1.0) / u_xlat29.x;
    u_xlat87 = min(u_xlat29.x, 16.0);
    u_xlat21.xyz = u_xlat18.xyz * u_xlat16_25.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat21.xyz = vec3(u_xlat66) * u_xlat21.xyz;
    u_xlat66 = dot(u_xlat4.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_48.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48.x = min(max(u_xlat16_48.x, 0.0), 1.0);
#else
    u_xlat16_48.x = clamp(u_xlat16_48.x, 0.0, 1.0);
#endif
    u_xlat89 = (-u_xlat16_48.x) + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat21.x = u_xlat16_2.x + -1.0;
    u_xlat66 = u_xlat66 * u_xlat21.x + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_2.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat66 = u_xlat87 * u_xlat66;
    u_xlat16_48.x = u_xlat89 * u_xlat89;
    u_xlat16_48.x = u_xlat89 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat89 * u_xlat16_48.x;
    u_xlat16_71 = u_xlat89 * u_xlat16_48.x;
    u_xlat89 = (-u_xlat16_48.x) * u_xlat89 + 1.0;
    u_xlat16_11.xyz = u_xlat16_5.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat16_11.xyz * vec3(u_xlat89);
    u_xlat89 = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat89) * vec3(u_xlat16_71) + u_xlat21.xyz;
    u_xlat21.xyz = vec3(u_xlat66) * u_xlat21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.zxy;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat16_1.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_14.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_14.xyz + _sssColorOcc.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat4.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat73 = dot(u_xlat16_17.xyz, u_xlat15.xyz);
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat22.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat22.xyz = vec3(u_xlat73) * u_xlat22.xyz + _sssColorBack.zxy;
    u_xlat22.xyz = u_xlat16_14.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_14.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat73 = min(u_xlat10_3.z, u_xlat6);
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat73) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_19.xyz * vec3(u_xlat73) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati73 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati73].xyz;
    u_xlati73 = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati66 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati73].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_1.xyz;
    u_xlat16_48.x = dot((-u_xlat16_8.xyz), u_xlat4.xyz);
    u_xlat16_48.x = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat22.xyz = (-u_xlat4.xyz) * u_xlat16_48.xxx + (-u_xlat16_8.xyz);
    u_xlat16_5.z = dot(u_xlat16_10.xyz, u_xlat22.xyz);
    u_xlat73 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_8.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48.x = floor(u_xlat16_7.w);
    u_xlat16_71 = u_xlat16_48.x + 1.0;
    u_xlat16_71 = min(u_xlat16_71, 15.0);
    u_xlat16_7.x = u_xlat16_71 * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_7.x = u_xlat16_48.x * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_89 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_48.x = u_xlat16_8.w * 15.0 + (-u_xlat16_48.x);
    u_xlat16_71 = (-u_xlat16_89) + u_xlat16_66;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_71 + u_xlat16_89;
    u_xlat16_48.x = u_xlat16_79 * u_xlat16_48.x;
    u_xlat73 = u_xlat73 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat6 * 0.5;
    u_xlat16_71 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_48.x = u_xlat73 * u_xlat16_71 + u_xlat16_48.x;
    u_xlat16_71 = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat16_8.x = (-u_xlat16_48.x) * 2.0 + 1.0;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_8.x + u_xlat16_71;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat6;
    u_xlat16_48.x = min(u_xlat16_48.x, u_xlat10_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat69) + (-u_xlat22.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat22.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat20.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_8.xyw = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_2.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_11.xyz;
    u_xlat16_2.xzw = u_xlat16_48.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xzw * u_xlat16_8.xyw + u_xlat16_1.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_8.xyw;
    u_xlat16_2.xzw = u_xlat21.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.zwx;
    u_xlat16_70 = dot(u_xlat16_2.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat10_9.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat10_9.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat20.x = u_xlat18.x * u_xlat16_25.x + _Sanshe_X;
    u_xlat20.y = u_xlat18.y * u_xlat16_25.x + _Sanshe_Y;
    u_xlat20.z = u_xlat16_8.z;
    u_xlat69 = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = max(u_xlat69, 0.00048828125);
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Fw;
    u_xlat69 = exp2(u_xlat69);
    u_xlat0.w = u_xlat69 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb73 = _UseSansheMask>=0.5;
#endif
    u_xlat16_48.xy = (bool(u_xlatb73)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_48.xy = u_xlat16_21.xy * u_xlat16_48.xx + u_xlat16_48.yy;
    u_xlat20.x = u_xlat18.x * u_xlat16_25.x + _Sanshe2_X;
    u_xlat20.y = u_xlat18.y * u_xlat16_25.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_48.yx;
    u_xlat20.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_25.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat20.xyz;
    u_xlat16_8.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_8.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _DirectionalDir.xyz;
    u_xlat23.x = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.xyz = u_xlat23.xxx * _DirectionalColor.zxy;
    u_xlat23.xyz = u_xlat23.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.x = u_xlat16_21.z * u_xlat16_8.x + u_xlat16_8.y;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat16_8.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_1.xyz + u_xlat16_25.xyz;
    u_xlat23.x = dot(u_xlat16_1.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat23.x = u_xlat23.x + -0.25;
    u_xlat23.x = u_xlat23.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = max(u_xlat16_25.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_25.xyz + u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat46 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat69 = u_xlat4.x * 15.0 + (-u_xlat46);
    u_xlat3.x = u_xlat46 * 0.0625 + u_xlat3.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat20.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat20.xy, 0.0).xyz;
    u_xlat20.xyz = (-u_xlat16_4.xyz) + u_xlat16_20.xyz;
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat20.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = exp2(_PostExposure);
    u_xlat20.xyz = u_xlat4.xyz * u_xlat16_1.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat20.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat20.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xyz = min(max(u_xlat20.xyz, 0.0), 1.0);
#else
    u_xlat20.xyz = clamp(u_xlat20.xyz, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat20.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat20.xyz = (-vec3(u_xlat46)) + u_xlat20.xyz;
    u_xlat69 = u_xlat23.x * -2.0 + 3.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat69;
    u_xlat0.x = max(u_xlat23.x, u_xlat0.x);
    u_xlat16_1.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x + _Saturation;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat20.xyz + vec3(u_xlat46);
    u_xlat16_1.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb69 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_47.x = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_47.xx * u_xlat16_1.xy + u_xlat0.zy;
    u_xlat16_5.w = (-u_xlat0.x);
    u_xlat16_1.x = float(1.0);
    u_xlat16_1.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_47.xx * u_xlat16_1.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_3.xyw);
    u_xlat16_6.yzw = u_xlat16_3.yzx + u_xlat16_5.yzw;
    u_xlat16_6.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb23 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_1.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_24 = u_xlat16_1.x * u_xlat16_6.w + u_xlat0.x;
    u_xlat16_25.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz + u_xlat16_3.xyw;
    u_xlat16_1.x = min(u_xlat16_24, u_xlat16_25.y);
    u_xlat16_24 = u_xlat16_24 + (-u_xlat16_25.y);
    u_xlat16_1.x = (-u_xlat16_1.x) + u_xlat16_25.x;
    u_xlat16_47.x = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_24 = u_xlat16_24 / u_xlat16_47.x;
    u_xlat16_24 = u_xlat16_24 + u_xlat16_25.z;
    u_xlat16_24 = abs(u_xlat16_24) + _HueShift;
    u_xlat16_8.xyz = vec3(u_xlat16_24) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = u_xlat16_25.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_24;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_25.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_25.xxx;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat16_25.yyy + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_2.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
mediump vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat10_21;
bvec3 u_xlatb21;
float u_xlat22;
vec3 u_xlat23;
bool u_xlatb23;
vec3 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat42;
bool u_xlatb42;
float u_xlat44;
mediump vec2 u_xlat16_44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_46;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_52;
mediump float u_xlat16_54;
float u_xlat65;
int u_xlati65;
bool u_xlatb65;
mediump float u_xlat16_66;
int u_xlati66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
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
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat7.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb21.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb21.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb21.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb21.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb21.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb21.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_48.xy = u_xlat10_21.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat21.x = u_xlat10_21.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_48.x * _shadowStrength;
    u_xlat42 = u_xlat16_48.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_69 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_10.xyz = vec3(u_xlat16_69) * u_xlat16_10.xyz;
    u_xlat16_69 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_69) + u_xlat16_73;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_69 = u_xlat16_1.w * u_xlat16_73 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_1.w * u_xlat16_69;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73;
    u_xlat16_11.x = sqrt(u_xlat16_69);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_69));
    u_xlat16_32.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_75 = _sssIntensity * _sssIntensity;
    u_xlat16_75 = u_xlat16_2 * u_xlat16_75;
    u_xlat10_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.x = (-u_xlat10_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_34 = sqrt(u_xlat16_75);
    u_xlat16_12.xyz = vec3(u_xlat16_34) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_34) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_34) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_32.xyz = u_xlat16_17.xyz * u_xlat16_32.xyz + (-u_xlat3.xxx);
    u_xlat16_32.xyz = vec3(u_xlat16_34) * u_xlat16_32.xyz + u_xlat3.xxx;
    u_xlat10_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat10_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat10_4.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat10_4.zxy * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat10_2.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xzw = u_xlat16_13.xxx * u_xlat16_19.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_13.xzw;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_32.xyz = u_xlat16_6.xyz * u_xlat16_32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_78);
    u_xlat16_18.xyz = u_xlat24.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb65 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_19.xy = (bool(u_xlatb65)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat65 = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_79);
    u_xlat16_79 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = float(1.0) / float(u_xlat16_78);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_79;
    u_xlat16_78 = max(u_xlat16_19.x, u_xlat16_78);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_18.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_19.xyz = vec3(u_xlat65) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_77 = u_xlat42 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat21.x * u_xlat16_11.x;
    u_xlat16_20.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_77) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_12.xyz + (-vec3(u_xlat65));
    u_xlat16_12.xyz = vec3(u_xlat16_34) * u_xlat16_12.xyz + vec3(u_xlat65);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xzw;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat42) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat65) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat24.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_33.yyy + u_xlat16_18.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat42 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_54);
    u_xlat16_54 = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_12.x = u_xlat16_54 * u_xlat16_12.x;
    u_xlat16_12.x = max(u_xlat16_33.x, u_xlat16_12.x);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_12.x;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = vec3(u_xlat42) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz + (-vec3(u_xlat42));
    u_xlat16_14.xyz = vec3(u_xlat16_34) * u_xlat16_14.xyz + vec3(u_xlat42);
    u_xlat16_14.xyz = u_xlat16_13.xzw * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * vec3(u_xlat42) + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat10_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_74 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat21.x = (-u_xlat3.x) * u_xlat16_74 + u_xlat3.x;
    u_xlat21.x = u_xlat3.x * u_xlat21.x + u_xlat16_74;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat3.x;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat2.xyw * u_xlat16_12.xxx;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat4.x) * u_xlat16_74 + u_xlat4.x;
    u_xlat42 = u_xlat4.x * u_xlat42 + u_xlat16_74;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat21.y = u_xlat42 + u_xlat4.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.x * u_xlat21.y;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat21.x = min(u_xlat21.x, 16.0);
    u_xlat24.xyz = u_xlat2.xyw * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat24.xyz = vec3(u_xlat42) * u_xlat24.xyz;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16_33.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_33.x) + 1.0;
    u_xlat24.x = u_xlat42 * u_xlat42;
    u_xlat45 = u_xlat16_74 + -1.0;
    u_xlat24.x = u_xlat24.x * u_xlat45 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat16_74 / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 0.318309873;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat24.x = u_xlat21.x * u_xlat24.x;
    u_xlat16_33.x = u_xlat65 * u_xlat65;
    u_xlat16_33.x = u_xlat65 * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat65 * u_xlat16_33.x;
    u_xlat16_54 = u_xlat65 * u_xlat16_33.x;
    u_xlat65 = (-u_xlat16_33.x) * u_xlat65 + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat16_15.xyz;
    u_xlat65 = u_xlat16_15.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat65) * vec3(u_xlat16_54) + u_xlat8.xyz;
    u_xlat24.xyz = u_xlat24.xxx * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.zxy;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat24.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_16.xyz + _sssColorOcc.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat65 = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat8.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat8.xyz + _sssColorBack.zxy;
    u_xlat8.xyz = u_xlat16_16.xyz * u_xlat8.xyz;
    u_xlat16_16.xyz = u_xlat8.xyz * u_xlat16_13.xzw + (-u_xlat16_13.xzw);
    u_xlat16_33.xyz = vec3(u_xlat16_75) * u_xlat16_16.xyz + u_xlat16_13.xzw;
    u_xlat16_13.xyz = u_xlat16_33.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat65 = min(u_xlat0.x, u_xlat10_2.z);
    u_xlat16_13.xyz = vec3(u_xlat65) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat65) * u_xlat16_13.xyz;
    u_xlat16_16.xyz = u_xlat16_33.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat65) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat65) * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat65) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_33.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(u_xlat65) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_73) * u_xlat16_16.xyz;
    u_xlati65 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati65].xyz;
    u_xlati65 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati66 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati65].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_33.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_33.x = u_xlat0.w * 0.5;
    u_xlat16_54 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_75 = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_75 = u_xlat16_75 + u_xlat16_75;
    u_xlat8.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_75) + (-u_xlat16_14.xyz);
    u_xlat16_1.z = dot(u_xlat16_10.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_9.w);
    u_xlat16_31.x = u_xlat16_10.x + 1.0;
    u_xlat16_31.x = min(u_xlat16_31.x, 15.0);
    u_xlat16_9.x = u_xlat16_31.x * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_10.x * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_10.x = u_xlat16_10.z * 15.0 + (-u_xlat16_10.x);
    u_xlat16_31.x = u_xlat16_66 + (-u_xlat16_46);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_31.x + u_xlat16_46;
    u_xlat16_10.x = u_xlat16_73 * u_xlat16_10.x;
    u_xlat65 = u_xlat65 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat65 * u_xlat16_54 + u_xlat16_33.x;
    u_xlat16_31.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_52.x = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_52.x + u_xlat16_31.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat8.xyz);
    u_xlat5.xyz = vec3(u_xlat16_74) * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat13.y = u_xlat5.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_31.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat4.y = u_xlat16_1.x;
    u_xlat16_44.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_33.xyz = u_xlat16_15.xyz * u_xlat16_44.xxx + u_xlat16_44.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat4.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyw = vec3(u_xlat16_76) * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb44 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb44)) ? u_xlat16_14.xyw : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_33.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_31.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_33.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_33.xyz;
    u_xlat16_10.xyz = u_xlat3.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat10_4.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat10_4.w * _albedoColor.w;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 1.17549435e-38);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat7.xyz;
    u_xlat4.x = u_xlat2.x * u_xlat16_12.x + _Sanshe_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_12.x + _Sanshe_Y;
    u_xlat4.z = u_xlat16_14.z;
    u_xlat44 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat44 = (-u_xlat44) + 1.0;
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat44 = max(u_xlat44, 0.00048828125);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * _Sanshe_Fw;
    u_xlat44 = exp2(u_xlat44);
    u_xlat2.z = u_xlat44 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb65 = _UseSansheMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb65)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_52.xy = u_xlat16_5.xy * u_xlat16_52.xx + u_xlat16_52.yy;
    u_xlat4.x = u_xlat2.x * u_xlat16_12.x + _Sanshe2_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_12.x + _Sanshe2_Y;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = max(u_xlat2.x, 0.00048828125);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat2.xz = u_xlat2.xz * u_xlat16_52.yx;
    u_xlat3.xyz = u_xlat2.xxx * _Sanshe2_color.zxy;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat2.zzz * _Sanshe_color.zxy + u_xlat3.xyz;
    u_xlat16_52.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_52.x = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat16_52.xxx * _DirectionalDir.xyz;
    u_xlat23.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.xyz = u_xlat23.xxx * _DirectionalColor.zxy;
    u_xlat23.xyz = u_xlat23.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb3 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52.x = u_xlat16_5.z * u_xlat16_52.x + u_xlat16_52.y;
    u_xlat16_12.xyz = u_xlat23.xyz * u_xlat16_52.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat23.x = dot(u_xlat16_11.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat23.x = u_xlat23.x + -0.25;
    u_xlat23.x = u_xlat23.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat44 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat65 = u_xlat3.x * 15.0 + (-u_xlat44);
    u_xlat0.x = u_xlat44 * 0.0625 + u_xlat0.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat65) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_52.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat16_52.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat44)) + u_xlat4.xyz;
    u_xlat65 = u_xlat23.x * -2.0 + 3.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat65;
    u_xlat2.x = max(u_xlat23.x, u_xlat2.x);
    u_xlat16_52.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_52.x = u_xlat2.x * u_xlat16_52.x + _Saturation;
    u_xlat2.xyz = u_xlat16_52.xxx * u_xlat4.xyz + vec3(u_xlat44);
    u_xlat16_52.xy = (-u_xlat2.zy) + u_xlat2.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(u_xlat2.y>=u_xlat2.z);
#else
    u_xlatb65 = u_xlat2.y>=u_xlat2.z;
#endif
    u_xlat16_11.x = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_0.xy = u_xlat16_11.xx * u_xlat16_52.xy + u_xlat2.zy;
    u_xlat16_1.w = (-u_xlat2.x);
    u_xlat16_52.x = float(1.0);
    u_xlat16_52.y = float(-1.0);
    u_xlat16_0.zw = u_xlat16_11.xx * u_xlat16_52.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_4.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_4.x = u_xlat16_1.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat2.x>=u_xlat16_0.x);
#else
    u_xlatb23 = u_xlat2.x>=u_xlat16_0.x;
#endif
    u_xlat16_52.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_73 = u_xlat16_52.x * u_xlat16_4.w + u_xlat2.x;
    u_xlat16_11.xyz = u_xlat16_52.xxx * u_xlat16_4.xyz + u_xlat16_0.xyw;
    u_xlat16_52.x = min(u_xlat16_73, u_xlat16_11.y);
    u_xlat16_73 = u_xlat16_73 + (-u_xlat16_11.y);
    u_xlat16_52.x = (-u_xlat16_52.x) + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_52.x * 6.0 + 9.99999975e-05;
    u_xlat16_73 = u_xlat16_73 / u_xlat16_32.x;
    u_xlat16_73 = u_xlat16_73 + u_xlat16_11.z;
    u_xlat16_73 = abs(u_xlat16_73) + _HueShift;
    u_xlat16_32.xyz = vec3(u_xlat16_73) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_32.xyz = fract(u_xlat16_32.xyz);
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_32.xyz = abs(u_xlat16_32.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_32.xyz = u_xlat16_32.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_73 = u_xlat16_11.x + 9.99999975e-05;
    u_xlat16_52.x = u_xlat16_52.x / u_xlat16_73;
    u_xlat16_32.xyz = u_xlat16_52.xxx * u_xlat16_32.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_32.xyz * u_xlat16_11.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb2 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_52.xxx * u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat16_52.yyy + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_10.x : u_xlat16_31.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
mediump vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
ivec3 u_xlati8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec2 u_xlat21;
mediump vec3 u_xlat10_21;
bvec3 u_xlatb21;
float u_xlat22;
vec3 u_xlat23;
bool u_xlatb23;
vec3 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat42;
bool u_xlatb42;
float u_xlat44;
mediump vec2 u_xlat16_44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_46;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_52;
mediump float u_xlat16_54;
float u_xlat65;
int u_xlati65;
bool u_xlatb65;
mediump float u_xlat16_66;
int u_xlati66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
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
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat68 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat68 = max(u_xlat68, 1.17549435e-38);
    u_xlat68 = inversesqrt(u_xlat68);
    u_xlat7.xyz = vec3(u_xlat68) * u_xlat5.xyz;
    u_xlat25.x = dot(u_xlat7.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat7.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat22 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat22 = (-u_xlat1.x) + u_xlat22;
    u_xlat0.z = _ShadowBias.y * u_xlat22 + u_xlat1.x;
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
    u_xlat21.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb21.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb21.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb21.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb21.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb21.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb21.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_48.xy = u_xlat10_21.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat21.x = u_xlat10_21.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_48.x * _shadowStrength;
    u_xlat42 = u_xlat16_48.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat68) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_69 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_69 = inversesqrt(u_xlat16_69);
    u_xlat16_10.xyz = vec3(u_xlat16_69) * u_xlat16_10.xyz;
    u_xlat16_69 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_69) + u_xlat16_73;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_69 = u_xlat16_1.w * u_xlat16_73 + u_xlat16_69;
    u_xlat16_69 = u_xlat16_1.w * u_xlat16_69;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_73;
    u_xlat16_11.x = sqrt(u_xlat16_69);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_69));
    u_xlat16_32.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xyz = _sssColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_75 = _sssIntensity * _sssIntensity;
    u_xlat16_75 = u_xlat16_2 * u_xlat16_75;
    u_xlat10_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.x = (-u_xlat10_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_34 = sqrt(u_xlat16_75);
    u_xlat16_12.xyz = vec3(u_xlat16_34) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _sssColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_34) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_34) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_32.xyz = u_xlat16_17.xyz * u_xlat16_32.xyz + (-u_xlat3.xxx);
    u_xlat16_32.xyz = vec3(u_xlat16_34) * u_xlat16_32.xyz + u_xlat3.xxx;
    u_xlat10_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat10_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat10_4.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat10_4.zxy * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat10_2.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xzw = u_xlat16_13.xxx * u_xlat16_19.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_13.xzw;
    u_xlat16_32.xyz = u_xlat16_32.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_32.xyz = u_xlat16_6.xyz * u_xlat16_32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb65 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_78);
    u_xlat16_18.xyz = u_xlat24.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb65 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_19.xy = (bool(u_xlatb65)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat65 = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_79);
    u_xlat16_79 = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_78 = float(1.0) / float(u_xlat16_78);
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_79;
    u_xlat16_78 = max(u_xlat16_19.x, u_xlat16_78);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_18.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_19.xyz = vec3(u_xlat65) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_77 = u_xlat42 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat21.x * u_xlat16_11.x;
    u_xlat16_20.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_77) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_12.xyz + (-vec3(u_xlat65));
    u_xlat16_12.xyz = vec3(u_xlat16_34) * u_xlat16_12.xyz + vec3(u_xlat65);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xzw;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat42) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat65) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat24.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_33.yyy + u_xlat16_18.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat42 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_54);
    u_xlat16_54 = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_12.x = u_xlat16_54 * u_xlat16_12.x;
    u_xlat16_12.x = max(u_xlat16_33.x, u_xlat16_12.x);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_12.x;
    u_xlat16_12.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = vec3(u_xlat42) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz + (-vec3(u_xlat42));
    u_xlat16_14.xyz = vec3(u_xlat16_34) * u_xlat16_14.xyz + vec3(u_xlat42);
    u_xlat16_14.xyz = u_xlat16_13.xzw * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * vec3(u_xlat42) + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat10_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_74 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat21.x = (-u_xlat3.x) * u_xlat16_74 + u_xlat3.x;
    u_xlat21.x = u_xlat3.x * u_xlat21.x + u_xlat16_74;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat3.x;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat2.xyw * u_xlat16_12.xxx;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat4.x) * u_xlat16_74 + u_xlat4.x;
    u_xlat42 = u_xlat4.x * u_xlat42 + u_xlat16_74;
    u_xlat42 = sqrt(u_xlat42);
    u_xlat21.y = u_xlat42 + u_xlat4.x;
    u_xlat21.xy = u_xlat21.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat21.x = u_xlat21.x * u_xlat21.y;
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat21.x = min(u_xlat21.x, 16.0);
    u_xlat24.xyz = u_xlat2.xyw * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat24.xyz = vec3(u_xlat42) * u_xlat24.xyz;
    u_xlat42 = dot(u_xlat7.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat16_33.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.x = min(max(u_xlat16_33.x, 0.0), 1.0);
#else
    u_xlat16_33.x = clamp(u_xlat16_33.x, 0.0, 1.0);
#endif
    u_xlat65 = (-u_xlat16_33.x) + 1.0;
    u_xlat24.x = u_xlat42 * u_xlat42;
    u_xlat45 = u_xlat16_74 + -1.0;
    u_xlat24.x = u_xlat24.x * u_xlat45 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat16_74 / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * 0.318309873;
    u_xlat24.x = min(u_xlat24.x, 16.0);
    u_xlat24.x = u_xlat21.x * u_xlat24.x;
    u_xlat16_33.x = u_xlat65 * u_xlat65;
    u_xlat16_33.x = u_xlat65 * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat65 * u_xlat16_33.x;
    u_xlat16_54 = u_xlat65 * u_xlat16_33.x;
    u_xlat65 = (-u_xlat16_33.x) * u_xlat65 + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat16_15.xyz;
    u_xlat65 = u_xlat16_15.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat65) * vec3(u_xlat16_54) + u_xlat8.xyz;
    u_xlat24.xyz = u_xlat24.xxx * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.zxy;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat24.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_16.xyz + _sssColorOcc.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat65 = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat65 = max(u_xlat65, 0.0);
    u_xlat8.xyz = _sssColorBase.zxy + (-_sssColorBack.zxy);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat8.xyz + _sssColorBack.zxy;
    u_xlat8.xyz = u_xlat16_16.xyz * u_xlat8.xyz;
    u_xlat16_16.xyz = u_xlat8.xyz * u_xlat16_13.xzw + (-u_xlat16_13.xzw);
    u_xlat16_33.xyz = vec3(u_xlat16_75) * u_xlat16_16.xyz + u_xlat16_13.xzw;
    u_xlat16_13.xyz = u_xlat16_33.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat65 = min(u_xlat0.x, u_xlat10_2.z);
    u_xlat16_13.xyz = vec3(u_xlat65) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat65) * u_xlat16_13.xyz;
    u_xlat16_16.xyz = u_xlat16_33.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat65) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat65) * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat65) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_33.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_16.xyz * vec3(u_xlat65) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_73) * u_xlat16_16.xyz;
    u_xlati65 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati65].xyz;
    u_xlati65 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati66 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati65].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_76 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_33.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_33.x = u_xlat0.w * 0.5;
    u_xlat16_54 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_75 = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_75 = u_xlat16_75 + u_xlat16_75;
    u_xlat8.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_75) + (-u_xlat16_14.xyz);
    u_xlat16_1.z = dot(u_xlat16_10.xyz, u_xlat8.xyz);
    u_xlat65 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_9.w);
    u_xlat16_31.x = u_xlat16_10.x + 1.0;
    u_xlat16_31.x = min(u_xlat16_31.x, 15.0);
    u_xlat16_9.x = u_xlat16_31.x * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_10.x * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_46 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_10.x = u_xlat16_10.z * 15.0 + (-u_xlat16_10.x);
    u_xlat16_31.x = u_xlat16_66 + (-u_xlat16_46);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_31.x + u_xlat16_46;
    u_xlat16_10.x = u_xlat16_73 * u_xlat16_10.x;
    u_xlat65 = u_xlat65 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat65 * u_xlat16_54 + u_xlat16_33.x;
    u_xlat16_31.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_52.x = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_52.x + u_xlat16_31.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat68) + (-u_xlat8.xyz);
    u_xlat5.xyz = vec3(u_xlat16_74) * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat13.y = u_xlat5.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_31.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat4.y = u_xlat16_1.x;
    u_xlat16_44.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_33.xyz = u_xlat16_15.xyz * u_xlat16_44.xxx + u_xlat16_44.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat4.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyw = vec3(u_xlat16_76) * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb44 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb44)) ? u_xlat16_14.xyw : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_33.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_31.xyz;
    u_xlat16_33.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_33.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_33.xyz;
    u_xlat16_10.xyz = u_xlat3.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat10_4.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat10_4.w * _albedoColor.w;
    u_xlat44 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 1.17549435e-38);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat7.xyz;
    u_xlat4.x = u_xlat2.x * u_xlat16_12.x + _Sanshe_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_12.x + _Sanshe_Y;
    u_xlat4.z = u_xlat16_14.z;
    u_xlat44 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat44 = (-u_xlat44) + 1.0;
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat44 = max(u_xlat44, 0.00048828125);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * _Sanshe_Fw;
    u_xlat44 = exp2(u_xlat44);
    u_xlat2.z = u_xlat44 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb65 = _UseSansheMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb65)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_52.xy = u_xlat16_5.xy * u_xlat16_52.xx + u_xlat16_52.yy;
    u_xlat4.x = u_xlat2.x * u_xlat16_12.x + _Sanshe2_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_12.x + _Sanshe2_Y;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = max(u_xlat2.x, 0.00048828125);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat2.xz = u_xlat2.xz * u_xlat16_52.yx;
    u_xlat3.xyz = u_xlat2.xxx * _Sanshe2_color.zxy;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat2.zzz * _Sanshe_color.zxy + u_xlat3.xyz;
    u_xlat16_52.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_52.x = inversesqrt(u_xlat16_52.x);
    u_xlat16_14.xyz = u_xlat16_52.xxx * _DirectionalDir.xyz;
    u_xlat23.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.xyz = u_xlat23.xxx * _DirectionalColor.zxy;
    u_xlat23.xyz = u_xlat23.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb3 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_52.x = u_xlat16_5.z * u_xlat16_52.x + u_xlat16_52.y;
    u_xlat16_12.xyz = u_xlat23.xyz * u_xlat16_52.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat23.x = dot(u_xlat16_11.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat23.x = u_xlat23.x + -0.25;
    u_xlat23.x = u_xlat23.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat44 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat65 = u_xlat3.x * 15.0 + (-u_xlat44);
    u_xlat0.x = u_xlat44 * 0.0625 + u_xlat0.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat65) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_52.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat16_52.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat44)) + u_xlat4.xyz;
    u_xlat65 = u_xlat23.x * -2.0 + 3.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat65;
    u_xlat2.x = max(u_xlat23.x, u_xlat2.x);
    u_xlat16_52.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_52.x = u_xlat2.x * u_xlat16_52.x + _Saturation;
    u_xlat2.xyz = u_xlat16_52.xxx * u_xlat4.xyz + vec3(u_xlat44);
    u_xlat16_52.xy = (-u_xlat2.zy) + u_xlat2.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(u_xlat2.y>=u_xlat2.z);
#else
    u_xlatb65 = u_xlat2.y>=u_xlat2.z;
#endif
    u_xlat16_11.x = (u_xlatb65) ? 1.0 : 0.0;
    u_xlat16_0.xy = u_xlat16_11.xx * u_xlat16_52.xy + u_xlat2.zy;
    u_xlat16_1.w = (-u_xlat2.x);
    u_xlat16_52.x = float(1.0);
    u_xlat16_52.y = float(-1.0);
    u_xlat16_0.zw = u_xlat16_11.xx * u_xlat16_52.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_4.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_4.x = u_xlat16_1.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat2.x>=u_xlat16_0.x);
#else
    u_xlatb23 = u_xlat2.x>=u_xlat16_0.x;
#endif
    u_xlat16_52.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_73 = u_xlat16_52.x * u_xlat16_4.w + u_xlat2.x;
    u_xlat16_11.xyz = u_xlat16_52.xxx * u_xlat16_4.xyz + u_xlat16_0.xyw;
    u_xlat16_52.x = min(u_xlat16_73, u_xlat16_11.y);
    u_xlat16_73 = u_xlat16_73 + (-u_xlat16_11.y);
    u_xlat16_52.x = (-u_xlat16_52.x) + u_xlat16_11.x;
    u_xlat16_32.x = u_xlat16_52.x * 6.0 + 9.99999975e-05;
    u_xlat16_73 = u_xlat16_73 / u_xlat16_32.x;
    u_xlat16_73 = u_xlat16_73 + u_xlat16_11.z;
    u_xlat16_73 = abs(u_xlat16_73) + _HueShift;
    u_xlat16_32.xyz = vec3(u_xlat16_73) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_32.xyz = fract(u_xlat16_32.xyz);
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_32.xyz = abs(u_xlat16_32.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_32.xyz = u_xlat16_32.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_73 = u_xlat16_11.x + 9.99999975e-05;
    u_xlat16_52.x = u_xlat16_52.x / u_xlat16_73;
    u_xlat16_32.xyz = u_xlat16_52.xxx * u_xlat16_32.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_32.xyz * u_xlat16_11.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb2 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_52.xxx * u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat16_52.yyy + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_10.x : u_xlat16_31.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
bvec4 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec4 u_xlat18;
mediump float u_xlat16_18;
int u_xlati18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
ivec3 u_xlati22;
vec3 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat29;
mediump vec2 u_xlat10_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_34;
vec3 u_xlat41;
float u_xlat46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
float u_xlat66;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
int u_xlati73;
bool u_xlatb73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat87;
mediump float u_xlat16_87;
float u_xlat89;
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
    u_xlat16_24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 6.10351563e-05);
    u_xlat16_47.x = inversesqrt(u_xlat16_24);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_47.xxx;
    u_xlat16_47.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_47.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_47.x);
#endif
    u_xlat16_47.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_47.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_47.yyy + u_xlat16_3.xyz;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_70);
    u_xlat16_70 = u_xlat16_24 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24 = float(1.0) / float(u_xlat16_24);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_24 = u_xlat16_70 * u_xlat16_24;
    u_xlat16_24 = max(u_xlat16_47.x, u_xlat16_24);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_24;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_70 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_70) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat16_3.xyz;
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
    u_xlat69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat0.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_70 = _sssIntensity * _sssIntensity;
    u_xlat16_70 = u_xlat16_5.x * u_xlat16_70;
    u_xlat10_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_71 = (-u_xlat10_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_70);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_30.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_30.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_10.xyz = vec3(u_xlat16_77) * u_xlat16_10.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_78 = (-u_xlat16_77) + u_xlat16_78;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_78 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_77;
    u_xlat16_78 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_78 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_77);
    u_xlat6 = min(u_xlat16_77, 1.0);
    u_xlatb12 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_12.x = (u_xlatb12.x) ? float(1.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb12.y) ? float(0.0) : float(1.0);
    u_xlat16_12.z = (u_xlatb12.z) ? float(1.0) : float(0.0);
    u_xlat16_12.w = (u_xlatb12.w) ? float(0.0) : float(1.0);
    u_xlat10_29.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat29.xy = u_xlat10_29.xy * u_xlat16_12.xz + u_xlat16_12.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xy = min(max(u_xlat29.xy, 0.0), 1.0);
#else
    u_xlat29.xy = clamp(u_xlat29.xy, 0.0, 1.0);
#endif
    u_xlat16_34.xy = u_xlat29.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_34.xyz = u_xlat16_34.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + (-vec3(u_xlat73));
    u_xlat16_14.xyz = u_xlat16_7.xxx * u_xlat16_14.xyz + vec3(u_xlat73);
    u_xlat10_9 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat10_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat10_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat29.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat73) * u_xlat16_1.xyz;
    u_xlat73 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + (-vec3(u_xlat73));
    u_xlat16_14.xyz = u_xlat16_7.xxx * u_xlat16_14.xyz + vec3(u_xlat73);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb29 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_11.xxx * u_xlat18.xyz;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb29 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb29)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.yyy + u_xlat16_19.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat29.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_11.x;
    u_xlat16_77 = max(u_xlat16_17.x, u_xlat16_77);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_77;
    u_xlat16_14.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat29.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xyz + (-u_xlat29.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat29.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat29.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat10_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat29.x = (-u_xlat73) * u_xlat16_2.x + u_xlat73;
    u_xlat29.x = u_xlat73 * u_xlat29.x + u_xlat16_2.x;
    u_xlat18.x = sqrt(u_xlat29.x);
    u_xlat18.x = u_xlat73 + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat41.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25.x = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_8.xyz = u_xlat16_25.xxx * u_xlat41.xyz;
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat20.x) * u_xlat16_2.x + u_xlat20.x;
    u_xlat66 = u_xlat20.x * u_xlat66 + u_xlat16_2.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat20.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat66;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat21.xyz = u_xlat41.xyz * u_xlat16_25.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat21.xyz = vec3(u_xlat87) * u_xlat21.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_48.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48.x = min(max(u_xlat16_48.x, 0.0), 1.0);
#else
    u_xlat16_48.x = clamp(u_xlat16_48.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_48.x) + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat89 = u_xlat16_2.x + -1.0;
    u_xlat87 = u_xlat87 * u_xlat89 + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat16_2.x / u_xlat87;
    u_xlat18.w = u_xlat87 * 0.318309873;
    u_xlat18.xw = min(u_xlat18.xw, vec2(16.0, 16.0));
    u_xlat18.x = u_xlat18.x * u_xlat18.w;
    u_xlat16_48.x = u_xlat66 * u_xlat66;
    u_xlat16_48.x = u_xlat66 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat66 * u_xlat16_48.x;
    u_xlat16_71 = u_xlat66 * u_xlat16_48.x;
    u_xlat87 = (-u_xlat16_48.x) * u_xlat66 + 1.0;
    u_xlat16_11.xyz = u_xlat16_5.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat16_11.xyz * vec3(u_xlat87);
    u_xlat87 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat87) * vec3(u_xlat16_71) + u_xlat21.xyz;
    u_xlat21.xyz = u_xlat18.xxx * u_xlat21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat16_1.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_14.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_14.xyz + _sssColorOcc.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat4.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat73 = dot(u_xlat16_17.xyz, u_xlat15.xyz);
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat22.xyz = vec3(u_xlat73) * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat22.xyz = u_xlat16_14.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_14.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat73 = min(u_xlat10_3.z, u_xlat6);
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat73) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_19.xyz * vec3(u_xlat73) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati73 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati73].xyz;
    u_xlati73 = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati18 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati73].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_1.xyz;
    u_xlat16_48.x = dot((-u_xlat16_8.xyz), u_xlat4.xyz);
    u_xlat16_48.x = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat22.xyz = (-u_xlat4.xyz) * u_xlat16_48.xxx + (-u_xlat16_8.xyz);
    u_xlat16_5.z = dot(u_xlat16_10.xyz, u_xlat22.xyz);
    u_xlat73 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_8.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48.x = floor(u_xlat16_7.w);
    u_xlat16_71 = u_xlat16_48.x + 1.0;
    u_xlat16_71 = min(u_xlat16_71, 15.0);
    u_xlat16_7.x = u_xlat16_71 * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_7.x = u_xlat16_48.x * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_48.x = u_xlat16_8.w * 15.0 + (-u_xlat16_48.x);
    u_xlat16_71 = (-u_xlat16_87) + u_xlat16_18;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_71 + u_xlat16_87;
    u_xlat16_48.x = u_xlat16_79 * u_xlat16_48.x;
    u_xlat73 = u_xlat73 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat6 * 0.5;
    u_xlat16_71 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_48.x = u_xlat73 * u_xlat16_71 + u_xlat16_48.x;
    u_xlat16_71 = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat16_8.x = (-u_xlat16_48.x) * 2.0 + 1.0;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_8.x + u_xlat16_71;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat6;
    u_xlat16_48.x = min(u_xlat16_48.x, u_xlat10_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat69) + (-u_xlat22.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat22.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat20.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_8.xyw = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_2.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_11.xyz;
    u_xlat16_2.xzw = u_xlat16_48.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xzw * u_xlat16_8.xyw + u_xlat16_1.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_8.xyw;
    u_xlat16_2.xzw = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xzw;
    u_xlat16_70 = dot(u_xlat16_2.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat10_9.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat10_9.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat20.x = u_xlat41.x * u_xlat16_25.x + _Sanshe_X;
    u_xlat20.y = u_xlat41.y * u_xlat16_25.x + _Sanshe_Y;
    u_xlat20.z = u_xlat16_8.z;
    u_xlat69 = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = max(u_xlat69, 0.00048828125);
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Fw;
    u_xlat69 = exp2(u_xlat69);
    u_xlat0.w = u_xlat69 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb73 = _UseSansheMask>=0.5;
#endif
    u_xlat16_48.xy = (bool(u_xlatb73)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_48.xy = u_xlat16_21.xy * u_xlat16_48.xx + u_xlat16_48.yy;
    u_xlat20.x = u_xlat41.x * u_xlat16_25.x + _Sanshe2_X;
    u_xlat20.y = u_xlat41.y * u_xlat16_25.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_48.yx;
    u_xlat18.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_25.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat18.xyz;
    u_xlat16_8.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_8.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _DirectionalDir.xyz;
    u_xlat23.x = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.xyz = u_xlat23.xxx * _DirectionalColor.xyz;
    u_xlat23.xyz = u_xlat23.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.x = u_xlat16_21.z * u_xlat16_8.x + u_xlat16_8.y;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat16_8.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_1.xyz + u_xlat16_25.xyz;
    u_xlat23.x = dot(u_xlat16_1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat23.x = u_xlat23.x + -0.25;
    u_xlat23.x = u_xlat23.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = max(u_xlat16_25.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_25.xyz + u_xlat16_1.xyz;
    u_xlat16_25.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_25.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat46)) + u_xlat4.xyz;
    u_xlat69 = u_xlat23.x * -2.0 + 3.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat69;
    u_xlat0.x = max(u_xlat23.x, u_xlat0.x);
    u_xlat16_25.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_25.x = u_xlat0.x * u_xlat16_25.x + _Saturation;
    u_xlat0.xyz = u_xlat16_25.xxx * u_xlat4.xyz + vec3(u_xlat46);
    u_xlat16_25.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb69 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_71 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_3.xy = vec2(u_xlat16_71) * u_xlat16_25.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_25.x = float(1.0);
    u_xlat16_25.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_71) * u_xlat16_25.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb23 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_25.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_48.x = u_xlat16_25.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_8.xyz = u_xlat16_25.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_25.x = min(u_xlat16_48.x, u_xlat16_8.y);
    u_xlat16_48.x = u_xlat16_48.x + (-u_xlat16_8.y);
    u_xlat16_25.x = (-u_xlat16_25.x) + u_xlat16_8.x;
    u_xlat16_71 = u_xlat16_25.x * 6.0 + 9.99999975e-05;
    u_xlat16_48.x = u_xlat16_48.x / u_xlat16_71;
    u_xlat16_48.x = u_xlat16_48.x + u_xlat16_8.z;
    u_xlat16_48.x = abs(u_xlat16_48.x) + _HueShift;
    u_xlat16_31.xyz = u_xlat16_48.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_31.xyz = fract(u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_31.xyz = abs(u_xlat16_31.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_31.xyz = u_xlat16_31.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_25.x = u_xlat16_25.x / u_xlat16_48.x;
    u_xlat16_25.xyz = u_xlat16_25.xxx * u_xlat16_31.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_8.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_8.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_2.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(6) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
bvec4 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec4 u_xlat18;
mediump float u_xlat16_18;
int u_xlati18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
ivec3 u_xlati22;
vec3 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
vec2 u_xlat29;
mediump vec2 u_xlat10_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_34;
vec3 u_xlat41;
float u_xlat46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
float u_xlat66;
float u_xlat69;
bool u_xlatb69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat73;
int u_xlati73;
bool u_xlatb73;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat87;
mediump float u_xlat16_87;
float u_xlat89;
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
    u_xlat16_24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 6.10351563e-05);
    u_xlat16_47.x = inversesqrt(u_xlat16_24);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_47.xxx;
    u_xlat16_47.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_47.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_47.x);
#endif
    u_xlat16_47.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_47.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_47.yyy + u_xlat16_3.xyz;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_70);
    u_xlat16_70 = u_xlat16_24 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_24 = float(1.0) / float(u_xlat16_24);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_24 = u_xlat16_70 * u_xlat16_24;
    u_xlat16_24 = max(u_xlat16_47.x, u_xlat16_24);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_24;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_70 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_70) + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat16_3.xyz;
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
    u_xlat69 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat4.xyz = vec3(u_xlat69) * u_xlat0.xyz;
    u_xlat73 = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_70 = _sssIntensity * _sssIntensity;
    u_xlat16_70 = u_xlat16_5.x * u_xlat16_70;
    u_xlat10_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_71 = (-u_xlat10_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_7.x = sqrt(u_xlat16_70);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_30.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat16_30.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_8.xyz);
    u_xlat16_9.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_10.xyz = vec3(u_xlat16_77) * u_xlat16_10.xyz;
    u_xlat16_77 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_77 = min(max(u_xlat16_77, 0.0), 1.0);
#else
    u_xlat16_77 = clamp(u_xlat16_77, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_77 * 0.5 + 0.5;
    u_xlat16_78 = (-u_xlat16_77) + u_xlat16_78;
    u_xlat16_79 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_78 + u_xlat16_77;
    u_xlat16_77 = u_xlat16_5.w * u_xlat16_77;
    u_xlat16_78 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_78 + -1.0;
    u_xlat16_79 = _occlusionScale * u_xlat16_79 + 1.0;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_79;
    u_xlat16_11.x = sqrt(u_xlat16_77);
    u_xlat6 = min(u_xlat16_77, 1.0);
    u_xlatb12 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_12.x = (u_xlatb12.x) ? float(1.0) : float(0.0);
    u_xlat16_12.y = (u_xlatb12.y) ? float(0.0) : float(1.0);
    u_xlat16_12.z = (u_xlatb12.z) ? float(1.0) : float(0.0);
    u_xlat16_12.w = (u_xlatb12.w) ? float(0.0) : float(1.0);
    u_xlat10_29.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat29.xy = u_xlat10_29.xy * u_xlat16_12.xz + u_xlat16_12.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xy = min(max(u_xlat29.xy, 0.0), 1.0);
#else
    u_xlat29.xy = clamp(u_xlat29.xy, 0.0, 1.0);
#endif
    u_xlat16_34.xy = u_xlat29.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_34.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_34.xyz = u_xlat16_34.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + (-vec3(u_xlat73));
    u_xlat16_14.xyz = u_xlat16_7.xxx * u_xlat16_14.xyz + vec3(u_xlat73);
    u_xlat10_9 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat10_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat10_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_16.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat29.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat73) * u_xlat16_1.xyz;
    u_xlat73 = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = vec3(u_xlat73) * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + (-vec3(u_xlat73));
    u_xlat16_14.xyz = u_xlat16_7.xxx * u_xlat16_14.xyz + vec3(u_xlat73);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb29 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_71 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat18.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_77 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat16_77 = max(u_xlat16_77, 6.10351563e-05);
    u_xlat16_11.x = inversesqrt(u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_11.xxx * u_xlat18.xyz;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb29 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb29)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.yyy + u_xlat16_19.xyz;
    u_xlat16_11.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat29.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_77 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_77 = float(1.0) / float(u_xlat16_77);
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_77 = u_xlat16_77 * u_xlat16_11.x;
    u_xlat16_77 = max(u_xlat16_17.x, u_xlat16_77);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_77;
    u_xlat16_14.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_2.xyz = u_xlat29.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_34.xyz + (-u_xlat29.xxx);
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat29.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat29.yyy * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xy = u_xlat10_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat29.x = (-u_xlat73) * u_xlat16_2.x + u_xlat73;
    u_xlat29.x = u_xlat73 * u_xlat29.x + u_xlat16_2.x;
    u_xlat18.x = sqrt(u_xlat29.x);
    u_xlat18.x = u_xlat73 + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat41.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25.x = dot(u_xlat41.xyz, u_xlat41.xyz);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_8.xyz = u_xlat16_25.xxx * u_xlat41.xyz;
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat20.x) * u_xlat16_2.x + u_xlat20.x;
    u_xlat66 = u_xlat20.x * u_xlat66 + u_xlat16_2.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat20.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat66;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat21.xyz = u_xlat41.xyz * u_xlat16_25.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat21.xyz = vec3(u_xlat87) * u_xlat21.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_48.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48.x = min(max(u_xlat16_48.x, 0.0), 1.0);
#else
    u_xlat16_48.x = clamp(u_xlat16_48.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_48.x) + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat89 = u_xlat16_2.x + -1.0;
    u_xlat87 = u_xlat87 * u_xlat89 + 1.0;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat16_2.x / u_xlat87;
    u_xlat18.w = u_xlat87 * 0.318309873;
    u_xlat18.xw = min(u_xlat18.xw, vec2(16.0, 16.0));
    u_xlat18.x = u_xlat18.x * u_xlat18.w;
    u_xlat16_48.x = u_xlat66 * u_xlat66;
    u_xlat16_48.x = u_xlat66 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat66 * u_xlat16_48.x;
    u_xlat16_71 = u_xlat66 * u_xlat16_48.x;
    u_xlat87 = (-u_xlat16_48.x) * u_xlat66 + 1.0;
    u_xlat16_11.xyz = u_xlat16_5.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat16_11.xyz * vec3(u_xlat87);
    u_xlat87 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat87) * vec3(u_xlat16_71) + u_xlat21.xyz;
    u_xlat21.xyz = u_xlat18.xxx * u_xlat21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat16_1.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_14.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_5.www * u_xlat16_14.xyz + _sssColorOcc.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat4.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat4.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat4.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_17.y = u_xlat16_10.y;
    u_xlat73 = dot(u_xlat16_17.xyz, u_xlat15.xyz);
    u_xlat73 = max(u_xlat73, 0.0);
    u_xlat22.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat22.xyz = vec3(u_xlat73) * u_xlat22.xyz + _sssColorBack.xyz;
    u_xlat22.xyz = u_xlat16_14.xyz * u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat22.xyz * u_xlat16_16.xyz + (-u_xlat16_16.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_14.xyz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat73 = min(u_xlat10_3.z, u_xlat6);
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat73) * u_xlat16_16.xyz;
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_19.xyz = vec3(u_xlat73) * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat73) + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_19.xyz * vec3(u_xlat73) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati22.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_79) * u_xlat16_19.xyz;
    u_xlati73 = int(int_bitfieldInsert(2,u_xlati22.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati73].xyz;
    u_xlati73 = int(uint(uint(u_xlati22.x) & 1u));
    u_xlati18 = (u_xlati22.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati73].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_19.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_16.xyz + u_xlat16_1.xyz;
    u_xlat16_48.x = dot((-u_xlat16_8.xyz), u_xlat4.xyz);
    u_xlat16_48.x = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat22.xyz = (-u_xlat4.xyz) * u_xlat16_48.xxx + (-u_xlat16_8.xyz);
    u_xlat16_5.z = dot(u_xlat16_10.xyz, u_xlat22.xyz);
    u_xlat73 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16_8.xyw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_7.yzw = u_xlat16_8.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48.x = floor(u_xlat16_7.w);
    u_xlat16_71 = u_xlat16_48.x + 1.0;
    u_xlat16_71 = min(u_xlat16_71, 15.0);
    u_xlat16_7.x = u_xlat16_71 * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_18 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_7.x = u_xlat16_48.x * 16.0 + u_xlat16_7.z;
    u_xlat16_8.xy = u_xlat16_7.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_48.x = u_xlat16_8.w * 15.0 + (-u_xlat16_48.x);
    u_xlat16_71 = (-u_xlat16_87) + u_xlat16_18;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_71 + u_xlat16_87;
    u_xlat16_48.x = u_xlat16_79 * u_xlat16_48.x;
    u_xlat73 = u_xlat73 * u_xlat16_48.x;
    u_xlat16_48.x = u_xlat6 * 0.5;
    u_xlat16_71 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_48.x = u_xlat73 * u_xlat16_71 + u_xlat16_48.x;
    u_xlat16_71 = u_xlat16_48.x + u_xlat16_48.x;
    u_xlat16_8.x = (-u_xlat16_48.x) * 2.0 + 1.0;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat16_8.x + u_xlat16_71;
    u_xlat16_48.x = u_xlat16_48.x * u_xlat6;
    u_xlat16_48.x = min(u_xlat16_48.x, u_xlat10_3.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat69) + (-u_xlat22.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat22.xyz;
    u_xlat16_10.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_10.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat10.y = u_xlat0.y;
    u_xlat10.xz = u_xlat16_10.xz;
    u_xlat16_2.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat20.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_8.xyw = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat10.xyz, u_xlat16_2.x);
    u_xlat16_11.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_70) * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * u_xlat16_11.xyz;
    u_xlat16_2.xzw = u_xlat16_48.xxx * u_xlat16_8.xyw;
    u_xlat16_8.xyw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyw = min(max(u_xlat16_8.xyw, 0.0), 1.0);
#else
    u_xlat16_8.xyw = clamp(u_xlat16_8.xyw, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xzw * u_xlat16_8.xyw + u_xlat16_1.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xzw * u_xlat16_8.xyw;
    u_xlat16_2.xzw = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xzw;
    u_xlat16_70 = dot(u_xlat16_2.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat10_9.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat10_9.w * _albedoColor.w;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat20.x = u_xlat41.x * u_xlat16_25.x + _Sanshe_X;
    u_xlat20.y = u_xlat41.y * u_xlat16_25.x + _Sanshe_Y;
    u_xlat20.z = u_xlat16_8.z;
    u_xlat69 = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = max(u_xlat69, 0.00048828125);
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Fw;
    u_xlat69 = exp2(u_xlat69);
    u_xlat0.w = u_xlat69 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb73 = _UseSansheMask>=0.5;
#endif
    u_xlat16_48.xy = (bool(u_xlatb73)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_48.xy = u_xlat16_21.xy * u_xlat16_48.xx + u_xlat16_48.yy;
    u_xlat20.x = u_xlat41.x * u_xlat16_25.x + _Sanshe2_X;
    u_xlat20.y = u_xlat41.y * u_xlat16_25.x + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat20.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_48.yx;
    u_xlat18.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_25.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat18.xyz;
    u_xlat16_8.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_8.x = inversesqrt(u_xlat16_8.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _DirectionalDir.xyz;
    u_xlat23.x = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat23.xyz = u_xlat23.xxx * _DirectionalColor.xyz;
    u_xlat23.xyz = u_xlat23.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.x = u_xlat16_21.z * u_xlat16_8.x + u_xlat16_8.y;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat16_8.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_1.xyz + u_xlat16_25.xyz;
    u_xlat23.x = dot(u_xlat16_1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat23.x = u_xlat23.x + -0.25;
    u_xlat23.x = u_xlat23.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = max(u_xlat16_25.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_25.xyz + u_xlat16_1.xyz;
    u_xlat16_25.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat16_25.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat46)) + u_xlat4.xyz;
    u_xlat69 = u_xlat23.x * -2.0 + 3.0;
    u_xlat23.x = u_xlat23.x * u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat69;
    u_xlat0.x = max(u_xlat23.x, u_xlat0.x);
    u_xlat16_25.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_25.x = u_xlat0.x * u_xlat16_25.x + _Saturation;
    u_xlat0.xyz = u_xlat16_25.xxx * u_xlat4.xyz + vec3(u_xlat46);
    u_xlat16_25.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb69 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_71 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_3.xy = vec2(u_xlat16_71) * u_xlat16_25.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_25.x = float(1.0);
    u_xlat16_25.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_71) * u_xlat16_25.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat0.x>=u_xlat16_3.x);
#else
    u_xlatb23 = u_xlat0.x>=u_xlat16_3.x;
#endif
    u_xlat16_25.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat16_48.x = u_xlat16_25.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_8.xyz = u_xlat16_25.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_25.x = min(u_xlat16_48.x, u_xlat16_8.y);
    u_xlat16_48.x = u_xlat16_48.x + (-u_xlat16_8.y);
    u_xlat16_25.x = (-u_xlat16_25.x) + u_xlat16_8.x;
    u_xlat16_71 = u_xlat16_25.x * 6.0 + 9.99999975e-05;
    u_xlat16_48.x = u_xlat16_48.x / u_xlat16_71;
    u_xlat16_48.x = u_xlat16_48.x + u_xlat16_8.z;
    u_xlat16_48.x = abs(u_xlat16_48.x) + _HueShift;
    u_xlat16_31.xyz = u_xlat16_48.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_31.xyz = fract(u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_31.xyz = abs(u_xlat16_31.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_31.xyz = u_xlat16_31.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48.x = u_xlat16_8.x + 9.99999975e-05;
    u_xlat16_25.x = u_xlat16_25.x / u_xlat16_48.x;
    u_xlat16_25.xyz = u_xlat16_25.xxx * u_xlat16_31.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_8.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_8.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_8.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_70 : u_xlat16_2.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
float u_xlat22;
mediump vec3 u_xlat10_22;
bvec3 u_xlatb22;
float u_xlat23;
vec3 u_xlat25;
bool u_xlatb25;
vec3 u_xlat26;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump float u_xlat16_35;
float u_xlat44;
float u_xlat47;
mediump float u_xlat16_47;
int u_xlati47;
float u_xlat48;
bool u_xlatb48;
mediump vec2 u_xlat16_50;
float u_xlat52;
mediump float u_xlat16_52;
mediump vec2 u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat69;
bool u_xlatb69;
float u_xlat71;
mediump float u_xlat16_72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
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
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat7.xyz = vec3(u_xlat71) * u_xlat16_6.xyz;
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
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat7.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat26.x = dot(u_xlat7.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat7.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat23 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat2.x = (-u_xlat1.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat2.x + u_xlat1.x;
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
    u_xlat22 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb22.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb22.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb22.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb22.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb22.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb22.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_22.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_50.xy = u_xlat10_22.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat22 = u_xlat10_22.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_50.x * _shadowStrength;
    u_xlat44 = u_xlat16_50.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat2.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat2.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat3.x = u_xlat2.x + -1.0;
    u_xlat3.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat3.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_72 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_10.xyz = vec3(u_xlat16_72) * u_xlat16_10.xyz;
    u_xlat16_72 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_72 * 0.5 + 0.5;
    u_xlat16_76 = (-u_xlat16_72) + u_xlat16_76;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_76 + u_xlat16_72;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_72;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_76;
    u_xlat16_11.x = sqrt(u_xlat16_72);
    u_xlat3.xy = min(u_xlat3.xy, vec2(u_xlat16_72));
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_47 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = _sssIntensity * _sssIntensity;
    u_xlat16_78 = u_xlat16_47 * u_xlat16_78;
    u_xlat10_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.x = (-u_xlat10_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_35 = sqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_35) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat47 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_35) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_35) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat47) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_33.xyz = u_xlat16_17.xyz * u_xlat16_33.xyz + (-vec3(u_xlat47));
    u_xlat16_33.xyz = vec3(u_xlat16_35) * u_xlat16_33.xyz + vec3(u_xlat47);
    u_xlat10_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat10_4.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat10_4.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat10_2.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xzw = u_xlat16_13.xxx * u_xlat16_19.xyz;
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_13.xzw;
    u_xlat16_33.xyz = u_xlat16_33.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_81);
    u_xlat16_18.xyz = u_xlat4.xyz * vec3(u_xlat16_82);
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb69 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_19.xy = (bool(u_xlatb69)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat69 = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_82);
    u_xlat16_82 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = float(1.0) / float(u_xlat16_81);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82;
    u_xlat16_81 = max(u_xlat16_19.x, u_xlat16_81);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_81;
    u_xlat16_18.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_19.xyz = vec3(u_xlat69) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_80 = u_xlat44 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat22 * u_xlat16_11.x;
    u_xlat16_20.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_12.xyz + (-vec3(u_xlat69));
    u_xlat16_12.xyz = vec3(u_xlat16_35) * u_xlat16_12.xyz + vec3(u_xlat69);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xzw;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat44) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat69) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_33.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_34.xxx;
    u_xlat16_34.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.00100000005>=abs(u_xlat16_34.x));
#else
    u_xlatb69 = 0.00100000005>=abs(u_xlat16_34.x);
#endif
    u_xlat16_34.xy = (bool(u_xlatb69)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_34.yyy + u_xlat16_18.xyz;
    u_xlat16_56 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat69 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_56);
    u_xlat16_56 = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_56 = (-u_xlat16_56) * u_xlat16_56 + 1.0;
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_12.x = u_xlat16_56 * u_xlat16_12.x;
    u_xlat16_12.x = max(u_xlat16_34.x, u_xlat16_12.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_12.x;
    u_xlat16_12.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = vec3(u_xlat69) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz + (-vec3(u_xlat69));
    u_xlat16_14.xyz = vec3(u_xlat16_35) * u_xlat16_14.xyz + vec3(u_xlat69);
    u_xlat16_14.xyz = u_xlat16_13.xzw * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat22) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * vec3(u_xlat69) + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat10_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_77 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat69 = (-u_xlat47) * u_xlat16_77 + u_xlat47;
    u_xlat69 = u_xlat47 * u_xlat69 + u_xlat16_77;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat47;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_12.xxx;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat8.x) * u_xlat16_77 + u_xlat8.x;
    u_xlat73 = u_xlat8.x * u_xlat73 + u_xlat16_77;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat8.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat73;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat9.xyz = u_xlat4.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat9.xyz = vec3(u_xlat48) * u_xlat9.xyz;
    u_xlat48 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_34.x) + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat52 = u_xlat16_77 + -1.0;
    u_xlat48 = u_xlat48 * u_xlat52 + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat16_77 / u_xlat48;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat69 = u_xlat69 * u_xlat48;
    u_xlat16_34.x = u_xlat73 * u_xlat73;
    u_xlat16_34.x = u_xlat73 * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat73 * u_xlat16_34.x;
    u_xlat16_56 = u_xlat73 * u_xlat16_34.x;
    u_xlat48 = (-u_xlat16_34.x) * u_xlat73 + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat48 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat48) * vec3(u_xlat16_56) + u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat69) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat47) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat47 = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat21.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat21.xyz = vec3(u_xlat47) * u_xlat21.xyz + _sssColorBack.xyz;
    u_xlat21.xyz = u_xlat16_16.xyz * u_xlat21.xyz;
    u_xlat16_16.xyz = u_xlat21.xyz * u_xlat16_13.xzw + (-u_xlat16_13.xzw);
    u_xlat16_34.xyz = vec3(u_xlat16_78) * u_xlat16_16.xyz + u_xlat16_13.xzw;
    u_xlat16_13.xyz = u_xlat16_34.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat3.x = min(u_xlat3.x, u_xlat10_2.z);
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_16.xyz = u_xlat16_34.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat3.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat3.xxx * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat3.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_34.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat3.xxx + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati3.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_76) * u_xlat16_16.xyz;
    u_xlati47 = int(int_bitfieldInsert(2,u_xlati3.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati47].xyz;
    u_xlati3.x = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati47 = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati3.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati47].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_34.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_34.x = u_xlat3.y * 0.5;
    u_xlat16_56 = (-u_xlat3.y) * 0.5 + 1.0;
    u_xlat16_78 = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_78 = u_xlat16_78 + u_xlat16_78;
    u_xlat3.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_78) + (-u_xlat16_14.xyz);
    u_xlat16_1.z = dot(u_xlat16_10.xyz, u_xlat3.xzw);
    u_xlat48 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_0.w);
    u_xlat16_32.x = u_xlat16_10.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.z;
    u_xlat16_13.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_73 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_0.x = u_xlat16_10.x * 16.0 + u_xlat16_0.z;
    u_xlat16_13.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_10.x = u_xlat16_10.z * 15.0 + (-u_xlat16_10.x);
    u_xlat16_32.x = u_xlat16_73 + (-u_xlat16_52);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_32.x + u_xlat16_52;
    u_xlat16_10.x = u_xlat16_76 * u_xlat16_10.x;
    u_xlat48 = u_xlat48 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat48 * u_xlat16_56 + u_xlat16_34.x;
    u_xlat16_32.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_54.x = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_54.x + u_xlat16_32.x;
    u_xlat16_10.x = u_xlat3.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat71) + (-u_xlat3.xzw);
    u_xlat3.xyz = vec3(u_xlat16_77) * u_xlat5.xyz + u_xlat3.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat13.y = u_xlat3.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_32.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat8.y = u_xlat16_1.x;
    u_xlat16_3.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_34.xyz = u_xlat16_15.xyz * u_xlat16_3.xxx + u_xlat16_3.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_32.x);
    u_xlat16_32.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat3.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyw = vec3(u_xlat16_79) * u_xlat16_32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb3)) ? u_xlat16_14.xyw : u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_34.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_32.xyz;
    u_xlat16_34.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_34.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_34.xyz;
    u_xlat16_10.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat10_4.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat10_4.w * _albedoColor.w;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat5.x = u_xlat4.x * u_xlat16_12.x + _Sanshe_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_12.x + _Sanshe_Y;
    u_xlat5.z = u_xlat16_14.z;
    u_xlat69 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = max(u_xlat69, 0.00048828125);
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Fw;
    u_xlat69 = exp2(u_xlat69);
    u_xlat3.w = u_xlat69 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb48 = _UseSansheMask>=0.5;
#endif
    u_xlat16_54.xy = (bool(u_xlatb48)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_54.xy = u_xlat16_8.xy * u_xlat16_54.xx + u_xlat16_54.yy;
    u_xlat5.x = u_xlat4.x * u_xlat16_12.x + _Sanshe2_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_12.x + _Sanshe2_Y;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = max(u_xlat3.x, 0.00048828125);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _Sanshe2_Fw;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _Sanshe2_Power;
    u_xlat3.xw = u_xlat3.xw * u_xlat16_54.yx;
    u_xlat4.xyz = u_xlat3.xxx * _Sanshe2_color.xyz;
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat3.www * _Sanshe_color.xyz + u_xlat4.xyz;
    u_xlat16_54.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_54.x = inversesqrt(u_xlat16_54.x);
    u_xlat16_14.xyz = u_xlat16_54.xxx * _DirectionalDir.xyz;
    u_xlat25.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat25.xyz = u_xlat25.xxx * _DirectionalColor.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_54.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_54.x = u_xlat16_8.z * u_xlat16_54.x + u_xlat16_54.y;
    u_xlat16_12.xyz = u_xlat25.xyz * u_xlat16_54.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.x = dot(u_xlat16_11.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat25.x = u_xlat25.x + -0.25;
    u_xlat25.x = u_xlat25.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_54.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat16_54.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat47 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat47)) + u_xlat4.xyz;
    u_xlat69 = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat69;
    u_xlat3.x = max(u_xlat25.x, u_xlat3.x);
    u_xlat16_54.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_54.x = u_xlat3.x * u_xlat16_54.x + _Saturation;
    u_xlat3.xyz = u_xlat16_54.xxx * u_xlat4.xyz + vec3(u_xlat47);
    u_xlat16_54.xy = (-u_xlat3.zy) + u_xlat3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(u_xlat3.y>=u_xlat3.z);
#else
    u_xlatb69 = u_xlat3.y>=u_xlat3.z;
#endif
    u_xlat16_77 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_0.xy = vec2(u_xlat16_77) * u_xlat16_54.xy + u_xlat3.zy;
    u_xlat16_1.w = (-u_xlat3.x);
    u_xlat16_54.x = float(1.0);
    u_xlat16_54.y = float(-1.0);
    u_xlat16_0.zw = vec2(u_xlat16_77) * u_xlat16_54.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_2.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat3.x>=u_xlat16_0.x);
#else
    u_xlatb25 = u_xlat3.x>=u_xlat16_0.x;
#endif
    u_xlat16_54.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_76 = u_xlat16_54.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_12.xyz = u_xlat16_54.xxx * u_xlat16_2.xyz + u_xlat16_0.xyw;
    u_xlat16_54.x = min(u_xlat16_76, u_xlat16_12.y);
    u_xlat16_76 = u_xlat16_76 + (-u_xlat16_12.y);
    u_xlat16_54.x = (-u_xlat16_54.x) + u_xlat16_12.x;
    u_xlat16_77 = u_xlat16_54.x * 6.0 + 9.99999975e-05;
    u_xlat16_76 = u_xlat16_76 / u_xlat16_77;
    u_xlat16_76 = u_xlat16_76 + u_xlat16_12.z;
    u_xlat16_76 = abs(u_xlat16_76) + _HueShift;
    u_xlat16_34.xyz = vec3(u_xlat16_76) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_34.xyz = fract(u_xlat16_34.xyz);
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_34.xyz = abs(u_xlat16_34.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_34.xyz = u_xlat16_34.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = u_xlat16_12.x + 9.99999975e-05;
    u_xlat16_54.x = u_xlat16_54.x / u_xlat16_76;
    u_xlat16_34.xyz = u_xlat16_54.xxx * u_xlat16_34.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb3 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_54.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_54.xxx * u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat16_11.xyz * u_xlat16_54.yyy + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_10.x : u_xlat16_32.x;
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
out highp vec4 vs_TEXCOORD5;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _sssColorBase;
uniform 	mediump vec4 _sssColorBack;
uniform 	mediump vec4 _sssColorOcc;
uniform 	mediump float _sssIntensity;
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _UseAdjustColor;
uniform 	mediump float _PostExposure;
uniform 	mediump float _Contrast;
uniform 	mediump float _Saturation;
uniform 	mediump float _SansheSaturation;
uniform 	mediump float _HueShift;
uniform 	mediump float _UseSansheMask;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	mediump float _UseDirectionalMask;
uniform 	mediump vec4 _DirectionalColor;
uniform 	mediump float _DirectionalIntensity;
uniform 	mediump vec4 _DirectionalDir;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(8) uniform mediump sampler2D _skinMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
ivec4 u_xlati3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
float u_xlat22;
mediump vec3 u_xlat10_22;
bvec3 u_xlatb22;
float u_xlat23;
vec3 u_xlat25;
bool u_xlatb25;
vec3 u_xlat26;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump float u_xlat16_35;
float u_xlat44;
float u_xlat47;
mediump float u_xlat16_47;
int u_xlati47;
float u_xlat48;
bool u_xlatb48;
mediump vec2 u_xlat16_50;
float u_xlat52;
mediump float u_xlat16_52;
mediump vec2 u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat69;
bool u_xlatb69;
float u_xlat71;
mediump float u_xlat16_72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
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
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat7.xyz = vec3(u_xlat71) * u_xlat16_6.xyz;
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
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat7.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat26.x = dot(u_xlat7.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat7.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat23 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat2.x = (-u_xlat1.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat2.x + u_xlat1.x;
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
    u_xlat22 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb22.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb22.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb22.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb22.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb22.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb22.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat10_22.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_50.xy = u_xlat10_22.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat22 = u_xlat10_22.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_50.x * _shadowStrength;
    u_xlat44 = u_xlat16_50.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat2.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat2.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat3.x = u_xlat2.x + -1.0;
    u_xlat3.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat3.xx + vec2(1.0, 1.0);
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(_occlusionScale) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_72 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_10.xyz = vec3(u_xlat16_72) * u_xlat16_10.xyz;
    u_xlat16_72 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_72 * 0.5 + 0.5;
    u_xlat16_76 = (-u_xlat16_72) + u_xlat16_76;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_76 + u_xlat16_72;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_72;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_76;
    u_xlat16_11.x = sqrt(u_xlat16_72);
    u_xlat3.xy = min(u_xlat3.xy, vec2(u_xlat16_72));
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xyz = _sssColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_47 = texture(_skinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = _sssIntensity * _sssIntensity;
    u_xlat16_78 = u_xlat16_47 * u_xlat16_78;
    u_xlat10_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.x = (-u_xlat10_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_35 = sqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_35) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat47 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _sssColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_35) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _sssColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_35) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat47) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_33.xyz = u_xlat16_17.xyz * u_xlat16_33.xyz + (-vec3(u_xlat47));
    u_xlat16_33.xyz = vec3(u_xlat16_35) * u_xlat16_33.xyz + vec3(u_xlat47);
    u_xlat10_4 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_17.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat10_4.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat10_4.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18.xyz = u_xlat10_2.www * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xzw = u_xlat16_13.xxx * u_xlat16_19.xyz;
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_13.xzw;
    u_xlat16_33.xyz = u_xlat16_33.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_82 = inversesqrt(u_xlat16_81);
    u_xlat16_18.xyz = u_xlat4.xyz * vec3(u_xlat16_82);
    u_xlat16_82 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.00100000005>=abs(u_xlat16_82));
#else
    u_xlatb69 = 0.00100000005>=abs(u_xlat16_82);
#endif
    u_xlat16_19.xy = (bool(u_xlatb69)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_20.xyz;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_18.xyz);
    u_xlat69 = dot(u_xlat7.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_82);
    u_xlat16_82 = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_81 = float(1.0) / float(u_xlat16_81);
    u_xlat16_82 = (-u_xlat16_82) * u_xlat16_82 + 1.0;
    u_xlat16_82 = max(u_xlat16_82, 0.0);
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82;
    u_xlat16_81 = max(u_xlat16_19.x, u_xlat16_81);
    u_xlat16_80 = u_xlat16_80 * u_xlat16_81;
    u_xlat16_18.xyz = vec3(u_xlat16_80) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_19.xyz = vec3(u_xlat69) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_80 = u_xlat44 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat22 * u_xlat16_11.x;
    u_xlat16_20.xyz = u_xlat16_11.xxx * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_80) * u_xlat16_14.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_19.xyz * u_xlat16_12.xyz + (-vec3(u_xlat69));
    u_xlat16_12.xyz = vec3(u_xlat16_35) * u_xlat16_12.xyz + vec3(u_xlat69);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xzw;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat44) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat69) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_33.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb69 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_12.x = max(u_xlat16_12.x, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_34.xxx;
    u_xlat16_34.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.00100000005>=abs(u_xlat16_34.x));
#else
    u_xlatb69 = 0.00100000005>=abs(u_xlat16_34.x);
#endif
    u_xlat16_34.xy = (bool(u_xlatb69)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_34.yyy + u_xlat16_18.xyz;
    u_xlat16_56 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat69 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat69 = min(max(u_xlat69, 0.0), 1.0);
#else
    u_xlat69 = clamp(u_xlat69, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_56);
    u_xlat16_56 = u_xlat16_12.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_12.x = float(1.0) / float(u_xlat16_12.x);
    u_xlat16_56 = (-u_xlat16_56) * u_xlat16_56 + 1.0;
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_12.x = u_xlat16_56 * u_xlat16_12.x;
    u_xlat16_12.x = max(u_xlat16_34.x, u_xlat16_12.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_12.x;
    u_xlat16_12.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = vec3(u_xlat69) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_20.xyz + (-vec3(u_xlat69));
    u_xlat16_14.xyz = vec3(u_xlat16_35) * u_xlat16_14.xyz + vec3(u_xlat69);
    u_xlat16_14.xyz = u_xlat16_13.xzw * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = vec3(u_xlat22) * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * vec3(u_xlat69) + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat10_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_77 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat69 = (-u_xlat47) * u_xlat16_77 + u_xlat47;
    u_xlat69 = u_xlat47 * u_xlat69 + u_xlat16_77;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat47;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_12.xxx;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat8.x) * u_xlat16_77 + u_xlat8.x;
    u_xlat73 = u_xlat8.x * u_xlat73 + u_xlat16_77;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat8.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat73;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat9.xyz = u_xlat4.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat9.xyz = vec3(u_xlat48) * u_xlat9.xyz;
    u_xlat48 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_34.x) + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat52 = u_xlat16_77 + -1.0;
    u_xlat48 = u_xlat48 * u_xlat52 + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat16_77 / u_xlat48;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat69 = u_xlat69 * u_xlat48;
    u_xlat16_34.x = u_xlat73 * u_xlat73;
    u_xlat16_34.x = u_xlat73 * u_xlat16_34.x;
    u_xlat16_34.x = u_xlat73 * u_xlat16_34.x;
    u_xlat16_56 = u_xlat73 * u_xlat16_34.x;
    u_xlat48 = (-u_xlat16_34.x) * u_xlat73 + 1.0;
    u_xlat16_15.xyz = u_xlat16_1.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat48 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat48) * vec3(u_xlat16_56) + u_xlat9.xyz;
    u_xlat9.xyz = vec3(u_xlat69) * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat47) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_16.xyz = (-_sssColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_1.www * u_xlat16_16.xyz + _sssColorOcc.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat7.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat7.xz);
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat17.y = u_xlat7.y;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_18.y = u_xlat16_10.y;
    u_xlat47 = dot(u_xlat16_18.xyz, u_xlat17.xyz);
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat21.xyz = _sssColorBase.xyz + (-_sssColorBack.xyz);
    u_xlat21.xyz = vec3(u_xlat47) * u_xlat21.xyz + _sssColorBack.xyz;
    u_xlat21.xyz = u_xlat16_16.xyz * u_xlat21.xyz;
    u_xlat16_16.xyz = u_xlat21.xyz * u_xlat16_13.xzw + (-u_xlat16_13.xzw);
    u_xlat16_34.xyz = vec3(u_xlat16_78) * u_xlat16_16.xyz + u_xlat16_13.xzw;
    u_xlat16_13.xyz = u_xlat16_34.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat3.x = min(u_xlat3.x, u_xlat10_2.z);
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_16.xyz = u_xlat16_34.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat3.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat3.xxx * u_xlat16_16.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat3.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_34.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_16.xyz * u_xlat3.xxx + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati3.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_76) * u_xlat16_16.xyz;
    u_xlati47 = int(int_bitfieldInsert(2,u_xlati3.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati47].xyz;
    u_xlati3.x = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati47 = (u_xlati3.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati3.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati47].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_79 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_34.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_34.x = u_xlat3.y * 0.5;
    u_xlat16_56 = (-u_xlat3.y) * 0.5 + 1.0;
    u_xlat16_78 = dot((-u_xlat16_14.xyz), u_xlat7.xyz);
    u_xlat16_78 = u_xlat16_78 + u_xlat16_78;
    u_xlat3.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_78) + (-u_xlat16_14.xyz);
    u_xlat16_1.z = dot(u_xlat16_10.xyz, u_xlat3.xzw);
    u_xlat48 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_0.w);
    u_xlat16_32.x = u_xlat16_10.x + 1.0;
    u_xlat16_32.x = min(u_xlat16_32.x, 15.0);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.z;
    u_xlat16_13.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_73 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_0.x = u_xlat16_10.x * 16.0 + u_xlat16_0.z;
    u_xlat16_13.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_10.x = u_xlat16_10.z * 15.0 + (-u_xlat16_10.x);
    u_xlat16_32.x = u_xlat16_73 + (-u_xlat16_52);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_32.x + u_xlat16_52;
    u_xlat16_10.x = u_xlat16_76 * u_xlat16_10.x;
    u_xlat48 = u_xlat48 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat48 * u_xlat16_56 + u_xlat16_34.x;
    u_xlat16_32.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_54.x = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_54.x + u_xlat16_32.x;
    u_xlat16_10.x = u_xlat3.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat71) + (-u_xlat3.xzw);
    u_xlat3.xyz = vec3(u_xlat16_77) * u_xlat5.xyz + u_xlat3.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat3.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat3.xz);
    u_xlat13.y = u_xlat3.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_32.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat8.y = u_xlat16_1.x;
    u_xlat16_3.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_34.xyz = u_xlat16_15.xyz * u_xlat16_3.xxx + u_xlat16_3.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_32.x);
    u_xlat16_32.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat3.xyz = u_xlat16_32.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_32.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyw = vec3(u_xlat16_79) * u_xlat16_32.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb3 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_32.xyz = (bool(u_xlatb3)) ? u_xlat16_14.xyw : u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_34.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_32.xyz;
    u_xlat16_34.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_34.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_34.xyz;
    u_xlat16_10.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.x = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat10_4.w * _albedoColor.w + u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat10_4.w * _albedoColor.w;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat5.x = u_xlat4.x * u_xlat16_12.x + _Sanshe_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_12.x + _Sanshe_Y;
    u_xlat5.z = u_xlat16_14.z;
    u_xlat69 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = (-u_xlat69) + 1.0;
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = max(u_xlat69, 0.00048828125);
    u_xlat69 = log2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Fw;
    u_xlat69 = exp2(u_xlat69);
    u_xlat3.w = u_xlat69 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb48 = _UseSansheMask>=0.5;
#endif
    u_xlat16_54.xy = (bool(u_xlatb48)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_54.xy = u_xlat16_8.xy * u_xlat16_54.xx + u_xlat16_54.yy;
    u_xlat5.x = u_xlat4.x * u_xlat16_12.x + _Sanshe2_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_12.x + _Sanshe2_Y;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = max(u_xlat3.x, 0.00048828125);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _Sanshe2_Fw;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _Sanshe2_Power;
    u_xlat3.xw = u_xlat3.xw * u_xlat16_54.yx;
    u_xlat4.xyz = u_xlat3.xxx * _Sanshe2_color.xyz;
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat3.www * _Sanshe_color.xyz + u_xlat4.xyz;
    u_xlat16_54.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_54.x = inversesqrt(u_xlat16_54.x);
    u_xlat16_14.xyz = u_xlat16_54.xxx * _DirectionalDir.xyz;
    u_xlat25.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat25.xyz = u_xlat25.xxx * _DirectionalColor.xyz;
    u_xlat25.xyz = u_xlat25.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_54.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_54.x = u_xlat16_8.z * u_xlat16_54.x + u_xlat16_54.y;
    u_xlat16_12.xyz = u_xlat25.xyz * u_xlat16_54.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.x = dot(u_xlat16_11.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat25.x = u_xlat25.x + -0.25;
    u_xlat25.x = u_xlat25.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_54.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat16_54.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat47 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat47)) + u_xlat4.xyz;
    u_xlat69 = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat69;
    u_xlat3.x = max(u_xlat25.x, u_xlat3.x);
    u_xlat16_54.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_54.x = u_xlat3.x * u_xlat16_54.x + _Saturation;
    u_xlat3.xyz = u_xlat16_54.xxx * u_xlat4.xyz + vec3(u_xlat47);
    u_xlat16_54.xy = (-u_xlat3.zy) + u_xlat3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(u_xlat3.y>=u_xlat3.z);
#else
    u_xlatb69 = u_xlat3.y>=u_xlat3.z;
#endif
    u_xlat16_77 = (u_xlatb69) ? 1.0 : 0.0;
    u_xlat16_0.xy = vec2(u_xlat16_77) * u_xlat16_54.xy + u_xlat3.zy;
    u_xlat16_1.w = (-u_xlat3.x);
    u_xlat16_54.x = float(1.0);
    u_xlat16_54.y = float(-1.0);
    u_xlat16_0.zw = vec2(u_xlat16_77) * u_xlat16_54.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_2.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(u_xlat3.x>=u_xlat16_0.x);
#else
    u_xlatb25 = u_xlat3.x>=u_xlat16_0.x;
#endif
    u_xlat16_54.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat16_76 = u_xlat16_54.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_12.xyz = u_xlat16_54.xxx * u_xlat16_2.xyz + u_xlat16_0.xyw;
    u_xlat16_54.x = min(u_xlat16_76, u_xlat16_12.y);
    u_xlat16_76 = u_xlat16_76 + (-u_xlat16_12.y);
    u_xlat16_54.x = (-u_xlat16_54.x) + u_xlat16_12.x;
    u_xlat16_77 = u_xlat16_54.x * 6.0 + 9.99999975e-05;
    u_xlat16_76 = u_xlat16_76 / u_xlat16_77;
    u_xlat16_76 = u_xlat16_76 + u_xlat16_12.z;
    u_xlat16_76 = abs(u_xlat16_76) + _HueShift;
    u_xlat16_34.xyz = vec3(u_xlat16_76) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_34.xyz = fract(u_xlat16_34.xyz);
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_34.xyz = abs(u_xlat16_34.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.xyz = min(max(u_xlat16_34.xyz, 0.0), 1.0);
#else
    u_xlat16_34.xyz = clamp(u_xlat16_34.xyz, 0.0, 1.0);
#endif
    u_xlat16_34.xyz = u_xlat16_34.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_76 = u_xlat16_12.x + 9.99999975e-05;
    u_xlat16_54.x = u_xlat16_54.x / u_xlat16_76;
    u_xlat16_34.xyz = u_xlat16_54.xxx * u_xlat16_34.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_34.xyz * u_xlat16_12.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb3 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_54.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_54.xxx * u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat16_11.xyz * u_xlat16_54.yyy + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb3 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_10.x : u_xlat16_32.x;
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
  GpuProgramID 70208
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Skin_SFGUI"
}