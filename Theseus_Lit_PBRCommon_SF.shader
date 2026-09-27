//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_SF" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 0.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _DynamicNormalMap ("动态法线贴图", 2D) = "bump" { }

_DynamicNormalIntensity ("动态法线强度", Range(0, 1)) = 1.0

[Tex] _DetailNormalMap ("细节法线贴图", 2D) = "bump" { }

_DetailNormalMask ("细节法线遮罩", 2D) = "white" { }

_DetailNormalIntensity ("细节法线强度", Range(0, 10)) = 1.0

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_UseShadowMask ("启用补光遮罩", Float) = 0.0

_UseRenderInfo01Mask ("启用RenderInfo补光1遮罩", Float) = 0.0

_UseRenderInfo02Mask ("启用RenderInfo补光2遮罩", Float) = 0.0

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0,0,0,0)

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

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
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 36336
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
int u_xlati9;
vec3 u_xlat10;
mediump vec2 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_15;
bvec4 u_xlatb15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_27;
vec3 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
vec3 u_xlat31;
vec2 u_xlat32;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
vec2 u_xlat51;
float u_xlat54;
vec2 u_xlat57;
bool u_xlatb57;
float u_xlat66;
mediump float u_xlat16_68;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
int u_xlati75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
float u_xlat80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_23.x * u_xlat16_45;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_23.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
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
    u_xlat66 = (-_ShadeRange) + _DetailRange;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_4.xyz = texture(_DetailNormalMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_DetailNormalIntensity);
    u_xlat16_4.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_4.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_7 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_4.w = u_xlat16_3.z * u_xlat16_7;
    u_xlat16_5.xyz = u_xlat16_4.xyw + u_xlat16_4.xyz;
    u_xlat8.z = u_xlat16_4.z * u_xlat16_5.z;
    u_xlat8.xy = vec2(u_xlat16_7) * u_xlat16_3.xy + u_xlat16_5.xy;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat73 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat9.xyz = u_xlat16_3.xyz * vec3(u_xlat73);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat29.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat74 = dot(u_xlat29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat9.x = u_xlat74 + (-_ShadeRange);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat66 = u_xlat66 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat66 * -2.0 + 3.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat9.x;
    u_xlat16_9.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat9.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
    u_xlat16_1.x = min(u_xlat66, u_xlat9.x);
    u_xlat16_1.x = u_xlat16_1.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = (-u_xlat16_5.xyz) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat9.yyy * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_6.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.x = u_xlat16_6.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat31.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat31.xyz, u_xlat31.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat10.xyz = u_xlat31.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat10.xyz;
    u_xlat16_68 = dot(u_xlat16_23.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat29.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat29.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat32.x = (-u_xlat16_68) + 1.0;
    u_xlat16_23.x = u_xlat32.x * u_xlat32.x;
    u_xlat16_23.x = u_xlat32.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat32.x * u_xlat16_23.x;
    u_xlat54 = (-u_xlat16_23.x) * u_xlat32.x + 1.0;
    u_xlat16_23.x = u_xlat32.x * u_xlat16_23.x;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat54);
    u_xlat12.xyz = u_xlat9.xxx * u_xlat16_23.xxx + u_xlat12.xyz;
    u_xlat16_23.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat32.x = (-u_xlat76) * u_xlat16_23.x + u_xlat76;
    u_xlat32.x = u_xlat76 * u_xlat32.x + u_xlat16_23.x;
    u_xlat32.x = sqrt(u_xlat32.x);
    u_xlat32.x = u_xlat32.x + u_xlat76;
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat31.xyz;
    u_xlat13.x = dot(u_xlat29.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat13.x) * u_xlat16_23.x + u_xlat13.x;
    u_xlat54 = u_xlat13.x * u_xlat54 + u_xlat16_23.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat32.y = u_xlat54 + u_xlat13.x;
    u_xlat32.xy = u_xlat32.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat32.x = u_xlat32.x * u_xlat32.y;
    u_xlat10.y = float(1.0) / u_xlat32.x;
    u_xlat78 = u_xlat16_23.x + -1.0;
    u_xlat10.x = u_xlat10.x * u_xlat78 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_23.x / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.318309873;
    u_xlat10.xy = min(u_xlat10.xy, vec2(16.0, 16.0));
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat14.xyz = u_xlat12.xyz * u_xlat10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat76) * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlatb15 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_15.x = (u_xlatb15.x) ? float(1.0) : float(0.0);
    u_xlat16_15.y = (u_xlatb15.y) ? float(0.0) : float(1.0);
    u_xlat16_15.z = (u_xlatb15.z) ? float(1.0) : float(0.0);
    u_xlat16_15.w = (u_xlatb15.w) ? float(0.0) : float(1.0);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xy = u_xlat16_10.xy * u_xlat16_15.xz + u_xlat16_15.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat10.xxx * u_xlat14.xyz;
    u_xlat16.xyz = u_xlat31.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat16.xyz = u_xlat57.xxx * u_xlat16.xyz;
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat57.x = dot(u_xlat29.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat57.x * u_xlat78 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_23.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat79 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat79 * u_xlat79;
    u_xlat16_45 = u_xlat79 * u_xlat16_45;
    u_xlat16_45 = u_xlat79 * u_xlat16_45;
    u_xlat80 = (-u_xlat16_45) * u_xlat79 + 1.0;
    u_xlat16_45 = u_xlat79 * u_xlat16_45;
    u_xlat16.xyz = u_xlat16_6.xyz * vec3(u_xlat80);
    u_xlat16.xyz = u_xlat9.xxx * vec3(u_xlat16_45) + u_xlat16.xyz;
    u_xlat79 = (-u_xlat74) * u_xlat16_23.x + u_xlat74;
    u_xlat79 = u_xlat74 * u_xlat79 + u_xlat16_23.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat74 + u_xlat79;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat79 = u_xlat32.y * u_xlat79;
    u_xlat57.y = float(1.0) / u_xlat79;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat57.x = u_xlat57.y * u_xlat57.x;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat74) * u_xlat16.xyz;
    u_xlat16_17.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_71 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_72 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat14.xyz;
    u_xlat16_68 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_19.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_71;
    u_xlat16_19.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat14.xyz = u_xlat31.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
    u_xlat75 = dot(u_xlat29.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat57.x = dot(u_xlat29.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_68) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_23.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat14.x = (-u_xlat57.x) * u_xlat16_23.x + u_xlat57.x;
    u_xlat14.x = u_xlat57.x * u_xlat14.x + u_xlat16_23.x;
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat14.x = u_xlat57.x + u_xlat14.x;
    u_xlat14.x = u_xlat14.x + 6.10351563e-05;
    u_xlat54 = u_xlat32.y * u_xlat14.x;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat75 = u_xlat75 * u_xlat54;
    u_xlat16_68 = u_xlat79 * u_xlat79;
    u_xlat16_68 = u_xlat79 * u_xlat16_68;
    u_xlat16_68 = u_xlat79 * u_xlat16_68;
    u_xlat16_71 = u_xlat79 * u_xlat16_68;
    u_xlat54 = (-u_xlat16_68) * u_xlat79 + 1.0;
    u_xlat14.xyz = u_xlat16_6.xyz * vec3(u_xlat54);
    u_xlat14.xyz = u_xlat9.xxx * vec3(u_xlat16_71) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = u_xlat57.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_19.xyz * u_xlat14.xyz;
    u_xlat16_17.xyz = u_xlat14.xyz * u_xlat10.yyy + u_xlat16_17.xyz;
    u_xlat16_68 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_68) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat76) * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_18.xyz * vec3(u_xlat74) + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_5.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.yyy * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat57.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat29.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_19.xyz = vec3(u_xlat16_68) * u_xlat16_19.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_68) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_68 = u_xlat16_0.w * u_xlat16_71 + u_xlat16_68;
    u_xlat16_68 = u_xlat16_0.w * u_xlat16_68;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_71;
    u_xlat74 = min(u_xlat16_68, 1.0);
    u_xlat9.x = min(u_xlat16_4.z, u_xlat74);
    u_xlat16_18.xyz = u_xlat9.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat9.xxx * u_xlat16_18.xyz;
    u_xlat16_20.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat9.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat9.xxx * u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat9.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_20.xyz * u_xlat9.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_71) * u_xlat16_21.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlati9 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati75 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati9].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz + u_xlat16_2.xyz;
    u_xlat16_5.x = dot((-u_xlat16_11.xyz), u_xlat29.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat10.xyz = (-u_xlat29.xyz) * u_xlat16_5.xxx + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_23.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_0.z = dot(u_xlat16_19.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_19.xyz, u_xlat29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat18.y = u_xlat8.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_72 = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat13.y = u_xlat16_0.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_72);
    u_xlat16_11.xyw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat8.xyz = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyw = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_19.xyz = vec3(u_xlat16_68) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyw = (bool(u_xlatb8)) ? u_xlat16_19.xyz : u_xlat16_11.xyw;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyw;
    u_xlat16_68 = u_xlat74 * 0.5;
    u_xlat16_72 = (-u_xlat74) * 0.5 + 1.0;
    u_xlat16_0.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_5.x = floor(u_xlat16_0.w);
    u_xlat16_27.x = u_xlat16_5.x + 1.0;
    u_xlat16_27.x = min(u_xlat16_27.x, 15.0);
    u_xlat16_0.x = u_xlat16_27.x * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_8.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_5.x * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_5.x);
    u_xlat16_27.x = (-u_xlat16_30.x) + u_xlat16_8.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_27.x + u_xlat16_30.x;
    u_xlat16_5.x = u_xlat16_71 * u_xlat16_5.x;
    u_xlat7.x = u_xlat7.x * u_xlat16_5.x;
    u_xlat16_68 = u_xlat7.x * u_xlat16_72 + u_xlat16_68;
    u_xlat16_5.x = u_xlat16_68 + u_xlat16_68;
    u_xlat16_27.x = (-u_xlat16_68) * 2.0 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_27.x + u_xlat16_5.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat74;
    u_xlat16_68 = min(u_xlat16_68, u_xlat16_4.z);
    u_xlat16_5.xyz = vec3(u_xlat16_68) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_6.yzx + u_xlat16_17.yzx;
    u_xlat16_68 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_8.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_8.zxy * _EmissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_27.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_27.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat29.xyz;
    u_xlat10.x = u_xlat31.x * u_xlat16_1.x + _Sanshe_X;
    u_xlat10.y = u_xlat31.y * u_xlat16_1.x + _Sanshe_Y;
    u_xlat10.z = u_xlat16_11.z;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat7.x, 0.00048828125);
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Fw;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb74 = _UseSansheMask>=0.5;
#endif
    u_xlat16_27.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xy = u_xlat16_13.xy * u_xlat16_27.xx + u_xlat16_27.yy;
    u_xlat7.x = u_xlat16_27.x * u_xlat7.x;
    u_xlat10.x = u_xlat31.x * u_xlat16_1.x + _Sanshe2_X;
    u_xlat10.y = u_xlat31.y * u_xlat16_1.x + _Sanshe2_Y;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = max(u_xlat8.x, 0.00048828125);
    u_xlat8.x = log2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Fw;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Power;
    u_xlat8.x = u_xlat16_27.y * u_xlat8.x;
    u_xlat30.xyz = u_xlat8.xxx * _Sanshe2_color.zxy;
    u_xlat8.x = u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_27.xyz = u_xlat7.xxx * _Sanshe_color.zxy + u_xlat30.xyz;
    u_xlat16_6.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * _DirectionalDir.xyz;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat29.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.xyz = u_xlat7.xxx * _DirectionalColor.zxy;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb73 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_6.xy = (bool(u_xlatb73)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = u_xlat16_13.z * u_xlat16_6.x + u_xlat16_6.y;
    u_xlat16_27.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat7.x = dot(u_xlat16_2.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.x = u_xlat7.x + -0.25;
    u_xlat7.x = u_xlat7.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_27.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_27.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_27.xyz + u_xlat16_2.xyz;
    u_xlat29.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat29.xyz = max(u_xlat29.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat29.xyz = log2(u_xlat29.xyz);
    u_xlat29.xyz = u_xlat29.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat29.xz * vec2(15.0, 0.9375);
    u_xlat30.x = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat29.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat29.x = u_xlat29.x * 15.0 + (-u_xlat30.x);
    u_xlat0.x = u_xlat30.x * 0.0625 + u_xlat0.y;
    u_xlat16_30.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat51.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat51.xy, 0.0).xyz;
    u_xlat9.xyz = (-u_xlat16_30.xyz) + u_xlat16_9.xyz;
    u_xlat29.xyz = u_xlat29.xxx * u_xlat9.xyz + u_xlat16_30.xyz;
    u_xlat16_2.x = exp2(_PostExposure);
    u_xlat30.xyz = u_xlat29.xyz * u_xlat16_2.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat30.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat30.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xyz = min(max(u_xlat30.xyz, 0.0), 1.0);
#else
    u_xlat30.xyz = clamp(u_xlat30.xyz, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat30.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat30.xyz = u_xlat30.xyz + (-u_xlat9.xxx);
    u_xlat31.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat31.x;
    u_xlat7.x = max(u_xlat7.x, u_xlat8.x);
    u_xlat16_2.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_2.x + _Saturation;
    u_xlat8.xyz = u_xlat16_2.xxx * u_xlat30.xyz + u_xlat9.xxx;
    u_xlat16_2.xy = (-u_xlat8.zy) + u_xlat8.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat8.y>=u_xlat8.z);
#else
    u_xlatb7 = u_xlat8.y>=u_xlat8.z;
#endif
    u_xlat16_46 = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_0.xy = vec2(u_xlat16_46) * u_xlat16_2.xy + u_xlat8.zy;
    u_xlat16_1.w = (-u_xlat8.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_0.zw = vec2(u_xlat16_46) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_3.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_3.x = u_xlat16_1.x + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat8.x>=u_xlat16_0.x);
#else
    u_xlatb7 = u_xlat8.x>=u_xlat16_0.x;
#endif
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_24 = u_xlat16_2.x * u_xlat16_3.w + u_xlat8.x;
    u_xlat16_27.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_0.xyw;
    u_xlat16_2.x = min(u_xlat16_24, u_xlat16_27.y);
    u_xlat16_24 = u_xlat16_24 + (-u_xlat16_27.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_27.x;
    u_xlat16_46 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_24 = u_xlat16_24 / u_xlat16_46;
    u_xlat16_24 = u_xlat16_24 + u_xlat16_27.z;
    u_xlat16_24 = abs(u_xlat16_24) + _HueShift;
    u_xlat16_6.xyz = vec3(u_xlat16_24) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_6.xyz = fract(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_6.xyz = abs(u_xlat16_6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = u_xlat16_27.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_24;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_27.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb7 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_27.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_27.xxx;
    SV_Target0.xyz = u_xlat29.xyz * u_xlat16_27.yyy + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb7 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb7) ? u_xlat16_68 : u_xlat16_5.x;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(14) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
int u_xlati9;
vec3 u_xlat10;
mediump vec2 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_15;
bvec4 u_xlatb15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_27;
vec3 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_30;
vec3 u_xlat31;
vec2 u_xlat32;
mediump float u_xlat16_45;
mediump float u_xlat16_46;
vec2 u_xlat51;
float u_xlat54;
vec2 u_xlat57;
bool u_xlatb57;
float u_xlat66;
mediump float u_xlat16_68;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
float u_xlat73;
bool u_xlatb73;
float u_xlat74;
bool u_xlatb74;
float u_xlat75;
int u_xlati75;
float u_xlat76;
float u_xlat78;
float u_xlat79;
float u_xlat80;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_23.x * u_xlat16_45;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_23.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
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
    u_xlat66 = (-_ShadeRange) + _DetailRange;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_4.xyz = texture(_DetailNormalMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_DetailNormalIntensity);
    u_xlat16_4.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_4.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_7 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_4.w = u_xlat16_3.z * u_xlat16_7;
    u_xlat16_5.xyz = u_xlat16_4.xyw + u_xlat16_4.xyz;
    u_xlat8.z = u_xlat16_4.z * u_xlat16_5.z;
    u_xlat8.xy = vec2(u_xlat16_7) * u_xlat16_3.xy + u_xlat16_5.xy;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat73 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat73 = max(u_xlat73, 1.17549435e-38);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat9.xyz = u_xlat16_3.xyz * vec3(u_xlat73);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat29.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat74 = dot(u_xlat29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat74 = max(u_xlat74, 0.0);
    u_xlat9.x = u_xlat74 + (-_ShadeRange);
    u_xlat74 = min(u_xlat74, 1.0);
    u_xlat66 = u_xlat66 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat66 * -2.0 + 3.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat9.x;
    u_xlat16_9.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat9.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
    u_xlat16_1.x = min(u_xlat66, u_xlat9.x);
    u_xlat16_1.x = u_xlat16_1.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = (-u_xlat16_5.xyz) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat9.yyy * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_6.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.x = u_xlat16_6.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat31.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat31.xyz, u_xlat31.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat10.xyz = u_xlat31.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat76 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat10.xyz = vec3(u_xlat76) * u_xlat10.xyz;
    u_xlat16_68 = dot(u_xlat16_23.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat29.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat29.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat32.x = (-u_xlat16_68) + 1.0;
    u_xlat16_23.x = u_xlat32.x * u_xlat32.x;
    u_xlat16_23.x = u_xlat32.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat32.x * u_xlat16_23.x;
    u_xlat54 = (-u_xlat16_23.x) * u_xlat32.x + 1.0;
    u_xlat16_23.x = u_xlat32.x * u_xlat16_23.x;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat54);
    u_xlat12.xyz = u_xlat9.xxx * u_xlat16_23.xxx + u_xlat12.xyz;
    u_xlat16_23.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0078125);
    u_xlat32.x = (-u_xlat76) * u_xlat16_23.x + u_xlat76;
    u_xlat32.x = u_xlat76 * u_xlat32.x + u_xlat16_23.x;
    u_xlat32.x = sqrt(u_xlat32.x);
    u_xlat32.x = u_xlat32.x + u_xlat76;
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat31.xyz;
    u_xlat13.x = dot(u_xlat29.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat13.x) * u_xlat16_23.x + u_xlat13.x;
    u_xlat54 = u_xlat13.x * u_xlat54 + u_xlat16_23.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat32.y = u_xlat54 + u_xlat13.x;
    u_xlat32.xy = u_xlat32.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat32.x = u_xlat32.x * u_xlat32.y;
    u_xlat10.y = float(1.0) / u_xlat32.x;
    u_xlat78 = u_xlat16_23.x + -1.0;
    u_xlat10.x = u_xlat10.x * u_xlat78 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_23.x / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.318309873;
    u_xlat10.xy = min(u_xlat10.xy, vec2(16.0, 16.0));
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat14.xyz = u_xlat12.xyz * u_xlat10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat76) * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlatb15 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_15.x = (u_xlatb15.x) ? float(1.0) : float(0.0);
    u_xlat16_15.y = (u_xlatb15.y) ? float(0.0) : float(1.0);
    u_xlat16_15.z = (u_xlatb15.z) ? float(1.0) : float(0.0);
    u_xlat16_15.w = (u_xlatb15.w) ? float(0.0) : float(1.0);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xy = u_xlat16_10.xy * u_xlat16_15.xz + u_xlat16_15.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat10.xxx * u_xlat14.xyz;
    u_xlat16.xyz = u_xlat31.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat57.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat57.x = inversesqrt(u_xlat57.x);
    u_xlat16.xyz = u_xlat57.xxx * u_xlat16.xyz;
    u_xlat16_45 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat57.x = dot(u_xlat29.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat57.x * u_xlat78 + 1.0;
    u_xlat57.x = u_xlat57.x * u_xlat57.x;
    u_xlat57.x = u_xlat16_23.x / u_xlat57.x;
    u_xlat57.x = u_xlat57.x * 0.318309873;
    u_xlat79 = (-u_xlat16_45) + 1.0;
    u_xlat16_45 = u_xlat79 * u_xlat79;
    u_xlat16_45 = u_xlat79 * u_xlat16_45;
    u_xlat16_45 = u_xlat79 * u_xlat16_45;
    u_xlat80 = (-u_xlat16_45) * u_xlat79 + 1.0;
    u_xlat16_45 = u_xlat79 * u_xlat16_45;
    u_xlat16.xyz = u_xlat16_6.xyz * vec3(u_xlat80);
    u_xlat16.xyz = u_xlat9.xxx * vec3(u_xlat16_45) + u_xlat16.xyz;
    u_xlat79 = (-u_xlat74) * u_xlat16_23.x + u_xlat74;
    u_xlat79 = u_xlat74 * u_xlat79 + u_xlat16_23.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat74 + u_xlat79;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat79 = u_xlat32.y * u_xlat79;
    u_xlat57.y = float(1.0) / u_xlat79;
    u_xlat57.xy = min(u_xlat57.xy, vec2(16.0, 16.0));
    u_xlat57.x = u_xlat57.y * u_xlat57.x;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat57.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat74) * u_xlat16.xyz;
    u_xlat16_17.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_71 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_71 = (-u_xlat16_71) * u_xlat16_71 + 1.0;
    u_xlat16_71 = max(u_xlat16_71, 0.0);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_72 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat14.xyz;
    u_xlat16_68 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_71 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_71));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_71);
#endif
    u_xlat16_19.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_72 = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_72);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_71;
    u_xlat16_19.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat14.xyz = u_xlat31.xyz * u_xlat16_1.xxx + u_xlat16_18.xyz;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
    u_xlat75 = dot(u_xlat29.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_18.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat57.x = dot(u_xlat29.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.x = min(max(u_xlat57.x, 0.0), 1.0);
#else
    u_xlat57.x = clamp(u_xlat57.x, 0.0, 1.0);
#endif
    u_xlat79 = (-u_xlat16_68) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_23.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat14.x = (-u_xlat57.x) * u_xlat16_23.x + u_xlat57.x;
    u_xlat14.x = u_xlat57.x * u_xlat14.x + u_xlat16_23.x;
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat14.x = u_xlat57.x + u_xlat14.x;
    u_xlat14.x = u_xlat14.x + 6.10351563e-05;
    u_xlat54 = u_xlat32.y * u_xlat14.x;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat75 = u_xlat75 * u_xlat54;
    u_xlat16_68 = u_xlat79 * u_xlat79;
    u_xlat16_68 = u_xlat79 * u_xlat16_68;
    u_xlat16_68 = u_xlat79 * u_xlat16_68;
    u_xlat16_71 = u_xlat79 * u_xlat16_68;
    u_xlat54 = (-u_xlat16_68) * u_xlat79 + 1.0;
    u_xlat14.xyz = u_xlat16_6.xyz * vec3(u_xlat54);
    u_xlat14.xyz = u_xlat9.xxx * vec3(u_xlat16_71) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = u_xlat57.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_19.xyz * u_xlat14.xyz;
    u_xlat16_17.xyz = u_xlat14.xyz * u_xlat10.yyy + u_xlat16_17.xyz;
    u_xlat16_68 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_68) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat76) * u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_18.xyz * vec3(u_xlat74) + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_5.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.yyy * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat57.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = (-u_xlat8.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_19.xyz + u_xlat29.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_19.xyz = vec3(u_xlat16_68) * u_xlat16_19.xyz;
    u_xlat16_68 = dot(u_xlat16_19.xyz, u_xlat29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_68 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_68) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_68 = u_xlat16_0.w * u_xlat16_71 + u_xlat16_68;
    u_xlat16_68 = u_xlat16_0.w * u_xlat16_68;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_71;
    u_xlat74 = min(u_xlat16_68, 1.0);
    u_xlat9.x = min(u_xlat16_4.z, u_xlat74);
    u_xlat16_18.xyz = u_xlat9.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat9.xxx * u_xlat16_18.xyz;
    u_xlat16_20.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat9.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat9.xxx * u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat9.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_20.xyz * u_xlat9.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_20.y = u_xlat16_19.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_71) * u_xlat16_21.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlati9 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati75 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati9].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati75].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_68 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz + u_xlat16_2.xyz;
    u_xlat16_5.x = dot((-u_xlat16_11.xyz), u_xlat29.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat10.xyz = (-u_xlat29.xyz) * u_xlat16_5.xxx + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_23.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_0.z = dot(u_xlat16_19.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_19.xyz, u_xlat29.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat16_18.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat18.y = u_xlat8.y;
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat16_72 = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat13.y = u_xlat16_0.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat18.xyz, u_xlat16_72);
    u_xlat16_11.xyw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat8.xyz = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyw = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_19.xyz = vec3(u_xlat16_68) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyw = (bool(u_xlatb8)) ? u_xlat16_19.xyz : u_xlat16_11.xyw;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyw;
    u_xlat16_68 = u_xlat74 * 0.5;
    u_xlat16_72 = (-u_xlat74) * 0.5 + 1.0;
    u_xlat16_0.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_5.x = floor(u_xlat16_0.w);
    u_xlat16_27.x = u_xlat16_5.x + 1.0;
    u_xlat16_27.x = min(u_xlat16_27.x, 15.0);
    u_xlat16_0.x = u_xlat16_27.x * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_8.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_5.x * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_5.x);
    u_xlat16_27.x = (-u_xlat16_30.x) + u_xlat16_8.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_27.x + u_xlat16_30.x;
    u_xlat16_5.x = u_xlat16_71 * u_xlat16_5.x;
    u_xlat7.x = u_xlat7.x * u_xlat16_5.x;
    u_xlat16_68 = u_xlat7.x * u_xlat16_72 + u_xlat16_68;
    u_xlat16_5.x = u_xlat16_68 + u_xlat16_68;
    u_xlat16_27.x = (-u_xlat16_68) * 2.0 + 1.0;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_27.x + u_xlat16_5.x;
    u_xlat16_68 = u_xlat16_68 * u_xlat74;
    u_xlat16_68 = min(u_xlat16_68, u_xlat16_4.z);
    u_xlat16_5.xyz = vec3(u_xlat16_68) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_6.yzx + u_xlat16_17.yzx;
    u_xlat16_68 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_68;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_8.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_8.zxy * _EmissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_27.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_27.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat29.xyz;
    u_xlat10.x = u_xlat31.x * u_xlat16_1.x + _Sanshe_X;
    u_xlat10.y = u_xlat31.y * u_xlat16_1.x + _Sanshe_Y;
    u_xlat10.z = u_xlat16_11.z;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat7.x, 0.00048828125);
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Fw;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb74 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb74 = _UseSansheMask>=0.5;
#endif
    u_xlat16_27.xy = (bool(u_xlatb74)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xy = u_xlat16_13.xy * u_xlat16_27.xx + u_xlat16_27.yy;
    u_xlat7.x = u_xlat16_27.x * u_xlat7.x;
    u_xlat10.x = u_xlat31.x * u_xlat16_1.x + _Sanshe2_X;
    u_xlat10.y = u_xlat31.y * u_xlat16_1.x + _Sanshe2_Y;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = max(u_xlat8.x, 0.00048828125);
    u_xlat8.x = log2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Fw;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Power;
    u_xlat8.x = u_xlat16_27.y * u_xlat8.x;
    u_xlat30.xyz = u_xlat8.xxx * _Sanshe2_color.zxy;
    u_xlat8.x = u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_27.xyz = u_xlat7.xxx * _Sanshe_color.zxy + u_xlat30.xyz;
    u_xlat16_6.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * _DirectionalDir.xyz;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat29.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.xyz = u_xlat7.xxx * _DirectionalColor.zxy;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb73 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_6.xy = (bool(u_xlatb73)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_6.x = u_xlat16_13.z * u_xlat16_6.x + u_xlat16_6.y;
    u_xlat16_27.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_2.xyz + u_xlat16_27.xyz;
    u_xlat7.x = dot(u_xlat16_2.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.x = u_xlat7.x + -0.25;
    u_xlat7.x = u_xlat7.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_27.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_27.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_27.xyz + u_xlat16_2.xyz;
    u_xlat29.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat29.xyz = max(u_xlat29.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat29.xyz = log2(u_xlat29.xyz);
    u_xlat29.xyz = u_xlat29.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat29.xz * vec2(15.0, 0.9375);
    u_xlat30.x = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat29.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat29.x = u_xlat29.x * 15.0 + (-u_xlat30.x);
    u_xlat0.x = u_xlat30.x * 0.0625 + u_xlat0.y;
    u_xlat16_30.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat51.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat51.xy, 0.0).xyz;
    u_xlat9.xyz = (-u_xlat16_30.xyz) + u_xlat16_9.xyz;
    u_xlat29.xyz = u_xlat29.xxx * u_xlat9.xyz + u_xlat16_30.xyz;
    u_xlat16_2.x = exp2(_PostExposure);
    u_xlat30.xyz = u_xlat29.xyz * u_xlat16_2.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat30.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat30.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xyz = min(max(u_xlat30.xyz, 0.0), 1.0);
#else
    u_xlat30.xyz = clamp(u_xlat30.xyz, 0.0, 1.0);
#endif
    u_xlat9.x = dot(u_xlat30.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat30.xyz = u_xlat30.xyz + (-u_xlat9.xxx);
    u_xlat31.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat31.x;
    u_xlat7.x = max(u_xlat7.x, u_xlat8.x);
    u_xlat16_2.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_2.x + _Saturation;
    u_xlat8.xyz = u_xlat16_2.xxx * u_xlat30.xyz + u_xlat9.xxx;
    u_xlat16_2.xy = (-u_xlat8.zy) + u_xlat8.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat8.y>=u_xlat8.z);
#else
    u_xlatb7 = u_xlat8.y>=u_xlat8.z;
#endif
    u_xlat16_46 = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_0.xy = vec2(u_xlat16_46) * u_xlat16_2.xy + u_xlat8.zy;
    u_xlat16_1.w = (-u_xlat8.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_0.zw = vec2(u_xlat16_46) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_3.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_3.x = u_xlat16_1.x + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat8.x>=u_xlat16_0.x);
#else
    u_xlatb7 = u_xlat8.x>=u_xlat16_0.x;
#endif
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : 0.0;
    u_xlat16_24 = u_xlat16_2.x * u_xlat16_3.w + u_xlat8.x;
    u_xlat16_27.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_0.xyw;
    u_xlat16_2.x = min(u_xlat16_24, u_xlat16_27.y);
    u_xlat16_24 = u_xlat16_24 + (-u_xlat16_27.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_27.x;
    u_xlat16_46 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_24 = u_xlat16_24 / u_xlat16_46;
    u_xlat16_24 = u_xlat16_24 + u_xlat16_27.z;
    u_xlat16_24 = abs(u_xlat16_24) + _HueShift;
    u_xlat16_6.xyz = vec3(u_xlat16_24) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_6.xyz = fract(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_6.xyz = abs(u_xlat16_6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = u_xlat16_27.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_24;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_27.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb7 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_27.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_27.xxx;
    SV_Target0.xyz = u_xlat29.xyz * u_xlat16_27.yyy + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb7 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb7) ? u_xlat16_68 : u_xlat16_5.x;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(13) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(16) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
bvec3 u_xlatb21;
float u_xlat22;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_34;
float u_xlat42;
mediump float u_xlat16_42;
int u_xlati42;
float u_xlat45;
float u_xlat46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_50;
float u_xlat54;
mediump float u_xlat16_55;
float u_xlat63;
mediump float u_xlat16_63;
bool u_xlatb63;
float u_xlat65;
float u_xlat66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
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
    u_xlat67 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_6.xyz = texture(_DetailNormalMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_DetailNormalIntensity);
    u_xlat16_6.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_8.xyz);
    u_xlat16_6.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_67 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.w = u_xlat16_5.z * u_xlat16_67;
    u_xlat16_7.xyz = u_xlat16_6.xyw + u_xlat16_6.xyz;
    u_xlat9.z = u_xlat16_6.z * u_xlat16_7.z;
    u_xlat9.xy = vec2(u_xlat16_67) * u_xlat16_5.xy + u_xlat16_7.xy;
    u_xlat67 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat9.xyz = vec3(u_xlat67) * u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat11.xyz = vec3(u_xlat67) * u_xlat16_5.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat9.xyz = vec3(u_xlat67) * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb72)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat16_5.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb21.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb21.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb21.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb21.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb21.y) ? float(0.0) : float(1.0);
    u_xlat16_5.xy = (u_xlatb21.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_47.xy = u_xlat16_21.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat21.x = u_xlat16_21.z * u_xlat16_5.x + u_xlat16_5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_47.x * _ShadowStrength;
    u_xlat42 = u_xlat16_47.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_5.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_5.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_8.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_7.x * u_xlat16_28;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_8.x);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_70;
    u_xlat16_8.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).zxy;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat65 = (-_ShadeRange) + _DetailRange;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat3.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat24.x = u_xlat3.x + (-_ShadeRange);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat65 = u_xlat65 * u_xlat24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat65 * -2.0 + 3.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat24.x;
    u_xlat16_24.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat24.xy = (-u_xlat16_24.xy) + vec2(1.0, 1.0);
    u_xlat16_68 = min(u_xlat65, u_xlat24.x);
    u_xlat16_68 = u_xlat16_68 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_6.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz + u_xlat2.xyz;
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat24.yyy * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xy = u_xlat16_6.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat11.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_7.xyz;
    u_xlat45 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat11.xyz = vec3(u_xlat45) * u_xlat11.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat45 = dot(u_xlat9.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat72 = (-u_xlat16_70) + 1.0;
    u_xlat16_7.x = u_xlat72 * u_xlat72;
    u_xlat16_7.x = u_xlat72 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat72 * u_xlat16_7.x;
    u_xlat73 = (-u_xlat16_7.x) * u_xlat72 + 1.0;
    u_xlat16_7.x = u_xlat72 * u_xlat16_7.x;
    u_xlat11.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat11.xyz = u_xlat24.xxx * u_xlat16_7.xxx + u_xlat11.xyz;
    u_xlat16_7.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat72 = (-u_xlat45) * u_xlat16_7.x + u_xlat45;
    u_xlat72 = u_xlat45 * u_xlat72 + u_xlat16_7.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat45 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_68);
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat12.x) * u_xlat16_7.x + u_xlat12.x;
    u_xlat73 = u_xlat12.x * u_xlat73 + u_xlat16_7.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat12.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat74 = u_xlat16_7.x + -1.0;
    u_xlat66 = u_xlat66 * u_xlat74 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_7.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat66 = u_xlat72 * u_xlat66;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _DirectSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat45) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_8.xyz * u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat42) * u_xlat11.xyz;
    u_xlat16.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat16.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat74 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_7.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat72 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat72 * u_xlat72;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat54 = (-u_xlat16_71) * u_xlat72 + 1.0;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat54);
    u_xlat16.xyz = u_xlat24.xxx * vec3(u_xlat16_71) + u_xlat16.xyz;
    u_xlat72 = (-u_xlat3.x) * u_xlat16_7.x + u_xlat3.x;
    u_xlat72 = u_xlat3.x * u_xlat72 + u_xlat16_7.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat3.x + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = u_xlat3.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16.xyz * u_xlat16_5.xyz + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat11.xyz;
    u_xlat16_71 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_19.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_76;
    u_xlat16_19.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat11.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_18.xyz;
    u_xlat66 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat11.xyz;
    u_xlat66 = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat16_18.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_71) + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat74 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_7.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat11.x = (-u_xlat46) * u_xlat16_7.x + u_xlat46;
    u_xlat11.x = u_xlat46 * u_xlat11.x + u_xlat16_7.x;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat46 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat73 = u_xlat73 * u_xlat11.x;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat66 = u_xlat66 * u_xlat73;
    u_xlat16_71 = u_xlat72 * u_xlat72;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16_76 = u_xlat72 * u_xlat16_71;
    u_xlat72 = (-u_xlat16_71) * u_xlat72 + 1.0;
    u_xlat11.xyz = u_xlat16_14.xyz * vec3(u_xlat72);
    u_xlat11.xyz = u_xlat24.xxx * vec3(u_xlat16_76) + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _DirectSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat46) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_19.xyz * u_xlat11.xyz;
    u_xlat16_17.xyz = u_xlat11.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_71 = (-u_xlat16_6.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_71) * u_xlat16_13.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat42) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = vec3(u_xlat45) * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat3.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat21.xxx * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat46) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_17.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = (-u_xlat10.xyz) * vec3(u_xlat67) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_8.xyz + u_xlat9.xyz;
    u_xlat16_71 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_8.xyz = vec3(u_xlat16_71) * u_xlat16_8.xyz;
    u_xlat16_71 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_76 = (-u_xlat16_71) + u_xlat16_76;
    u_xlat16_77 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_77 + 1.0;
    u_xlat16_71 = u_xlat16_2.w * u_xlat16_76 + u_xlat16_71;
    u_xlat16_71 = u_xlat16_2.w * u_xlat16_71;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _OcclusionScale * u_xlat16_76 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_76;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_71));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_6.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_19.y = u_xlat16_8.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_76) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_71 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_13.x = u_xlat0.y * 0.5;
    u_xlat16_34 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_55 = dot((-u_xlat16_15.xyz), u_xlat9.xyz);
    u_xlat16_55 = u_xlat16_55 + u_xlat16_55;
    u_xlat3.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_55) + (-u_xlat16_15.xyz);
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat3.xyz);
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_11.w);
    u_xlat16_29.x = u_xlat16_8.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_11.x = u_xlat16_29.x * 16.0 + u_xlat16_11.z;
    u_xlat16_15.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_11.x = u_xlat16_8.x * 16.0 + u_xlat16_11.z;
    u_xlat16_15.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_8.x = u_xlat16_8.z * 15.0 + (-u_xlat16_8.x);
    u_xlat16_29.x = (-u_xlat16_63) + u_xlat16_42;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_29.x + u_xlat16_63;
    u_xlat16_8.x = u_xlat16_76 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_34 + u_xlat16_13.x;
    u_xlat16_29.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_50.x = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_50.x + u_xlat16_29.x;
    u_xlat16_8.x = u_xlat0.y * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_6.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat67) + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat16_7.xxx * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_29.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_29.x);
    u_xlat16_15.xyw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyw = u_xlat16_15.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_29.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_29.xyz : u_xlat16_15.xyw;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_29.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.yzx * u_xlat16_14.yzx + u_xlat16_17.yzx;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_15.xyw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyw = u_xlat16_14.xyz * u_xlat16_15.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_14.xyz * u_xlat16_15.xyw + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat3.x = u_xlat4.x * u_xlat16_68 + _Sanshe_X;
    u_xlat3.y = u_xlat4.y * u_xlat16_68 + _Sanshe_Y;
    u_xlat3.z = u_xlat16_15.z;
    u_xlat63 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat63 = (-u_xlat63) + 1.0;
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat63 = max(u_xlat63, 0.00048828125);
    u_xlat63 = log2(u_xlat63);
    u_xlat63 = u_xlat63 * _Sanshe_Fw;
    u_xlat63 = exp2(u_xlat63);
    u_xlat0.w = u_xlat63 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb66 = _UseSansheMask>=0.5;
#endif
    u_xlat16_50.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_50.xy = u_xlat16_10.xy * u_xlat16_50.xx + u_xlat16_50.yy;
    u_xlat3.x = u_xlat4.x * u_xlat16_68 + _Sanshe2_X;
    u_xlat3.y = u_xlat4.y * u_xlat16_68 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_50.yx;
    u_xlat3.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat3.xyz;
    u_xlat16_68 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * _DirectionalDir.xyz;
    u_xlat21.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
    u_xlat21.x = max(u_xlat21.x, 0.0);
    u_xlat21.xyz = u_xlat21.xxx * _DirectionalColor.zxy;
    u_xlat21.xyz = u_xlat21.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb3 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_50.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = u_xlat16_10.z * u_xlat16_50.x + u_xlat16_50.y;
    u_xlat16_14.xyz = u_xlat21.xyz * vec3(u_xlat16_68) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat21.x = dot(u_xlat16_5.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat21.x = u_xlat21.x + -0.25;
    u_xlat21.x = u_xlat21.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_14.xyz = (-u_xlat16_5.xyz) + _FogCol.zxy;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat3.xyz = u_xlat16_5.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat42 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat63 = u_xlat3.x * 15.0 + (-u_xlat42);
    u_xlat1.x = u_xlat42 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat63) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_5.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat16_5.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat42)) + u_xlat4.xyz;
    u_xlat63 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat63;
    u_xlat0.x = max(u_xlat21.x, u_xlat0.x);
    u_xlat16_5.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x + _Saturation;
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat4.xyz + vec3(u_xlat42);
    u_xlat16_5.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb63 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_47.x = (u_xlatb63) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_47.xx * u_xlat16_5.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_5.x = float(1.0);
    u_xlat16_5.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_47.xx * u_xlat16_5.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb21.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_5.x = (u_xlatb21.x) ? 1.0 : 0.0;
    u_xlat16_26.x = u_xlat16_5.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_5.xzw = u_xlat16_5.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_50.x = min(u_xlat16_5.z, u_xlat16_26.x);
    u_xlat16_26.x = (-u_xlat16_5.z) + u_xlat16_26.x;
    u_xlat16_47.x = u_xlat16_5.x + (-u_xlat16_50.x);
    u_xlat16_50.x = u_xlat16_47.x * 6.0 + 9.99999975e-05;
    u_xlat16_26.x = u_xlat16_26.x / u_xlat16_50.x;
    u_xlat16_26.x = u_xlat16_26.x + u_xlat16_5.w;
    u_xlat16_26.x = abs(u_xlat16_26.x) + _HueShift;
    u_xlat16_14.xyz = u_xlat16_26.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.x = u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_26.x = u_xlat16_47.x / u_xlat16_26.x;
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_26.xyz * u_xlat16_5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_50.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_50.xxx;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat16_50.yyy + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_8.x : u_xlat16_29.x;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(13) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(15) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(16) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
bvec3 u_xlatb21;
float u_xlat22;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
mediump vec3 u_xlat16_26;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_34;
float u_xlat42;
mediump float u_xlat16_42;
int u_xlati42;
float u_xlat45;
float u_xlat46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_50;
float u_xlat54;
mediump float u_xlat16_55;
float u_xlat63;
mediump float u_xlat16_63;
bool u_xlatb63;
float u_xlat65;
float u_xlat66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
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
    u_xlat67 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat4.xyz = vec3(u_xlat67) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_6.xyz = texture(_DetailNormalMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_DetailNormalIntensity);
    u_xlat16_6.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_8.xyz);
    u_xlat16_6.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_67 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.w = u_xlat16_5.z * u_xlat16_67;
    u_xlat16_7.xyz = u_xlat16_6.xyw + u_xlat16_6.xyz;
    u_xlat9.z = u_xlat16_6.z * u_xlat16_7.z;
    u_xlat9.xy = vec2(u_xlat16_67) * u_xlat16_5.xy + u_xlat16_7.xy;
    u_xlat67 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat9.xyz = vec3(u_xlat67) * u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat67 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat11.xyz = vec3(u_xlat67) * u_xlat16_5.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat67 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat67 = max(u_xlat67, 1.17549435e-38);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat9.xyz = vec3(u_xlat67) * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb72)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat16_5.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat21.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb21.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb21.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb21.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb21.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb21.y) ? float(0.0) : float(1.0);
    u_xlat16_5.xy = (u_xlatb21.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_47.xy = u_xlat16_21.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat21.x = u_xlat16_21.z * u_xlat16_5.x + u_xlat16_5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_47.x * _ShadowStrength;
    u_xlat42 = u_xlat16_47.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_5.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_5.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_8.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_7.x * u_xlat16_28;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_8.x);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_70;
    u_xlat16_8.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).zxy;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat65 = (-_ShadeRange) + _DetailRange;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat3.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat24.x = u_xlat3.x + (-_ShadeRange);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat65 = u_xlat65 * u_xlat24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat65 * -2.0 + 3.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat65 * u_xlat24.x;
    u_xlat16_24.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat24.xy = (-u_xlat16_24.xy) + vec2(1.0, 1.0);
    u_xlat16_68 = min(u_xlat65, u_xlat24.x);
    u_xlat16_68 = u_xlat16_68 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.zxy * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_6.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz + u_xlat2.xyz;
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat24.yyy * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xy = u_xlat16_6.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.x = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat11.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_7.xyz;
    u_xlat45 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat11.xyz = vec3(u_xlat45) * u_xlat11.xyz;
    u_xlat16_70 = dot(u_xlat16_7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat45 = dot(u_xlat9.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat72 = (-u_xlat16_70) + 1.0;
    u_xlat16_7.x = u_xlat72 * u_xlat72;
    u_xlat16_7.x = u_xlat72 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat72 * u_xlat16_7.x;
    u_xlat73 = (-u_xlat16_7.x) * u_xlat72 + 1.0;
    u_xlat16_7.x = u_xlat72 * u_xlat16_7.x;
    u_xlat11.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat11.xyz = u_xlat24.xxx * u_xlat16_7.xxx + u_xlat11.xyz;
    u_xlat16_7.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat72 = (-u_xlat45) * u_xlat16_7.x + u_xlat45;
    u_xlat72 = u_xlat45 * u_xlat72 + u_xlat16_7.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat45 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat16_15.xyz = u_xlat4.xyz * vec3(u_xlat16_68);
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat12.x) * u_xlat16_7.x + u_xlat12.x;
    u_xlat73 = u_xlat12.x * u_xlat73 + u_xlat16_7.x;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat12.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat74 = u_xlat16_7.x + -1.0;
    u_xlat66 = u_xlat66 * u_xlat74 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_7.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat66 = u_xlat72 * u_xlat66;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _DirectSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat45) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_8.xyz * u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat42) * u_xlat11.xyz;
    u_xlat16.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat66 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat16.xyz = vec3(u_xlat66) * u_xlat16.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat9.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat74 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_7.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat72 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat72 * u_xlat72;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat54 = (-u_xlat16_71) * u_xlat72 + 1.0;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat54);
    u_xlat16.xyz = u_xlat24.xxx * vec3(u_xlat16_71) + u_xlat16.xyz;
    u_xlat72 = (-u_xlat3.x) * u_xlat16_7.x + u_xlat3.x;
    u_xlat72 = u_xlat3.x * u_xlat72 + u_xlat16_7.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat3.x + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat72 * u_xlat73;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _DirectSpecularColor.zxy;
    u_xlat16.xyz = u_xlat3.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16.xyz * u_xlat16_5.xyz + u_xlat11.xyz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat11.xyz;
    u_xlat16_71 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_19.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_19.x);
    u_xlat16_19.xzw = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.yyy + u_xlat16_19.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_76;
    u_xlat16_19.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat11.xyz = u_xlat4.xyz * vec3(u_xlat16_68) + u_xlat16_18.xyz;
    u_xlat66 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat11.xyz;
    u_xlat66 = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_71 = dot(u_xlat16_18.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat46 = dot(u_xlat9.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_71) + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat74 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_7.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat11.x = (-u_xlat46) * u_xlat16_7.x + u_xlat46;
    u_xlat11.x = u_xlat46 * u_xlat11.x + u_xlat16_7.x;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat46 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat73 = u_xlat73 * u_xlat11.x;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat66 = u_xlat66 * u_xlat73;
    u_xlat16_71 = u_xlat72 * u_xlat72;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16_71 = u_xlat72 * u_xlat16_71;
    u_xlat16_76 = u_xlat72 * u_xlat16_71;
    u_xlat72 = (-u_xlat16_71) * u_xlat72 + 1.0;
    u_xlat11.xyz = u_xlat16_14.xyz * vec3(u_xlat72);
    u_xlat11.xyz = u_xlat24.xxx * vec3(u_xlat16_76) + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat66) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _DirectSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat46) * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_19.xyz * u_xlat11.xyz;
    u_xlat16_17.xyz = u_xlat11.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_71 = (-u_xlat16_6.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_71) * u_xlat16_13.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_18.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat42) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = vec3(u_xlat45) * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat3.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat21.xxx * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat46) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_17.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = (-u_xlat10.xyz) * vec3(u_xlat67) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_8.xyz + u_xlat9.xyz;
    u_xlat16_71 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_8.xyz = vec3(u_xlat16_71) * u_xlat16_8.xyz;
    u_xlat16_71 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_71 * 0.5 + 0.5;
    u_xlat16_76 = (-u_xlat16_71) + u_xlat16_76;
    u_xlat16_77 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_77 + 1.0;
    u_xlat16_71 = u_xlat16_2.w * u_xlat16_76 + u_xlat16_71;
    u_xlat16_71 = u_xlat16_2.w * u_xlat16_71;
    u_xlat16_76 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 + -1.0;
    u_xlat16_76 = _OcclusionScale * u_xlat16_76 + 1.0;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_76;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_71));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_6.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_19.y = u_xlat16_8.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_76) * u_xlat16_20.xyz;
    u_xlati42 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati42].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati42 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati42].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_71 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_13.x = u_xlat0.y * 0.5;
    u_xlat16_34 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_55 = dot((-u_xlat16_15.xyz), u_xlat9.xyz);
    u_xlat16_55 = u_xlat16_55 + u_xlat16_55;
    u_xlat3.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_55) + (-u_xlat16_15.xyz);
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat3.xyz);
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_11.w);
    u_xlat16_29.x = u_xlat16_8.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_11.x = u_xlat16_29.x * 16.0 + u_xlat16_11.z;
    u_xlat16_15.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_11.x = u_xlat16_8.x * 16.0 + u_xlat16_11.z;
    u_xlat16_15.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_8.x = u_xlat16_8.z * 15.0 + (-u_xlat16_8.x);
    u_xlat16_29.x = (-u_xlat16_63) + u_xlat16_42;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_29.x + u_xlat16_63;
    u_xlat16_8.x = u_xlat16_76 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_34 + u_xlat16_13.x;
    u_xlat16_29.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_50.x = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_50.x + u_xlat16_29.x;
    u_xlat16_8.x = u_xlat0.y * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_6.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat67) + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat16_7.xxx * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_29.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_29.x);
    u_xlat16_15.xyw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyw = u_xlat16_15.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_29.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_29.xyz : u_xlat16_15.xyw;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_29.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.yzx * u_xlat16_14.yzx + u_xlat16_17.yzx;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_29.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_15.xyw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyw = u_xlat16_14.xyz * u_xlat16_15.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_14.xyz * u_xlat16_15.xyw + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat3.x = u_xlat4.x * u_xlat16_68 + _Sanshe_X;
    u_xlat3.y = u_xlat4.y * u_xlat16_68 + _Sanshe_Y;
    u_xlat3.z = u_xlat16_15.z;
    u_xlat63 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat63 = (-u_xlat63) + 1.0;
    u_xlat63 = max(u_xlat63, 0.0);
    u_xlat63 = max(u_xlat63, 0.00048828125);
    u_xlat63 = log2(u_xlat63);
    u_xlat63 = u_xlat63 * _Sanshe_Fw;
    u_xlat63 = exp2(u_xlat63);
    u_xlat0.w = u_xlat63 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb66 = _UseSansheMask>=0.5;
#endif
    u_xlat16_50.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_50.xy = u_xlat16_10.xy * u_xlat16_50.xx + u_xlat16_50.yy;
    u_xlat3.x = u_xlat4.x * u_xlat16_68 + _Sanshe2_X;
    u_xlat3.y = u_xlat4.y * u_xlat16_68 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_50.yx;
    u_xlat3.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat3.xyz;
    u_xlat16_68 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_15.xyz = vec3(u_xlat16_68) * _DirectionalDir.xyz;
    u_xlat21.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
    u_xlat21.x = max(u_xlat21.x, 0.0);
    u_xlat21.xyz = u_xlat21.xxx * _DirectionalColor.zxy;
    u_xlat21.xyz = u_xlat21.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb3 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_50.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = u_xlat16_10.z * u_xlat16_50.x + u_xlat16_50.y;
    u_xlat16_14.xyz = u_xlat21.xyz * vec3(u_xlat16_68) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat21.x = dot(u_xlat16_5.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat21.x = u_xlat21.x + -0.25;
    u_xlat21.x = u_xlat21.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_14.xyz = (-u_xlat16_5.xyz) + _FogCol.zxy;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat3.xyz = u_xlat16_5.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat3.xz * vec2(15.0, 0.9375);
    u_xlat42 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat3.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat63 = u_xlat3.x * 15.0 + (-u_xlat42);
    u_xlat1.x = u_xlat42 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat3.xyz = vec3(u_xlat63) * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat16_5.x = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat16_5.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat42)) + u_xlat4.xyz;
    u_xlat63 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat63;
    u_xlat0.x = max(u_xlat21.x, u_xlat0.x);
    u_xlat16_5.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x + _Saturation;
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat4.xyz + vec3(u_xlat42);
    u_xlat16_5.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb63 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_47.x = (u_xlatb63) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_47.xx * u_xlat16_5.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_5.x = float(1.0);
    u_xlat16_5.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_47.xx * u_xlat16_5.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb21.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_5.x = (u_xlatb21.x) ? 1.0 : 0.0;
    u_xlat16_26.x = u_xlat16_5.x * u_xlat16_4.w + u_xlat0.x;
    u_xlat16_5.xzw = u_xlat16_5.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_50.x = min(u_xlat16_5.z, u_xlat16_26.x);
    u_xlat16_26.x = (-u_xlat16_5.z) + u_xlat16_26.x;
    u_xlat16_47.x = u_xlat16_5.x + (-u_xlat16_50.x);
    u_xlat16_50.x = u_xlat16_47.x * 6.0 + 9.99999975e-05;
    u_xlat16_26.x = u_xlat16_26.x / u_xlat16_50.x;
    u_xlat16_26.x = u_xlat16_26.x + u_xlat16_5.w;
    u_xlat16_26.x = abs(u_xlat16_26.x) + _HueShift;
    u_xlat16_14.xyz = u_xlat16_26.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_26.x = u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_26.x = u_xlat16_47.x / u_xlat16_26.x;
    u_xlat16_26.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_26.xyz * u_xlat16_5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_50.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_50.xxx;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat16_50.yyy + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_8.x : u_xlat16_29.x;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
int u_xlati9;
vec3 u_xlat10;
mediump vec2 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
mediump vec4 u_xlat16_14;
bvec4 u_xlatb14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
bool u_xlatb28;
vec3 u_xlat29;
mediump float u_xlat16_29;
vec3 u_xlat30;
vec2 u_xlat31;
vec3 u_xlat33;
mediump float u_xlat16_43;
float u_xlat50;
float u_xlat52;
float u_xlat54;
vec2 u_xlat55;
float u_xlat63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
int u_xlati72;
float u_xlat73;
float u_xlat75;
float u_xlat76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_22.x * u_xlat16_43;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_22.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
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
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_23, u_xlat16_2.x);
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
    u_xlat63 = (-_ShadeRange) + _DetailRange;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_4.xyz = texture(_DetailNormalMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_DetailNormalIntensity);
    u_xlat16_4.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_4.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_7 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_4.w = u_xlat16_3.z * u_xlat16_7;
    u_xlat16_5.xyz = u_xlat16_4.xyw + u_xlat16_4.xyz;
    u_xlat8.z = u_xlat16_4.z * u_xlat16_5.z;
    u_xlat8.xy = vec2(u_xlat16_7) * u_xlat16_3.xy + u_xlat16_5.xy;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat70 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat70 = max(u_xlat70, 1.17549435e-38);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = u_xlat16_3.xyz * vec3(u_xlat70);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat28.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat71 = dot(u_xlat28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat71 = max(u_xlat71, 0.0);
    u_xlat9.x = u_xlat71 + (-_ShadeRange);
    u_xlat71 = min(u_xlat71, 1.0);
    u_xlat63 = u_xlat63 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat63 * -2.0 + 3.0;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat63 * u_xlat9.x;
    u_xlat16_9.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat9.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
    u_xlat16_1.x = min(u_xlat63, u_xlat9.x);
    u_xlat16_1.x = u_xlat16_1.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = (-u_xlat16_5.xyz) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat9.yyy * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_6.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.x = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat10.xyz = u_xlat30.xyz * u_xlat16_1.xxx + u_xlat16_22.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat16_65 = dot(u_xlat16_22.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat28.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat28.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat31.x = (-u_xlat16_65) + 1.0;
    u_xlat16_22.x = u_xlat31.x * u_xlat31.x;
    u_xlat16_22.x = u_xlat31.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat31.x * u_xlat16_22.x;
    u_xlat52 = (-u_xlat16_22.x) * u_xlat31.x + 1.0;
    u_xlat16_22.x = u_xlat31.x * u_xlat16_22.x;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat52);
    u_xlat12.xyz = u_xlat9.xxx * u_xlat16_22.xxx + u_xlat12.xyz;
    u_xlat16_22.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat31.x = (-u_xlat73) * u_xlat16_22.x + u_xlat73;
    u_xlat31.x = u_xlat73 * u_xlat31.x + u_xlat16_22.x;
    u_xlat31.x = sqrt(u_xlat31.x);
    u_xlat31.x = u_xlat31.x + u_xlat73;
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat30.xyz;
    u_xlat13.x = dot(u_xlat28.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat13.x) * u_xlat16_22.x + u_xlat13.x;
    u_xlat52 = u_xlat13.x * u_xlat52 + u_xlat16_22.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat31.y = u_xlat52 + u_xlat13.x;
    u_xlat31.xy = u_xlat31.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat31.x = u_xlat31.x * u_xlat31.y;
    u_xlat10.y = float(1.0) / u_xlat31.x;
    u_xlat75 = u_xlat16_22.x + -1.0;
    u_xlat10.x = u_xlat10.x * u_xlat75 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_22.x / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.318309873;
    u_xlat10.xy = min(u_xlat10.xy, vec2(16.0, 16.0));
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat73) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlatb14 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_14.x = (u_xlatb14.x) ? float(1.0) : float(0.0);
    u_xlat16_14.y = (u_xlatb14.y) ? float(0.0) : float(1.0);
    u_xlat16_14.z = (u_xlatb14.z) ? float(1.0) : float(0.0);
    u_xlat16_14.w = (u_xlatb14.w) ? float(0.0) : float(1.0);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xy = u_xlat16_10.xy * u_xlat16_14.xz + u_xlat16_14.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat30.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat55.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat55.x = inversesqrt(u_xlat55.x);
    u_xlat15.xyz = u_xlat55.xxx * u_xlat15.xyz;
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat55.x = dot(u_xlat28.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55.x = min(max(u_xlat55.x, 0.0), 1.0);
#else
    u_xlat55.x = clamp(u_xlat55.x, 0.0, 1.0);
#endif
    u_xlat55.x = u_xlat55.x * u_xlat55.x;
    u_xlat55.x = u_xlat55.x * u_xlat75 + 1.0;
    u_xlat55.x = u_xlat55.x * u_xlat55.x;
    u_xlat55.x = u_xlat16_22.x / u_xlat55.x;
    u_xlat55.x = u_xlat55.x * 0.318309873;
    u_xlat76 = (-u_xlat16_43) + 1.0;
    u_xlat16_43 = u_xlat76 * u_xlat76;
    u_xlat16_43 = u_xlat76 * u_xlat16_43;
    u_xlat16_43 = u_xlat76 * u_xlat16_43;
    u_xlat15.x = (-u_xlat16_43) * u_xlat76 + 1.0;
    u_xlat16_43 = u_xlat76 * u_xlat16_43;
    u_xlat15.xyz = u_xlat16_6.xyz * u_xlat15.xxx;
    u_xlat15.xyz = u_xlat9.xxx * vec3(u_xlat16_43) + u_xlat15.xyz;
    u_xlat76 = (-u_xlat71) * u_xlat16_22.x + u_xlat71;
    u_xlat76 = u_xlat71 * u_xlat76 + u_xlat16_22.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat71 + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat31.y * u_xlat76;
    u_xlat55.y = float(1.0) / u_xlat76;
    u_xlat55.xy = min(u_xlat55.xy, vec2(16.0, 16.0));
    u_xlat55.x = u_xlat55.y * u_xlat55.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat55.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat71) * u_xlat15.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_64 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = (-u_xlat16_64) * u_xlat16_64 + 1.0;
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_65 = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = vec3(u_xlat16_43) * u_xlat12.xyz;
    u_xlat16_43 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb12 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat16_18.xy = (bool(u_xlatb12)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_43 = max(u_xlat16_43, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb12 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_65);
    u_xlat16_43 = u_xlat16_64 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat12.xyz = u_xlat30.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat72 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat12.xyz = vec3(u_xlat72) * u_xlat12.xyz;
    u_xlat72 = dot(u_xlat28.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat28.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat33.x = (-u_xlat16_43) + 1.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat75 + 1.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat16_22.x / u_xlat72;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat54 = (-u_xlat12.x) * u_xlat16_22.x + u_xlat12.x;
    u_xlat54 = u_xlat12.x * u_xlat54 + u_xlat16_22.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat12.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat52 = u_xlat31.y * u_xlat54;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat72 = u_xlat72 * u_xlat52;
    u_xlat16_43 = u_xlat33.x * u_xlat33.x;
    u_xlat16_43 = u_xlat33.x * u_xlat16_43;
    u_xlat16_43 = u_xlat33.x * u_xlat16_43;
    u_xlat16_64 = u_xlat33.x * u_xlat16_43;
    u_xlat52 = (-u_xlat16_43) * u_xlat33.x + 1.0;
    u_xlat33.xyz = u_xlat16_6.xyz * vec3(u_xlat52);
    u_xlat33.xyz = u_xlat9.xxx * vec3(u_xlat16_64) + u_xlat33.xyz;
    u_xlat33.xyz = vec3(u_xlat72) * u_xlat33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat33.xyz = min(max(u_xlat33.xyz, 0.0), 1.0);
#else
    u_xlat33.xyz = clamp(u_xlat33.xyz, 0.0, 1.0);
#endif
    u_xlat33.xyz = u_xlat33.xyz * _DirectSpecularColor.xyz;
    u_xlat33.xyz = u_xlat12.xxx * u_xlat33.xyz;
    u_xlat33.xyz = u_xlat16_18.xyz * u_xlat33.xyz;
    u_xlat16_16.xyz = u_xlat33.xyz * u_xlat10.yyy + u_xlat16_16.xyz;
    u_xlat16_43 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_43) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat73) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_5.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat12.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat8.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_18.xyz + u_xlat28.xyz;
    u_xlat16_43 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_18.xyz = vec3(u_xlat16_43) * u_xlat16_18.xyz;
    u_xlat16_43 = dot(u_xlat16_18.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_43 * 0.5 + 0.5;
    u_xlat16_64 = (-u_xlat16_43) + u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_43 = u_xlat16_0.w * u_xlat16_64 + u_xlat16_43;
    u_xlat16_43 = u_xlat16_0.w * u_xlat16_43;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _OcclusionScale * u_xlat16_64 + 1.0;
    u_xlat16_43 = u_xlat16_64 * u_xlat16_43;
    u_xlat71 = min(u_xlat16_43, 1.0);
    u_xlat9.x = min(u_xlat16_4.z, u_xlat71);
    u_xlat16_17.xyz = u_xlat9.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat9.xxx * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat9.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat9.xxx * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat9.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat9.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_64) * u_xlat16_20.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlati9 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati72 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati9].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati72].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_43 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_65 = dot((-u_xlat16_11.xyz), u_xlat28.xyz);
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat10.xyz = (-u_xlat28.xyz) * vec3(u_xlat16_65) + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_22.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_0.z = dot(u_xlat16_18.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_18.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_22.x = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat13.y = u_xlat16_0.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_22.x);
    u_xlat16_11.xyw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat8.xyz = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyw = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_43) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyw = (bool(u_xlatb8)) ? u_xlat16_18.xyz : u_xlat16_11.xyw;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyw;
    u_xlat16_22.x = u_xlat71 * 0.5;
    u_xlat16_43 = (-u_xlat71) * 0.5 + 1.0;
    u_xlat16_0.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_65 = floor(u_xlat16_0.w);
    u_xlat16_5.x = u_xlat16_65 + 1.0;
    u_xlat16_5.x = min(u_xlat16_5.x, 15.0);
    u_xlat16_0.x = u_xlat16_5.x * 16.0 + u_xlat16_0.z;
    u_xlat16_5.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_8.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_0.x = u_xlat16_65 * 16.0 + u_xlat16_0.z;
    u_xlat16_5.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_65 = u_xlat16_5.z * 15.0 + (-u_xlat16_65);
    u_xlat16_5.x = (-u_xlat16_29) + u_xlat16_8.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_5.x + u_xlat16_29;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat7.x = u_xlat7.x * u_xlat16_64;
    u_xlat16_22.x = u_xlat7.x * u_xlat16_43 + u_xlat16_22.x;
    u_xlat16_43 = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat16_64 = (-u_xlat16_22.x) * 2.0 + 1.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_64 + u_xlat16_43;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat71;
    u_xlat16_22.x = min(u_xlat16_22.x, u_xlat16_4.z);
    u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_6.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz + u_xlat16_16.xyz;
    u_xlat16_22.x = dot(u_xlat16_22.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_8.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * _EmissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat28.xyz;
    u_xlat10.x = u_xlat30.x * u_xlat16_1.x + _Sanshe_X;
    u_xlat10.y = u_xlat30.y * u_xlat16_1.x + _Sanshe_Y;
    u_xlat10.z = u_xlat16_11.z;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat7.x, 0.00048828125);
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Fw;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb71 = _UseSansheMask>=0.5;
#endif
    u_xlat16_5.xy = (bool(u_xlatb71)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xy = u_xlat16_12.xy * u_xlat16_5.xx + u_xlat16_5.yy;
    u_xlat7.x = u_xlat16_5.x * u_xlat7.x;
    u_xlat10.x = u_xlat30.x * u_xlat16_1.x + _Sanshe2_X;
    u_xlat10.y = u_xlat30.y * u_xlat16_1.x + _Sanshe2_Y;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = max(u_xlat8.x, 0.00048828125);
    u_xlat8.x = log2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Fw;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Power;
    u_xlat8.x = u_xlat16_5.y * u_xlat8.x;
    u_xlat29.xyz = u_xlat8.xxx * _Sanshe2_color.xyz;
    u_xlat8.x = u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat7.xxx * _Sanshe_color.xyz + u_xlat29.xyz;
    u_xlat16_1.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_6.xyz = u_xlat16_1.xxx * _DirectionalDir.xyz;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat28.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.xyz = u_xlat7.xxx * _DirectionalColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb70 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_1.xw = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = u_xlat16_12.z * u_xlat16_1.x + u_xlat16_1.w;
    u_xlat16_5.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz + u_xlat16_5.xyz;
    u_xlat7.x = dot(u_xlat16_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.x = u_xlat7.x + -0.25;
    u_xlat7.x = u_xlat7.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = exp2(_PostExposure);
    u_xlat28.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat28.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat28.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xyz = min(max(u_xlat28.xyz, 0.0), 1.0);
#else
    u_xlat28.xyz = clamp(u_xlat28.xyz, 0.0, 1.0);
#endif
    u_xlat29.x = dot(u_xlat28.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat28.xyz = u_xlat28.xyz + (-u_xlat29.xxx);
    u_xlat50 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat50;
    u_xlat7.x = max(u_xlat7.x, u_xlat8.x);
    u_xlat16_1.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_1.x = u_xlat7.x * u_xlat16_1.x + _Saturation;
    u_xlat7.xyz = u_xlat16_1.xxx * u_xlat28.xyz + u_xlat29.xxx;
    u_xlat16_1.xw = (-u_xlat7.zy) + u_xlat7.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat7.y>=u_xlat7.z);
#else
    u_xlatb70 = u_xlat7.y>=u_xlat7.z;
#endif
    u_xlat16_65 = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat16_0.xy = vec2(u_xlat16_65) * u_xlat16_1.xw + u_xlat7.zy;
    u_xlat16_3.w = (-u_xlat7.x);
    u_xlat16_1.x = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat16_0.zw = vec2(u_xlat16_65) * u_xlat16_1.xw + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_0.xyw);
    u_xlat16_4.yzw = u_xlat16_0.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_3.x + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat7.x>=u_xlat16_0.x);
#else
    u_xlatb28 = u_xlat7.x>=u_xlat16_0.x;
#endif
    u_xlat16_1.x = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_64 = u_xlat16_1.x * u_xlat16_4.w + u_xlat7.x;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_0.xyw;
    u_xlat16_1.x = min(u_xlat16_64, u_xlat16_5.y);
    u_xlat16_64 = u_xlat16_64 + (-u_xlat16_5.y);
    u_xlat16_1.x = (-u_xlat16_1.x) + u_xlat16_5.x;
    u_xlat16_65 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_64 = u_xlat16_64 / u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 + u_xlat16_5.z;
    u_xlat16_64 = abs(u_xlat16_64) + _HueShift;
    u_xlat16_26.xyz = vec3(u_xlat16_64) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_26.xyz = fract(u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_26.xyz = abs(u_xlat16_26.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xyz = min(max(u_xlat16_26.xyz, 0.0), 1.0);
#else
    u_xlat16_26.xyz = clamp(u_xlat16_26.xyz, 0.0, 1.0);
#endif
    u_xlat16_26.xyz = u_xlat16_26.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_64 = u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_64;
    u_xlat16_26.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_26.xyz * u_xlat16_5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb7 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_1.xw = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_1.www + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb7 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb7) ? u_xlat16_22.x : u_xlat16_43;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(13) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
int u_xlati9;
vec3 u_xlat10;
mediump vec2 u_xlat16_10;
ivec3 u_xlati10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
mediump vec4 u_xlat16_14;
bvec4 u_xlatb14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
bool u_xlatb28;
vec3 u_xlat29;
mediump float u_xlat16_29;
vec3 u_xlat30;
vec2 u_xlat31;
vec3 u_xlat33;
mediump float u_xlat16_43;
float u_xlat50;
float u_xlat52;
float u_xlat54;
vec2 u_xlat55;
float u_xlat63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
bool u_xlatb71;
float u_xlat72;
int u_xlati72;
float u_xlat73;
float u_xlat75;
float u_xlat76;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_22.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_22.x = (-u_xlat16_22.x) * u_xlat16_22.x + 1.0;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_43 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_22.x * u_xlat16_43;
    u_xlat16_22.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_22.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_22.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_22.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_22.xyz = u_xlat16_2.xyz * u_xlat16_22.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_22.xyz);
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
    u_xlat16_23 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_23, u_xlat16_2.x);
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
    u_xlat63 = (-_ShadeRange) + _DetailRange;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat16_3.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_4.xyz = texture(_DetailNormalMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_DetailNormalIntensity);
    u_xlat16_4.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_4.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat16_7 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_4.w = u_xlat16_3.z * u_xlat16_7;
    u_xlat16_5.xyz = u_xlat16_4.xyw + u_xlat16_4.xyz;
    u_xlat8.z = u_xlat16_4.z * u_xlat16_5.z;
    u_xlat8.xy = vec2(u_xlat16_7) * u_xlat16_3.xy + u_xlat16_5.xy;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat70 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat70 = max(u_xlat70, 1.17549435e-38);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = u_xlat16_3.xyz * vec3(u_xlat70);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat7.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat28.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat71 = dot(u_xlat28.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat71 = max(u_xlat71, 0.0);
    u_xlat9.x = u_xlat71 + (-_ShadeRange);
    u_xlat71 = min(u_xlat71, 1.0);
    u_xlat63 = u_xlat63 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat63 * -2.0 + 3.0;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat63 * u_xlat9.x;
    u_xlat16_9.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat9.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
    u_xlat16_1.x = min(u_xlat63, u_xlat9.x);
    u_xlat16_1.x = u_xlat16_1.x + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat16_11.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = (-u_xlat16_5.xyz) * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat9.yyy * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_0.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_6.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.x = u_xlat16_6.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat30.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat30.xyz, u_xlat30.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat10.xyz = u_xlat30.xyz * u_xlat16_1.xxx + u_xlat16_22.xyz;
    u_xlat73 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat10.xyz = vec3(u_xlat73) * u_xlat10.xyz;
    u_xlat16_65 = dot(u_xlat16_22.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat73 = dot(u_xlat28.xyz, u_xlat16_22.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat10.x = dot(u_xlat28.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat31.x = (-u_xlat16_65) + 1.0;
    u_xlat16_22.x = u_xlat31.x * u_xlat31.x;
    u_xlat16_22.x = u_xlat31.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat31.x * u_xlat16_22.x;
    u_xlat52 = (-u_xlat16_22.x) * u_xlat31.x + 1.0;
    u_xlat16_22.x = u_xlat31.x * u_xlat16_22.x;
    u_xlat12.xyz = u_xlat16_6.xyz * vec3(u_xlat52);
    u_xlat12.xyz = u_xlat9.xxx * u_xlat16_22.xxx + u_xlat12.xyz;
    u_xlat16_22.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0078125);
    u_xlat31.x = (-u_xlat73) * u_xlat16_22.x + u_xlat73;
    u_xlat31.x = u_xlat73 * u_xlat31.x + u_xlat16_22.x;
    u_xlat31.x = sqrt(u_xlat31.x);
    u_xlat31.x = u_xlat31.x + u_xlat73;
    u_xlat16_11.xyz = u_xlat16_1.xxx * u_xlat30.xyz;
    u_xlat13.x = dot(u_xlat28.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat13.x) * u_xlat16_22.x + u_xlat13.x;
    u_xlat52 = u_xlat13.x * u_xlat52 + u_xlat16_22.x;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat31.y = u_xlat52 + u_xlat13.x;
    u_xlat31.xy = u_xlat31.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat31.x = u_xlat31.x * u_xlat31.y;
    u_xlat10.y = float(1.0) / u_xlat31.x;
    u_xlat75 = u_xlat16_22.x + -1.0;
    u_xlat10.x = u_xlat10.x * u_xlat75 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat16_22.x / u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.318309873;
    u_xlat10.xy = min(u_xlat10.xy, vec2(16.0, 16.0));
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat12.xyz = u_xlat12.xyz * u_xlat10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat73) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_2.xyz * u_xlat12.xyz;
    u_xlatb14 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_14.x = (u_xlatb14.x) ? float(1.0) : float(0.0);
    u_xlat16_14.y = (u_xlatb14.y) ? float(0.0) : float(1.0);
    u_xlat16_14.z = (u_xlatb14.z) ? float(1.0) : float(0.0);
    u_xlat16_14.w = (u_xlatb14.w) ? float(0.0) : float(1.0);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xy = u_xlat16_10.xy * u_xlat16_14.xz + u_xlat16_14.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat10.xxx * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat30.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat55.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat55.x = inversesqrt(u_xlat55.x);
    u_xlat15.xyz = u_xlat55.xxx * u_xlat15.xyz;
    u_xlat16_43 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat55.x = dot(u_xlat28.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55.x = min(max(u_xlat55.x, 0.0), 1.0);
#else
    u_xlat55.x = clamp(u_xlat55.x, 0.0, 1.0);
#endif
    u_xlat55.x = u_xlat55.x * u_xlat55.x;
    u_xlat55.x = u_xlat55.x * u_xlat75 + 1.0;
    u_xlat55.x = u_xlat55.x * u_xlat55.x;
    u_xlat55.x = u_xlat16_22.x / u_xlat55.x;
    u_xlat55.x = u_xlat55.x * 0.318309873;
    u_xlat76 = (-u_xlat16_43) + 1.0;
    u_xlat16_43 = u_xlat76 * u_xlat76;
    u_xlat16_43 = u_xlat76 * u_xlat16_43;
    u_xlat16_43 = u_xlat76 * u_xlat16_43;
    u_xlat15.x = (-u_xlat16_43) * u_xlat76 + 1.0;
    u_xlat16_43 = u_xlat76 * u_xlat16_43;
    u_xlat15.xyz = u_xlat16_6.xyz * u_xlat15.xxx;
    u_xlat15.xyz = u_xlat9.xxx * vec3(u_xlat16_43) + u_xlat15.xyz;
    u_xlat76 = (-u_xlat71) * u_xlat16_22.x + u_xlat71;
    u_xlat76 = u_xlat71 * u_xlat76 + u_xlat16_22.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat71 + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat31.y * u_xlat76;
    u_xlat55.y = float(1.0) / u_xlat76;
    u_xlat55.xy = min(u_xlat55.xy, vec2(16.0, 16.0));
    u_xlat55.x = u_xlat55.y * u_xlat55.x;
    u_xlat15.xyz = u_xlat15.xyz * u_xlat55.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat71) * u_xlat15.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_43 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_43 = max(u_xlat16_43, 6.10351563e-05);
    u_xlat16_64 = u_xlat16_43 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = (-u_xlat16_64) * u_xlat16_64 + 1.0;
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_65 = float(1.0) / float(u_xlat16_43);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_17.xyz = vec3(u_xlat16_43) * u_xlat12.xyz;
    u_xlat16_43 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb12 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat16_18.xy = (bool(u_xlatb12)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_43 = max(u_xlat16_43, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb12 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_65 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_65);
    u_xlat16_43 = u_xlat16_64 * u_xlat16_43;
    u_xlat16_18.xyz = vec3(u_xlat16_43) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat12.xyz = u_xlat30.xyz * u_xlat16_1.xxx + u_xlat16_17.xyz;
    u_xlat72 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat12.xyz = vec3(u_xlat72) * u_xlat12.xyz;
    u_xlat72 = dot(u_xlat28.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat16_43 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat28.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat33.x = (-u_xlat16_43) + 1.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat75 + 1.0;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat72 = u_xlat16_22.x / u_xlat72;
    u_xlat72 = u_xlat72 * 0.318309873;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat54 = (-u_xlat12.x) * u_xlat16_22.x + u_xlat12.x;
    u_xlat54 = u_xlat12.x * u_xlat54 + u_xlat16_22.x;
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat12.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat52 = u_xlat31.y * u_xlat54;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat72 = u_xlat72 * u_xlat52;
    u_xlat16_43 = u_xlat33.x * u_xlat33.x;
    u_xlat16_43 = u_xlat33.x * u_xlat16_43;
    u_xlat16_43 = u_xlat33.x * u_xlat16_43;
    u_xlat16_64 = u_xlat33.x * u_xlat16_43;
    u_xlat52 = (-u_xlat16_43) * u_xlat33.x + 1.0;
    u_xlat33.xyz = u_xlat16_6.xyz * vec3(u_xlat52);
    u_xlat33.xyz = u_xlat9.xxx * vec3(u_xlat16_64) + u_xlat33.xyz;
    u_xlat33.xyz = vec3(u_xlat72) * u_xlat33.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat33.xyz = min(max(u_xlat33.xyz, 0.0), 1.0);
#else
    u_xlat33.xyz = clamp(u_xlat33.xyz, 0.0, 1.0);
#endif
    u_xlat33.xyz = u_xlat33.xyz * _DirectSpecularColor.xyz;
    u_xlat33.xyz = u_xlat12.xxx * u_xlat33.xyz;
    u_xlat33.xyz = u_xlat16_18.xyz * u_xlat33.xyz;
    u_xlat16_16.xyz = u_xlat33.xyz * u_xlat10.yyy + u_xlat16_16.xyz;
    u_xlat16_43 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_43) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat73) * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat71) + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat16_5.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_17.xyz * u_xlat12.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = (-u_xlat8.xyz) * u_xlat7.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_18.xyz + u_xlat28.xyz;
    u_xlat16_43 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_18.xyz = vec3(u_xlat16_43) * u_xlat16_18.xyz;
    u_xlat16_43 = dot(u_xlat16_18.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43 = min(max(u_xlat16_43, 0.0), 1.0);
#else
    u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_43 * 0.5 + 0.5;
    u_xlat16_64 = (-u_xlat16_43) + u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_0.w = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_43 = u_xlat16_0.w * u_xlat16_64 + u_xlat16_43;
    u_xlat16_43 = u_xlat16_0.w * u_xlat16_43;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _OcclusionScale * u_xlat16_64 + 1.0;
    u_xlat16_43 = u_xlat16_64 * u_xlat16_43;
    u_xlat71 = min(u_xlat16_43, 1.0);
    u_xlat9.x = min(u_xlat16_4.z, u_xlat71);
    u_xlat16_17.xyz = u_xlat9.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat9.xxx * u_xlat16_17.xyz;
    u_xlat16_19.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat9.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat9.xxx * u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat9.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat9.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_64) * u_xlat16_20.xyz;
    u_xlati9 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati9].xyz;
    u_xlati9 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlati72 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati9].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati72].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_43 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_20.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat16_65 = dot((-u_xlat16_11.xyz), u_xlat28.xyz);
    u_xlat16_65 = u_xlat16_65 + u_xlat16_65;
    u_xlat10.xyz = (-u_xlat28.xyz) * vec3(u_xlat16_65) + (-u_xlat16_11.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat7.xxx + (-u_xlat10.xyz);
    u_xlat8.xyz = u_xlat16_22.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat16_0.z = dot(u_xlat16_18.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_18.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_17.x = dot(_IndirectCubemapRotationParams.xy, u_xlat8.xz);
    u_xlat16_17.z = dot(_IndirectCubemapRotationParams.zw, u_xlat8.xz);
    u_xlat17.y = u_xlat8.y;
    u_xlat17.xz = u_xlat16_17.xz;
    u_xlat16_22.x = u_xlat16_0.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_0.x);
    u_xlat13.y = u_xlat16_0.x;
    u_xlat16_8.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xxx + u_xlat16_8.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat17.xyz, u_xlat16_22.x);
    u_xlat16_11.xyw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat8.xyz = u_xlat16_11.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyw = u_xlat8.xyz * u_xlat8.xyz;
    u_xlat16_11.xyw = u_xlat16_11.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_43) * u_xlat16_11.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb8 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyw = (bool(u_xlatb8)) ? u_xlat16_18.xyz : u_xlat16_11.xyw;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyw;
    u_xlat16_22.x = u_xlat71 * 0.5;
    u_xlat16_43 = (-u_xlat71) * 0.5 + 1.0;
    u_xlat16_0.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_65 = floor(u_xlat16_0.w);
    u_xlat16_5.x = u_xlat16_65 + 1.0;
    u_xlat16_5.x = min(u_xlat16_5.x, 15.0);
    u_xlat16_0.x = u_xlat16_5.x * 16.0 + u_xlat16_0.z;
    u_xlat16_5.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_8.x = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_0.x = u_xlat16_65 * 16.0 + u_xlat16_0.z;
    u_xlat16_5.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_5.xy).x;
    u_xlat16_65 = u_xlat16_5.z * 15.0 + (-u_xlat16_65);
    u_xlat16_5.x = (-u_xlat16_29) + u_xlat16_8.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_5.x + u_xlat16_29;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat7.x = u_xlat7.x * u_xlat16_64;
    u_xlat16_22.x = u_xlat7.x * u_xlat16_43 + u_xlat16_22.x;
    u_xlat16_43 = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat16_64 = (-u_xlat16_22.x) * 2.0 + 1.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_64 + u_xlat16_43;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat71;
    u_xlat16_22.x = min(u_xlat16_22.x, u_xlat16_4.z);
    u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_6.xyz;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_5.xyz + u_xlat16_16.xyz;
    u_xlat16_22.x = dot(u_xlat16_22.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_22.x = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_43 = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_8.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * _EmissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat7.x = max(u_xlat7.x, 1.17549435e-38);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat28.xyz;
    u_xlat10.x = u_xlat30.x * u_xlat16_1.x + _Sanshe_X;
    u_xlat10.y = u_xlat30.y * u_xlat16_1.x + _Sanshe_Y;
    u_xlat10.z = u_xlat16_11.z;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat7.x, 0.00048828125);
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Fw;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb71 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb71 = _UseSansheMask>=0.5;
#endif
    u_xlat16_5.xy = (bool(u_xlatb71)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_12.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xy = u_xlat16_12.xy * u_xlat16_5.xx + u_xlat16_5.yy;
    u_xlat7.x = u_xlat16_5.x * u_xlat7.x;
    u_xlat10.x = u_xlat30.x * u_xlat16_1.x + _Sanshe2_X;
    u_xlat10.y = u_xlat30.y * u_xlat16_1.x + _Sanshe2_Y;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.0);
    u_xlat8.x = max(u_xlat8.x, 0.00048828125);
    u_xlat8.x = log2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Fw;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _Sanshe2_Power;
    u_xlat8.x = u_xlat16_5.y * u_xlat8.x;
    u_xlat29.xyz = u_xlat8.xxx * _Sanshe2_color.xyz;
    u_xlat8.x = u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat7.xxx * _Sanshe_color.xyz + u_xlat29.xyz;
    u_xlat16_1.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_6.xyz = u_xlat16_1.xxx * _DirectionalDir.xyz;
    u_xlat7.x = dot(u_xlat16_6.xyz, u_xlat28.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.xyz = u_xlat7.xxx * _DirectionalColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb70 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_1.xw = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = u_xlat16_12.z * u_xlat16_1.x + u_xlat16_1.w;
    u_xlat16_5.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz + u_xlat16_5.xyz;
    u_xlat7.x = dot(u_xlat16_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.x = u_xlat7.x + -0.25;
    u_xlat7.x = u_xlat7.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = exp2(_PostExposure);
    u_xlat28.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat28.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat28.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xyz = min(max(u_xlat28.xyz, 0.0), 1.0);
#else
    u_xlat28.xyz = clamp(u_xlat28.xyz, 0.0, 1.0);
#endif
    u_xlat29.x = dot(u_xlat28.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat28.xyz = u_xlat28.xyz + (-u_xlat29.xxx);
    u_xlat50 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat50;
    u_xlat7.x = max(u_xlat7.x, u_xlat8.x);
    u_xlat16_1.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_1.x = u_xlat7.x * u_xlat16_1.x + _Saturation;
    u_xlat7.xyz = u_xlat16_1.xxx * u_xlat28.xyz + u_xlat29.xxx;
    u_xlat16_1.xw = (-u_xlat7.zy) + u_xlat7.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat7.y>=u_xlat7.z);
#else
    u_xlatb70 = u_xlat7.y>=u_xlat7.z;
#endif
    u_xlat16_65 = (u_xlatb70) ? 1.0 : 0.0;
    u_xlat16_0.xy = vec2(u_xlat16_65) * u_xlat16_1.xw + u_xlat7.zy;
    u_xlat16_3.w = (-u_xlat7.x);
    u_xlat16_1.x = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat16_0.zw = vec2(u_xlat16_65) * u_xlat16_1.xw + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_0.xyw);
    u_xlat16_4.yzw = u_xlat16_0.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_3.x + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat7.x>=u_xlat16_0.x);
#else
    u_xlatb28 = u_xlat7.x>=u_xlat16_0.x;
#endif
    u_xlat16_1.x = (u_xlatb28) ? 1.0 : 0.0;
    u_xlat16_64 = u_xlat16_1.x * u_xlat16_4.w + u_xlat7.x;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_0.xyw;
    u_xlat16_1.x = min(u_xlat16_64, u_xlat16_5.y);
    u_xlat16_64 = u_xlat16_64 + (-u_xlat16_5.y);
    u_xlat16_1.x = (-u_xlat16_1.x) + u_xlat16_5.x;
    u_xlat16_65 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_64 = u_xlat16_64 / u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 + u_xlat16_5.z;
    u_xlat16_64 = abs(u_xlat16_64) + _HueShift;
    u_xlat16_26.xyz = vec3(u_xlat16_64) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_26.xyz = fract(u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_26.xyz = abs(u_xlat16_26.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26.xyz = min(max(u_xlat16_26.xyz, 0.0), 1.0);
#else
    u_xlat16_26.xyz = clamp(u_xlat16_26.xyz, 0.0, 1.0);
#endif
    u_xlat16_26.xyz = u_xlat16_26.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_64 = u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_64;
    u_xlat16_26.xyz = u_xlat16_1.xxx * u_xlat16_26.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_26.xyz * u_xlat16_5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb7 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_1.xw = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_1.www + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb7 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb7) ? u_xlat16_22.x : u_xlat16_43;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bvec3 u_xlatb22;
float u_xlat23;
vec2 u_xlat26;
mediump vec2 u_xlat16_26;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_36;
float u_xlat44;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_52;
float u_xlat55;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat68;
float u_xlat70;
mediump float u_xlat16_70;
bool u_xlatb70;
mediump float u_xlat16_71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
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
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_6.xyz = texture(_DetailNormalMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_DetailNormalIntensity);
    u_xlat16_6.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_8.xyz);
    u_xlat16_6.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_70 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.w = u_xlat16_5.z * u_xlat16_70;
    u_xlat16_7.xyz = u_xlat16_6.xyw + u_xlat16_6.xyz;
    u_xlat9.z = u_xlat16_6.z * u_xlat16_7.z;
    u_xlat9.xy = vec2(u_xlat16_70) * u_xlat16_5.xy + u_xlat16_7.xy;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat70) * u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat70 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat70 = max(u_xlat70, 1.17549435e-38);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat16_5.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 1.17549435e-38);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat70) * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb75)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat23 = (-u_xlat1.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat23 + u_xlat1.x;
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
    u_xlat16_5.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb22.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb22.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb22.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb22.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb22.y) ? float(0.0) : float(1.0);
    u_xlat16_5.xy = (u_xlatb22.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_49.xy = u_xlat16_22.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat22.x = u_xlat16_22.z * u_xlat16_5.x + u_xlat16_5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_49.x * _ShadowStrength;
    u_xlat44 = u_xlat16_49.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_5.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_5.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_71 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_29 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_8.xyz = u_xlat2.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_7.x * u_xlat16_29;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_8.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_8.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat68 = (-_ShadeRange) + _DetailRange;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat4.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat26.x = u_xlat4.x + (-_ShadeRange);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat68 = u_xlat68 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat68 * -2.0 + 3.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat68 * u_xlat26.x;
    u_xlat16_26.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat26.xy = (-u_xlat16_26.xy) + vec2(1.0, 1.0);
    u_xlat16_71 = min(u_xlat68, u_xlat26.x);
    u_xlat16_71 = u_xlat16_71 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyz + u_xlat2.xyz;
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat26.yyy * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_71) + u_xlat16_7.xyz;
    u_xlat48 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat12.xyz = vec3(u_xlat48) * u_xlat12.xyz;
    u_xlat16_73 = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat48 = dot(u_xlat9.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat76 = (-u_xlat16_73) + 1.0;
    u_xlat16_7.x = u_xlat76 * u_xlat76;
    u_xlat16_7.x = u_xlat76 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat76 * u_xlat16_7.x;
    u_xlat77 = (-u_xlat16_7.x) * u_xlat76 + 1.0;
    u_xlat16_7.x = u_xlat76 * u_xlat16_7.x;
    u_xlat12.xyz = u_xlat16_14.xyz * vec3(u_xlat77);
    u_xlat12.xyz = u_xlat26.xxx * u_xlat16_7.xxx + u_xlat12.xyz;
    u_xlat16_7.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat76 = (-u_xlat48) * u_xlat16_7.x + u_xlat48;
    u_xlat76 = u_xlat48 * u_xlat76 + u_xlat16_7.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat48 + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_15.xyz = vec3(u_xlat16_71) * u_xlat11.xyz;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat77 = (-u_xlat16.x) * u_xlat16_7.x + u_xlat16.x;
    u_xlat77 = u_xlat16.x * u_xlat77 + u_xlat16_7.x;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat16.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat76 = u_xlat76 * u_xlat77;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat78 = u_xlat16_7.x + -1.0;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_7.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat75 = u_xlat76 * u_xlat75;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat48) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_8.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat44) * u_xlat12.xyz;
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat17.xyz = vec3(u_xlat75) * u_xlat17.xyz;
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat9.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_7.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat76 * u_xlat76;
    u_xlat16_74 = u_xlat76 * u_xlat16_74;
    u_xlat16_74 = u_xlat76 * u_xlat16_74;
    u_xlat60 = (-u_xlat16_74) * u_xlat76 + 1.0;
    u_xlat16_74 = u_xlat76 * u_xlat16_74;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat60);
    u_xlat17.xyz = u_xlat26.xxx * vec3(u_xlat16_74) + u_xlat17.xyz;
    u_xlat76 = (-u_xlat4.x) * u_xlat16_7.x + u_xlat4.x;
    u_xlat76 = u_xlat4.x * u_xlat76 + u_xlat16_7.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat4.x + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat76 * u_xlat77;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.xyz;
    u_xlat17.xyz = u_xlat4.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_5.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_79 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_80 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat12.xyz;
    u_xlat16_74 = u_xlat16_79 * u_xlat16_80;
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_20.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_80);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_79;
    u_xlat16_20.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_71) + u_xlat16_19.xyz;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat16_74) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_7.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat12.x = (-u_xlat76) * u_xlat16_7.x + u_xlat76;
    u_xlat12.x = u_xlat76 * u_xlat12.x + u_xlat16_7.x;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat76 + u_xlat12.x;
    u_xlat12.x = u_xlat12.x + 6.10351563e-05;
    u_xlat77 = u_xlat77 * u_xlat12.x;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat75 = u_xlat75 * u_xlat77;
    u_xlat16_74 = u_xlat55 * u_xlat55;
    u_xlat16_74 = u_xlat55 * u_xlat16_74;
    u_xlat16_74 = u_xlat55 * u_xlat16_74;
    u_xlat16_79 = u_xlat55 * u_xlat16_74;
    u_xlat55 = (-u_xlat16_74) * u_xlat55 + 1.0;
    u_xlat12.xyz = u_xlat16_14.xyz * vec3(u_xlat55);
    u_xlat12.xyz = u_xlat26.xxx * vec3(u_xlat16_79) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat76) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_20.xyz * u_xlat12.xyz;
    u_xlat16_18.xyz = u_xlat12.xyz * u_xlat22.xxx + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat44) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat4.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_20.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat22.xxx * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat76) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = (-u_xlat10.xyz) * vec3(u_xlat70) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_8.xyz + u_xlat9.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_8.xyz = vec3(u_xlat16_74) * u_xlat16_8.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_79 = (-u_xlat16_74) + u_xlat16_79;
    u_xlat16_80 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_74 = u_xlat16_2.w * u_xlat16_79 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_2.w * u_xlat16_74;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_79;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_20.y = u_xlat16_8.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_20.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_79) * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati44 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz + u_xlat16_5.xyz;
    u_xlat16_13.x = u_xlat0.y * 0.5;
    u_xlat16_35 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_57 = dot((-u_xlat16_15.xyz), u_xlat9.xyz);
    u_xlat16_57 = u_xlat16_57 + u_xlat16_57;
    u_xlat4.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_57) + (-u_xlat16_15.xyz);
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_6.w);
    u_xlat16_30.x = u_xlat16_8.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_6.x = u_xlat16_30.x * 16.0 + u_xlat16_6.z;
    u_xlat16_15.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_6.x = u_xlat16_8.x * 16.0 + u_xlat16_6.z;
    u_xlat16_15.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_8.x = u_xlat16_8.z * 15.0 + (-u_xlat16_8.x);
    u_xlat16_30.x = (-u_xlat16_66) + u_xlat16_44;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_30.x + u_xlat16_66;
    u_xlat16_8.x = u_xlat16_79 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_35 + u_xlat16_13.x;
    u_xlat16_30.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_52.x = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_52.x + u_xlat16_30.x;
    u_xlat16_8.x = u_xlat0.y * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_3.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat70) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_7.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_30.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat16.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_30.x);
    u_xlat16_15.xyw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_15.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyw = u_xlat16_15.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_30.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (bool(u_xlatb0)) ? u_xlat16_30.xyz : u_xlat16_15.xyw;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_30.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz + u_xlat16_18.xyz;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_15.xyw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyw = u_xlat16_14.xyz * u_xlat16_15.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_14.xyz * u_xlat16_15.xyw + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat4.x = u_xlat11.x * u_xlat16_71 + _Sanshe_X;
    u_xlat4.y = u_xlat11.y * u_xlat16_71 + _Sanshe_Y;
    u_xlat4.z = u_xlat16_15.z;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = max(u_xlat66, 0.00048828125);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Fw;
    u_xlat66 = exp2(u_xlat66);
    u_xlat0.w = u_xlat66 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb70 = _UseSansheMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_52.xy = u_xlat16_10.xy * u_xlat16_52.xx + u_xlat16_52.yy;
    u_xlat4.x = u_xlat11.x * u_xlat16_71 + _Sanshe2_X;
    u_xlat4.y = u_xlat11.y * u_xlat16_71 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_52.yx;
    u_xlat4.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat4.xyz;
    u_xlat16_71 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_15.xyz = vec3(u_xlat16_71) * _DirectionalDir.xyz;
    u_xlat22.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat22.xyz = u_xlat22.xxx * _DirectionalColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = u_xlat16_10.z * u_xlat16_52.x + u_xlat16_52.y;
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_71) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat22.x = dot(u_xlat16_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat22.x = u_xlat22.x + -0.25;
    u_xlat22.x = u_xlat22.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_14.xyz = (-u_xlat16_5.xyz) + _FogCol.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_71 = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_71) + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat44)) + u_xlat4.xyz;
    u_xlat66 = u_xlat22.x * -2.0 + 3.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat66;
    u_xlat0.x = max(u_xlat22.x, u_xlat0.x);
    u_xlat16_71 = (-_Saturation) + _SansheSaturation;
    u_xlat16_71 = u_xlat0.x * u_xlat16_71 + _Saturation;
    u_xlat0.xyz = vec3(u_xlat16_71) * u_xlat4.xyz + vec3(u_xlat44);
    u_xlat16_52.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb66 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_71 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_71) * u_xlat16_52.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_52.x = float(1.0);
    u_xlat16_52.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_71) * u_xlat16_52.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb22.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_71 = (u_xlatb22.x) ? 1.0 : 0.0;
    u_xlat16_52.x = u_xlat16_71 * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_14.xyz = vec3(u_xlat16_71) * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_71 = min(u_xlat16_52.x, u_xlat16_14.y);
    u_xlat16_52.x = u_xlat16_52.x + (-u_xlat16_14.y);
    u_xlat16_71 = (-u_xlat16_71) + u_xlat16_14.x;
    u_xlat16_74 = u_xlat16_71 * 6.0 + 9.99999975e-05;
    u_xlat16_52.x = u_xlat16_52.x / u_xlat16_74;
    u_xlat16_52.x = u_xlat16_52.x + u_xlat16_14.z;
    u_xlat16_52.x = abs(u_xlat16_52.x) + _HueShift;
    u_xlat16_36.xyz = u_xlat16_52.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_36.xyz = fract(u_xlat16_36.xyz);
    u_xlat16_36.xyz = u_xlat16_36.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_36.xyz = abs(u_xlat16_36.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_36.xyz = u_xlat16_36.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_52.x = u_xlat16_14.x + 9.99999975e-05;
    u_xlat16_71 = u_xlat16_71 / u_xlat16_52.x;
    u_xlat16_36.xyz = vec3(u_xlat16_71) * u_xlat16_36.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_36.xyz * u_xlat16_14.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_52.xxx * u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_52.yyy + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_8.x : u_xlat16_30.x;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _DynamicNormalIntensity;
uniform 	mediump float _DetailNormalIntensity;
uniform 	mediump vec4 _DetailNormalMap_ST;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DynamicNormalMap;
UNITY_LOCATION(11) uniform mediump sampler2D _DetailNormalMap;
UNITY_LOCATION(12) uniform mediump sampler2D _DetailNormalMask;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadeDetailTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadeDetailMask;
UNITY_LOCATION(15) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec2 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bvec3 u_xlatb22;
float u_xlat23;
vec2 u_xlat26;
mediump vec2 u_xlat16_26;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump float u_xlat16_35;
mediump vec3 u_xlat16_36;
float u_xlat44;
mediump float u_xlat16_44;
int u_xlati44;
float u_xlat48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_52;
float u_xlat55;
mediump float u_xlat16_57;
float u_xlat60;
float u_xlat66;
mediump float u_xlat16_66;
bool u_xlatb66;
float u_xlat68;
float u_xlat70;
mediump float u_xlat16_70;
bool u_xlatb70;
mediump float u_xlat16_71;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat77;
float u_xlat78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
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
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat16_5.xy = vs_TEXCOORD3.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
    u_xlat16_6.xyz = texture(_DetailNormalMap, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_DetailNormalIntensity);
    u_xlat16_6.xyz = texture(_DynamicNormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_8.xyz);
    u_xlat16_6.xyz = vec3(vec3(_DynamicNormalIntensity, _DynamicNormalIntensity, _DynamicNormalIntensity)) * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat16_70 = texture(_DetailNormalMask, vs_TEXCOORD3.xy).x;
    u_xlat16_6.w = u_xlat16_5.z * u_xlat16_70;
    u_xlat16_7.xyz = u_xlat16_6.xyw + u_xlat16_6.xyz;
    u_xlat9.z = u_xlat16_6.z * u_xlat16_7.z;
    u_xlat9.xy = vec2(u_xlat16_70) * u_xlat16_5.xy + u_xlat16_7.xy;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat70) * u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat70 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat70 = max(u_xlat70, 1.17549435e-38);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat11.xyz = vec3(u_xlat70) * u_xlat16_5.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat9.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 1.17549435e-38);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat70) * u_xlat10.xyz;
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat4.xxx + vs_TEXCOORD0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb75)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat23 = (-u_xlat1.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat23 + u_xlat1.x;
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
    u_xlat16_5.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_5.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_5.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb22.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb22.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb22.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb22.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb22.y) ? float(0.0) : float(1.0);
    u_xlat16_5.xy = (u_xlatb22.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_49.xy = u_xlat16_22.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat22.x = u_xlat16_22.z * u_xlat16_5.x + u_xlat16_5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_49.x * _ShadowStrength;
    u_xlat44 = u_xlat16_49.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_5.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_5.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_71 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_71 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_29 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_8.xyz = u_xlat2.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_7.x * u_xlat16_29;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_8.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_8.x);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_73;
    u_xlat16_8.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = u_xlat2.xy * _ShadeDetailTex_ST.xy + _ShadeDetailTex_ST.zw;
    u_xlat16_2.xyz = texture(_ShadeDetailTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat68 = (-_ShadeRange) + _DetailRange;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat4.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat26.x = u_xlat4.x + (-_ShadeRange);
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat68 = u_xlat68 * u_xlat26.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat68 * -2.0 + 3.0;
    u_xlat68 = u_xlat68 * u_xlat68;
    u_xlat68 = u_xlat68 * u_xlat26.x;
    u_xlat16_26.xy = texture(_ShadeDetailMask, vs_TEXCOORD3.xy).xy;
    u_xlat26.xy = (-u_xlat16_26.xy) + vec2(1.0, 1.0);
    u_xlat16_71 = min(u_xlat68, u_xlat26.x);
    u_xlat16_71 = u_xlat16_71 + _ShadeDetail;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_1.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_3.www * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_15.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyz + u_xlat2.xyz;
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat26.yyy * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat26.x = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_71 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_71) + u_xlat16_7.xyz;
    u_xlat48 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat12.xyz = vec3(u_xlat48) * u_xlat12.xyz;
    u_xlat16_73 = dot(u_xlat16_7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat48 = dot(u_xlat9.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat76 = (-u_xlat16_73) + 1.0;
    u_xlat16_7.x = u_xlat76 * u_xlat76;
    u_xlat16_7.x = u_xlat76 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat76 * u_xlat16_7.x;
    u_xlat77 = (-u_xlat16_7.x) * u_xlat76 + 1.0;
    u_xlat16_7.x = u_xlat76 * u_xlat16_7.x;
    u_xlat12.xyz = u_xlat16_14.xyz * vec3(u_xlat77);
    u_xlat12.xyz = u_xlat26.xxx * u_xlat16_7.xxx + u_xlat12.xyz;
    u_xlat16_7.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0078125);
    u_xlat76 = (-u_xlat48) * u_xlat16_7.x + u_xlat48;
    u_xlat76 = u_xlat48 * u_xlat76 + u_xlat16_7.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat48 + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_15.xyz = vec3(u_xlat16_71) * u_xlat11.xyz;
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat77 = (-u_xlat16.x) * u_xlat16_7.x + u_xlat16.x;
    u_xlat77 = u_xlat16.x * u_xlat77 + u_xlat16_7.x;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 + u_xlat16.x;
    u_xlat77 = u_xlat77 + 6.10351563e-05;
    u_xlat76 = u_xlat76 * u_xlat77;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat78 = u_xlat16_7.x + -1.0;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_7.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat75 = u_xlat76 * u_xlat75;
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat48) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_8.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat44) * u_xlat12.xyz;
    u_xlat17.xyz = u_xlat11.xyz * vec3(u_xlat16_71) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat17.xyz = vec3(u_xlat75) * u_xlat17.xyz;
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat9.xyz, u_xlat17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_7.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat76 * u_xlat76;
    u_xlat16_74 = u_xlat76 * u_xlat16_74;
    u_xlat16_74 = u_xlat76 * u_xlat16_74;
    u_xlat60 = (-u_xlat16_74) * u_xlat76 + 1.0;
    u_xlat16_74 = u_xlat76 * u_xlat16_74;
    u_xlat17.xyz = u_xlat16_14.xyz * vec3(u_xlat60);
    u_xlat17.xyz = u_xlat26.xxx * vec3(u_xlat16_74) + u_xlat17.xyz;
    u_xlat76 = (-u_xlat4.x) * u_xlat16_7.x + u_xlat4.x;
    u_xlat76 = u_xlat4.x * u_xlat76 + u_xlat16_7.x;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat4.x + u_xlat76;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat76 * u_xlat77;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat17.xyz = u_xlat17.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.xyz;
    u_xlat17.xyz = u_xlat4.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_18.xyz = u_xlat17.xyz * u_xlat16_5.xyz + u_xlat12.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_79 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_80 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_19.xyz = vec3(u_xlat16_74) * u_xlat12.xyz;
    u_xlat16_74 = u_xlat16_79 * u_xlat16_80;
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_20.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_20.x);
    u_xlat16_20.xzw = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_20.xzw;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_79 = max(u_xlat16_79, u_xlat16_80);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_79;
    u_xlat16_20.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_71) + u_xlat16_19.xyz;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(u_xlat16_19.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat9.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat16_74) + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat78 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_7.x / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat12.x = (-u_xlat76) * u_xlat16_7.x + u_xlat76;
    u_xlat12.x = u_xlat76 * u_xlat12.x + u_xlat16_7.x;
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat12.x = u_xlat76 + u_xlat12.x;
    u_xlat12.x = u_xlat12.x + 6.10351563e-05;
    u_xlat77 = u_xlat77 * u_xlat12.x;
    u_xlat77 = float(1.0) / u_xlat77;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat75 = u_xlat75 * u_xlat77;
    u_xlat16_74 = u_xlat55 * u_xlat55;
    u_xlat16_74 = u_xlat55 * u_xlat16_74;
    u_xlat16_74 = u_xlat55 * u_xlat16_74;
    u_xlat16_79 = u_xlat55 * u_xlat16_74;
    u_xlat55 = (-u_xlat16_74) * u_xlat55 + 1.0;
    u_xlat12.xyz = u_xlat16_14.xyz * vec3(u_xlat55);
    u_xlat12.xyz = u_xlat26.xxx * vec3(u_xlat16_79) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _DirectSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat76) * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat16_20.xyz * u_xlat12.xyz;
    u_xlat16_18.xyz = u_xlat12.xyz * u_xlat22.xxx + u_xlat16_18.xyz;
    u_xlat16_74 = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat44) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat4.xxx + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_20.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat22.xxx * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat76) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = (-u_xlat10.xyz) * vec3(u_xlat70) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_8.xyz + u_xlat9.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_8.xyz = vec3(u_xlat16_74) * u_xlat16_8.xyz;
    u_xlat16_74 = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_79 = (-u_xlat16_74) + u_xlat16_79;
    u_xlat16_80 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_80 + 1.0;
    u_xlat16_74 = u_xlat16_2.w * u_xlat16_79 + u_xlat16_74;
    u_xlat16_74 = u_xlat16_2.w * u_xlat16_74;
    u_xlat16_79 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_79 = u_xlat16_79 + -1.0;
    u_xlat16_79 = _OcclusionScale * u_xlat16_79 + 1.0;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_79;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_74));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_20.y = u_xlat16_8.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_20.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_79) * u_xlat16_21.xyz;
    u_xlati44 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati44].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati44 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati44].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_74 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_21.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz + u_xlat16_5.xyz;
    u_xlat16_13.x = u_xlat0.y * 0.5;
    u_xlat16_35 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_57 = dot((-u_xlat16_15.xyz), u_xlat9.xyz);
    u_xlat16_57 = u_xlat16_57 + u_xlat16_57;
    u_xlat4.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_57) + (-u_xlat16_15.xyz);
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat4.xyz);
    u_xlat16_8.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_8.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_8.x = floor(u_xlat16_6.w);
    u_xlat16_30.x = u_xlat16_8.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_6.x = u_xlat16_30.x * 16.0 + u_xlat16_6.z;
    u_xlat16_15.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_6.x = u_xlat16_8.x * 16.0 + u_xlat16_6.z;
    u_xlat16_15.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_8.x = u_xlat16_8.z * 15.0 + (-u_xlat16_8.x);
    u_xlat16_30.x = (-u_xlat16_66) + u_xlat16_44;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_30.x + u_xlat16_66;
    u_xlat16_8.x = u_xlat16_79 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat0.x * u_xlat16_35 + u_xlat16_13.x;
    u_xlat16_30.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_52.x = (-u_xlat16_8.x) * 2.0 + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_52.x + u_xlat16_30.x;
    u_xlat16_8.x = u_xlat0.y * u_xlat16_8.x;
    u_xlat16_8.x = min(u_xlat16_3.z, u_xlat16_8.x);
    u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat70) + (-u_xlat4.xyz);
    u_xlat0.xyz = u_xlat16_7.xxx * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_30.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat16.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat16.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_30.x);
    u_xlat16_15.xyw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_15.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyw = u_xlat16_15.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_30.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (bool(u_xlatb0)) ? u_xlat16_30.xyz : u_xlat16_15.xyw;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_30.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_14.xyz + u_xlat16_18.xyz;
    u_xlat16_8.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_15.xyw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyw = u_xlat16_14.xyz * u_xlat16_15.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_14.xyz * u_xlat16_15.xyw + u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat4.x = u_xlat11.x * u_xlat16_71 + _Sanshe_X;
    u_xlat4.y = u_xlat11.y * u_xlat16_71 + _Sanshe_Y;
    u_xlat4.z = u_xlat16_15.z;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = (-u_xlat66) + 1.0;
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = max(u_xlat66, 0.00048828125);
    u_xlat66 = log2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Fw;
    u_xlat66 = exp2(u_xlat66);
    u_xlat0.w = u_xlat66 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb70 = _UseSansheMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb70)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_52.xy = u_xlat16_10.xy * u_xlat16_52.xx + u_xlat16_52.yy;
    u_xlat4.x = u_xlat11.x * u_xlat16_71 + _Sanshe2_X;
    u_xlat4.y = u_xlat11.y * u_xlat16_71 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_52.yx;
    u_xlat4.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat4.xyz;
    u_xlat16_71 = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_15.xyz = vec3(u_xlat16_71) * _DirectionalDir.xyz;
    u_xlat22.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat22.xyz = u_xlat22.xxx * _DirectionalColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = u_xlat16_10.z * u_xlat16_52.x + u_xlat16_52.y;
    u_xlat16_14.xyz = u_xlat22.xyz * vec3(u_xlat16_71) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_5.xyz + u_xlat16_14.xyz;
    u_xlat22.x = dot(u_xlat16_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat22.x = u_xlat22.x + -0.25;
    u_xlat22.x = u_xlat22.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_14.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_14.xyz = (-u_xlat16_5.xyz) + _FogCol.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD0.www * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_71 = exp2(_PostExposure);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_71) + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat4.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat4.xyz = (-vec3(u_xlat44)) + u_xlat4.xyz;
    u_xlat66 = u_xlat22.x * -2.0 + 3.0;
    u_xlat22.x = u_xlat22.x * u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat66;
    u_xlat0.x = max(u_xlat22.x, u_xlat0.x);
    u_xlat16_71 = (-_Saturation) + _SansheSaturation;
    u_xlat16_71 = u_xlat0.x * u_xlat16_71 + _Saturation;
    u_xlat0.xyz = vec3(u_xlat16_71) * u_xlat4.xyz + vec3(u_xlat44);
    u_xlat16_52.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb66 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_71 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_71) * u_xlat16_52.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_52.x = float(1.0);
    u_xlat16_52.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_71) * u_xlat16_52.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb22.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_71 = (u_xlatb22.x) ? 1.0 : 0.0;
    u_xlat16_52.x = u_xlat16_71 * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_14.xyz = vec3(u_xlat16_71) * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_71 = min(u_xlat16_52.x, u_xlat16_14.y);
    u_xlat16_52.x = u_xlat16_52.x + (-u_xlat16_14.y);
    u_xlat16_71 = (-u_xlat16_71) + u_xlat16_14.x;
    u_xlat16_74 = u_xlat16_71 * 6.0 + 9.99999975e-05;
    u_xlat16_52.x = u_xlat16_52.x / u_xlat16_74;
    u_xlat16_52.x = u_xlat16_52.x + u_xlat16_14.z;
    u_xlat16_52.x = abs(u_xlat16_52.x) + _HueShift;
    u_xlat16_36.xyz = u_xlat16_52.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_36.xyz = fract(u_xlat16_36.xyz);
    u_xlat16_36.xyz = u_xlat16_36.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_36.xyz = abs(u_xlat16_36.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_36.xyz = u_xlat16_36.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_52.x = u_xlat16_14.x + 9.99999975e-05;
    u_xlat16_71 = u_xlat16_71 / u_xlat16_52.x;
    u_xlat16_36.xyz = vec3(u_xlat16_71) * u_xlat16_36.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_36.xyz * u_xlat16_14.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_52.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_52.xxx * u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_52.yyy + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_8.x : u_xlat16_30.x;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
bvec4 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec3 u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat29;
float u_xlat36;
mediump vec2 u_xlat16_37;
mediump vec2 u_xlat16_38;
float u_xlat48;
int u_xlati48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat59;
float u_xlat61;
bool u_xlatb61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_66;
int u_xlati66;
mediump float u_xlat16_67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_55 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlatb6 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_6.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
    u_xlat16_6.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat16_6.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
    u_xlat16_6.w = (u_xlatb6.w) ? float(0.0) : float(1.0);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy * u_xlat16_6.xz + u_xlat16_6.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_55 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_57 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat7.xyz;
    u_xlat16_57 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_57));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_57);
#endif
    u_xlat16_9.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.yyy + u_xlat16_10.xyz;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_57);
    u_xlat16_57 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_57 = (-u_xlat16_57) * u_xlat16_57 + 1.0;
    u_xlat16_57 = max(u_xlat16_57, 0.0);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_56 = max(u_xlat16_9.x, u_xlat16_56);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_9.xyz = vec3(u_xlat16_55) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat7.y = u_xlat11.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat59 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat59);
    u_xlat61 = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat61) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(u_xlat61) + u_xlat16_8.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_8.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_55 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_57 = max(u_xlat16_55, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat5 = (-u_xlat61) * u_xlat16_57 + u_xlat61;
    u_xlat11.x = u_xlat61 * u_xlat5 + u_xlat16_57;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat61 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat29.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat29.xyz;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat12.x) * u_xlat16_57 + u_xlat12.x;
    u_xlat48 = u_xlat12.x * u_xlat48 + u_xlat16_57;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat12.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat11.x = u_xlat11.x * u_xlat48;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat13.xyz = u_xlat29.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat65 = dot(u_xlat7.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_62) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat66 = u_xlat16_57 + -1.0;
    u_xlat65 = u_xlat65 * u_xlat66 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_57 / u_xlat65;
    u_xlat11.w = u_xlat65 * 0.318309873;
    u_xlat11.xw = min(u_xlat11.xw, vec2(16.0, 16.0));
    u_xlat11.x = u_xlat11.x * u_xlat11.w;
    u_xlat16_62 = u_xlat48 * u_xlat48;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_9.x = u_xlat48 * u_xlat16_62;
    u_xlat48 = (-u_xlat16_62) * u_xlat48 + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(u_xlat48);
    u_xlat48 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat16_9.xxx + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat11.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_9.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_10.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_20 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_20) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_62 + u_xlat16_20;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_20;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_62;
    u_xlat61 = min(u_xlat16_20, 1.0);
    u_xlat48 = min(u_xlat16_5.z, u_xlat61);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = vec3(u_xlat48) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat48) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat48) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat48) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati48 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati66 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_20 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_9.x = dot((-u_xlat16_8.xyz), u_xlat7.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat17.xyz = (-u_xlat7.xyz) * u_xlat16_9.xxx + (-u_xlat16_8.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat17.xyz);
    u_xlat48 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_38.x = floor(u_xlat16_1.w);
    u_xlat16_56 = u_xlat16_38.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_1.x = u_xlat16_56 * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_1.x = u_xlat16_38.x * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_38.x = u_xlat16_9.z * 15.0 + (-u_xlat16_38.x);
    u_xlat16_56 = u_xlat16_66 + (-u_xlat16_67);
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_56 + u_xlat16_67;
    u_xlat16_38.x = u_xlat16_62 * u_xlat16_38.x;
    u_xlat48 = u_xlat48 * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat61 * 0.5;
    u_xlat16_56 = (-u_xlat61) * 0.5 + 1.0;
    u_xlat16_38.x = u_xlat48 * u_xlat16_56 + u_xlat16_38.x;
    u_xlat16_56 = u_xlat16_38.x + u_xlat16_38.x;
    u_xlat16_8.x = (-u_xlat16_38.x) * 2.0 + 1.0;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_8.x + u_xlat16_56;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat61;
    u_xlat16_38.x = min(u_xlat16_38.x, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat59) + (-u_xlat17.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat9.y = u_xlat0.y;
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_56 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_56);
    u_xlat16_8.xyw = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat16_8.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = vec3(u_xlat16_20) * u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyw;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_38.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat13.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_8.xyw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyw = u_xlat16_3.xyz * u_xlat16_8.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat12.x = u_xlat29.x * u_xlat16_58 + _Sanshe_X;
    u_xlat12.y = u_xlat29.y * u_xlat16_58 + _Sanshe_Y;
    u_xlat12.z = u_xlat16_8.z;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = max(u_xlat54, 0.00048828125);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Sanshe_Fw;
    u_xlat54 = exp2(u_xlat54);
    u_xlat0.w = u_xlat54 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb61 = _UseSansheMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xy = u_xlat16_13.xy * u_xlat16_38.xx + u_xlat16_38.yy;
    u_xlat12.x = u_xlat29.x * u_xlat16_58 + _Sanshe2_X;
    u_xlat12.y = u_xlat29.y * u_xlat16_58 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_38.yx;
    u_xlat12.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat12.xyz;
    u_xlat16_38.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_38.x = inversesqrt(u_xlat16_38.x);
    u_xlat16_8.xyz = u_xlat16_38.xxx * _DirectionalDir.xyz;
    u_xlat18.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat18.xyz = u_xlat18.xxx * _DirectionalColor.zxy;
    u_xlat18.xyz = u_xlat18.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb7 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_38.x = u_xlat16_13.z * u_xlat16_38.x + u_xlat16_38.y;
    u_xlat16_4.xyz = u_xlat18.xyz * u_xlat16_38.xxx + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat18.x = dot(u_xlat16_3.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat18.x = u_xlat18.x + -0.25;
    u_xlat18.x = u_xlat18.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat7.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat7.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat54 = u_xlat7.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat12.xyz = (-u_xlat16_7.xyz) + u_xlat16_12.xyz;
    u_xlat7.xyz = vec3(u_xlat54) * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat16_38.x = exp2(_PostExposure);
    u_xlat12.xyz = u_xlat7.xyz * u_xlat16_38.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat12.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat12.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat12.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat12.xyz = (-vec3(u_xlat36)) + u_xlat12.xyz;
    u_xlat54 = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat54;
    u_xlat0.x = max(u_xlat18.x, u_xlat0.x);
    u_xlat16_38.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_38.x = u_xlat0.x * u_xlat16_38.x + _Saturation;
    u_xlat0.xyz = u_xlat16_38.xxx * u_xlat12.xyz + vec3(u_xlat36);
    u_xlat16_38.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb54 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_3.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_3.xx * u_xlat16_38.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_38.x = float(1.0);
    u_xlat16_38.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_3.xx * u_xlat16_38.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_4.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_38.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_56 = u_xlat16_38.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_3.xyz = u_xlat16_38.xxx * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_38.x = min(u_xlat16_56, u_xlat16_3.y);
    u_xlat16_56 = u_xlat16_56 + (-u_xlat16_3.y);
    u_xlat16_38.x = (-u_xlat16_38.x) + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_38.x * 6.0 + 9.99999975e-05;
    u_xlat16_56 = u_xlat16_56 / u_xlat16_21.x;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_3.z;
    u_xlat16_56 = abs(u_xlat16_56) + _HueShift;
    u_xlat16_21.xyz = vec3(u_xlat16_56) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_21.xyz = fract(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_21.xyz = abs(u_xlat16_21.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_21.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_56 = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_38.x = u_xlat16_38.x / u_xlat16_56;
    u_xlat16_21.xyz = u_xlat16_38.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_21.xyz * u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_38.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat7.xyz * u_xlat16_38.yyy + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_20;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
bvec4 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec3 u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat29;
float u_xlat36;
mediump vec2 u_xlat16_37;
mediump vec2 u_xlat16_38;
float u_xlat48;
int u_xlati48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat59;
float u_xlat61;
bool u_xlatb61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_66;
int u_xlati66;
mediump float u_xlat16_67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_55 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlatb6 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_6.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
    u_xlat16_6.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat16_6.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
    u_xlat16_6.w = (u_xlatb6.w) ? float(0.0) : float(1.0);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy * u_xlat16_6.xz + u_xlat16_6.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_55 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_57 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat7.xyz;
    u_xlat16_57 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_57));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_57);
#endif
    u_xlat16_9.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.yyy + u_xlat16_10.xyz;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_57);
    u_xlat16_57 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_57 = (-u_xlat16_57) * u_xlat16_57 + 1.0;
    u_xlat16_57 = max(u_xlat16_57, 0.0);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_56 = max(u_xlat16_9.x, u_xlat16_56);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_9.xyz = vec3(u_xlat16_55) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat7.y = u_xlat11.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat59 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat59);
    u_xlat61 = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat61) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(u_xlat61) + u_xlat16_8.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_8.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_55 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_57 = max(u_xlat16_55, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat5 = (-u_xlat61) * u_xlat16_57 + u_xlat61;
    u_xlat11.x = u_xlat61 * u_xlat5 + u_xlat16_57;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat61 + u_xlat11.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat29.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat29.xyz;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat12.x) * u_xlat16_57 + u_xlat12.x;
    u_xlat48 = u_xlat12.x * u_xlat48 + u_xlat16_57;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat12.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat11.x = u_xlat11.x * u_xlat48;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat13.xyz = u_xlat29.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat65 = dot(u_xlat7.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_62) + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat66 = u_xlat16_57 + -1.0;
    u_xlat65 = u_xlat65 * u_xlat66 + 1.0;
    u_xlat65 = u_xlat65 * u_xlat65;
    u_xlat65 = u_xlat16_57 / u_xlat65;
    u_xlat11.w = u_xlat65 * 0.318309873;
    u_xlat11.xw = min(u_xlat11.xw, vec2(16.0, 16.0));
    u_xlat11.x = u_xlat11.x * u_xlat11.w;
    u_xlat16_62 = u_xlat48 * u_xlat48;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_9.x = u_xlat48 * u_xlat16_62;
    u_xlat48 = (-u_xlat16_62) * u_xlat48 + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(u_xlat48);
    u_xlat48 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat48) * u_xlat16_9.xxx + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat11.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_9.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_10.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_20 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_20) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_62 + u_xlat16_20;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_20;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_62;
    u_xlat61 = min(u_xlat16_20, 1.0);
    u_xlat48 = min(u_xlat16_5.z, u_xlat61);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = vec3(u_xlat48) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat48) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat48) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat48) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati48 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati66 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_20 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_9.x = dot((-u_xlat16_8.xyz), u_xlat7.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat17.xyz = (-u_xlat7.xyz) * u_xlat16_9.xxx + (-u_xlat16_8.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat17.xyz);
    u_xlat48 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_38.x = floor(u_xlat16_1.w);
    u_xlat16_56 = u_xlat16_38.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_1.x = u_xlat16_56 * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_66 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_1.x = u_xlat16_38.x * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_67 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_38.x = u_xlat16_9.z * 15.0 + (-u_xlat16_38.x);
    u_xlat16_56 = u_xlat16_66 + (-u_xlat16_67);
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_56 + u_xlat16_67;
    u_xlat16_38.x = u_xlat16_62 * u_xlat16_38.x;
    u_xlat48 = u_xlat48 * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat61 * 0.5;
    u_xlat16_56 = (-u_xlat61) * 0.5 + 1.0;
    u_xlat16_38.x = u_xlat48 * u_xlat16_56 + u_xlat16_38.x;
    u_xlat16_56 = u_xlat16_38.x + u_xlat16_38.x;
    u_xlat16_8.x = (-u_xlat16_38.x) * 2.0 + 1.0;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_8.x + u_xlat16_56;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat61;
    u_xlat16_38.x = min(u_xlat16_38.x, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat59) + (-u_xlat17.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat9.y = u_xlat0.y;
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_56 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_56);
    u_xlat16_8.xyw = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat16_8.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = vec3(u_xlat16_20) * u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyw;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_38.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat13.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_8.xyw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyw = u_xlat16_3.xyz * u_xlat16_8.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat12.x = u_xlat29.x * u_xlat16_58 + _Sanshe_X;
    u_xlat12.y = u_xlat29.y * u_xlat16_58 + _Sanshe_Y;
    u_xlat12.z = u_xlat16_8.z;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = max(u_xlat54, 0.00048828125);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Sanshe_Fw;
    u_xlat54 = exp2(u_xlat54);
    u_xlat0.w = u_xlat54 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb61 = _UseSansheMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xy = u_xlat16_13.xy * u_xlat16_38.xx + u_xlat16_38.yy;
    u_xlat12.x = u_xlat29.x * u_xlat16_58 + _Sanshe2_X;
    u_xlat12.y = u_xlat29.y * u_xlat16_58 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_38.yx;
    u_xlat12.xyz = u_xlat0.xxx * _Sanshe2_color.zxy;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.www * _Sanshe_color.zxy + u_xlat12.xyz;
    u_xlat16_38.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_38.x = inversesqrt(u_xlat16_38.x);
    u_xlat16_8.xyz = u_xlat16_38.xxx * _DirectionalDir.xyz;
    u_xlat18.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat18.xyz = u_xlat18.xxx * _DirectionalColor.zxy;
    u_xlat18.xyz = u_xlat18.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb7 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_38.x = u_xlat16_13.z * u_xlat16_38.x + u_xlat16_38.y;
    u_xlat16_4.xyz = u_xlat18.xyz * u_xlat16_38.xxx + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat18.x = dot(u_xlat16_3.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat18.x = u_xlat18.x + -0.25;
    u_xlat18.x = u_xlat18.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat7.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat7.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat54 = u_xlat7.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat12.xyz = (-u_xlat16_7.xyz) + u_xlat16_12.xyz;
    u_xlat7.xyz = vec3(u_xlat54) * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat16_38.x = exp2(_PostExposure);
    u_xlat12.xyz = u_xlat7.xyz * u_xlat16_38.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat12.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat12.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat12.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat12.xyz = (-vec3(u_xlat36)) + u_xlat12.xyz;
    u_xlat54 = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat54;
    u_xlat0.x = max(u_xlat18.x, u_xlat0.x);
    u_xlat16_38.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_38.x = u_xlat0.x * u_xlat16_38.x + _Saturation;
    u_xlat0.xyz = u_xlat16_38.xxx * u_xlat12.xyz + vec3(u_xlat36);
    u_xlat16_38.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb54 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_3.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.xy = u_xlat16_3.xx * u_xlat16_38.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_38.x = float(1.0);
    u_xlat16_38.y = float(-1.0);
    u_xlat16_1.zw = u_xlat16_3.xx * u_xlat16_38.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_4.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_38.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_56 = u_xlat16_38.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_3.xyz = u_xlat16_38.xxx * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_38.x = min(u_xlat16_56, u_xlat16_3.y);
    u_xlat16_56 = u_xlat16_56 + (-u_xlat16_3.y);
    u_xlat16_38.x = (-u_xlat16_38.x) + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_38.x * 6.0 + 9.99999975e-05;
    u_xlat16_56 = u_xlat16_56 / u_xlat16_21.x;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_3.z;
    u_xlat16_56 = abs(u_xlat16_56) + _HueShift;
    u_xlat16_21.xyz = vec3(u_xlat16_56) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_21.xyz = fract(u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_21.xyz = abs(u_xlat16_21.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.xyz = min(max(u_xlat16_21.xyz, 0.0), 1.0);
#else
    u_xlat16_21.xyz = clamp(u_xlat16_21.xyz, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = u_xlat16_21.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_56 = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_38.x = u_xlat16_38.x / u_xlat16_56;
    u_xlat16_21.xyz = u_xlat16_38.xxx * u_xlat16_21.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_21.xyz * u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_38.xxx * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat7.xyz * u_xlat16_38.yyy + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_20;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
bvec3 u_xlatb18;
float u_xlat19;
vec3 u_xlat20;
bool u_xlatb20;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_30;
vec2 u_xlat38;
int u_xlati38;
float u_xlat40;
bool u_xlatb40;
mediump vec2 u_xlat16_42;
mediump float u_xlat16_48;
float u_xlat56;
bool u_xlatb56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb18.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb18.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_2.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat2.x = u_xlat16_2.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_42.x * _ShadowStrength;
    u_xlat20.x = u_xlat16_42.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat38.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat38.x = max(u_xlat38.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat38.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat38.x = u_xlat38.x + -1.0;
    u_xlat38.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat38.xx + vec2(1.0, 1.0);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat20.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat20.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat3.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat2.x = (-u_xlat20.x) * u_xlat16_60 + u_xlat20.x;
    u_xlat2.x = u_xlat20.x * u_xlat2.x + u_xlat16_60;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat20.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_64);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat8.x) * u_xlat16_60 + u_xlat8.x;
    u_xlat58 = u_xlat8.x * u_xlat58 + u_xlat16_60;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat8.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat58;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat9.xyz = vec3(u_xlat40) * u_xlat9.xyz;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat16_65) + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat61 = u_xlat16_60 + -1.0;
    u_xlat40 = u_xlat40 * u_xlat61 + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat16_60 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat40;
    u_xlat16_65 = u_xlat58 * u_xlat58;
    u_xlat16_65 = u_xlat58 * u_xlat16_65;
    u_xlat16_65 = u_xlat58 * u_xlat16_65;
    u_xlat16_66 = u_xlat58 * u_xlat16_65;
    u_xlat40 = (-u_xlat16_65) * u_xlat58 + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat40) * u_xlat16_10.xyz;
    u_xlat40 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat40) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = u_xlat20.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat2.xy = min(u_xlat38.xy, vec2(u_xlat16_65));
    u_xlat2.x = min(u_xlat16_1.z, u_xlat2.x);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat2.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat2.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat2.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati2.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati2.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati38 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat2.y * 0.5;
    u_xlat16_30.x = (-u_xlat2.y) * 0.5 + 1.0;
    u_xlat16_48 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_48 = u_xlat16_48 + u_xlat16_48;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_48) + (-u_xlat16_13.xyz);
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat2.xzw);
    u_xlat40 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_13.xyw = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyw = min(max(u_xlat16_13.xyw, 0.0), 1.0);
#else
    u_xlat16_13.xyw = clamp(u_xlat16_13.xyw, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48 = floor(u_xlat16_14.w);
    u_xlat16_13.x = u_xlat16_48 + 1.0;
    u_xlat16_13.x = min(u_xlat16_13.x, 15.0);
    u_xlat16_14.x = u_xlat16_13.x * 16.0 + u_xlat16_14.z;
    u_xlat16_13.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_14.x = u_xlat16_48 * 16.0 + u_xlat16_14.z;
    u_xlat16_13.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_48 = u_xlat16_13.w * 15.0 + (-u_xlat16_48);
    u_xlat16_13.x = u_xlat16_58 + (-u_xlat16_61);
    u_xlat16_48 = u_xlat16_48 * u_xlat16_13.x + u_xlat16_61;
    u_xlat16_48 = u_xlat16_66 * u_xlat16_48;
    u_xlat40 = u_xlat40 * u_xlat16_48;
    u_xlat16_12.x = u_xlat40 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_30.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_48 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_48 + u_xlat16_30.x;
    u_xlat16_12.x = u_xlat2.y * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_1.z, u_xlat16_12.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat2.xzw);
    u_xlat2.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat2.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat14.y = u_xlat2.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat8.y = u_xlat16_3.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_60);
    u_xlat16_30.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat2.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyw = vec3(u_xlat16_65) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb2 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (bool(u_xlatb2)) ? u_xlat16_13.xyw : u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat9.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat5.x = u_xlat4.x * u_xlat16_64 + _Sanshe_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_64 + _Sanshe_Y;
    u_xlat5.z = u_xlat16_13.z;
    u_xlat56 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat56 = (-u_xlat56) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat56 = max(u_xlat56, 0.00048828125);
    u_xlat56 = log2(u_xlat56);
    u_xlat56 = u_xlat56 * _Sanshe_Fw;
    u_xlat56 = exp2(u_xlat56);
    u_xlat2.w = u_xlat56 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb40 = _UseSansheMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb40)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_8.xy * u_xlat16_42.xx + u_xlat16_42.yy;
    u_xlat5.x = u_xlat4.x * u_xlat16_64 + _Sanshe2_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_64 + _Sanshe2_Y;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = max(u_xlat2.x, 0.00048828125);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat2.xw = u_xlat2.xw * u_xlat16_42.yx;
    u_xlat4.xyz = u_xlat2.xxx * _Sanshe2_color.zxy;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat2.www * _Sanshe_color.zxy + u_xlat4.xyz;
    u_xlat16_42.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_42.x = inversesqrt(u_xlat16_42.x);
    u_xlat16_12.xyz = u_xlat16_42.xxx * _DirectionalDir.xyz;
    u_xlat20.x = dot(u_xlat16_12.xyz, u_xlat7.xyz);
    u_xlat20.x = max(u_xlat20.x, 0.0);
    u_xlat20.xyz = u_xlat20.xxx * _DirectionalColor.zxy;
    u_xlat20.xyz = u_xlat20.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_42.x = u_xlat16_8.z * u_xlat16_42.x + u_xlat16_42.y;
    u_xlat16_11.xyz = u_xlat20.xyz * u_xlat16_42.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat20.x = dot(u_xlat16_10.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat20.x = u_xlat20.x + -0.25;
    u_xlat20.x = u_xlat20.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat4.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat38.x = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat56 = u_xlat4.x * 15.0 + (-u_xlat38.x);
    u_xlat0.x = u_xlat38.x * 0.0625 + u_xlat0.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat5.xyz + u_xlat16_4.xyz;
    u_xlat16_42.x = exp2(_PostExposure);
    u_xlat5.xyz = u_xlat4.xyz * u_xlat16_42.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat38.x = dot(u_xlat5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat5.xyz = (-u_xlat38.xxx) + u_xlat5.xyz;
    u_xlat56 = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat56;
    u_xlat2.x = max(u_xlat20.x, u_xlat2.x);
    u_xlat16_42.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_42.x = u_xlat2.x * u_xlat16_42.x + _Saturation;
    u_xlat2.xyz = u_xlat16_42.xxx * u_xlat5.xyz + u_xlat38.xxx;
    u_xlat16_42.xy = (-u_xlat2.zy) + u_xlat2.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat2.y>=u_xlat2.z);
#else
    u_xlatb56 = u_xlat2.y>=u_xlat2.z;
#endif
    u_xlat16_10.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_0.xy = u_xlat16_10.xx * u_xlat16_42.xy + u_xlat2.zy;
    u_xlat16_1.w = (-u_xlat2.x);
    u_xlat16_42.x = float(1.0);
    u_xlat16_42.y = float(-1.0);
    u_xlat16_0.zw = u_xlat16_10.xx * u_xlat16_42.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_3.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_3.x = u_xlat16_1.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat2.x>=u_xlat16_0.x);
#else
    u_xlatb20 = u_xlat2.x>=u_xlat16_0.x;
#endif
    u_xlat16_42.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_60 = u_xlat16_42.x * u_xlat16_3.w + u_xlat2.x;
    u_xlat16_10.xyz = u_xlat16_42.xxx * u_xlat16_3.xyz + u_xlat16_0.xyw;
    u_xlat16_42.x = min(u_xlat16_60, u_xlat16_10.y);
    u_xlat16_60 = u_xlat16_60 + (-u_xlat16_10.y);
    u_xlat16_42.x = (-u_xlat16_42.x) + u_xlat16_10.x;
    u_xlat16_28.x = u_xlat16_42.x * 6.0 + 9.99999975e-05;
    u_xlat16_60 = u_xlat16_60 / u_xlat16_28.x;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_10.z;
    u_xlat16_60 = abs(u_xlat16_60) + _HueShift;
    u_xlat16_28.xyz = vec3(u_xlat16_60) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_28.xyz = fract(u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_28.xyz = abs(u_xlat16_28.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_60 = u_xlat16_10.x + 9.99999975e-05;
    u_xlat16_42.x = u_xlat16_42.x / u_xlat16_60;
    u_xlat16_28.xyz = u_xlat16_42.xxx * u_xlat16_28.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_28.xyz * u_xlat16_10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb2 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_42.xxx * u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat16_42.yyy + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_6.x : u_xlat16_24;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec4 u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
bvec3 u_xlatb18;
float u_xlat19;
vec3 u_xlat20;
bool u_xlatb20;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_30;
vec2 u_xlat38;
int u_xlati38;
float u_xlat40;
bool u_xlatb40;
mediump vec2 u_xlat16_42;
mediump float u_xlat16_48;
float u_xlat56;
bool u_xlatb56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_61;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat18 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb18.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb18.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_2.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat2.x = u_xlat16_2.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_42.x * _ShadowStrength;
    u_xlat20.x = u_xlat16_42.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat38.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat38.x = max(u_xlat38.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat38.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat38.x = u_xlat38.x + -1.0;
    u_xlat38.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat38.xx + vec2(1.0, 1.0);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_1.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat20.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat20.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat20.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat2.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat3.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat2.x = (-u_xlat20.x) * u_xlat16_60 + u_xlat20.x;
    u_xlat2.x = u_xlat20.x * u_xlat2.x + u_xlat16_60;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat20.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat4.xyz * vec3(u_xlat16_64);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat8.x) * u_xlat16_60 + u_xlat8.x;
    u_xlat58 = u_xlat8.x * u_xlat58 + u_xlat16_60;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat8.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat2.x = u_xlat2.x * u_xlat58;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat9.xyz = vec3(u_xlat40) * u_xlat9.xyz;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat16_65) + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat61 = u_xlat16_60 + -1.0;
    u_xlat40 = u_xlat40 * u_xlat61 + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat16_60 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat40;
    u_xlat16_65 = u_xlat58 * u_xlat58;
    u_xlat16_65 = u_xlat58 * u_xlat16_65;
    u_xlat16_65 = u_xlat58 * u_xlat16_65;
    u_xlat16_66 = u_xlat58 * u_xlat16_65;
    u_xlat40 = (-u_xlat16_65) * u_xlat58 + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat40) * u_xlat16_10.xyz;
    u_xlat40 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat40) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = u_xlat20.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat2.xy = min(u_xlat38.xy, vec2(u_xlat16_65));
    u_xlat2.x = min(u_xlat16_1.z, u_xlat2.x);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat2.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat2.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat2.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat2.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat2.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati2.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati2.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati2.x = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati38 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati2.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat2.y * 0.5;
    u_xlat16_30.x = (-u_xlat2.y) * 0.5 + 1.0;
    u_xlat16_48 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_48 = u_xlat16_48 + u_xlat16_48;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_48) + (-u_xlat16_13.xyz);
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat2.xzw);
    u_xlat40 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_13.xyw = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyw = min(max(u_xlat16_13.xyw, 0.0), 1.0);
#else
    u_xlat16_13.xyw = clamp(u_xlat16_13.xyw, 0.0, 1.0);
#endif
    u_xlat16_14.yzw = u_xlat16_13.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48 = floor(u_xlat16_14.w);
    u_xlat16_13.x = u_xlat16_48 + 1.0;
    u_xlat16_13.x = min(u_xlat16_13.x, 15.0);
    u_xlat16_14.x = u_xlat16_13.x * 16.0 + u_xlat16_14.z;
    u_xlat16_13.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_14.x = u_xlat16_48 * 16.0 + u_xlat16_14.z;
    u_xlat16_13.xy = u_xlat16_14.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_48 = u_xlat16_13.w * 15.0 + (-u_xlat16_48);
    u_xlat16_13.x = u_xlat16_58 + (-u_xlat16_61);
    u_xlat16_48 = u_xlat16_48 * u_xlat16_13.x + u_xlat16_61;
    u_xlat16_48 = u_xlat16_66 * u_xlat16_48;
    u_xlat40 = u_xlat40 * u_xlat16_48;
    u_xlat16_12.x = u_xlat40 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_30.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_48 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_48 + u_xlat16_30.x;
    u_xlat16_12.x = u_xlat2.y * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_1.z, u_xlat16_12.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat2.xzw);
    u_xlat2.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat2.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat2.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat2.xz);
    u_xlat14.y = u_xlat2.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat8.y = u_xlat16_3.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_60);
    u_xlat16_30.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat2.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyw = vec3(u_xlat16_65) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb2 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (bool(u_xlatb2)) ? u_xlat16_13.xyw : u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat9.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.zxy * _EmissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat5.x = u_xlat4.x * u_xlat16_64 + _Sanshe_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_64 + _Sanshe_Y;
    u_xlat5.z = u_xlat16_13.z;
    u_xlat56 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat56 = (-u_xlat56) + 1.0;
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat56 = max(u_xlat56, 0.00048828125);
    u_xlat56 = log2(u_xlat56);
    u_xlat56 = u_xlat56 * _Sanshe_Fw;
    u_xlat56 = exp2(u_xlat56);
    u_xlat2.w = u_xlat56 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb40 = _UseSansheMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb40)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_8.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_8.xy * u_xlat16_42.xx + u_xlat16_42.yy;
    u_xlat5.x = u_xlat4.x * u_xlat16_64 + _Sanshe2_X;
    u_xlat5.y = u_xlat4.y * u_xlat16_64 + _Sanshe2_Y;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = max(u_xlat2.x, 0.00048828125);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat2.xw = u_xlat2.xw * u_xlat16_42.yx;
    u_xlat4.xyz = u_xlat2.xxx * _Sanshe2_color.zxy;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat2.www * _Sanshe_color.zxy + u_xlat4.xyz;
    u_xlat16_42.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_42.x = inversesqrt(u_xlat16_42.x);
    u_xlat16_12.xyz = u_xlat16_42.xxx * _DirectionalDir.xyz;
    u_xlat20.x = dot(u_xlat16_12.xyz, u_xlat7.xyz);
    u_xlat20.x = max(u_xlat20.x, 0.0);
    u_xlat20.xyz = u_xlat20.xxx * _DirectionalColor.zxy;
    u_xlat20.xyz = u_xlat20.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb4 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_42.x = u_xlat16_8.z * u_xlat16_42.x + u_xlat16_42.y;
    u_xlat16_11.xyz = u_xlat20.xyz * u_xlat16_42.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat20.x = dot(u_xlat16_10.yzx, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat20.x = u_xlat20.x + -0.25;
    u_xlat20.x = u_xlat20.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat4.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat4.xz * vec2(15.0, 0.9375);
    u_xlat38.x = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat4.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat56 = u_xlat4.x * 15.0 + (-u_xlat38.x);
    u_xlat0.x = u_xlat38.x * 0.0625 + u_xlat0.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat5.xyz + u_xlat16_4.xyz;
    u_xlat16_42.x = exp2(_PostExposure);
    u_xlat5.xyz = u_xlat4.xyz * u_xlat16_42.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat38.x = dot(u_xlat5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat5.xyz = (-u_xlat38.xxx) + u_xlat5.xyz;
    u_xlat56 = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat56;
    u_xlat2.x = max(u_xlat20.x, u_xlat2.x);
    u_xlat16_42.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_42.x = u_xlat2.x * u_xlat16_42.x + _Saturation;
    u_xlat2.xyz = u_xlat16_42.xxx * u_xlat5.xyz + u_xlat38.xxx;
    u_xlat16_42.xy = (-u_xlat2.zy) + u_xlat2.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(u_xlat2.y>=u_xlat2.z);
#else
    u_xlatb56 = u_xlat2.y>=u_xlat2.z;
#endif
    u_xlat16_10.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_0.xy = u_xlat16_10.xx * u_xlat16_42.xy + u_xlat2.zy;
    u_xlat16_1.w = (-u_xlat2.x);
    u_xlat16_42.x = float(1.0);
    u_xlat16_42.y = float(-1.0);
    u_xlat16_0.zw = u_xlat16_10.xx * u_xlat16_42.xy + vec2(-1.0, 0.666666687);
    u_xlat16_1.xyz = (-u_xlat16_0.xyw);
    u_xlat16_3.yzw = u_xlat16_0.yzx + u_xlat16_1.yzw;
    u_xlat16_3.x = u_xlat16_1.x + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat2.x>=u_xlat16_0.x);
#else
    u_xlatb20 = u_xlat2.x>=u_xlat16_0.x;
#endif
    u_xlat16_42.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat16_60 = u_xlat16_42.x * u_xlat16_3.w + u_xlat2.x;
    u_xlat16_10.xyz = u_xlat16_42.xxx * u_xlat16_3.xyz + u_xlat16_0.xyw;
    u_xlat16_42.x = min(u_xlat16_60, u_xlat16_10.y);
    u_xlat16_60 = u_xlat16_60 + (-u_xlat16_10.y);
    u_xlat16_42.x = (-u_xlat16_42.x) + u_xlat16_10.x;
    u_xlat16_28.x = u_xlat16_42.x * 6.0 + 9.99999975e-05;
    u_xlat16_60 = u_xlat16_60 / u_xlat16_28.x;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_10.z;
    u_xlat16_60 = abs(u_xlat16_60) + _HueShift;
    u_xlat16_28.xyz = vec3(u_xlat16_60) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_28.xyz = fract(u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_28.xyz = abs(u_xlat16_28.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_60 = u_xlat16_10.x + 9.99999975e-05;
    u_xlat16_42.x = u_xlat16_42.x / u_xlat16_60;
    u_xlat16_28.xyz = u_xlat16_42.xxx * u_xlat16_28.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_28.xyz * u_xlat16_10.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb2 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_42.xxx * u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat16_42.yyy + u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb2 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_6.x : u_xlat16_24;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
bvec4 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec3 u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_22;
float u_xlat23;
float u_xlat36;
mediump vec2 u_xlat16_37;
mediump vec2 u_xlat16_38;
vec2 u_xlat47;
int u_xlati47;
float u_xlat48;
mediump float u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat59;
float u_xlat61;
bool u_xlatb61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat65;
mediump float u_xlat16_65;
int u_xlati65;
float u_xlat66;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_55 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlatb6 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_6.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
    u_xlat16_6.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat16_6.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
    u_xlat16_6.w = (u_xlatb6.w) ? float(0.0) : float(1.0);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy * u_xlat16_6.xz + u_xlat16_6.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_55 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_57 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat7.xyz;
    u_xlat16_57 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_57));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_57);
#endif
    u_xlat16_9.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.yyy + u_xlat16_10.xyz;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_57);
    u_xlat16_57 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_57 = (-u_xlat16_57) * u_xlat16_57 + 1.0;
    u_xlat16_57 = max(u_xlat16_57, 0.0);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_56 = max(u_xlat16_9.x, u_xlat16_56);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_9.xyz = vec3(u_xlat16_55) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat7.y = u_xlat11.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat59 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat59);
    u_xlat61 = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat61) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(u_xlat61) + u_xlat16_8.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_8.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_55 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_57 = max(u_xlat16_55, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat5 = (-u_xlat61) * u_xlat16_57 + u_xlat61;
    u_xlat5 = u_xlat61 * u_xlat5 + u_xlat16_57;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat5 = u_xlat5 + u_xlat61;
    u_xlat5 = u_xlat5 + 6.10351563e-05;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat11.xyz;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat23 = (-u_xlat12.x) * u_xlat16_57 + u_xlat12.x;
    u_xlat23 = u_xlat12.x * u_xlat23 + u_xlat16_57;
    u_xlat23 = sqrt(u_xlat23);
    u_xlat65 = u_xlat23 + u_xlat12.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat5 * u_xlat65;
    u_xlat47.y = float(1.0) / u_xlat65;
    u_xlat13.xyz = u_xlat11.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat47.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat47.x = inversesqrt(u_xlat47.x);
    u_xlat13.xyz = u_xlat47.xxx * u_xlat13.xyz;
    u_xlat47.x = dot(u_xlat7.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.x = min(max(u_xlat47.x, 0.0), 1.0);
#else
    u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_62) + 1.0;
    u_xlat47.x = u_xlat47.x * u_xlat47.x;
    u_xlat66 = u_xlat16_57 + -1.0;
    u_xlat47.x = u_xlat47.x * u_xlat66 + 1.0;
    u_xlat47.x = u_xlat47.x * u_xlat47.x;
    u_xlat47.x = u_xlat16_57 / u_xlat47.x;
    u_xlat47.x = u_xlat47.x * 0.318309873;
    u_xlat47.xy = min(u_xlat47.xy, vec2(16.0, 16.0));
    u_xlat47.x = u_xlat47.y * u_xlat47.x;
    u_xlat16_62 = u_xlat48 * u_xlat48;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_9.x = u_xlat48 * u_xlat16_62;
    u_xlat65 = (-u_xlat16_62) * u_xlat48 + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(u_xlat65);
    u_xlat65 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat16_9.xxx + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat47.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_9.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_10.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_20 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_20) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_62 + u_xlat16_20;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_20;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_62;
    u_xlat61 = min(u_xlat16_20, 1.0);
    u_xlat47.x = min(u_xlat16_5.z, u_xlat61);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat47.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat47.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat47.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat47.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati47 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati47].xyz;
    u_xlati47 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati65 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati47].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati65].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_20 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_9.x = dot((-u_xlat16_8.xyz), u_xlat7.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat17.xyz = (-u_xlat7.xyz) * u_xlat16_9.xxx + (-u_xlat16_8.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat17.xyz);
    u_xlat47.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.x = min(max(u_xlat47.x, 0.0), 1.0);
#else
    u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_38.x = floor(u_xlat16_1.w);
    u_xlat16_56 = u_xlat16_38.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_1.x = u_xlat16_56 * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_65 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_1.x = u_xlat16_38.x * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_38.x = u_xlat16_9.z * 15.0 + (-u_xlat16_38.x);
    u_xlat16_56 = u_xlat16_65 + (-u_xlat16_48);
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_56 + u_xlat16_48;
    u_xlat16_38.x = u_xlat16_62 * u_xlat16_38.x;
    u_xlat47.x = u_xlat47.x * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat61 * 0.5;
    u_xlat16_56 = (-u_xlat61) * 0.5 + 1.0;
    u_xlat16_38.x = u_xlat47.x * u_xlat16_56 + u_xlat16_38.x;
    u_xlat16_56 = u_xlat16_38.x + u_xlat16_38.x;
    u_xlat16_8.x = (-u_xlat16_38.x) * 2.0 + 1.0;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_8.x + u_xlat16_56;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat61;
    u_xlat16_38.x = min(u_xlat16_38.x, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat59) + (-u_xlat17.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat9.y = u_xlat0.y;
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_56 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_56);
    u_xlat16_8.xyw = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_8.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = vec3(u_xlat16_20) * u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyw;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_38.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_8.xyw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyw = u_xlat16_3.xyz * u_xlat16_8.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat12.x = u_xlat11.x * u_xlat16_58 + _Sanshe_X;
    u_xlat12.y = u_xlat11.y * u_xlat16_58 + _Sanshe_Y;
    u_xlat12.z = u_xlat16_8.z;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = max(u_xlat54, 0.00048828125);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Sanshe_Fw;
    u_xlat54 = exp2(u_xlat54);
    u_xlat0.w = u_xlat54 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb61 = _UseSansheMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xy = u_xlat16_13.xy * u_xlat16_38.xx + u_xlat16_38.yy;
    u_xlat12.x = u_xlat11.x * u_xlat16_58 + _Sanshe2_X;
    u_xlat12.y = u_xlat11.y * u_xlat16_58 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_38.yx;
    u_xlat11.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat11.xyz;
    u_xlat16_38.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_38.x = inversesqrt(u_xlat16_38.x);
    u_xlat16_8.xyz = u_xlat16_38.xxx * _DirectionalDir.xyz;
    u_xlat18.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat18.xyz = u_xlat18.xxx * _DirectionalColor.xyz;
    u_xlat18.xyz = u_xlat18.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb7 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_38.x = u_xlat16_13.z * u_xlat16_38.x + u_xlat16_38.y;
    u_xlat16_4.xyz = u_xlat18.xyz * u_xlat16_38.xxx + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat18.x = dot(u_xlat16_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat18.x = u_xlat18.x + -0.25;
    u_xlat18.x = u_xlat18.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + _FogCol.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_38.x = exp2(_PostExposure);
    u_xlat7.xyz = u_xlat16_3.xyz * u_xlat16_38.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat7.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat7.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = (-vec3(u_xlat36)) + u_xlat7.xyz;
    u_xlat54 = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat54;
    u_xlat0.x = max(u_xlat18.x, u_xlat0.x);
    u_xlat16_38.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_38.x = u_xlat0.x * u_xlat16_38.x + _Saturation;
    u_xlat0.xyz = u_xlat16_38.xxx * u_xlat7.xyz + vec3(u_xlat36);
    u_xlat16_38.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb54 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_57 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_57) * u_xlat16_38.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_38.x = float(1.0);
    u_xlat16_38.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_57) * u_xlat16_38.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_1.xyw);
    u_xlat16_5.yzw = u_xlat16_1.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_38.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_56 = u_xlat16_38.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_38.xxx * u_xlat16_5.xyz + u_xlat16_1.xyw;
    u_xlat16_38.x = min(u_xlat16_56, u_xlat16_4.y);
    u_xlat16_56 = u_xlat16_56 + (-u_xlat16_4.y);
    u_xlat16_38.x = (-u_xlat16_38.x) + u_xlat16_4.x;
    u_xlat16_57 = u_xlat16_38.x * 6.0 + 9.99999975e-05;
    u_xlat16_56 = u_xlat16_56 / u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_4.z;
    u_xlat16_56 = abs(u_xlat16_56) + _HueShift;
    u_xlat16_22.xyz = vec3(u_xlat16_56) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_22.xyz = fract(u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_22.xyz = abs(u_xlat16_22.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_22.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_56 = u_xlat16_4.x + 9.99999975e-05;
    u_xlat16_38.x = u_xlat16_38.x / u_xlat16_56;
    u_xlat16_22.xyz = u_xlat16_38.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat16_4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_38.xxx * u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_38.yyy + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_20;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _SansheMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
bvec4 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec3 u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_22;
float u_xlat23;
float u_xlat36;
mediump vec2 u_xlat16_37;
mediump vec2 u_xlat16_38;
vec2 u_xlat47;
int u_xlati47;
float u_xlat48;
mediump float u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat59;
float u_xlat61;
bool u_xlatb61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat65;
mediump float u_xlat16_65;
int u_xlati65;
float u_xlat66;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_55 = (-u_xlat16_5.y) * _MetallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlatb6 = greaterThanEqual(vec4(_UseRenderInfo01Mask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5));
    u_xlat16_6.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
    u_xlat16_6.y = (u_xlatb6.y) ? float(0.0) : float(1.0);
    u_xlat16_6.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
    u_xlat16_6.w = (u_xlatb6.w) ? float(0.0) : float(1.0);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy * u_xlat16_6.xz + u_xlat16_6.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_55 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_57 = inversesqrt(u_xlat16_56);
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat7.xyz;
    u_xlat16_57 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_57));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_57);
#endif
    u_xlat16_9.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_9.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.yyy + u_xlat16_10.xyz;
    u_xlat16_57 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_8.xyz);
    u_xlat16_57 = u_xlat16_57 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_57);
    u_xlat16_57 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_57 = (-u_xlat16_57) * u_xlat16_57 + 1.0;
    u_xlat16_57 = max(u_xlat16_57, 0.0);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_56 = max(u_xlat16_9.x, u_xlat16_56);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_9.xyz = vec3(u_xlat16_55) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_10.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat7.y;
    u_xlat7.y = u_xlat11.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_10.xyz, u_xlat7.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat59 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat59);
    u_xlat61 = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat61) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(u_xlat61) + u_xlat16_8.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_8.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_55 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_57 = max(u_xlat16_55, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat5 = (-u_xlat61) * u_xlat16_57 + u_xlat61;
    u_xlat5 = u_xlat61 * u_xlat5 + u_xlat16_57;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat5 = u_xlat5 + u_xlat61;
    u_xlat5 = u_xlat5 + 6.10351563e-05;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_58 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_58) * u_xlat11.xyz;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat23 = (-u_xlat12.x) * u_xlat16_57 + u_xlat12.x;
    u_xlat23 = u_xlat12.x * u_xlat23 + u_xlat16_57;
    u_xlat23 = sqrt(u_xlat23);
    u_xlat65 = u_xlat23 + u_xlat12.x;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat65 = u_xlat5 * u_xlat65;
    u_xlat47.y = float(1.0) / u_xlat65;
    u_xlat13.xyz = u_xlat11.xyz * vec3(u_xlat16_58) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat47.x = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat47.x = inversesqrt(u_xlat47.x);
    u_xlat13.xyz = u_xlat47.xxx * u_xlat13.xyz;
    u_xlat47.x = dot(u_xlat7.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.x = min(max(u_xlat47.x, 0.0), 1.0);
#else
    u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_62) + 1.0;
    u_xlat47.x = u_xlat47.x * u_xlat47.x;
    u_xlat66 = u_xlat16_57 + -1.0;
    u_xlat47.x = u_xlat47.x * u_xlat66 + 1.0;
    u_xlat47.x = u_xlat47.x * u_xlat47.x;
    u_xlat47.x = u_xlat16_57 / u_xlat47.x;
    u_xlat47.x = u_xlat47.x * 0.318309873;
    u_xlat47.xy = min(u_xlat47.xy, vec2(16.0, 16.0));
    u_xlat47.x = u_xlat47.y * u_xlat47.x;
    u_xlat16_62 = u_xlat48 * u_xlat48;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_62 = u_xlat48 * u_xlat16_62;
    u_xlat16_9.x = u_xlat48 * u_xlat16_62;
    u_xlat65 = (-u_xlat16_62) * u_xlat48 + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(u_xlat65);
    u_xlat65 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat16_9.xxx + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat47.xxx * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_9.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_10.xyz = vec3(u_xlat16_20) * u_xlat16_10.xyz;
    u_xlat16_20 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_20 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_20) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_63 + 1.0;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_62 + u_xlat16_20;
    u_xlat16_20 = u_xlat16_2.w * u_xlat16_20;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _OcclusionScale * u_xlat16_62 + 1.0;
    u_xlat16_20 = u_xlat16_20 * u_xlat16_62;
    u_xlat61 = min(u_xlat16_20, 1.0);
    u_xlat47.x = min(u_xlat16_5.z, u_xlat61);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat47.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat47.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat47.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat47.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat47.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati47 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati47].xyz;
    u_xlati47 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati65 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati47].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati65].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_20 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_16.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz + u_xlat16_9.xyz;
    u_xlat16_9.x = dot((-u_xlat16_8.xyz), u_xlat7.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat17.xyz = (-u_xlat7.xyz) * u_xlat16_9.xxx + (-u_xlat16_8.xyz);
    u_xlat16_2.z = dot(u_xlat16_10.xyz, u_xlat17.xyz);
    u_xlat47.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.x = min(max(u_xlat47.x, 0.0), 1.0);
#else
    u_xlat47.x = clamp(u_xlat47.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_9.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_38.x = floor(u_xlat16_1.w);
    u_xlat16_56 = u_xlat16_38.x + 1.0;
    u_xlat16_56 = min(u_xlat16_56, 15.0);
    u_xlat16_1.x = u_xlat16_56 * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_65 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_1.x = u_xlat16_38.x * 16.0 + u_xlat16_1.z;
    u_xlat16_8.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_38.x = u_xlat16_9.z * 15.0 + (-u_xlat16_38.x);
    u_xlat16_56 = u_xlat16_65 + (-u_xlat16_48);
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_56 + u_xlat16_48;
    u_xlat16_38.x = u_xlat16_62 * u_xlat16_38.x;
    u_xlat47.x = u_xlat47.x * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat61 * 0.5;
    u_xlat16_56 = (-u_xlat61) * 0.5 + 1.0;
    u_xlat16_38.x = u_xlat47.x * u_xlat16_56 + u_xlat16_38.x;
    u_xlat16_56 = u_xlat16_38.x + u_xlat16_38.x;
    u_xlat16_8.x = (-u_xlat16_38.x) * 2.0 + 1.0;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat16_8.x + u_xlat16_56;
    u_xlat16_38.x = u_xlat16_38.x * u_xlat61;
    u_xlat16_38.x = min(u_xlat16_38.x, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat59) + (-u_xlat17.xyz);
    u_xlat0.xyz = vec3(u_xlat16_57) * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_9.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat9.y = u_xlat0.y;
    u_xlat9.xz = u_xlat16_9.xz;
    u_xlat16_56 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_56);
    u_xlat16_8.xyw = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_8.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyw = u_xlat16_8.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = vec3(u_xlat16_20) * u_xlat16_8.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyw;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_38.xxx * u_xlat16_2.xyw;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_8.xyw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyw = u_xlat16_3.xyz * u_xlat16_8.xyw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_8.xyw + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat12.x = u_xlat11.x * u_xlat16_58 + _Sanshe_X;
    u_xlat12.y = u_xlat11.y * u_xlat16_58 + _Sanshe_Y;
    u_xlat12.z = u_xlat16_8.z;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = max(u_xlat54, 0.00048828125);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Sanshe_Fw;
    u_xlat54 = exp2(u_xlat54);
    u_xlat0.w = u_xlat54 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb61 = _UseSansheMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb61)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_38.xy = u_xlat16_13.xy * u_xlat16_38.xx + u_xlat16_38.yy;
    u_xlat12.x = u_xlat11.x * u_xlat16_58 + _Sanshe2_X;
    u_xlat12.y = u_xlat11.y * u_xlat16_58 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat12.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_38.yx;
    u_xlat11.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat11.xyz;
    u_xlat16_38.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_38.x = inversesqrt(u_xlat16_38.x);
    u_xlat16_8.xyz = u_xlat16_38.xxx * _DirectionalDir.xyz;
    u_xlat18.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat18.xyz = u_xlat18.xxx * _DirectionalColor.xyz;
    u_xlat18.xyz = u_xlat18.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb7 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_38.x = u_xlat16_13.z * u_xlat16_38.x + u_xlat16_38.y;
    u_xlat16_4.xyz = u_xlat18.xyz * u_xlat16_38.xxx + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat18.x = dot(u_xlat16_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat18.x = u_xlat18.x + -0.25;
    u_xlat18.x = u_xlat18.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + _FogCol.xyz;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_38.x = exp2(_PostExposure);
    u_xlat7.xyz = u_xlat16_3.xyz * u_xlat16_38.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat7.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat7.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = (-vec3(u_xlat36)) + u_xlat7.xyz;
    u_xlat54 = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat54;
    u_xlat0.x = max(u_xlat18.x, u_xlat0.x);
    u_xlat16_38.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_38.x = u_xlat0.x * u_xlat16_38.x + _Saturation;
    u_xlat0.xyz = u_xlat16_38.xxx * u_xlat7.xyz + vec3(u_xlat36);
    u_xlat16_38.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb54 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_57 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_57) * u_xlat16_38.xy + u_xlat0.zy;
    u_xlat16_4.w = (-u_xlat0.x);
    u_xlat16_38.x = float(1.0);
    u_xlat16_38.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_57) * u_xlat16_38.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_1.xyw);
    u_xlat16_5.yzw = u_xlat16_1.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_38.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_56 = u_xlat16_38.x * u_xlat16_5.w + u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_38.xxx * u_xlat16_5.xyz + u_xlat16_1.xyw;
    u_xlat16_38.x = min(u_xlat16_56, u_xlat16_4.y);
    u_xlat16_56 = u_xlat16_56 + (-u_xlat16_4.y);
    u_xlat16_38.x = (-u_xlat16_38.x) + u_xlat16_4.x;
    u_xlat16_57 = u_xlat16_38.x * 6.0 + 9.99999975e-05;
    u_xlat16_56 = u_xlat16_56 / u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 + u_xlat16_4.z;
    u_xlat16_56 = abs(u_xlat16_56) + _HueShift;
    u_xlat16_22.xyz = vec3(u_xlat16_56) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_22.xyz = fract(u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_22.xyz = abs(u_xlat16_22.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xyz = u_xlat16_22.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_56 = u_xlat16_4.x + 9.99999975e-05;
    u_xlat16_38.x = u_xlat16_38.x / u_xlat16_56;
    u_xlat16_22.xyz = u_xlat16_38.xxx * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat16_4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_38.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_38.xxx * u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_38.yyy + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_20;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _SansheMask;
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
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bvec3 u_xlatb18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
float u_xlat36;
int u_xlati36;
bool u_xlatb38;
float u_xlat40;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
mediump float u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
bool u_xlatb56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb18.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb18.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_18.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat18.x = u_xlat16_18.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_42.x * _ShadowStrength;
    u_xlat36 = u_xlat16_42.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
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
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat36) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat56) * u_xlat16_13.xyz;
    u_xlat36 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat36) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat56) + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18.x = (-u_xlat36) * u_xlat16_60 + u_xlat36;
    u_xlat18.x = u_xlat36 * u_xlat18.x + u_xlat16_60;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat36;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat2.xyw * vec3(u_xlat16_64);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat4.x) * u_xlat16_60 + u_xlat4.x;
    u_xlat40 = u_xlat4.x * u_xlat40 + u_xlat16_60;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat4.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat40;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat8.xyz = u_xlat2.xyw * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat8.xyz = vec3(u_xlat56) * u_xlat8.xyz;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_65) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat58 = u_xlat16_60 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat58 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_60 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat56;
    u_xlat16_65 = u_xlat40 * u_xlat40;
    u_xlat16_65 = u_xlat40 * u_xlat16_65;
    u_xlat16_65 = u_xlat40 * u_xlat16_65;
    u_xlat16_66 = u_xlat40 * u_xlat16_65;
    u_xlat56 = (-u_xlat16_65) * u_xlat40 + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat56) * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat18.xxx * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_65));
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
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat0.y * 0.5;
    u_xlat16_30.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_48 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_48 = u_xlat16_48 + u_xlat16_48;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_48) + (-u_xlat16_13.xyz);
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_13.xyw = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyw = min(max(u_xlat16_13.xyw, 0.0), 1.0);
#else
    u_xlat16_13.xyw = clamp(u_xlat16_13.xyw, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_13.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48 = floor(u_xlat16_9.w);
    u_xlat16_13.x = u_xlat16_48 + 1.0;
    u_xlat16_13.x = min(u_xlat16_13.x, 15.0);
    u_xlat16_9.x = u_xlat16_13.x * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_48 * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_48 = u_xlat16_13.w * 15.0 + (-u_xlat16_48);
    u_xlat16_13.x = (-u_xlat16_58) + u_xlat16_40;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_13.x + u_xlat16_58;
    u_xlat16_48 = u_xlat16_66 * u_xlat16_48;
    u_xlat56 = u_xlat56 * u_xlat16_48;
    u_xlat16_12.x = u_xlat56 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_30.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_48 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_48 + u_xlat16_30.x;
    u_xlat16_12.x = u_xlat0.y * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_2.z, u_xlat16_12.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat4.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_60);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyw = vec3(u_xlat16_65) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyw : u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat4.x = u_xlat2.x * u_xlat16_64 + _Sanshe_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_64 + _Sanshe_Y;
    u_xlat4.z = u_xlat16_13.z;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = max(u_xlat54, 0.00048828125);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Sanshe_Fw;
    u_xlat54 = exp2(u_xlat54);
    u_xlat0.w = u_xlat54 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb38 = _UseSansheMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb38)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_5.xy * u_xlat16_42.xx + u_xlat16_42.yy;
    u_xlat4.x = u_xlat2.x * u_xlat16_64 + _Sanshe2_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_64 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_42.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_42.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_42.x = inversesqrt(u_xlat16_42.x);
    u_xlat16_12.xyz = u_xlat16_42.xxx * _DirectionalDir.xyz;
    u_xlat18.x = dot(u_xlat16_12.xyz, u_xlat7.xyz);
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat18.xyz = u_xlat18.xxx * _DirectionalColor.xyz;
    u_xlat18.xyz = u_xlat18.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb2 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_42.x = u_xlat16_5.z * u_xlat16_42.x + u_xlat16_42.y;
    u_xlat16_11.xyz = u_xlat18.xyz * u_xlat16_42.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat18.x = dot(u_xlat16_10.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat18.x = u_xlat18.x + -0.25;
    u_xlat18.x = u_xlat18.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_42.x = exp2(_PostExposure);
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat16_42.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat36)) + u_xlat2.xyz;
    u_xlat54 = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat54;
    u_xlat0.x = max(u_xlat18.x, u_xlat0.x);
    u_xlat16_42.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_42.x = u_xlat0.x * u_xlat16_42.x + _Saturation;
    u_xlat0.xyz = u_xlat16_42.xxx * u_xlat2.xyz + vec3(u_xlat36);
    u_xlat16_42.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb54 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_64 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_64) * u_xlat16_42.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_42.x = float(1.0);
    u_xlat16_42.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_64) * u_xlat16_42.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb18.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_42.x = (u_xlatb18.x) ? 1.0 : 0.0;
    u_xlat16_60 = u_xlat16_42.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_11.xyz = u_xlat16_42.xxx * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_42.x = min(u_xlat16_60, u_xlat16_11.y);
    u_xlat16_60 = u_xlat16_60 + (-u_xlat16_11.y);
    u_xlat16_42.x = (-u_xlat16_42.x) + u_xlat16_11.x;
    u_xlat16_64 = u_xlat16_42.x * 6.0 + 9.99999975e-05;
    u_xlat16_60 = u_xlat16_60 / u_xlat16_64;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_11.z;
    u_xlat16_60 = abs(u_xlat16_60) + _HueShift;
    u_xlat16_29.xyz = vec3(u_xlat16_60) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_29.xyz = fract(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_29.xyz = abs(u_xlat16_29.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_60 = u_xlat16_11.x + 9.99999975e-05;
    u_xlat16_42.x = u_xlat16_42.x / u_xlat16_60;
    u_xlat16_29.xyz = u_xlat16_42.xxx * u_xlat16_29.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_29.xyz * u_xlat16_11.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_42.xxx * u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_42.yyy + u_xlat16_11.xyz;
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
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
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
uniform 	mediump float _UseShadowMask;
uniform 	mediump float _UseRenderInfo01Mask;
uniform 	mediump float _UseRenderInfo02Mask;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
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
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _SansheMask;
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
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bvec3 u_xlatb18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
float u_xlat36;
int u_xlati36;
bool u_xlatb38;
float u_xlat40;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
mediump float u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
bool u_xlatb56;
float u_xlat58;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlatb18.xyz = greaterThanEqual(vec4(_UseShadowMask, _UseRenderInfo01Mask, _UseRenderInfo02Mask, _UseRenderInfo02Mask), vec4(0.5, 0.5, 0.5, 0.5)).xyz;
    u_xlat16_1.x = (u_xlatb18.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb18.x) ? float(0.0) : float(1.0);
    u_xlat16_1.z = (u_xlatb18.y) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb18.y) ? float(0.0) : float(1.0);
    u_xlat16_6.xy = (u_xlatb18.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_18.xy * u_xlat16_1.xz + u_xlat16_1.yw;
    u_xlat18.x = u_xlat16_18.z * u_xlat16_6.x + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_42.x * _ShadowStrength;
    u_xlat36 = u_xlat16_42.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
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
    u_xlat16_60 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = vec3(u_xlat36) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat56) * u_xlat16_13.xyz;
    u_xlat36 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat36) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat56 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_65);
    u_xlat16_65 = u_xlat16_64 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_64 = float(1.0) / float(u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_65) * u_xlat16_65 + 1.0;
    u_xlat16_65 = max(u_xlat16_65, 0.0);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_64 = max(u_xlat16_14.x, u_xlat16_64);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_13.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat56) + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18.x = (-u_xlat36) * u_xlat16_60 + u_xlat36;
    u_xlat18.x = u_xlat36 * u_xlat18.x + u_xlat16_60;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat36;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat2.xyw * vec3(u_xlat16_64);
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat4.x) * u_xlat16_60 + u_xlat4.x;
    u_xlat40 = u_xlat4.x * u_xlat40 + u_xlat16_60;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat4.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat40;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat8.xyz = u_xlat2.xyw * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat8.xyz = vec3(u_xlat56) * u_xlat8.xyz;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_65) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat58 = u_xlat16_60 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat58 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_60 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat56;
    u_xlat16_65 = u_xlat40 * u_xlat40;
    u_xlat16_65 = u_xlat40 * u_xlat16_65;
    u_xlat16_65 = u_xlat40 * u_xlat16_65;
    u_xlat16_66 = u_xlat40 * u_xlat16_65;
    u_xlat56 = (-u_xlat16_65) * u_xlat40 + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat56) * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat18.xxx * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat8.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_OcclusionScale, _OcclusionScale, _OcclusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _OcclusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_3.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _OcclusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_65));
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
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = u_xlat0.y * 0.5;
    u_xlat16_30.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_48 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_48 = u_xlat16_48 + u_xlat16_48;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_48) + (-u_xlat16_13.xyz);
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_13.xyw = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyw = min(max(u_xlat16_13.xyw, 0.0), 1.0);
#else
    u_xlat16_13.xyw = clamp(u_xlat16_13.xyw, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_13.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_48 = floor(u_xlat16_9.w);
    u_xlat16_13.x = u_xlat16_48 + 1.0;
    u_xlat16_13.x = min(u_xlat16_13.x, 15.0);
    u_xlat16_9.x = u_xlat16_13.x * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_9.x = u_xlat16_48 * 16.0 + u_xlat16_9.z;
    u_xlat16_13.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_48 = u_xlat16_13.w * 15.0 + (-u_xlat16_48);
    u_xlat16_13.x = (-u_xlat16_58) + u_xlat16_40;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_13.x + u_xlat16_58;
    u_xlat16_48 = u_xlat16_66 * u_xlat16_48;
    u_xlat56 = u_xlat56 * u_xlat16_48;
    u_xlat16_12.x = u_xlat56 * u_xlat16_30.x + u_xlat16_12.x;
    u_xlat16_30.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_48 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_48 + u_xlat16_30.x;
    u_xlat16_12.x = u_xlat0.y * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_2.z, u_xlat16_12.x);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat4.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_60);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyw = vec3(u_xlat16_65) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyw : u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_30.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat4.x = u_xlat2.x * u_xlat16_64 + _Sanshe_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_64 + _Sanshe_Y;
    u_xlat4.z = u_xlat16_13.z;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = max(u_xlat54, 0.00048828125);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Sanshe_Fw;
    u_xlat54 = exp2(u_xlat54);
    u_xlat0.w = u_xlat54 * _Sanshe_Power;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(_UseSansheMask>=0.5);
#else
    u_xlatb38 = _UseSansheMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb38)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_5.xyz = texture(_SansheMask, vs_TEXCOORD3.xy).xyz;
    u_xlat16_42.xy = u_xlat16_5.xy * u_xlat16_42.xx + u_xlat16_42.yy;
    u_xlat4.x = u_xlat2.x * u_xlat16_64 + _Sanshe2_X;
    u_xlat4.y = u_xlat2.y * u_xlat16_64 + _Sanshe2_Y;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = max(u_xlat0.x, 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe2_Power;
    u_xlat0.xw = u_xlat0.xw * u_xlat16_42.yx;
    u_xlat2.xyz = u_xlat0.xxx * _Sanshe2_color.xyz;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat0.www * _Sanshe_color.xyz + u_xlat2.xyz;
    u_xlat16_42.x = dot(_DirectionalDir.xyz, _DirectionalDir.xyz);
    u_xlat16_42.x = inversesqrt(u_xlat16_42.x);
    u_xlat16_12.xyz = u_xlat16_42.xxx * _DirectionalDir.xyz;
    u_xlat18.x = dot(u_xlat16_12.xyz, u_xlat7.xyz);
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat18.xyz = u_xlat18.xxx * _DirectionalColor.xyz;
    u_xlat18.xyz = u_xlat18.xyz * vec3(_DirectionalIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseDirectionalMask>=0.5);
#else
    u_xlatb2 = _UseDirectionalMask>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_42.x = u_xlat16_5.z * u_xlat16_42.x + u_xlat16_42.y;
    u_xlat16_11.xyz = u_xlat18.xyz * u_xlat16_42.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat18.x = dot(u_xlat16_10.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat18.x = u_xlat18.x + -0.25;
    u_xlat18.x = u_xlat18.x * 1.81818175;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_42.x = exp2(_PostExposure);
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat16_42.xxx + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = (-vec3(u_xlat36)) + u_xlat2.xyz;
    u_xlat54 = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat54;
    u_xlat0.x = max(u_xlat18.x, u_xlat0.x);
    u_xlat16_42.x = (-_Saturation) + _SansheSaturation;
    u_xlat16_42.x = u_xlat0.x * u_xlat16_42.x + _Saturation;
    u_xlat0.xyz = u_xlat16_42.xxx * u_xlat2.xyz + vec3(u_xlat36);
    u_xlat16_42.xy = (-u_xlat0.zy) + u_xlat0.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb54 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_64 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.xy = vec2(u_xlat16_64) * u_xlat16_42.xy + u_xlat0.zy;
    u_xlat16_2.w = (-u_xlat0.x);
    u_xlat16_42.x = float(1.0);
    u_xlat16_42.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_64) * u_xlat16_42.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.yzw = u_xlat16_1.yzx + u_xlat16_2.yzw;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb18.x = u_xlat0.x>=u_xlat16_1.x;
#endif
    u_xlat16_42.x = (u_xlatb18.x) ? 1.0 : 0.0;
    u_xlat16_60 = u_xlat16_42.x * u_xlat16_3.w + u_xlat0.x;
    u_xlat16_11.xyz = u_xlat16_42.xxx * u_xlat16_3.xyz + u_xlat16_1.xyw;
    u_xlat16_42.x = min(u_xlat16_60, u_xlat16_11.y);
    u_xlat16_60 = u_xlat16_60 + (-u_xlat16_11.y);
    u_xlat16_42.x = (-u_xlat16_42.x) + u_xlat16_11.x;
    u_xlat16_64 = u_xlat16_42.x * 6.0 + 9.99999975e-05;
    u_xlat16_60 = u_xlat16_60 / u_xlat16_64;
    u_xlat16_60 = u_xlat16_60 + u_xlat16_11.z;
    u_xlat16_60 = abs(u_xlat16_60) + _HueShift;
    u_xlat16_29.xyz = vec3(u_xlat16_60) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_29.xyz = fract(u_xlat16_29.xyz);
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_29.xyz = abs(u_xlat16_29.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_29.xyz = u_xlat16_29.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_60 = u_xlat16_11.x + 9.99999975e-05;
    u_xlat16_42.x = u_xlat16_42.x / u_xlat16_60;
    u_xlat16_29.xyz = u_xlat16_42.xxx * u_xlat16_29.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_29.xyz * u_xlat16_11.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseAdjustColor>=0.5);
#else
    u_xlatb0 = _UseAdjustColor>=0.5;
#endif
    u_xlat16_42.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_42.xxx * u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_42.yyy + u_xlat16_11.xyz;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" }
  GpuProgramID 67274
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_SFGUI"
}