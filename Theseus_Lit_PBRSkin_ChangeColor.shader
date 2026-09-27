//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Skin)_ChangeColor" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _AlbedoMap ("基础色贴图", 2D) = "white" { }

_AlbedoColor ("基础色", Color) = (1,1,1,1)

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

_AlbedoChangMap ("换色后Albedo贴图", 2D) = "white" { }

_AlbedoChangColor ("换色后基础色", Color) = (1,1,1,1)

_NormalChangMap ("换色后法线贴图", 2D) = "bump" { }

_ChangColorAmount ("换色进度", Range(0, 1)) = 0.0

_DirectSpecularColor ("高光颜色", Color) = (1,1,1,1)

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Tex] _SkinMap ("皮肤贴图", 2D) = "black" { }

_SSSIntensity ("3S强度", Range(0, 3)) = 0.0

_SSSColorBase ("3S颜色基础", Color) = (1,1,1,1)

_SSSColorBack ("3S颜色背后", Color) = (1,1,1,1)

_SSSColorOcc ("3S颜色Occ", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.0

_ShadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 37093
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
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
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
ivec3 u_xlati24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
mediump float u_xlat16_49;
mediump float u_xlat16_52;
mediump float u_xlat16_54;
float u_xlat61;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_78;
float u_xlat79;
bool u_xlatb79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_82;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat72 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_25.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat72 * u_xlat72;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_3.x = u_xlat72 * u_xlat16_74;
    u_xlat72 = (-u_xlat16_74) * u_xlat72 + 1.0;
    u_xlat16_5.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_27.xyz = u_xlat16_5.zxy * u_xlat16_27.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_5.zxy;
    u_xlat16_5 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_5.zxy * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoColor.zxy;
    u_xlat5.xyz = u_xlat16_27.xyz * _AlbedoChangColor.zxy + (-u_xlat16_6.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_6.xyz;
    u_xlat16_27.xyz = u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_27.xyz = u_xlat16_6.yyy * u_xlat16_27.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_27.xyz;
    u_xlat72 = u_xlat16_27.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat8.xyz;
    u_xlat16_9.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat9.xyz = vec3(_ChangColorAmount) * u_xlat9.xyz + u_xlat16_11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_74 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_74) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat16_10.xyz;
    u_xlat14.xyz = u_xlat13.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat13.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat14.x;
    u_xlat12.x = u_xlat13.z;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat14.x = u_xlat13.y;
    u_xlat13.y = u_xlat14.z;
    u_xlat13.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat9.xyz, u_xlat13.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat9.xyz, u_xlat14.xyz);
    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat9.xyz = vec3(u_xlat76) * u_xlat12.xyz;
    u_xlat7 = dot(u_xlat9.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat79 = (-u_xlat7) * u_xlat16_25.x + u_xlat7;
    u_xlat79 = u_xlat7 * u_xlat79 + u_xlat16_25.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat7;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat9.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat13.x) * u_xlat16_25.x + u_xlat13.x;
    u_xlat80 = u_xlat13.x * u_xlat80 + u_xlat16_25.x;
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat13.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat80;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat28 = u_xlat16_25.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat28 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_25.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.zxy;
    u_xlat8.xyz = vec3(u_xlat7) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat14.xyz = vec3(u_xlat79) * u_xlat14.xyz;
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat28 + 1.0;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat16_25.x / u_xlat79;
    u_xlat79 = u_xlat79 * 0.318309873;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat81 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat81 * u_xlat81;
    u_xlat16_49 = u_xlat81 * u_xlat16_49;
    u_xlat16_49 = u_xlat81 * u_xlat16_49;
    u_xlat16_73 = u_xlat81 * u_xlat16_49;
    u_xlat81 = (-u_xlat16_49) * u_xlat81 + 1.0;
    u_xlat14.xyz = u_xlat16_27.xyz * vec3(u_xlat81);
    u_xlat15.xyz = vec3(u_xlat72) * vec3(u_xlat16_73) + u_xlat14.xyz;
    u_xlat84 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat84) * u_xlat16_25.x + u_xlat84;
    u_xlat61 = u_xlat84 * u_xlat61 + u_xlat16_25.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat84 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat80 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat79 = u_xlat79 * u_xlat61;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat79);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat84) * u_xlat15.xyz;
    u_xlat16_11.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_49 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_16.xyz = vec3(u_xlat16_49) * u_xlat8.xyz;
    u_xlat16_49 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb79 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb79 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_17.xy = (bool(u_xlatb79)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb79 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb79 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb79) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_49 = u_xlat16_73 * u_xlat16_49;
    u_xlat16_17.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat79 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat79);
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
    u_xlat0.x = u_xlat0.x * u_xlat28 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_25.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat48 * u_xlat48;
    u_xlat16_1.x = u_xlat48 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat48 * u_xlat16_1.x;
    u_xlat16_49 = u_xlat48 * u_xlat16_1.x;
    u_xlat48 = (-u_xlat16_1.x) * u_xlat48 + 1.0;
    u_xlat8.xyz = u_xlat16_27.xyz * vec3(u_xlat48);
    u_xlat8.xyz = vec3(u_xlat72) * vec3(u_xlat16_49) + u_xlat8.xyz;
    u_xlat48 = (-u_xlat24.x) * u_xlat16_25.x + u_xlat24.x;
    u_xlat48 = u_xlat24.x * u_xlat48 + u_xlat16_25.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat24.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat80;
    u_xlat0.z = float(1.0) / u_xlat48;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat8.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat24.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat12.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat9.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_74) + u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_74;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_30;
    u_xlat16_82 = sqrt(u_xlat16_3.x);
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_16.xy = u_xlat4.xz * vec2(u_xlat16_82);
    u_xlat16_18.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_3.x = _SSSIntensity * _SSSIntensity;
    u_xlat16_3.x = u_xlat16_48 * u_xlat16_3.x;
    u_xlat16_83 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat5.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = sqrt(u_xlat16_3.x);
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_16.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_82) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_22.xyz);
    u_xlat16_23.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xzw + (-vec3(u_xlat7));
    u_xlat16_16.xyz = vec3(u_xlat16_83) * u_xlat16_16.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.xxx * u_xlat16_16.xyz;
    u_xlat16_23.xyz = vec3(u_xlat84) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat24.xxx * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat24.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat24.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz + (-vec3(u_xlat84));
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(u_xlat84);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat4.zzz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_1.xzw + u_xlat16_16.xyz;
    u_xlat16_17.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_6.www * u_xlat16_17.xyz + _SSSColorOcc.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat18.y = u_xlat9.y;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_20.y = u_xlat16_11.y;
    u_xlat24.x = dot(u_xlat16_20.xyz, u_xlat18.xyz);
    u_xlat24.x = max(u_xlat24.x, 0.0);
    u_xlat4.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat4.xyz + _SSSColorBack.zxy;
    u_xlat24.xyz = u_xlat16_17.xyz * u_xlat24.xyz;
    u_xlat16_17.xyz = u_xlat24.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat16_17.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_30) * u_xlat16_21.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_16.xyz;
    u_xlat16_82 = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_82 = u_xlat16_82 + u_xlat16_82;
    u_xlat24.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_82) + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_11.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_11.xyz, u_xlat24.xyz);
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_54 = floor(u_xlat16_2.w);
    u_xlat16_78 = u_xlat16_54 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_54 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_54 = u_xlat16_10.z * 15.0 + (-u_xlat16_54);
    u_xlat16_78 = (-u_xlat16_52) + u_xlat16_28;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_78 + u_xlat16_52;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_54;
    u_xlat4.x = u_xlat4.x * u_xlat16_30;
    u_xlat16_30 = u_xlat0.x * 0.5;
    u_xlat16_54 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_30 = u_xlat4.x * u_xlat16_54 + u_xlat16_30;
    u_xlat16_54 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_78 = (-u_xlat16_30) * 2.0 + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_78 + u_xlat16_54;
    u_xlat16_30 = u_xlat0.x * u_xlat16_30;
    u_xlat16_30 = min(u_xlat16_30, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat12.xyz * vec3(u_xlat76) + (-u_xlat24.xyz);
    u_xlat0.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat24.xyz;
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_25.x;
    u_xlat16_25.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat13.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_25.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_3.xxx * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_27.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_3.yzx * u_xlat16_6.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
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
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
vec3 u_xlat15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
ivec3 u_xlati24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
mediump float u_xlat16_49;
mediump float u_xlat16_52;
mediump float u_xlat16_54;
float u_xlat61;
float u_xlat72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_78;
float u_xlat79;
bool u_xlatb79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_82;
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
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_25.xyz;
    u_xlat72 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_25.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat72 * u_xlat72;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_3.x = u_xlat72 * u_xlat16_74;
    u_xlat72 = (-u_xlat16_74) * u_xlat72 + 1.0;
    u_xlat16_5.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_27.xyz = u_xlat16_5.zxy * u_xlat16_27.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_5.zxy;
    u_xlat16_5 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_5.zxy * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoColor.zxy;
    u_xlat5.xyz = u_xlat16_27.xyz * _AlbedoChangColor.zxy + (-u_xlat16_6.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_6.xyz;
    u_xlat16_27.xyz = u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_27.xyz = u_xlat16_6.yyy * u_xlat16_27.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_27.xyz;
    u_xlat72 = u_xlat16_27.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat8.xyz;
    u_xlat16_9.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat9.xyz = vec3(_ChangColorAmount) * u_xlat9.xyz + u_xlat16_11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_74 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_74) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat16_10.xyz;
    u_xlat14.xyz = u_xlat13.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat13.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat14.x;
    u_xlat12.x = u_xlat13.z;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat14.x = u_xlat13.y;
    u_xlat13.y = u_xlat14.z;
    u_xlat13.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat9.xyz, u_xlat13.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat9.xyz, u_xlat14.xyz);
    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat9.xyz = vec3(u_xlat76) * u_xlat12.xyz;
    u_xlat7 = dot(u_xlat9.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat79 = (-u_xlat7) * u_xlat16_25.x + u_xlat7;
    u_xlat79 = u_xlat7 * u_xlat79 + u_xlat16_25.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat7;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat9.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat13.x) * u_xlat16_25.x + u_xlat13.x;
    u_xlat80 = u_xlat13.x * u_xlat80 + u_xlat16_25.x;
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat13.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat80;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat28 = u_xlat16_25.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat28 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_25.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.zxy;
    u_xlat8.xyz = vec3(u_xlat7) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat14.xyz = vec3(u_xlat79) * u_xlat14.xyz;
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat28 + 1.0;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat16_25.x / u_xlat79;
    u_xlat79 = u_xlat79 * 0.318309873;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat81 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat81 * u_xlat81;
    u_xlat16_49 = u_xlat81 * u_xlat16_49;
    u_xlat16_49 = u_xlat81 * u_xlat16_49;
    u_xlat16_73 = u_xlat81 * u_xlat16_49;
    u_xlat81 = (-u_xlat16_49) * u_xlat81 + 1.0;
    u_xlat14.xyz = u_xlat16_27.xyz * vec3(u_xlat81);
    u_xlat15.xyz = vec3(u_xlat72) * vec3(u_xlat16_73) + u_xlat14.xyz;
    u_xlat84 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat84) * u_xlat16_25.x + u_xlat84;
    u_xlat61 = u_xlat84 * u_xlat61 + u_xlat16_25.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat84 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat80 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat79 = u_xlat79 * u_xlat61;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat79);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat84) * u_xlat15.xyz;
    u_xlat16_11.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_49 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_49 = max(u_xlat16_49, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_49 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_49);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_16.xyz = vec3(u_xlat16_49) * u_xlat8.xyz;
    u_xlat16_49 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb79 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb79 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_17.xy = (bool(u_xlatb79)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb79 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb79 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb79) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_49 = u_xlat16_73 * u_xlat16_49;
    u_xlat16_17.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat79 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat79);
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
    u_xlat0.x = u_xlat0.x * u_xlat28 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_25.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat48 * u_xlat48;
    u_xlat16_1.x = u_xlat48 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat48 * u_xlat16_1.x;
    u_xlat16_49 = u_xlat48 * u_xlat16_1.x;
    u_xlat48 = (-u_xlat16_1.x) * u_xlat48 + 1.0;
    u_xlat8.xyz = u_xlat16_27.xyz * vec3(u_xlat48);
    u_xlat8.xyz = vec3(u_xlat72) * vec3(u_xlat16_49) + u_xlat8.xyz;
    u_xlat48 = (-u_xlat24.x) * u_xlat16_25.x + u_xlat24.x;
    u_xlat48 = u_xlat24.x * u_xlat48 + u_xlat16_25.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat24.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat80;
    u_xlat0.z = float(1.0) / u_xlat48;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat8.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat24.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat12.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat9.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_11.xyz = vec3(u_xlat16_74) * u_xlat16_11.xyz;
    u_xlat16_74 = dot(u_xlat16_11.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_74) + u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_74;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_30;
    u_xlat16_82 = sqrt(u_xlat16_3.x);
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_16.xy = u_xlat4.xz * vec2(u_xlat16_82);
    u_xlat16_18.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_3.x = _SSSIntensity * _SSSIntensity;
    u_xlat16_3.x = u_xlat16_48 * u_xlat16_3.x;
    u_xlat16_83 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat5.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = sqrt(u_xlat16_3.x);
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xzw = u_xlat16_16.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_16.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_82) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_22.xyz);
    u_xlat16_23.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_16.xyz = u_xlat16_23.xyz * u_xlat16_16.xzw + (-vec3(u_xlat7));
    u_xlat16_16.xyz = vec3(u_xlat16_83) * u_xlat16_16.xyz + vec3(u_xlat7);
    u_xlat16_16.xyz = u_xlat16_19.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.xxx * u_xlat16_16.xyz;
    u_xlat16_23.xyz = vec3(u_xlat84) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat24.xxx * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat24.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat24.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz + (-vec3(u_xlat84));
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(u_xlat84);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat4.zzz + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_1.xzw + u_xlat16_16.xyz;
    u_xlat16_17.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_6.www * u_xlat16_17.xyz + _SSSColorOcc.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat18.y = u_xlat9.y;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_20.y = u_xlat16_11.y;
    u_xlat24.x = dot(u_xlat16_20.xyz, u_xlat18.xyz);
    u_xlat24.x = max(u_xlat24.x, 0.0);
    u_xlat4.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat4.xyz + _SSSColorBack.zxy;
    u_xlat24.xyz = u_xlat16_17.xyz * u_xlat24.xyz;
    u_xlat16_17.xyz = u_xlat24.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat16_17.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_30) * u_xlat16_21.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_16.xyz;
    u_xlat16_82 = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_82 = u_xlat16_82 + u_xlat16_82;
    u_xlat24.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_82) + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_11.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_11.xyz, u_xlat24.xyz);
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_54 = floor(u_xlat16_2.w);
    u_xlat16_78 = u_xlat16_54 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_54 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_54 = u_xlat16_10.z * 15.0 + (-u_xlat16_54);
    u_xlat16_78 = (-u_xlat16_52) + u_xlat16_28;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_78 + u_xlat16_52;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_54;
    u_xlat4.x = u_xlat4.x * u_xlat16_30;
    u_xlat16_30 = u_xlat0.x * 0.5;
    u_xlat16_54 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_30 = u_xlat4.x * u_xlat16_54 + u_xlat16_30;
    u_xlat16_54 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_78 = (-u_xlat16_30) * 2.0 + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_78 + u_xlat16_54;
    u_xlat16_30 = u_xlat0.x * u_xlat16_30;
    u_xlat16_30 = min(u_xlat16_30, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat12.xyz * vec3(u_xlat76) + (-u_xlat24.xyz);
    u_xlat0.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat24.xyz;
    u_xlat16_25.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_25.x;
    u_xlat16_25.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat13.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_25.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_3.xxx * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_27.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_16.xyz;
    u_xlat16_1.xyz = u_xlat16_3.yzx * u_xlat16_6.yzx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
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
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_32;
float u_xlat51;
float u_xlat60;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
float u_xlat83;
float u_xlat85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_89;
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
    u_xlat29.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat29.xyz = u_xlat29.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat9.xyz = vec3(u_xlat80) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat29.x = dot(u_xlat30.xyz, u_xlat29.xyz);
    u_xlat29.x = (-u_xlat29.x) * u_xlat29.x + 1.0;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x * _ShadowBias.z;
    u_xlat29.xyz = (-u_xlat30.xyz) * u_xlat29.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat29.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat26.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat26.x = (-u_xlat1.x) + u_xlat26.x;
    u_xlat0.z = _ShadowBias.y * u_xlat26.x + u_xlat1.x;
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
    u_xlat25.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat25.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_25.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_25.z * _ShadowStrength;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_81);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = u_xlat16_7.x * u_xlat16_32.x;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_81 = max(u_xlat16_81, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_82 = max(u_xlat16_82, u_xlat16_11.x);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_81) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_7.xyz;
    u_xlat76 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat16_82 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat30.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat30.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat27.x = (-u_xlat16_82) + 1.0;
    u_xlat16_7.x = u_xlat27.x * u_xlat27.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_32.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat27.x = (-u_xlat16_7.x) * u_xlat27.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_3.zxy * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_3.zxy * u_xlat16_7.xzw;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.zxy;
    u_xlat3.xyz = u_xlat16_7.xzw * _AlbedoChangColor.zxy + (-u_xlat16_12.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xzw = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xzw = u_xlat16_9.yyy * u_xlat16_7.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat16_7.xzw;
    u_xlat4.x = u_xlat16_7.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat4.xxx * u_xlat16_32.xxx + u_xlat27.xyz;
    u_xlat16_32.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat79 = (-u_xlat76) * u_xlat16_32.x + u_xlat76;
    u_xlat79 = u_xlat76 * u_xlat79 + u_xlat16_32.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat76 + u_xlat79;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat10.x = dot(u_xlat30.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat10.x) * u_xlat16_32.x + u_xlat10.x;
    u_xlat83 = u_xlat10.x * u_xlat83 + u_xlat16_32.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat10.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat83;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat60 = u_xlat16_32.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat60 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_32.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat79 * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat25.xxx * u_xlat2.xyz;
    u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat77 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat13.xyz = vec3(u_xlat77) * u_xlat13.xyz;
    u_xlat16_86 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat30.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat60 + 1.0;
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat16_32.x / u_xlat77;
    u_xlat77 = u_xlat77 * 0.318309873;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat79 = (-u_xlat16_86) + 1.0;
    u_xlat16_86 = u_xlat79 * u_xlat79;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_87 = u_xlat79 * u_xlat16_86;
    u_xlat79 = (-u_xlat16_86) * u_xlat79 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xzw * vec3(u_xlat79);
    u_xlat13.xyz = u_xlat4.xxx * vec3(u_xlat16_87) + u_xlat13.xyz;
    u_xlat79 = dot(u_xlat30.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat79) * u_xlat16_32.x + u_xlat79;
    u_xlat85 = u_xlat79 * u_xlat85 + u_xlat16_32.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat79 + u_xlat85;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat83 * u_xlat85;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat77 = u_xlat77 * u_xlat85;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat77);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat13.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_86 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_86 = max(u_xlat16_86, 6.10351563e-05);
    u_xlat16_87 = u_xlat16_86 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_89 = float(1.0) / float(u_xlat16_86);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = u_xlat16_87 * u_xlat16_89;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_89);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_87;
    u_xlat16_16.xyz = vec3(u_xlat16_86) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat30.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat60 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_32.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat26.x = dot(u_xlat30.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_81) + 1.0;
    u_xlat16_81 = u_xlat51 * u_xlat51;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_86 = u_xlat51 * u_xlat16_81;
    u_xlat51 = (-u_xlat16_81) * u_xlat51 + 1.0;
    u_xlat2.xyz = u_xlat16_7.xzw * vec3(u_xlat51);
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_86) + u_xlat2.xyz;
    u_xlat51 = (-u_xlat26.x) * u_xlat16_32.x + u_xlat26.x;
    u_xlat51 = u_xlat26.x * u_xlat51 + u_xlat16_32.x;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat26.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat83;
    u_xlat1.z = float(1.0) / u_xlat51;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat25.yyy + u_xlat16_14.xyz;
    u_xlat16_15.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat30.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_81 * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_81) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_86 + u_xlat16_81;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_81;
    u_xlat16_86 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 + -1.0;
    u_xlat16_86 = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_86;
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_81));
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(u_xlat16_87);
    u_xlat16_18.xy = u_xlat25.xy * vec2(u_xlat16_87);
    u_xlat16_19.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_81 = _SSSIntensity * _SSSIntensity;
    u_xlat16_81 = u_xlat16_1.x * u_xlat16_81;
    u_xlat16_87 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat3.xyz * vec3(u_xlat16_87);
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_19.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_22.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_87) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat79) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_24.xyz * u_xlat16_17.xyz + (-vec3(u_xlat79));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat79);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat76) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat26.xxx * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xzw = u_xlat16_18.xxx * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_18.yyy * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_22.xyz * u_xlat16_19.xyz + (-u_xlat26.xxx);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + u_xlat26.xxx;
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xzw + (-vec3(u_xlat76));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat76);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat25.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat25.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.www * u_xlat16_11.xyz + _SSSColorOcc.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat30.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat30.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat30.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat1.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat1.xyz = u_xlat25.xxx * u_xlat1.xyz + _SSSColorBack.zxy;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_20.xyz + (-u_xlat16_20.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_81) * u_xlat16_11.xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat16_19.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati25 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_81 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xyz = (-u_xlat30.xyz) * u_xlat16_11.xxx + (-u_xlat16_12.xyz);
    u_xlat1.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_32.xxx * u_xlat26.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_32.x = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat10.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_32.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_81 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_81 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_81 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_81 = u_xlat16_11.z * 15.0 + (-u_xlat16_81);
    u_xlat16_82 = (-u_xlat16_25.x) + u_xlat16_0.x;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82 + u_xlat16_25.x;
    u_xlat16_81 = u_xlat16_86 * u_xlat16_81;
    u_xlat0.x = u_xlat1.x * u_xlat16_81;
    u_xlat16_81 = u_xlat0.w * 0.5;
    u_xlat16_82 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_81 = u_xlat0.x * u_xlat16_82 + u_xlat16_81;
    u_xlat16_82 = u_xlat16_81 + u_xlat16_81;
    u_xlat16_11.x = (-u_xlat16_81) * 2.0 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_11.x + u_xlat16_82;
    u_xlat16_81 = u_xlat0.w * u_xlat16_81;
    u_xlat16_81 = min(u_xlat16_4.z, u_xlat16_81);
    u_xlat16_7.xyz = vec3(u_xlat16_81) * u_xlat16_7.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_7.yzx * u_xlat16_11.yzx + u_xlat16_14.yzx;
    u_xlat16_81 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_81;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_6.xyz;
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
    u_xlat75 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_81 : u_xlat16_7.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
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
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_32;
float u_xlat51;
float u_xlat60;
float u_xlat75;
float u_xlat76;
float u_xlat77;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
float u_xlat83;
float u_xlat85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_89;
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
    u_xlat29.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat29.xyz = u_xlat29.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat9.xyz = vec3(u_xlat80) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat29.x = dot(u_xlat30.xyz, u_xlat29.xyz);
    u_xlat29.x = (-u_xlat29.x) * u_xlat29.x + 1.0;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x * _ShadowBias.z;
    u_xlat29.xyz = (-u_xlat30.xyz) * u_xlat29.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat29.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat26.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat26.x = (-u_xlat1.x) + u_xlat26.x;
    u_xlat0.z = _ShadowBias.y * u_xlat26.x + u_xlat1.x;
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
    u_xlat25.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat25.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_25.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_25.z * _ShadowStrength;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_81);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = u_xlat16_7.x * u_xlat16_32.x;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_81 = max(u_xlat16_81, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_82 = max(u_xlat16_82, u_xlat16_11.x);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_81) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_7.xyz;
    u_xlat76 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat16_82 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat30.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat30.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat27.x = (-u_xlat16_82) + 1.0;
    u_xlat16_7.x = u_xlat27.x * u_xlat27.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_32.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat27.x = (-u_xlat16_7.x) * u_xlat27.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xzw = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_3.zxy * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_3.zxy * u_xlat16_7.xzw;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.zxy;
    u_xlat3.xyz = u_xlat16_7.xzw * _AlbedoChangColor.zxy + (-u_xlat16_12.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xzw = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xzw = u_xlat16_9.yyy * u_xlat16_7.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat16_7.xzw;
    u_xlat4.x = u_xlat16_7.w * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat4.xxx * u_xlat16_32.xxx + u_xlat27.xyz;
    u_xlat16_32.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat79 = (-u_xlat76) * u_xlat16_32.x + u_xlat76;
    u_xlat79 = u_xlat76 * u_xlat79 + u_xlat16_32.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat76 + u_xlat79;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat10.x = dot(u_xlat30.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat10.x) * u_xlat16_32.x + u_xlat10.x;
    u_xlat83 = u_xlat10.x * u_xlat83 + u_xlat16_32.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat10.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat83;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat60 = u_xlat16_32.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat60 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_32.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat79 * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat25.xxx * u_xlat2.xyz;
    u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat77 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat13.xyz = vec3(u_xlat77) * u_xlat13.xyz;
    u_xlat16_86 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat30.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat60 + 1.0;
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat16_32.x / u_xlat77;
    u_xlat77 = u_xlat77 * 0.318309873;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat79 = (-u_xlat16_86) + 1.0;
    u_xlat16_86 = u_xlat79 * u_xlat79;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_87 = u_xlat79 * u_xlat16_86;
    u_xlat79 = (-u_xlat16_86) * u_xlat79 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xzw * vec3(u_xlat79);
    u_xlat13.xyz = u_xlat4.xxx * vec3(u_xlat16_87) + u_xlat13.xyz;
    u_xlat79 = dot(u_xlat30.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat79) * u_xlat16_32.x + u_xlat79;
    u_xlat85 = u_xlat79 * u_xlat85 + u_xlat16_32.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat79 + u_xlat85;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat83 * u_xlat85;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat77 = u_xlat77 * u_xlat85;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat77);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat13.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_86 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_86 = max(u_xlat16_86, 6.10351563e-05);
    u_xlat16_87 = u_xlat16_86 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_89 = float(1.0) / float(u_xlat16_86);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = u_xlat16_87 * u_xlat16_89;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_89);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_87;
    u_xlat16_16.xyz = vec3(u_xlat16_86) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat30.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat60 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_32.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat26.x = dot(u_xlat30.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_81) + 1.0;
    u_xlat16_81 = u_xlat51 * u_xlat51;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_86 = u_xlat51 * u_xlat16_81;
    u_xlat51 = (-u_xlat16_81) * u_xlat51 + 1.0;
    u_xlat2.xyz = u_xlat16_7.xzw * vec3(u_xlat51);
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_86) + u_xlat2.xyz;
    u_xlat51 = (-u_xlat26.x) * u_xlat16_32.x + u_xlat26.x;
    u_xlat51 = u_xlat26.x * u_xlat51 + u_xlat16_32.x;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat26.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat83;
    u_xlat1.z = float(1.0) / u_xlat51;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.zxy;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat25.yyy + u_xlat16_14.xyz;
    u_xlat16_15.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat30.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_81 * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_81) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_86 + u_xlat16_81;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_81;
    u_xlat16_86 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 + -1.0;
    u_xlat16_86 = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_86;
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_81));
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(u_xlat16_87);
    u_xlat16_18.xy = u_xlat25.xy * vec2(u_xlat16_87);
    u_xlat16_19.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.x = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_81 = _SSSIntensity * _SSSIntensity;
    u_xlat16_81 = u_xlat16_1.x * u_xlat16_81;
    u_xlat16_87 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat3.xyz * vec3(u_xlat16_87);
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_19.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_22.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_87) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat79) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_24.xyz * u_xlat16_17.xyz + (-vec3(u_xlat79));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat79);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat76) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat26.xxx * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xzw = u_xlat16_18.xxx * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_18.yyy * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_22.xyz * u_xlat16_19.xyz + (-u_xlat26.xxx);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + u_xlat26.xxx;
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xzw + (-vec3(u_xlat76));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat76);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat25.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat25.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.www * u_xlat16_11.xyz + _SSSColorOcc.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat30.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat30.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat30.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat1.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat1.xyz = u_xlat25.xxx * u_xlat1.xyz + _SSSColorBack.zxy;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_20.xyz + (-u_xlat16_20.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_81) * u_xlat16_11.xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.zxy;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat16_19.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati25 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_81 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xyz = (-u_xlat30.xyz) * u_xlat16_11.xxx + (-u_xlat16_12.xyz);
    u_xlat1.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_32.xxx * u_xlat26.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_32.x = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat10.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_32.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_81 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_81 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_81 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_81 = u_xlat16_11.z * 15.0 + (-u_xlat16_81);
    u_xlat16_82 = (-u_xlat16_25.x) + u_xlat16_0.x;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82 + u_xlat16_25.x;
    u_xlat16_81 = u_xlat16_86 * u_xlat16_81;
    u_xlat0.x = u_xlat1.x * u_xlat16_81;
    u_xlat16_81 = u_xlat0.w * 0.5;
    u_xlat16_82 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_81 = u_xlat0.x * u_xlat16_82 + u_xlat16_81;
    u_xlat16_82 = u_xlat16_81 + u_xlat16_81;
    u_xlat16_11.x = (-u_xlat16_81) * 2.0 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_11.x + u_xlat16_82;
    u_xlat16_81 = u_xlat0.w * u_xlat16_81;
    u_xlat16_81 = min(u_xlat16_4.z, u_xlat16_81);
    u_xlat16_7.xyz = vec3(u_xlat16_81) * u_xlat16_7.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_7.yzx * u_xlat16_11.yzx + u_xlat16_14.yzx;
    u_xlat16_81 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_81;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_6.xyz;
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
    u_xlat75 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat75);
    u_xlat1.x = u_xlat75 * 0.0625 + u_xlat1.y;
    u_xlat16_25.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_25.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_25.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_81 : u_xlat16_7.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
ivec3 u_xlati24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
mediump float u_xlat16_49;
mediump float u_xlat16_52;
mediump float u_xlat16_54;
float u_xlat61;
float u_xlat72;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
float u_xlat84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 6.10351563e-05);
    u_xlat16_25.x = u_xlat16_1 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_25.x = (-u_xlat16_25.x) * u_xlat16_25.x + 1.0;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_49 = float(1.0) / float(u_xlat16_1);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat16_1 = u_xlat16_25.x * u_xlat16_49;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1 = max(u_xlat16_25.x, u_xlat16_1);
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
    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_25.xyz;
    u_xlat72 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_25.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat72 * u_xlat72;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_3.x = u_xlat72 * u_xlat16_74;
    u_xlat72 = (-u_xlat16_74) * u_xlat72 + 1.0;
    u_xlat16_5.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_27.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_5.xyz;
    u_xlat16_5 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoColor.xyz;
    u_xlat5.xyz = u_xlat16_27.xyz * _AlbedoChangColor.xyz + (-u_xlat16_6.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_6.xyz;
    u_xlat16_27.xyz = u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_27.xyz = u_xlat16_6.yyy * u_xlat16_27.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_27.xyz;
    u_xlat72 = u_xlat16_27.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat8.xyz;
    u_xlat16_9.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat9.xyz = vec3(_ChangColorAmount) * u_xlat9.xyz + u_xlat16_11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_74 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_74) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat16_10.xyz;
    u_xlat14.xyz = u_xlat13.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat13.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat14.x;
    u_xlat12.x = u_xlat13.z;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat14.x = u_xlat13.y;
    u_xlat13.y = u_xlat14.z;
    u_xlat13.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat9.xyz, u_xlat13.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat9.xyz, u_xlat14.xyz);
    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat9.xyz = vec3(u_xlat76) * u_xlat12.xyz;
    u_xlat7 = dot(u_xlat9.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat79 = (-u_xlat7) * u_xlat16_25.x + u_xlat7;
    u_xlat79 = u_xlat7 * u_xlat79 + u_xlat16_25.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat7;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat13.x = dot(u_xlat9.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat13.x) * u_xlat16_25.x + u_xlat13.x;
    u_xlat80 = u_xlat13.x * u_xlat80 + u_xlat16_25.x;
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat13.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat80;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat28 = u_xlat16_25.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat28 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_25.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat7) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat14.xyz = vec3(u_xlat79) * u_xlat14.xyz;
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat28 + 1.0;
    u_xlat81 = u_xlat79 * u_xlat79;
    u_xlat81 = u_xlat16_25.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat84 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat84 * u_xlat84;
    u_xlat16_49 = u_xlat84 * u_xlat16_49;
    u_xlat16_74 = u_xlat84 * u_xlat16_49;
    u_xlat16_3.x = u_xlat84 * u_xlat16_74;
    u_xlat84 = (-u_xlat16_74) * u_xlat84 + 1.0;
    u_xlat14.xyz = u_xlat16_27.xyz * vec3(u_xlat84);
    u_xlat14.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat14.xyz;
    u_xlat84 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat84) * u_xlat16_25.x + u_xlat84;
    u_xlat61 = u_xlat84 * u_xlat61 + u_xlat16_25.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat84 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat80 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat81 = u_xlat81 * u_xlat61;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat84) * u_xlat14.xyz;
    u_xlat16_11.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat8.xyz;
    u_xlat16_74 = u_xlat16_3.x * u_xlat16_30;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb8 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30 = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_30);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_3.x;
    u_xlat16_16.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_15.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xxx;
    u_xlat16_74 = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat28 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_25.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat48 * u_xlat48;
    u_xlat16_74 = u_xlat48 * u_xlat16_74;
    u_xlat16_74 = u_xlat48 * u_xlat16_74;
    u_xlat16_3.x = u_xlat48 * u_xlat16_74;
    u_xlat48 = (-u_xlat16_74) * u_xlat48 + 1.0;
    u_xlat8.xyz = u_xlat16_27.xyz * vec3(u_xlat48);
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat8.xyz;
    u_xlat48 = (-u_xlat24.x) * u_xlat16_25.x + u_xlat24.x;
    u_xlat48 = u_xlat24.x * u_xlat48 + u_xlat16_25.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat24.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat80;
    u_xlat0.z = float(1.0) / u_xlat48;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat8.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat24.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_11.xyz;
    u_xlat16_15.xyz = (-u_xlat12.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat16_74 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz;
    u_xlat16_74 = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_74) + u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_74;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_30;
    u_xlat16_82 = sqrt(u_xlat16_3.x);
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_17.xy = u_xlat4.xz * vec2(u_xlat16_82);
    u_xlat16_18.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_3.x = _SSSIntensity * _SSSIntensity;
    u_xlat16_3.x = u_xlat16_48 * u_xlat16_3.x;
    u_xlat16_83 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat5.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = sqrt(u_xlat16_3.x);
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xzw = u_xlat16_17.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_17.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_82) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_22.xyz);
    u_xlat16_23.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat16_17.xzw + (-vec3(u_xlat7));
    u_xlat16_17.xyz = vec3(u_xlat16_83) * u_xlat16_17.xyz + vec3(u_xlat7);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_2.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = vec3(u_xlat84) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat24.xxx * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat24.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat24.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz + (-vec3(u_xlat84));
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(u_xlat84);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat4.zzz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_6.www * u_xlat16_17.xyz + _SSSColorOcc.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat18.y = u_xlat9.y;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_20.y = u_xlat16_15.y;
    u_xlat24.x = dot(u_xlat16_20.xyz, u_xlat18.xyz);
    u_xlat24.x = max(u_xlat24.x, 0.0);
    u_xlat4.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat4.xyz + _SSSColorBack.xyz;
    u_xlat24.xyz = u_xlat16_17.xyz * u_xlat24.xyz;
    u_xlat16_17.xyz = u_xlat24.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat16_17.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_30) * u_xlat16_21.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_16.xyz;
    u_xlat16_82 = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_82 = u_xlat16_82 + u_xlat16_82;
    u_xlat24.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_82) + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat24.xyz);
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_54 = floor(u_xlat16_2.w);
    u_xlat16_78 = u_xlat16_54 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_54 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_54 = u_xlat16_10.z * 15.0 + (-u_xlat16_54);
    u_xlat16_78 = (-u_xlat16_52) + u_xlat16_28;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_78 + u_xlat16_52;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_54;
    u_xlat4.x = u_xlat4.x * u_xlat16_30;
    u_xlat16_30 = u_xlat0.x * 0.5;
    u_xlat16_54 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_30 = u_xlat4.x * u_xlat16_54 + u_xlat16_30;
    u_xlat16_54 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_78 = (-u_xlat16_30) * 2.0 + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_78 + u_xlat16_54;
    u_xlat16_30 = u_xlat0.x * u_xlat16_30;
    u_xlat16_30 = min(u_xlat16_30, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat12.xyz * vec3(u_xlat76) + (-u_xlat24.xyz);
    u_xlat0.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat24.xyz;
    u_xlat16_54 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_54;
    u_xlat16_54 = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat13.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_54);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_3.xxx * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_27.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_16.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_27.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
ivec3 u_xlati24;
mediump vec3 u_xlat16_25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
mediump float u_xlat16_49;
mediump float u_xlat16_52;
mediump float u_xlat16_54;
float u_xlat61;
float u_xlat72;
mediump float u_xlat16_74;
float u_xlat76;
mediump float u_xlat16_78;
float u_xlat79;
float u_xlat80;
float u_xlat81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
float u_xlat84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 6.10351563e-05);
    u_xlat16_25.x = u_xlat16_1 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_25.x = (-u_xlat16_25.x) * u_xlat16_25.x + 1.0;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_49 = float(1.0) / float(u_xlat16_1);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat16_1 = u_xlat16_25.x * u_xlat16_49;
    u_xlat16_25.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_25.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1 = max(u_xlat16_25.x, u_xlat16_1);
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
    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = inversesqrt(u_xlat16_1);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_25.xyz;
    u_xlat72 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat4.xyz = vec3(u_xlat72) * u_xlat4.xyz;
    u_xlat16_74 = dot(u_xlat16_25.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat72 * u_xlat72;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_74 = u_xlat72 * u_xlat16_74;
    u_xlat16_3.x = u_xlat72 * u_xlat16_74;
    u_xlat72 = (-u_xlat16_74) * u_xlat72 + 1.0;
    u_xlat16_5.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_27.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_5.xyz;
    u_xlat16_5 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoColor.xyz;
    u_xlat5.xyz = u_xlat16_27.xyz * _AlbedoChangColor.xyz + (-u_xlat16_6.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_6.xyz;
    u_xlat16_27.xyz = u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_27.xyz = u_xlat16_6.yyy * u_xlat16_27.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_27.xyz;
    u_xlat72 = u_xlat16_27.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat8.xyz;
    u_xlat16_9.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat9.xyz = vec3(_ChangColorAmount) * u_xlat9.xyz + u_xlat16_11.xyz;
    u_xlat12.z = vs_TEXCOORD1.x;
    u_xlat16_74 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_74) + vs_TEXCOORD2.yzx;
    u_xlat76 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat13.xyz = vec3(u_xlat76) * u_xlat16_10.xyz;
    u_xlat14.xyz = u_xlat13.xyz * vs_TEXCOORD1.zxy;
    u_xlat14.xyz = vs_TEXCOORD1.yzx * u_xlat13.yzx + (-u_xlat14.xyz);
    u_xlat14.xyz = u_xlat14.xzy * vs_TEXCOORD2.www;
    u_xlat12.y = u_xlat14.x;
    u_xlat12.x = u_xlat13.z;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat12.xyz);
    u_xlat14.x = u_xlat13.y;
    u_xlat13.y = u_xlat14.z;
    u_xlat13.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat9.xyz, u_xlat13.xyz);
    u_xlat14.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat9.xyz, u_xlat14.xyz);
    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat76 = max(u_xlat76, 1.17549435e-38);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat9.xyz = vec3(u_xlat76) * u_xlat12.xyz;
    u_xlat7 = dot(u_xlat9.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_25.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0078125);
    u_xlat79 = (-u_xlat7) * u_xlat16_25.x + u_xlat7;
    u_xlat79 = u_xlat7 * u_xlat79 + u_xlat16_25.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat7;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(u_xlat16_1);
    u_xlat13.x = dot(u_xlat9.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat80 = (-u_xlat13.x) * u_xlat16_25.x + u_xlat13.x;
    u_xlat80 = u_xlat13.x * u_xlat80 + u_xlat16_25.x;
    u_xlat80 = sqrt(u_xlat80);
    u_xlat80 = u_xlat80 + u_xlat13.x;
    u_xlat80 = u_xlat80 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat80;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat4.x = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat28 = u_xlat16_25.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat28 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_25.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat79 * u_xlat4.x;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _DirectSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat7) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_2.xyz * u_xlat8.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat79 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat14.xyz = vec3(u_xlat79) * u_xlat14.xyz;
    u_xlat16_49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat28 + 1.0;
    u_xlat81 = u_xlat79 * u_xlat79;
    u_xlat81 = u_xlat16_25.x / u_xlat81;
    u_xlat81 = u_xlat81 * 0.318309873;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat84 = (-u_xlat16_49) + 1.0;
    u_xlat16_49 = u_xlat84 * u_xlat84;
    u_xlat16_49 = u_xlat84 * u_xlat16_49;
    u_xlat16_74 = u_xlat84 * u_xlat16_49;
    u_xlat16_3.x = u_xlat84 * u_xlat16_74;
    u_xlat84 = (-u_xlat16_74) * u_xlat84 + 1.0;
    u_xlat14.xyz = u_xlat16_27.xyz * vec3(u_xlat84);
    u_xlat14.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat14.xyz;
    u_xlat84 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat84 = min(max(u_xlat84, 0.0), 1.0);
#else
    u_xlat84 = clamp(u_xlat84, 0.0, 1.0);
#endif
    u_xlat61 = (-u_xlat84) * u_xlat16_25.x + u_xlat84;
    u_xlat61 = u_xlat84 * u_xlat61 + u_xlat16_25.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat84 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat80 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat81 = u_xlat81 * u_xlat61;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat84) * u_xlat14.xyz;
    u_xlat16_11.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_30 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat8.xyz;
    u_xlat16_74 = u_xlat16_3.x * u_xlat16_30;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb8 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb8)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_74 = max(u_xlat16_74, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb8 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_30 = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_30);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_3.x;
    u_xlat16_16.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_1) + u_xlat16_15.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xxx;
    u_xlat16_74 = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat28 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_25.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat48 * u_xlat48;
    u_xlat16_74 = u_xlat48 * u_xlat16_74;
    u_xlat16_74 = u_xlat48 * u_xlat16_74;
    u_xlat16_3.x = u_xlat48 * u_xlat16_74;
    u_xlat48 = (-u_xlat16_74) * u_xlat48 + 1.0;
    u_xlat8.xyz = u_xlat16_27.xyz * vec3(u_xlat48);
    u_xlat8.xyz = vec3(u_xlat72) * u_xlat16_3.xxx + u_xlat8.xyz;
    u_xlat48 = (-u_xlat24.x) * u_xlat16_25.x + u_xlat24.x;
    u_xlat48 = u_xlat24.x * u_xlat48 + u_xlat16_25.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat24.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat48 * u_xlat80;
    u_xlat0.z = float(1.0) / u_xlat48;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat8.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat24.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_11.xyz;
    u_xlat16_15.xyz = (-u_xlat12.xyz) * vec3(u_xlat76) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat16_74 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_15.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz;
    u_xlat16_74 = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_74 * 0.5 + 0.5;
    u_xlat16_3.x = (-u_xlat16_74) + u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x + u_xlat16_74;
    u_xlat16_3.x = u_xlat16_6.w * u_xlat16_3.x;
    u_xlat16_30 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_30 + -1.0;
    u_xlat16_30 = _OcclusionScale * u_xlat16_30 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_30;
    u_xlat16_82 = sqrt(u_xlat16_3.x);
    u_xlat0.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_17.xy = u_xlat4.xz * vec2(u_xlat16_82);
    u_xlat16_18.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_3.x = _SSSIntensity * _SSSIntensity;
    u_xlat16_3.x = u_xlat16_48 * u_xlat16_3.x;
    u_xlat16_83 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_19.xyz = u_xlat5.xyz * vec3(u_xlat16_83);
    u_xlat16_83 = sqrt(u_xlat16_3.x);
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = (-u_xlat16_18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xzw = u_xlat16_17.xxx * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_21.xyz = u_xlat16_17.yyy * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_82) * u_xlat16_20.xyz + u_xlat16_18.xyz;
    u_xlat16_20.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_83) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_20.xyz + (-u_xlat16_22.xyz);
    u_xlat16_23.xyz = vec3(u_xlat7) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_17.xyz = u_xlat16_23.xyz * u_xlat16_17.xzw + (-vec3(u_xlat7));
    u_xlat16_17.xyz = vec3(u_xlat16_83) * u_xlat16_17.xyz + vec3(u_xlat7);
    u_xlat16_17.xyz = u_xlat16_19.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_2.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_23.xyz = vec3(u_xlat84) * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat24.xxx * u_xlat16_20.xyz + u_xlat16_22.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat24.xxx);
    u_xlat16_20.xyz = vec3(u_xlat16_83) * u_xlat16_20.xyz + u_xlat24.xxx;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_20.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_20.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_23.xyz * u_xlat16_18.xyz + (-vec3(u_xlat84));
    u_xlat16_18.xyz = vec3(u_xlat16_83) * u_xlat16_18.xyz + vec3(u_xlat84);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat4.zzz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz + u_xlat16_16.xyz;
    u_xlat16_17.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_6.www * u_xlat16_17.xyz + _SSSColorOcc.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat9.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat9.xz);
    u_xlat18.xz = u_xlat16_18.xz;
    u_xlat18.y = u_xlat9.y;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_20.y = u_xlat16_15.y;
    u_xlat24.x = dot(u_xlat16_20.xyz, u_xlat18.xyz);
    u_xlat24.x = max(u_xlat24.x, 0.0);
    u_xlat4.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat4.xyz + _SSSColorBack.xyz;
    u_xlat24.xyz = u_xlat16_17.xyz * u_xlat24.xyz;
    u_xlat16_17.xyz = u_xlat24.xyz * u_xlat16_19.xyz + (-u_xlat16_19.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xxx * u_xlat16_17.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat24.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat24.xxx * u_xlat16_19.xyz;
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat24.xxx * u_xlat16_21.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat24.xxx + (-u_xlat16_21.xyz);
    u_xlat16_21.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_21.xyz * u_xlat24.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_30) * u_xlat16_21.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati48 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_3.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_19.xyz + u_xlat16_16.xyz;
    u_xlat16_82 = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_82 = u_xlat16_82 + u_xlat16_82;
    u_xlat24.xyz = (-u_xlat9.xyz) * vec3(u_xlat16_82) + (-u_xlat16_10.xyz);
    u_xlat4.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat24.xyz);
    u_xlat16_10.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_54 = floor(u_xlat16_2.w);
    u_xlat16_78 = u_xlat16_54 + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_2.x = u_xlat16_54 * 16.0 + u_xlat16_2.z;
    u_xlat16_10.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_54 = u_xlat16_10.z * 15.0 + (-u_xlat16_54);
    u_xlat16_78 = (-u_xlat16_52) + u_xlat16_28;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_78 + u_xlat16_52;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_54;
    u_xlat4.x = u_xlat4.x * u_xlat16_30;
    u_xlat16_30 = u_xlat0.x * 0.5;
    u_xlat16_54 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_30 = u_xlat4.x * u_xlat16_54 + u_xlat16_30;
    u_xlat16_54 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_78 = (-u_xlat16_30) * 2.0 + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_78 + u_xlat16_54;
    u_xlat16_30 = u_xlat0.x * u_xlat16_30;
    u_xlat16_30 = min(u_xlat16_30, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat12.xyz * vec3(u_xlat76) + (-u_xlat24.xyz);
    u_xlat0.xyz = u_xlat16_25.xxx * u_xlat4.xyz + u_xlat24.xyz;
    u_xlat16_54 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_54;
    u_xlat16_54 = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat13.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_54);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyz = u_xlat16_3.xxx * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_10.xyz : u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_27.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_16.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_27.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.x : u_xlat16_27.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_32;
float u_xlat51;
float u_xlat60;
float u_xlat76;
float u_xlat77;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
float u_xlat83;
float u_xlat85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_89;
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
    u_xlat29.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat29.xyz = u_xlat29.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat9.xyz = vec3(u_xlat80) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat29.x = dot(u_xlat30.xyz, u_xlat29.xyz);
    u_xlat29.x = (-u_xlat29.x) * u_xlat29.x + 1.0;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x * _ShadowBias.z;
    u_xlat29.xyz = (-u_xlat30.xyz) * u_xlat29.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat29.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat26.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat26.x = (-u_xlat1.x) + u_xlat26.x;
    u_xlat0.z = _ShadowBias.y * u_xlat26.x + u_xlat1.x;
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
    u_xlat25.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat25.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_25.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_25.z * _ShadowStrength;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_81);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = u_xlat16_7.x * u_xlat16_32.x;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_81 = max(u_xlat16_81, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_82 = max(u_xlat16_82, u_xlat16_11.x);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_81) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_7.xyz;
    u_xlat76 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat16_82 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat30.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat30.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat27.x = (-u_xlat16_82) + 1.0;
    u_xlat16_7.x = u_xlat27.x * u_xlat27.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_32.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat27.x = (-u_xlat16_7.x) * u_xlat27.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.xyz;
    u_xlat3.xyz = u_xlat16_7.xzw * _AlbedoChangColor.xyz + (-u_xlat16_12.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xzw = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xzw = u_xlat16_9.yyy * u_xlat16_7.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat16_7.xzw;
    u_xlat4.x = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat4.xxx * u_xlat16_32.xxx + u_xlat27.xyz;
    u_xlat16_32.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat79 = (-u_xlat76) * u_xlat16_32.x + u_xlat76;
    u_xlat79 = u_xlat76 * u_xlat79 + u_xlat16_32.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat76 + u_xlat79;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat10.x = dot(u_xlat30.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat10.x) * u_xlat16_32.x + u_xlat10.x;
    u_xlat83 = u_xlat10.x * u_xlat83 + u_xlat16_32.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat10.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat83;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat60 = u_xlat16_32.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat60 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_32.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat79 * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat25.xxx * u_xlat2.xyz;
    u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat77 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat13.xyz = vec3(u_xlat77) * u_xlat13.xyz;
    u_xlat16_86 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat30.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat60 + 1.0;
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat16_32.x / u_xlat77;
    u_xlat77 = u_xlat77 * 0.318309873;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat79 = (-u_xlat16_86) + 1.0;
    u_xlat16_86 = u_xlat79 * u_xlat79;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_87 = u_xlat79 * u_xlat16_86;
    u_xlat79 = (-u_xlat16_86) * u_xlat79 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xzw * vec3(u_xlat79);
    u_xlat13.xyz = u_xlat4.xxx * vec3(u_xlat16_87) + u_xlat13.xyz;
    u_xlat79 = dot(u_xlat30.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat79) * u_xlat16_32.x + u_xlat79;
    u_xlat85 = u_xlat79 * u_xlat85 + u_xlat16_32.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat79 + u_xlat85;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat83 * u_xlat85;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat77 = u_xlat77 * u_xlat85;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat77);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_86 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_86 = max(u_xlat16_86, 6.10351563e-05);
    u_xlat16_87 = u_xlat16_86 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_89 = float(1.0) / float(u_xlat16_86);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = u_xlat16_87 * u_xlat16_89;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_89);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_87;
    u_xlat16_16.xyz = vec3(u_xlat16_86) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat30.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat60 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_32.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat26.x = dot(u_xlat30.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_81) + 1.0;
    u_xlat16_81 = u_xlat51 * u_xlat51;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_86 = u_xlat51 * u_xlat16_81;
    u_xlat51 = (-u_xlat16_81) * u_xlat51 + 1.0;
    u_xlat2.xyz = u_xlat16_7.xzw * vec3(u_xlat51);
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_86) + u_xlat2.xyz;
    u_xlat51 = (-u_xlat26.x) * u_xlat16_32.x + u_xlat26.x;
    u_xlat51 = u_xlat26.x * u_xlat51 + u_xlat16_32.x;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat26.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat83;
    u_xlat1.z = float(1.0) / u_xlat51;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat25.yyy + u_xlat16_14.xyz;
    u_xlat16_15.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat30.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_81 * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_81) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_86 + u_xlat16_81;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_81;
    u_xlat16_86 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 + -1.0;
    u_xlat16_86 = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_86;
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_81));
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(u_xlat16_87);
    u_xlat16_18.xy = u_xlat25.xy * vec2(u_xlat16_87);
    u_xlat16_19.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_81 = _SSSIntensity * _SSSIntensity;
    u_xlat16_81 = u_xlat16_1 * u_xlat16_81;
    u_xlat16_87 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat3.xyz * vec3(u_xlat16_87);
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_19.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_22.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_87) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat79) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_24.xyz * u_xlat16_17.xyz + (-vec3(u_xlat79));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat79);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat76) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat26.xxx * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xzw = u_xlat16_18.xxx * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_18.yyy * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_22.xyz * u_xlat16_19.xyz + (-u_xlat26.xxx);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + u_xlat26.xxx;
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xzw + (-vec3(u_xlat76));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat76);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat25.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat25.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.www * u_xlat16_11.xyz + _SSSColorOcc.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat30.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat30.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat30.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat1.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat1.xyz = u_xlat25.xxx * u_xlat1.xyz + _SSSColorBack.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_20.xyz + (-u_xlat16_20.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_81) * u_xlat16_11.xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat16_19.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati25 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_81 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xyz = (-u_xlat30.xyz) * u_xlat16_11.xxx + (-u_xlat16_12.xyz);
    u_xlat1.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_32.xxx * u_xlat26.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_32.x = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat10.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_32.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_81 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_81 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_81 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_81 = u_xlat16_11.z * 15.0 + (-u_xlat16_81);
    u_xlat16_82 = (-u_xlat16_25.x) + u_xlat16_0.x;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82 + u_xlat16_25.x;
    u_xlat16_81 = u_xlat16_86 * u_xlat16_81;
    u_xlat0.x = u_xlat1.x * u_xlat16_81;
    u_xlat16_81 = u_xlat0.w * 0.5;
    u_xlat16_82 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_81 = u_xlat0.x * u_xlat16_82 + u_xlat16_81;
    u_xlat16_82 = u_xlat16_81 + u_xlat16_81;
    u_xlat16_11.x = (-u_xlat16_81) * 2.0 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_11.x + u_xlat16_82;
    u_xlat16_81 = u_xlat0.w * u_xlat16_81;
    u_xlat16_81 = min(u_xlat16_4.z, u_xlat16_81);
    u_xlat16_7.xyz = vec3(u_xlat16_81) * u_xlat16_7.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat16_14.xyz;
    u_xlat16_81 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_81;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_81 : u_xlat16_7.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
int u_xlati25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat29;
vec3 u_xlat30;
mediump vec3 u_xlat16_32;
float u_xlat51;
float u_xlat60;
float u_xlat76;
float u_xlat77;
float u_xlat79;
float u_xlat80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
float u_xlat83;
float u_xlat85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_89;
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
    u_xlat29.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat29.xyz = u_xlat29.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat80 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat80 = max(u_xlat80, 1.17549435e-38);
    u_xlat80 = inversesqrt(u_xlat80);
    u_xlat9.xyz = vec3(u_xlat80) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat30.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat29.x = dot(u_xlat30.xyz, u_xlat29.xyz);
    u_xlat29.x = (-u_xlat29.x) * u_xlat29.x + 1.0;
    u_xlat29.x = sqrt(u_xlat29.x);
    u_xlat29.x = u_xlat29.x * _ShadowBias.z;
    u_xlat29.xyz = (-u_xlat30.xyz) * u_xlat29.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat29.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat26.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat26.x = (-u_xlat1.x) + u_xlat26.x;
    u_xlat0.z = _ShadowBias.y * u_xlat26.x + u_xlat1.x;
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
    u_xlat25.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat25.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_25.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_25.z * _ShadowStrength;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = max(u_xlat16_81, 6.10351563e-05);
    u_xlat16_7.x = u_xlat16_81 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat16_7.x + 1.0;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_32.x = float(1.0) / float(u_xlat16_81);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = u_xlat16_7.x * u_xlat16_32.x;
    u_xlat16_7.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_7.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_81 = max(u_xlat16_81, u_xlat16_7.x);
    u_xlat16_7.xzw = u_xlat16_7.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.yyy + u_xlat16_7.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_82 = u_xlat16_82 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat16_82 = u_xlat16_82 * u_xlat16_82;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_82 = max(u_xlat16_82, u_xlat16_11.x);
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_81) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_81 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_7.xyz;
    u_xlat76 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat16_82 = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_82 = min(max(u_xlat16_82, 0.0), 1.0);
#else
    u_xlat16_82 = clamp(u_xlat16_82, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat30.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat30.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat27.x = (-u_xlat16_82) + 1.0;
    u_xlat16_7.x = u_xlat27.x * u_xlat27.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat16_32.x = u_xlat27.x * u_xlat16_7.x;
    u_xlat27.x = (-u_xlat16_7.x) * u_xlat27.x + 1.0;
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xzw = u_xlat16_3.xyz * u_xlat16_7.xzw;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _AlbedoColor.xyz;
    u_xlat3.xyz = u_xlat16_7.xzw * _AlbedoChangColor.xyz + (-u_xlat16_12.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xzw = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_4.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_7.xzw = u_xlat16_9.yyy * u_xlat16_7.xzw + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat16_7.xzw;
    u_xlat4.x = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat4.xxx * u_xlat16_32.xxx + u_xlat27.xyz;
    u_xlat16_32.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat79 = (-u_xlat76) * u_xlat16_32.x + u_xlat76;
    u_xlat79 = u_xlat76 * u_xlat79 + u_xlat16_32.x;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat76 + u_xlat79;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat1.xyz * vec3(u_xlat16_81);
    u_xlat10.x = dot(u_xlat30.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat83 = (-u_xlat10.x) * u_xlat16_32.x + u_xlat10.x;
    u_xlat83 = u_xlat10.x * u_xlat83 + u_xlat16_32.x;
    u_xlat83 = sqrt(u_xlat83);
    u_xlat83 = u_xlat83 + u_xlat10.x;
    u_xlat83 = u_xlat83 + 6.10351563e-05;
    u_xlat79 = u_xlat79 * u_xlat83;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat79 = min(u_xlat79, 16.0);
    u_xlat60 = u_xlat16_32.x + -1.0;
    u_xlat2.x = u_xlat2.x * u_xlat60 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_32.x / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat2.x = u_xlat79 * u_xlat2.x;
    u_xlat2.xyz = u_xlat27.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat76) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat25.xxx * u_xlat2.xyz;
    u_xlat13.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat77 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat13.xyz = vec3(u_xlat77) * u_xlat13.xyz;
    u_xlat16_86 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat77 = dot(u_xlat30.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat77 * u_xlat60 + 1.0;
    u_xlat77 = u_xlat77 * u_xlat77;
    u_xlat77 = u_xlat16_32.x / u_xlat77;
    u_xlat77 = u_xlat77 * 0.318309873;
    u_xlat77 = min(u_xlat77, 16.0);
    u_xlat79 = (-u_xlat16_86) + 1.0;
    u_xlat16_86 = u_xlat79 * u_xlat79;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_86 = u_xlat79 * u_xlat16_86;
    u_xlat16_87 = u_xlat79 * u_xlat16_86;
    u_xlat79 = (-u_xlat16_86) * u_xlat79 + 1.0;
    u_xlat13.xyz = u_xlat16_7.xzw * vec3(u_xlat79);
    u_xlat13.xyz = u_xlat4.xxx * vec3(u_xlat16_87) + u_xlat13.xyz;
    u_xlat79 = dot(u_xlat30.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat85 = (-u_xlat79) * u_xlat16_32.x + u_xlat79;
    u_xlat85 = u_xlat79 * u_xlat85 + u_xlat16_32.x;
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat79 + u_xlat85;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat85 = u_xlat83 * u_xlat85;
    u_xlat85 = float(1.0) / u_xlat85;
    u_xlat85 = min(u_xlat85, 16.0);
    u_xlat77 = u_xlat77 * u_xlat85;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat77);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat79) * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_86 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_86 = max(u_xlat16_86, 6.10351563e-05);
    u_xlat16_87 = u_xlat16_86 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_87 = (-u_xlat16_87) * u_xlat16_87 + 1.0;
    u_xlat16_87 = max(u_xlat16_87, 0.0);
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
    u_xlat16_89 = float(1.0) / float(u_xlat16_86);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_86);
    u_xlat16_86 = u_xlat16_87 * u_xlat16_89;
    u_xlat16_87 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_87));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_87);
#endif
    u_xlat16_16.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_87 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_87 = u_xlat16_87 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_87 = min(max(u_xlat16_87, 0.0), 1.0);
#else
    u_xlat16_87 = clamp(u_xlat16_87, 0.0, 1.0);
#endif
    u_xlat16_87 = u_xlat16_87 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_89 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_89);
    u_xlat16_86 = u_xlat16_86 * u_xlat16_87;
    u_xlat16_16.xyz = vec3(u_xlat16_86) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_81) + u_xlat16_15.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat30.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat60 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_32.x / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat26.x = dot(u_xlat30.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_81) + 1.0;
    u_xlat16_81 = u_xlat51 * u_xlat51;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_81 = u_xlat51 * u_xlat16_81;
    u_xlat16_86 = u_xlat51 * u_xlat16_81;
    u_xlat51 = (-u_xlat16_81) * u_xlat51 + 1.0;
    u_xlat2.xyz = u_xlat16_7.xzw * vec3(u_xlat51);
    u_xlat2.xyz = u_xlat4.xxx * vec3(u_xlat16_86) + u_xlat2.xyz;
    u_xlat51 = (-u_xlat26.x) * u_xlat16_32.x + u_xlat26.x;
    u_xlat51 = u_xlat26.x * u_xlat51 + u_xlat16_32.x;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat26.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat51 = u_xlat51 * u_xlat83;
    u_xlat1.z = float(1.0) / u_xlat51;
    u_xlat1.xz = min(u_xlat1.xz, vec2(16.0, 16.0));
    u_xlat1.x = u_xlat1.z * u_xlat1.x;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _DirectSpecularColor.xyz;
    u_xlat2.xyz = u_xlat26.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_16.xyz * u_xlat2.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat25.yyy + u_xlat16_14.xyz;
    u_xlat16_15.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat30.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_81 = inversesqrt(u_xlat16_81);
    u_xlat16_15.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
    u_xlat16_81 = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_81 * 0.5 + 0.5;
    u_xlat16_86 = (-u_xlat16_81) + u_xlat16_86;
    u_xlat16_87 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _OcclusionScale * u_xlat16_87 + 1.0;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_86 + u_xlat16_81;
    u_xlat16_81 = u_xlat16_9.w * u_xlat16_81;
    u_xlat16_86 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 + -1.0;
    u_xlat16_86 = _OcclusionScale * u_xlat16_86 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_86;
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_81));
    u_xlat16_17.xyz = u_xlat16_6.xyz * vec3(u_xlat16_87);
    u_xlat16_18.xy = u_xlat25.xy * vec2(u_xlat16_87);
    u_xlat16_19.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_81 = _SSSIntensity * _SSSIntensity;
    u_xlat16_81 = u_xlat16_1 * u_xlat16_81;
    u_xlat16_87 = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_87;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = u_xlat3.xyz * vec3(u_xlat16_87);
    u_xlat16_87 = sqrt(u_xlat16_81);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_21.xyz = (-u_xlat16_19.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_22.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22.xyz = vec3(u_xlat16_87) * u_xlat16_22.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23.xyz = vec3(u_xlat16_87) * u_xlat16_23.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + (-u_xlat16_23.xyz);
    u_xlat16_24.xyz = vec3(u_xlat79) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_17.xyz = u_xlat16_24.xyz * u_xlat16_17.xyz + (-vec3(u_xlat79));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat79);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat76) * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_22.xyz = u_xlat26.xxx * u_xlat16_22.xyz + u_xlat16_23.xyz;
    u_xlat16_18.xzw = u_xlat16_18.xxx * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_18.yyy * u_xlat16_21.xyz + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_22.xyz * u_xlat16_19.xyz + (-u_xlat26.xxx);
    u_xlat16_19.xyz = vec3(u_xlat16_87) * u_xlat16_19.xyz + u_xlat26.xxx;
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_19.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.xzw + (-vec3(u_xlat76));
    u_xlat16_17.xyz = vec3(u_xlat16_87) * u_xlat16_17.xyz + vec3(u_xlat76);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat25.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz * u_xlat25.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = u_xlat16_9.www * u_xlat16_11.xyz + _SSSColorOcc.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat30.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat30.xz);
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16.y = u_xlat30.y;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat25.x = dot(u_xlat16_17.xyz, u_xlat16.xyz);
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat1.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat1.xyz = u_xlat25.xxx * u_xlat1.xyz + _SSSColorBack.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat1.xyz;
    u_xlat16_11.xyz = u_xlat1.xyz * u_xlat16_20.xyz + (-u_xlat16_20.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_81) * u_xlat16_11.xyz + u_xlat16_20.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat0.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat0.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat16_19.xyz;
    u_xlati25 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati25].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati25 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_17.xyw;
    u_xlat16_19.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_81 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_11.x = dot((-u_xlat16_12.xyz), u_xlat30.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat0.xyz = (-u_xlat30.xyz) * u_xlat16_11.xxx + (-u_xlat16_12.xyz);
    u_xlat1.x = dot(u_xlat16_15.xyz, u_xlat30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_15.xyz, u_xlat0.xyz);
    u_xlat16_11.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_32.xxx * u_xlat26.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_32.x = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat10.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_7.xzw = u_xlat16_7.xzw * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_32.x);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_81) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xzw * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_81 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_81 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_81 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_81 = u_xlat16_11.z * 15.0 + (-u_xlat16_81);
    u_xlat16_82 = (-u_xlat16_25.x) + u_xlat16_0.x;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_82 + u_xlat16_25.x;
    u_xlat16_81 = u_xlat16_86 * u_xlat16_81;
    u_xlat0.x = u_xlat1.x * u_xlat16_81;
    u_xlat16_81 = u_xlat0.w * 0.5;
    u_xlat16_82 = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_81 = u_xlat0.x * u_xlat16_82 + u_xlat16_81;
    u_xlat16_82 = u_xlat16_81 + u_xlat16_81;
    u_xlat16_11.x = (-u_xlat16_81) * 2.0 + 1.0;
    u_xlat16_81 = u_xlat16_81 * u_xlat16_11.x + u_xlat16_82;
    u_xlat16_81 = u_xlat0.w * u_xlat16_81;
    u_xlat16_81 = min(u_xlat16_4.z, u_xlat16_81);
    u_xlat16_7.xyz = vec3(u_xlat16_81) * u_xlat16_7.xyz;
    u_xlat16_11.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat16_14.xyz;
    u_xlat16_81 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_81;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_32.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_32.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_81 : u_xlat16_7.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
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
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_40;
float u_xlat42;
float u_xlat50;
int u_xlati50;
float u_xlat54;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_62;
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
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_0.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.xyz = vec3(_ChangColorAmount) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat18.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat59 = dot(u_xlat18.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-u_xlat5.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_3.xyz = vec3(_OcclusionScale) * u_xlat16_2.xyz + u_xlat18.xyz;
    u_xlat16_55 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_3.xyz = vec3(u_xlat16_55) * u_xlat16_3.xyz;
    u_xlat16_55 = dot(u_xlat16_3.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_55 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_55) + u_xlat16_57;
    u_xlat16_4.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_4.x + 1.0;
    u_xlat16_55 = u_xlat16_2.w * u_xlat16_57 + u_xlat16_55;
    u_xlat16_55 = u_xlat16_2.w * u_xlat16_55;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_57;
    u_xlat16_4.x = sqrt(u_xlat16_55);
    u_xlat6.x = min(u_xlat16_55, 1.0);
    u_xlat16_24.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat16_22.xy = u_xlat16_4.xx * u_xlat24.xy;
    u_xlat16_8.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_60 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_55 = _SSSIntensity * _SSSIntensity;
    u_xlat16_55 = u_xlat16_60 * u_xlat16_55;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_58 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_62 = sqrt(u_xlat16_55);
    u_xlat16_8.xyz = vec3(u_xlat16_62) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = (-u_xlat16_8.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_22.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_22.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = vec3(u_xlat16_62) * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_9.xyz + (-u_xlat16_12.xyz);
    u_xlat16_13.xyz = vec3(u_xlat59) * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_10.xyz + (-vec3(u_xlat59));
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat16_10.xyz + vec3(u_xlat59);
    u_xlat16_14.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_14.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.zxy;
    u_xlat16_14 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.zxy;
    u_xlat14.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_15.xyz);
    u_xlat14.xyz = vec3(_ChangColorAmount) * u_xlat14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat24.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat59) * u_xlat16_1.xyz;
    u_xlat59 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = vec3(u_xlat59) * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + (-vec3(u_xlat59));
    u_xlat16_4.xyz = vec3(u_xlat16_62) * u_xlat16_4.xyz + vec3(u_xlat59);
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_4.x = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_22.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 6.10351563e-05);
    u_xlat16_40.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_10.xyz = u_xlat16_40.xxx * u_xlat14.xyz;
    u_xlat16_40.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_40.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_40.x);
#endif
    u_xlat16_40.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_40.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_40.yyy + u_xlat16_16.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat24.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_22.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_22.x = float(1.0) / float(u_xlat16_22.x);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_22.x = u_xlat16_58 * u_xlat16_22.x;
    u_xlat16_22.x = max(u_xlat16_40.x, u_xlat16_22.x);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_22.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_9.xyz = u_xlat24.xxx * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + (-u_xlat24.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_62) * u_xlat16_9.xyz + u_xlat24.xxx;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat24.yyy * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat24.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat24.x = (-u_xlat59) * u_xlat16_4.x + u_xlat59;
    u_xlat24.x = u_xlat59 * u_xlat24.x + u_xlat16_4.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat59 + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat7.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_22.x = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_9.xyz = u_xlat16_22.xxx * u_xlat7.xyw;
    u_xlat7.xyw = u_xlat7.xyw * u_xlat16_22.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.x = dot(u_xlat18.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat14.x) * u_xlat16_4.x + u_xlat14.x;
    u_xlat42 = u_xlat14.x * u_xlat42 + u_xlat16_4.x;
    u_xlat50 = sqrt(u_xlat42);
    u_xlat50 = u_xlat50 + u_xlat14.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat24.x * u_xlat50;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat50 = min(u_xlat50, 16.0);
    u_xlat17.x = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat7.xyw = u_xlat7.xyw * u_xlat17.xxx;
    u_xlat17.x = dot(u_xlat18.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat16_22.x) + 1.0;
    u_xlat25 = u_xlat17.x * u_xlat17.x;
    u_xlat61 = u_xlat16_4.x + -1.0;
    u_xlat25 = u_xlat25 * u_xlat61 + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat16_4.x / u_xlat25;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat25 = u_xlat50 * u_xlat25;
    u_xlat16_22.x = u_xlat7.x * u_xlat7.x;
    u_xlat16_22.x = u_xlat7.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat7.x * u_xlat16_22.x;
    u_xlat16_40.x = u_xlat7.x * u_xlat16_22.x;
    u_xlat7.x = (-u_xlat16_22.x) * u_xlat7.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = u_xlat7.xxx * u_xlat16_10.xyz;
    u_xlat7.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat7.xxx * u_xlat16_40.xxx + u_xlat17.xyz;
    u_xlat7.xyw = vec3(u_xlat25) * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyw = min(max(u_xlat7.xyw, 0.0), 1.0);
#else
    u_xlat7.xyw = clamp(u_xlat7.xyw, 0.0, 1.0);
#endif
    u_xlat7.xyw = u_xlat7.xyw * _DirectSpecularColor.zxy;
    u_xlat7.xyw = vec3(u_xlat59) * u_xlat7.xyw;
    u_xlat16_1.xyz = u_xlat7.xyw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_22.xyz + _SSSColorOcc.zxy;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat18.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat18.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat11.y = u_xlat18.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_3.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_3.xz);
    u_xlat16_12.y = u_xlat16_3.y;
    u_xlat59 = dot(u_xlat16_12.xyz, u_xlat11.xyz);
    u_xlat59 = max(u_xlat59, 0.0);
    u_xlat17.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat17.xyz = vec3(u_xlat59) * u_xlat17.xyz + _SSSColorBack.zxy;
    u_xlat17.xyz = u_xlat16_22.xyz * u_xlat17.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_22.xyz = vec3(u_xlat16_55) * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_22.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat59 = min(u_xlat6.x, u_xlat16_7.z);
    u_xlat16_13.xyz = vec3(u_xlat59) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat59) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat59) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat59) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz;
    u_xlati59 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati59].xyz;
    u_xlati59 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati50 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_12.xyw;
    u_xlat16_15.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_55 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_22.x = dot((-u_xlat16_9.xyz), u_xlat18.xyz);
    u_xlat16_22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat17.xyz = (-u_xlat18.xyz) * u_xlat16_22.xxx + (-u_xlat16_9.xyz);
    u_xlat18.x = dot(u_xlat16_3.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_3.xyz, u_xlat17.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_8.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_8.x = u_xlat16_21.x * 16.0 + u_xlat16_8.z;
    u_xlat16_22.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_8.x = u_xlat16_3.x * 16.0 + u_xlat16_8.z;
    u_xlat16_22.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_54) + u_xlat16_36;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_54;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat18.x = u_xlat18.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat6.x * 0.5;
    u_xlat16_21.x = (-u_xlat6.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat18.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat6.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx + (-u_xlat17.xyz);
    u_xlat0.xyz = u_xlat16_4.xxx * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat14.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_21.x);
    u_xlat16_21.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_21.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_21.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = vec3(u_xlat16_55) * u_xlat16_21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat7.ywx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_3.yzx;
    u_xlat16_55 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_14.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_14.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_4.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat2.x = u_xlat54 * 0.0625 + u_xlat2.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_18.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_3.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
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
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
ivec3 u_xlati17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_19;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump vec2 u_xlat16_40;
float u_xlat42;
float u_xlat50;
int u_xlati50;
float u_xlat54;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat59;
int u_xlati59;
mediump float u_xlat16_60;
float u_xlat61;
mediump float u_xlat16_62;
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
    u_xlat16_19 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_19 = max(u_xlat16_19, 6.10351563e-05);
    u_xlat16_37.x = inversesqrt(u_xlat16_19);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_37.xxx;
    u_xlat16_37.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_37.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_37.x);
#endif
    u_xlat16_37.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_37.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_37.yyy + u_xlat16_3.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_55);
    u_xlat16_55 = u_xlat16_19 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19 = float(1.0) / float(u_xlat16_19);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_19 = u_xlat16_55 * u_xlat16_19;
    u_xlat16_19 = max(u_xlat16_37.x, u_xlat16_19);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_0.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.xyz = vec3(_ChangColorAmount) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_55 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_55) + vs_TEXCOORD2.yzx;
    u_xlat54 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat54 = max(u_xlat54, 1.17549435e-38);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat18.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat59 = dot(u_xlat18.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-u_xlat5.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_3.xyz = vec3(_OcclusionScale) * u_xlat16_2.xyz + u_xlat18.xyz;
    u_xlat16_55 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_3.xyz = vec3(u_xlat16_55) * u_xlat16_3.xyz;
    u_xlat16_55 = dot(u_xlat16_3.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_55 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_55) + u_xlat16_57;
    u_xlat16_4.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_4.x + 1.0;
    u_xlat16_55 = u_xlat16_2.w * u_xlat16_57 + u_xlat16_55;
    u_xlat16_55 = u_xlat16_2.w * u_xlat16_55;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _OcclusionScale * u_xlat16_57 + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_57;
    u_xlat16_4.x = sqrt(u_xlat16_55);
    u_xlat6.x = min(u_xlat16_55, 1.0);
    u_xlat16_24.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat16_22.xy = u_xlat16_4.xx * u_xlat24.xy;
    u_xlat16_8.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_60 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_55 = _SSSIntensity * _SSSIntensity;
    u_xlat16_55 = u_xlat16_60 * u_xlat16_55;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_58 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_62 = sqrt(u_xlat16_55);
    u_xlat16_8.xyz = vec3(u_xlat16_62) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = (-u_xlat16_8.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_22.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_22.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = vec3(u_xlat16_62) * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_9.xyz + (-u_xlat16_12.xyz);
    u_xlat16_13.xyz = vec3(u_xlat59) * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_10.xyz + (-vec3(u_xlat59));
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat16_10.xyz + vec3(u_xlat59);
    u_xlat16_14.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_14.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.zxy;
    u_xlat16_14 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.zxy;
    u_xlat14.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_15.xyz);
    u_xlat14.xyz = vec3(_ChangColorAmount) * u_xlat14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat24.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat59) * u_xlat16_1.xyz;
    u_xlat59 = dot(u_xlat18.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = vec3(u_xlat59) * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + (-vec3(u_xlat59));
    u_xlat16_4.xyz = vec3(u_xlat16_62) * u_xlat16_4.xyz + vec3(u_xlat59);
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb24 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_4.x = (u_xlatb24) ? 1.0 : 0.0;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_22.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 6.10351563e-05);
    u_xlat16_40.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_10.xyz = u_xlat16_40.xxx * u_xlat14.xyz;
    u_xlat16_40.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.00100000005>=abs(u_xlat16_40.x));
#else
    u_xlatb24 = 0.00100000005>=abs(u_xlat16_40.x);
#endif
    u_xlat16_40.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_40.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_40.yyy + u_xlat16_16.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat24.x = dot(u_xlat18.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_22.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_22.x = float(1.0) / float(u_xlat16_22.x);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_22.x = u_xlat16_58 * u_xlat16_22.x;
    u_xlat16_22.x = max(u_xlat16_40.x, u_xlat16_22.x);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_22.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_9.xyz = u_xlat24.xxx * u_xlat16_9.xyz + u_xlat16_12.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + (-u_xlat24.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_62) * u_xlat16_9.xyz + u_xlat24.xxx;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat24.yyy * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat24.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat24.x = (-u_xlat59) * u_xlat16_4.x + u_xlat59;
    u_xlat24.x = u_xlat59 * u_xlat24.x + u_xlat16_4.x;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat59 + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + 6.10351563e-05;
    u_xlat7.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_22.x = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_9.xyz = u_xlat16_22.xxx * u_xlat7.xyw;
    u_xlat7.xyw = u_xlat7.xyw * u_xlat16_22.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.x = dot(u_xlat18.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat14.x) * u_xlat16_4.x + u_xlat14.x;
    u_xlat42 = u_xlat14.x * u_xlat42 + u_xlat16_4.x;
    u_xlat50 = sqrt(u_xlat42);
    u_xlat50 = u_xlat50 + u_xlat14.x;
    u_xlat50 = u_xlat50 + 6.10351563e-05;
    u_xlat50 = u_xlat24.x * u_xlat50;
    u_xlat50 = float(1.0) / u_xlat50;
    u_xlat50 = min(u_xlat50, 16.0);
    u_xlat17.x = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat7.xyw = u_xlat7.xyw * u_xlat17.xxx;
    u_xlat17.x = dot(u_xlat18.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_22.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat16_22.x) + 1.0;
    u_xlat25 = u_xlat17.x * u_xlat17.x;
    u_xlat61 = u_xlat16_4.x + -1.0;
    u_xlat25 = u_xlat25 * u_xlat61 + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat16_4.x / u_xlat25;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat25 = min(u_xlat25, 16.0);
    u_xlat25 = u_xlat50 * u_xlat25;
    u_xlat16_22.x = u_xlat7.x * u_xlat7.x;
    u_xlat16_22.x = u_xlat7.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat7.x * u_xlat16_22.x;
    u_xlat16_40.x = u_xlat7.x * u_xlat16_22.x;
    u_xlat7.x = (-u_xlat16_22.x) * u_xlat7.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = u_xlat7.xxx * u_xlat16_10.xyz;
    u_xlat7.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat7.xxx * u_xlat16_40.xxx + u_xlat17.xyz;
    u_xlat7.xyw = vec3(u_xlat25) * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyw = min(max(u_xlat7.xyw, 0.0), 1.0);
#else
    u_xlat7.xyw = clamp(u_xlat7.xyw, 0.0, 1.0);
#endif
    u_xlat7.xyw = u_xlat7.xyw * _DirectSpecularColor.zxy;
    u_xlat7.xyw = vec3(u_xlat59) * u_xlat7.xyw;
    u_xlat16_1.xyz = u_xlat7.xyw * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_2.www * u_xlat16_22.xyz + _SSSColorOcc.zxy;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat18.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat18.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat11.y = u_xlat18.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_3.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_3.xz);
    u_xlat16_12.y = u_xlat16_3.y;
    u_xlat59 = dot(u_xlat16_12.xyz, u_xlat11.xyz);
    u_xlat59 = max(u_xlat59, 0.0);
    u_xlat17.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat17.xyz = vec3(u_xlat59) * u_xlat17.xyz + _SSSColorBack.zxy;
    u_xlat17.xyz = u_xlat16_22.xyz * u_xlat17.xyz;
    u_xlat16_22.xyz = u_xlat17.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_22.xyz = vec3(u_xlat16_55) * u_xlat16_22.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_22.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat59 = min(u_xlat6.x, u_xlat16_7.z);
    u_xlat16_13.xyz = vec3(u_xlat59) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat59) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat59) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat59) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_22.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat59) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati17.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz;
    u_xlati59 = int(int_bitfieldInsert(2,u_xlati17.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati59].xyz;
    u_xlati59 = int(uint(uint(u_xlati17.x) & 1u));
    u_xlati50 = (u_xlati17.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati50].xyz + u_xlat16_12.xyw;
    u_xlat16_15.xyz = u_xlat16_12.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_55 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_22.x = dot((-u_xlat16_9.xyz), u_xlat18.xyz);
    u_xlat16_22.x = u_xlat16_22.x + u_xlat16_22.x;
    u_xlat17.xyz = (-u_xlat18.xyz) * u_xlat16_22.xxx + (-u_xlat16_9.xyz);
    u_xlat18.x = dot(u_xlat16_3.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_3.xyz, u_xlat17.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_8.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_8.x = u_xlat16_21.x * 16.0 + u_xlat16_8.z;
    u_xlat16_22.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_8.x = u_xlat16_3.x * 16.0 + u_xlat16_8.z;
    u_xlat16_22.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_22.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_54) + u_xlat16_36;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_54;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat18.x = u_xlat18.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat6.x * 0.5;
    u_xlat16_21.x = (-u_xlat6.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat18.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat6.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx + (-u_xlat17.xyz);
    u_xlat0.xyz = u_xlat16_4.xxx * u_xlat0.xyz + u_xlat17.xyz;
    u_xlat16_21.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat14.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_21.x);
    u_xlat16_21.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_21.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_21.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = vec3(u_xlat16_55) * u_xlat16_21.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_21.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat7.ywx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_3.yzx;
    u_xlat16_55 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_14.w * _AlbedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_14.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_4.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_21.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat2.x = u_xlat54 * 0.0625 + u_xlat2.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_18.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_55 : u_xlat16_3.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
int u_xlati22;
bool u_xlatb22;
float u_xlat23;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat44;
mediump float u_xlat16_56;
float u_xlat66;
float u_xlat68;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat26.x = dot(u_xlat27.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat27.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_OcclusionScale) * u_xlat16_7.xyz + u_xlat27.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_7.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_72 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_72) + u_xlat16_73;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _OcclusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_73 + u_xlat16_72;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_11.x = sqrt(u_xlat16_72);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_72));
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat22.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_72 = _SSSIntensity * _SSSIntensity;
    u_xlat16_72 = u_xlat16_2.x * u_xlat16_72;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_56 = sqrt(u_xlat16_72);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat68 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_56) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_33.xyz = u_xlat16_17.xyz * u_xlat16_33.xyz + (-vec3(u_xlat68));
    u_xlat16_33.xyz = vec3(u_xlat16_56) * u_xlat16_33.xyz + vec3(u_xlat68);
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_3.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_3.zxy * u_xlat16_17.xyz;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_3.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_3.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.zxy;
    u_xlat3.xyz = u_xlat16_17.xyz * _AlbedoChangColor.zxy + (-u_xlat16_18.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xxx * u_xlat3.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_33.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_78);
    u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_20.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
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
    u_xlat16_78 = max(u_xlat16_20.x, u_xlat16_78);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_19.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_20.xyz = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat3.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + u_xlat3.xxx;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat22.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_13.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_13.x = max(u_xlat16_13.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_35.xyz = u_xlat3.xyz * u_xlat16_35.xxx;
    u_xlat16_14.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_14.x));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_35.xyz = u_xlat16_35.xyz * u_xlat16_14.yyy + u_xlat16_19.xyz;
    u_xlat16_36 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_35.xyz);
    u_xlat22.x = dot(u_xlat27.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_36 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_35.x);
    u_xlat16_35.x = u_xlat16_13.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_13.x);
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_13.x = u_xlat16_35.x * u_xlat16_13.x;
    u_xlat16_13.x = max(u_xlat16_14.x, u_xlat16_13.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_13.x;
    u_xlat16_13.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyw = u_xlat16_14.xyz * u_xlat16_12.xyw + (-u_xlat22.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyw + u_xlat22.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat22.xxx + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_77 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat22.x = (-u_xlat68) * u_xlat16_77 + u_xlat68;
    u_xlat22.x = u_xlat68 * u_xlat22.x + u_xlat16_77;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat68;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_34.xyz = u_xlat3.xyz * u_xlat16_12.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat16_34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat2.x) * u_xlat16_77 + u_xlat2.x;
    u_xlat44 = u_xlat2.x * u_xlat44 + u_xlat16_77;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat22.y = u_xlat44 + u_xlat2.x;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat44 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat3.xyz;
    u_xlat44 = dot(u_xlat27.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_12.x) + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat25 = u_xlat16_77 + -1.0;
    u_xlat44 = u_xlat44 * u_xlat25 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_77 / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat16_12.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat44 = (-u_xlat16_12.x) * u_xlat3.x + 1.0;
    u_xlat16_35.xyz = u_xlat16_1.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_35.xyz;
    u_xlat44 = u_xlat16_35.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_13.xxx + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _DirectSpecularColor.zxy;
    u_xlat3.xyz = vec3(u_xlat68) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + _SSSColorOcc.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat27.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat27.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat27.y;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_16.y = u_xlat16_7.y;
    u_xlat22.x = dot(u_xlat16_16.xyz, u_xlat15.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat9.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat9.xyz = u_xlat22.xxx * u_xlat9.xyz + _SSSColorBack.zxy;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_17.xyz + (-u_xlat16_17.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati22 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_72 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_34.xyz), u_xlat27.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat27.xyz) * u_xlat16_12.xxx + (-u_xlat16_34.xyz);
    u_xlat68 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_7.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_77 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat2.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_13.xyz = u_xlat16_35.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_1.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_72 = floor(u_xlat16_1.w);
    u_xlat16_7.x = u_xlat16_72 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_1.x = u_xlat16_7.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_1.x = u_xlat16_72 * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_72 = u_xlat16_7.z * 15.0 + (-u_xlat16_72);
    u_xlat16_7.x = (-u_xlat16_22.x) + u_xlat16_0.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_7.x + u_xlat16_22.x;
    u_xlat16_72 = u_xlat16_73 * u_xlat16_72;
    u_xlat0.x = u_xlat68 * u_xlat16_72;
    u_xlat16_72 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_72 = u_xlat0.x * u_xlat16_7.x + u_xlat16_72;
    u_xlat16_7.x = u_xlat16_72 + u_xlat16_72;
    u_xlat16_29 = (-u_xlat16_72) * 2.0 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_29 + u_xlat16_7.x;
    u_xlat16_72 = u_xlat0.w * u_xlat16_72;
    u_xlat16_72 = min(u_xlat16_2.z, u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat3.yzx * u_xlat16_6.yzx + u_xlat16_7.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat1.x = u_xlat66 * 0.0625 + u_xlat1.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_22.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_28;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
int u_xlati22;
bool u_xlatb22;
float u_xlat23;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat44;
mediump float u_xlat16_56;
float u_xlat66;
float u_xlat68;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat26.x = dot(u_xlat27.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat27.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_OcclusionScale) * u_xlat16_7.xyz + u_xlat27.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_7.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_72 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_72) + u_xlat16_73;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _OcclusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_73 + u_xlat16_72;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_11.x = sqrt(u_xlat16_72);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_72));
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat22.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _SSSColorOcc.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_72 = _SSSIntensity * _SSSIntensity;
    u_xlat16_72 = u_xlat16_2.x * u_xlat16_72;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_56 = sqrt(u_xlat16_72);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat68 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _SSSColorBase.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _SSSColorBack.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_56) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_33.xyz = u_xlat16_17.xyz * u_xlat16_33.xyz + (-vec3(u_xlat68));
    u_xlat16_33.xyz = vec3(u_xlat16_56) * u_xlat16_33.xyz + vec3(u_xlat68);
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_3.zxy * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_3.zxy * u_xlat16_17.xyz;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_3.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_3.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.zxy;
    u_xlat3.xyz = u_xlat16_17.xyz * _AlbedoChangColor.zxy + (-u_xlat16_18.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xxx * u_xlat3.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_33.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_78);
    u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_20.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
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
    u_xlat16_78 = max(u_xlat16_20.x, u_xlat16_78);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_19.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_20.xyz = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat3.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + u_xlat3.xxx;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat22.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_13.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_13.x = max(u_xlat16_13.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_35.xyz = u_xlat3.xyz * u_xlat16_35.xxx;
    u_xlat16_14.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_14.x));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_35.xyz = u_xlat16_35.xyz * u_xlat16_14.yyy + u_xlat16_19.xyz;
    u_xlat16_36 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_35.xyz);
    u_xlat22.x = dot(u_xlat27.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_36 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_35.x);
    u_xlat16_35.x = u_xlat16_13.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_13.x);
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_13.x = u_xlat16_35.x * u_xlat16_13.x;
    u_xlat16_13.x = max(u_xlat16_14.x, u_xlat16_13.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_13.x;
    u_xlat16_13.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyw = u_xlat16_14.xyz * u_xlat16_12.xyw + (-u_xlat22.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyw + u_xlat22.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat22.xxx + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_77 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat22.x = (-u_xlat68) * u_xlat16_77 + u_xlat68;
    u_xlat22.x = u_xlat68 * u_xlat22.x + u_xlat16_77;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat68;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_34.xyz = u_xlat3.xyz * u_xlat16_12.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat16_34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat2.x) * u_xlat16_77 + u_xlat2.x;
    u_xlat44 = u_xlat2.x * u_xlat44 + u_xlat16_77;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat22.y = u_xlat44 + u_xlat2.x;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat44 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat3.xyz;
    u_xlat44 = dot(u_xlat27.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_12.x) + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat25 = u_xlat16_77 + -1.0;
    u_xlat44 = u_xlat44 * u_xlat25 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_77 / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat16_12.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat44 = (-u_xlat16_12.x) * u_xlat3.x + 1.0;
    u_xlat16_35.xyz = u_xlat16_1.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_35.xyz;
    u_xlat44 = u_xlat16_35.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_13.xxx + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _DirectSpecularColor.zxy;
    u_xlat3.xyz = vec3(u_xlat68) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = (-_SSSColorOcc.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + _SSSColorOcc.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat27.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat27.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat27.y;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_16.y = u_xlat16_7.y;
    u_xlat22.x = dot(u_xlat16_16.xyz, u_xlat15.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat9.xyz = _SSSColorBase.zxy + (-_SSSColorBack.zxy);
    u_xlat9.xyz = u_xlat22.xxx * u_xlat9.xyz + _SSSColorBack.zxy;
    u_xlat9.xyz = u_xlat16_14.xyz * u_xlat9.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_17.xyz + (-u_xlat16_17.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati22 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_72 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_34.xyz), u_xlat27.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat27.xyz) * u_xlat16_12.xxx + (-u_xlat16_34.xyz);
    u_xlat68 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_7.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_77 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat2.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_13.xyz = u_xlat16_35.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_1.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_72 = floor(u_xlat16_1.w);
    u_xlat16_7.x = u_xlat16_72 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_1.x = u_xlat16_7.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_1.x = u_xlat16_72 * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_72 = u_xlat16_7.z * 15.0 + (-u_xlat16_72);
    u_xlat16_7.x = (-u_xlat16_22.x) + u_xlat16_0.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_7.x + u_xlat16_22.x;
    u_xlat16_72 = u_xlat16_73 * u_xlat16_72;
    u_xlat0.x = u_xlat68 * u_xlat16_72;
    u_xlat16_72 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_72 = u_xlat0.x * u_xlat16_7.x + u_xlat16_72;
    u_xlat16_7.x = u_xlat16_72 + u_xlat16_72;
    u_xlat16_29 = (-u_xlat16_72) * 2.0 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_29 + u_xlat16_7.x;
    u_xlat16_72 = u_xlat0.w * u_xlat16_72;
    u_xlat16_72 = min(u_xlat16_2.z, u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat3.yzx * u_xlat16_6.yzx + u_xlat16_7.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
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
    u_xlat66 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat1.x = u_xlat66 * 0.0625 + u_xlat1.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_22.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_28;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
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
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
ivec3 u_xlati18;
vec3 u_xlat19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat25;
mediump vec2 u_xlat16_25;
bool u_xlatb25;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_41;
mediump vec2 u_xlat16_42;
float u_xlat44;
float u_xlat52;
int u_xlati52;
float u_xlat57;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
float u_xlat62;
int u_xlati62;
float u_xlat63;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat74;
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
    u_xlat16_20 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_39.x = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_39.xxx;
    u_xlat16_39.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_39.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_39.x);
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_39.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_39.yyy + u_xlat16_3.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_20 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20 = float(1.0) / float(u_xlat16_20);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_20 = u_xlat16_58 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_39.x, u_xlat16_20);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_0.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.xyz = vec3(_ChangColorAmount) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_58 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_58) + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat19.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat19.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-u_xlat5.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_3.xyz = vec3(_OcclusionScale) * u_xlat16_2.xyz + u_xlat19.xyz;
    u_xlat16_58 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_3.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat16_58 = dot(u_xlat16_3.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_58 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_58) + u_xlat16_60;
    u_xlat16_4.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_4.x + 1.0;
    u_xlat16_58 = u_xlat16_2.w * u_xlat16_60 + u_xlat16_58;
    u_xlat16_58 = u_xlat16_2.w * u_xlat16_58;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_60;
    u_xlat16_4.x = sqrt(u_xlat16_58);
    u_xlat6.x = min(u_xlat16_58, 1.0);
    u_xlat16_25.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat16_23.xy = u_xlat16_4.xx * u_xlat25.xy;
    u_xlat16_8.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_58 = _SSSIntensity * _SSSIntensity;
    u_xlat16_58 = u_xlat16_63 * u_xlat16_58;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_61 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_65 = sqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_65) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = (-u_xlat16_8.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_23.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_65) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = vec3(u_xlat16_65) * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat16_13.xyz = vec3(u_xlat62) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_10.xyz + (-vec3(u_xlat62));
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz + vec3(u_xlat62);
    u_xlat16_14.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.xyz;
    u_xlat14.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_15.xyz);
    u_xlat14.xyz = vec3(_ChangColorAmount) * u_xlat14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat25.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat62) * u_xlat16_1.xyz;
    u_xlat62 = dot(u_xlat19.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = vec3(u_xlat62) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + (-vec3(u_xlat62));
    u_xlat16_4.xyz = vec3(u_xlat16_65) * u_xlat16_4.xyz + vec3(u_xlat62);
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_4.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_23.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_42.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xyz = u_xlat16_42.xxx * u_xlat14.xyz;
    u_xlat16_42.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.00100000005>=abs(u_xlat16_42.x));
#else
    u_xlatb25 = 0.00100000005>=abs(u_xlat16_42.x);
#endif
    u_xlat16_42.xy = (bool(u_xlatb25)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_42.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_42.yyy + u_xlat16_16.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat25.x = dot(u_xlat19.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_23.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_23.x = u_xlat16_61 * u_xlat16_23.x;
    u_xlat16_23.x = max(u_xlat16_42.x, u_xlat16_23.x);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_23.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_9.xyz = u_xlat25.xxx * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + (-u_xlat25.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_65) * u_xlat16_9.xyz + u_xlat25.xxx;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat25.yyy * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat25.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat25.x = (-u_xlat62) * u_xlat16_4.x + u_xlat62;
    u_xlat25.x = u_xlat62 * u_xlat25.x + u_xlat16_4.x;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat62 + u_xlat25.x;
    u_xlat7.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_23.x = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_9.xyz = u_xlat16_23.xxx * u_xlat7.xyw;
    u_xlat7.xyw = u_xlat7.xyw * u_xlat16_23.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.x = dot(u_xlat19.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat14.x) * u_xlat16_4.x + u_xlat14.x;
    u_xlat44 = u_xlat14.x * u_xlat44 + u_xlat16_4.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat25.y = u_xlat44 + u_xlat14.x;
    u_xlat25.xy = u_xlat25.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.x * u_xlat25.y;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat44 = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat7.xyw = vec3(u_xlat44) * u_xlat7.xyw;
    u_xlat44 = dot(u_xlat19.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_23.x) + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat7.x = u_xlat16_4.x + -1.0;
    u_xlat44 = u_xlat44 * u_xlat7.x + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat7.x = u_xlat16_4.x / u_xlat44;
    u_xlat52 = u_xlat7.x * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat52 = u_xlat25.x * u_xlat52;
    u_xlat16_23.x = u_xlat63 * u_xlat63;
    u_xlat16_23.x = u_xlat63 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat63 * u_xlat16_23.x;
    u_xlat16_42.x = u_xlat63 * u_xlat16_23.x;
    u_xlat17.x = (-u_xlat16_23.x) * u_xlat63 + 1.0;
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = u_xlat16_10.xyz * u_xlat17.xxx;
    u_xlat74 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat74) * u_xlat16_42.xxx + u_xlat17.xyz;
    u_xlat17.xyz = vec3(u_xlat52) * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.xyz;
    u_xlat17.xyz = vec3(u_xlat62) * u_xlat17.xyz;
    u_xlat16_1.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_23.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_2.www * u_xlat16_23.xyz + _SSSColorOcc.xyz;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat19.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat19.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat11.y = u_xlat19.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_3.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_3.xz);
    u_xlat16_12.y = u_xlat16_3.y;
    u_xlat62 = dot(u_xlat16_12.xyz, u_xlat11.xyz);
    u_xlat62 = max(u_xlat62, 0.0);
    u_xlat18.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat18.xyz = vec3(u_xlat62) * u_xlat18.xyz + _SSSColorBack.xyz;
    u_xlat18.xyz = u_xlat16_23.xyz * u_xlat18.xyz;
    u_xlat16_23.xyz = u_xlat18.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_23.xyz = vec3(u_xlat16_58) * u_xlat16_23.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_23.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat62 = min(u_xlat6.x, u_xlat16_7.z);
    u_xlat16_13.xyz = vec3(u_xlat62) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat62) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_23.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat62) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat62) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat62) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_23.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat62) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_15.xyz;
    u_xlati62 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati62].xyz;
    u_xlati62 = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati52 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati62].xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_12.xyw;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_58 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_23.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_23.x = dot((-u_xlat16_9.xyz), u_xlat19.xyz);
    u_xlat16_23.x = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat18.xyz = (-u_xlat19.xyz) * u_xlat16_23.xxx + (-u_xlat16_9.xyz);
    u_xlat19.x = dot(u_xlat16_3.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_3.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_8.w);
    u_xlat16_22.x = u_xlat16_3.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_8.x = u_xlat16_22.x * 16.0 + u_xlat16_8.z;
    u_xlat16_23.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_23.xy).x;
    u_xlat16_8.x = u_xlat16_3.x * 16.0 + u_xlat16_8.z;
    u_xlat16_23.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_23.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_57) + u_xlat16_38;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_57;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat6.x * 0.5;
    u_xlat16_22.x = (-u_xlat6.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat19.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat6.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_4.xxx * u_xlat0.xyz + u_xlat18.xyz;
    u_xlat16_22.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat14.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = vec3(u_xlat16_58) * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_3.xyz;
    u_xlat16_58 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_14.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_14.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_22.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_22.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_3.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump float _OcclusionScale;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ShadowStrengthMap;
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
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec3 u_xlat18;
ivec3 u_xlati18;
vec3 u_xlat19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat25;
mediump vec2 u_xlat16_25;
bool u_xlatb25;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
mediump float u_xlat16_41;
mediump vec2 u_xlat16_42;
float u_xlat44;
float u_xlat52;
int u_xlati52;
float u_xlat57;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
float u_xlat62;
int u_xlati62;
float u_xlat63;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
float u_xlat74;
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
    u_xlat16_20 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_20 = max(u_xlat16_20, 6.10351563e-05);
    u_xlat16_39.x = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_39.xxx;
    u_xlat16_39.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_39.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_39.x);
#endif
    u_xlat16_39.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_39.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_39.yyy + u_xlat16_3.xyz;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_58);
    u_xlat16_58 = u_xlat16_20 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_20 = float(1.0) / float(u_xlat16_20);
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_20 = u_xlat16_58 * u_xlat16_20;
    u_xlat16_20 = max(u_xlat16_39.x, u_xlat16_20);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_20;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_0.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat0.xyz = vec3(_ChangColorAmount) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_58 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_58) + vs_TEXCOORD2.yzx;
    u_xlat57 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat57 = max(u_xlat57, 1.17549435e-38);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat16_3.xyz;
    u_xlat7.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat7.x;
    u_xlat5.x = u_xlat6.z;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat7.x = u_xlat6.y;
    u_xlat6.y = u_xlat7.z;
    u_xlat6.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat19.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat19.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-u_xlat5.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_3.xyz = vec3(_OcclusionScale) * u_xlat16_2.xyz + u_xlat19.xyz;
    u_xlat16_58 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_58 = inversesqrt(u_xlat16_58);
    u_xlat16_3.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat16_58 = dot(u_xlat16_3.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_58 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_58) + u_xlat16_60;
    u_xlat16_4.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _OcclusionScale * u_xlat16_4.x + 1.0;
    u_xlat16_58 = u_xlat16_2.w * u_xlat16_60 + u_xlat16_58;
    u_xlat16_58 = u_xlat16_2.w * u_xlat16_58;
    u_xlat16_60 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 + -1.0;
    u_xlat16_60 = _OcclusionScale * u_xlat16_60 + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_60;
    u_xlat16_4.x = sqrt(u_xlat16_58);
    u_xlat6.x = min(u_xlat16_58, 1.0);
    u_xlat16_25.xy = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat25.xy = u_xlat16_25.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.xy = min(max(u_xlat25.xy, 0.0), 1.0);
#else
    u_xlat25.xy = clamp(u_xlat25.xy, 0.0, 1.0);
#endif
    u_xlat16_23.xy = u_xlat16_4.xx * u_xlat25.xy;
    u_xlat16_8.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_63 = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_58 = _SSSIntensity * _SSSIntensity;
    u_xlat16_58 = u_xlat16_63 * u_xlat16_58;
    u_xlat16_7.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_61 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_58 = u_xlat16_58 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_65 = sqrt(u_xlat16_58);
    u_xlat16_8.xyz = vec3(u_xlat16_65) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = (-u_xlat16_8.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_23.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_23.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_65) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = vec3(u_xlat16_65) * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat16_13.xyz = vec3(u_xlat62) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_10.xyz + (-vec3(u_xlat62));
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz + vec3(u_xlat62);
    u_xlat16_14.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _AlbedoColor.xyz;
    u_xlat14.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_15.xyz);
    u_xlat14.xyz = vec3(_ChangColorAmount) * u_xlat14.xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_1.xyz = u_xlat25.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat62) * u_xlat16_1.xyz;
    u_xlat62 = dot(u_xlat19.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = vec3(u_xlat62) * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + (-vec3(u_xlat62));
    u_xlat16_4.xyz = vec3(u_xlat16_65) * u_xlat16_4.xyz + vec3(u_xlat62);
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb25 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_4.x = (u_xlatb25) ? 1.0 : 0.0;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_23.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_23.x = max(u_xlat16_23.x, 6.10351563e-05);
    u_xlat16_42.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xyz = u_xlat16_42.xxx * u_xlat14.xyz;
    u_xlat16_42.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.00100000005>=abs(u_xlat16_42.x));
#else
    u_xlatb25 = 0.00100000005>=abs(u_xlat16_42.x);
#endif
    u_xlat16_42.xy = (bool(u_xlatb25)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_42.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_42.yyy + u_xlat16_16.xyz;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_10.xyz);
    u_xlat25.x = dot(u_xlat19.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_4.x = max(u_xlat16_4.x, u_xlat16_61);
    u_xlat16_61 = u_xlat16_23.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_23.x = float(1.0) / float(u_xlat16_23.x);
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_23.x = u_xlat16_61 * u_xlat16_23.x;
    u_xlat16_23.x = max(u_xlat16_42.x, u_xlat16_23.x);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_23.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_9.xyz = u_xlat25.xxx * u_xlat16_12.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_11.xyz + (-u_xlat25.xxx);
    u_xlat16_9.xyz = vec3(u_xlat16_65) * u_xlat16_9.xyz + u_xlat25.xxx;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat25.yyy * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat25.xxx + u_xlat16_1.xyz;
    u_xlat16_2.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat25.x = (-u_xlat62) * u_xlat16_4.x + u_xlat62;
    u_xlat25.x = u_xlat62 * u_xlat25.x + u_xlat16_4.x;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat62 + u_xlat25.x;
    u_xlat7.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_23.x = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_9.xyz = u_xlat16_23.xxx * u_xlat7.xyw;
    u_xlat7.xyw = u_xlat7.xyw * u_xlat16_23.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat14.x = dot(u_xlat19.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat14.x) * u_xlat16_4.x + u_xlat14.x;
    u_xlat44 = u_xlat14.x * u_xlat44 + u_xlat16_4.x;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat25.y = u_xlat44 + u_xlat14.x;
    u_xlat25.xy = u_xlat25.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat25.x = u_xlat25.x * u_xlat25.y;
    u_xlat25.x = float(1.0) / u_xlat25.x;
    u_xlat25.x = min(u_xlat25.x, 16.0);
    u_xlat44 = dot(u_xlat7.xyw, u_xlat7.xyw);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat7.xyw = vec3(u_xlat44) * u_xlat7.xyw;
    u_xlat44 = dot(u_xlat19.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_23.x) + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat7.x = u_xlat16_4.x + -1.0;
    u_xlat44 = u_xlat44 * u_xlat7.x + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat7.x = u_xlat16_4.x / u_xlat44;
    u_xlat52 = u_xlat7.x * 0.318309873;
    u_xlat52 = min(u_xlat52, 16.0);
    u_xlat52 = u_xlat25.x * u_xlat52;
    u_xlat16_23.x = u_xlat63 * u_xlat63;
    u_xlat16_23.x = u_xlat63 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat63 * u_xlat16_23.x;
    u_xlat16_42.x = u_xlat63 * u_xlat16_23.x;
    u_xlat17.x = (-u_xlat16_23.x) * u_xlat63 + 1.0;
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = u_xlat16_10.xyz * u_xlat17.xxx;
    u_xlat74 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat74) * u_xlat16_42.xxx + u_xlat17.xyz;
    u_xlat17.xyz = vec3(u_xlat52) * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat17.xyz * _DirectSpecularColor.xyz;
    u_xlat17.xyz = vec3(u_xlat62) * u_xlat17.xyz;
    u_xlat16_1.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_23.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_2.www * u_xlat16_23.xyz + _SSSColorOcc.xyz;
    u_xlat16_11.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat19.xz);
    u_xlat16_11.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat19.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat11.y = u_xlat19.y;
    u_xlat16_12.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_3.xz);
    u_xlat16_12.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_3.xz);
    u_xlat16_12.y = u_xlat16_3.y;
    u_xlat62 = dot(u_xlat16_12.xyz, u_xlat11.xyz);
    u_xlat62 = max(u_xlat62, 0.0);
    u_xlat18.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat18.xyz = vec3(u_xlat62) * u_xlat18.xyz + _SSSColorBack.xyz;
    u_xlat18.xyz = u_xlat16_23.xyz * u_xlat18.xyz;
    u_xlat16_23.xyz = u_xlat18.xyz * u_xlat16_13.xyz + (-u_xlat16_13.xyz);
    u_xlat16_23.xyz = vec3(u_xlat16_58) * u_xlat16_23.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_23.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat62 = min(u_xlat6.x, u_xlat16_7.z);
    u_xlat16_13.xyz = vec3(u_xlat62) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat62) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_23.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat62) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat62) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat62) + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_23.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(u_xlat62) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_12.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_12.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_15.xyz;
    u_xlati62 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_12.yyy * _IrradianceACCoeffs[u_xlati62].xyz;
    u_xlati62 = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati52 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_12.xyw = u_xlat16_12.xxx * _IrradianceACCoeffs[u_xlati62].xyz + u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_12.xyw;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_58 = dot(u_xlat16_12.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_23.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_23.x = dot((-u_xlat16_9.xyz), u_xlat19.xyz);
    u_xlat16_23.x = u_xlat16_23.x + u_xlat16_23.x;
    u_xlat18.xyz = (-u_xlat19.xyz) * u_xlat16_23.xxx + (-u_xlat16_9.xyz);
    u_xlat19.x = dot(u_xlat16_3.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_3.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_8.w);
    u_xlat16_22.x = u_xlat16_3.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_8.x = u_xlat16_22.x * 16.0 + u_xlat16_8.z;
    u_xlat16_23.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(0.00390625, 0.0625);
    u_xlat16_38 = texture(_SpecularOcclusionLut3D, u_xlat16_23.xy).x;
    u_xlat16_8.x = u_xlat16_3.x * 16.0 + u_xlat16_8.z;
    u_xlat16_23.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(0.00390625, 0.0625);
    u_xlat16_57 = texture(_SpecularOcclusionLut3D, u_xlat16_23.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_57) + u_xlat16_38;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_57;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat19.x = u_xlat19.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat6.x * 0.5;
    u_xlat16_22.x = (-u_xlat6.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat19.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat6.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xxx + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_4.xxx * u_xlat0.xyz + u_xlat18.xyz;
    u_xlat16_22.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat14.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_4.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_22.x);
    u_xlat16_22.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_22.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_22.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyz = vec3(u_xlat16_58) * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyz : u_xlat16_22.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat17.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_3.xyz;
    u_xlat16_58 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_14.w * _AlbedoColor.w + u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_14.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_22.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_22.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_22.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_22.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_58 : u_xlat16_3.x;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
int u_xlati22;
bool u_xlatb22;
float u_xlat23;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat44;
mediump float u_xlat16_56;
float u_xlat68;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat26.x = dot(u_xlat27.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat27.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_OcclusionScale) * u_xlat16_7.xyz + u_xlat27.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_7.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_72 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_72) + u_xlat16_73;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _OcclusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_73 + u_xlat16_72;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_11.x = sqrt(u_xlat16_72);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_72));
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat22.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_72 = _SSSIntensity * _SSSIntensity;
    u_xlat16_72 = u_xlat16_2.x * u_xlat16_72;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_56 = sqrt(u_xlat16_72);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat68 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_56) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_33.xyz = u_xlat16_17.xyz * u_xlat16_33.xyz + (-vec3(u_xlat68));
    u_xlat16_33.xyz = vec3(u_xlat16_56) * u_xlat16_33.xyz + vec3(u_xlat68);
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.xyz;
    u_xlat3.xyz = u_xlat16_17.xyz * _AlbedoChangColor.xyz + (-u_xlat16_18.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xxx * u_xlat3.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_33.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_78);
    u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_20.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
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
    u_xlat16_78 = max(u_xlat16_20.x, u_xlat16_78);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_19.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_20.xyz = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat3.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + u_xlat3.xxx;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat22.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_13.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_13.x = max(u_xlat16_13.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_35.xyz = u_xlat3.xyz * u_xlat16_35.xxx;
    u_xlat16_14.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_14.x));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_35.xyz = u_xlat16_35.xyz * u_xlat16_14.yyy + u_xlat16_19.xyz;
    u_xlat16_36 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_35.xyz);
    u_xlat22.x = dot(u_xlat27.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_36 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_35.x);
    u_xlat16_35.x = u_xlat16_13.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_13.x);
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_13.x = u_xlat16_35.x * u_xlat16_13.x;
    u_xlat16_13.x = max(u_xlat16_14.x, u_xlat16_13.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_13.x;
    u_xlat16_13.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyw = u_xlat16_14.xyz * u_xlat16_12.xyw + (-u_xlat22.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyw + u_xlat22.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat22.xxx + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_77 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat22.x = (-u_xlat68) * u_xlat16_77 + u_xlat68;
    u_xlat22.x = u_xlat68 * u_xlat22.x + u_xlat16_77;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat68;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_34.xyz = u_xlat3.xyz * u_xlat16_12.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat16_34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat2.x) * u_xlat16_77 + u_xlat2.x;
    u_xlat44 = u_xlat2.x * u_xlat44 + u_xlat16_77;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat22.y = u_xlat44 + u_xlat2.x;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat44 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat3.xyz;
    u_xlat44 = dot(u_xlat27.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_12.x) + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat25 = u_xlat16_77 + -1.0;
    u_xlat44 = u_xlat44 * u_xlat25 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_77 / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat16_12.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat44 = (-u_xlat16_12.x) * u_xlat3.x + 1.0;
    u_xlat16_35.xyz = u_xlat16_1.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_35.xyz;
    u_xlat44 = u_xlat16_35.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_13.xxx + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _DirectSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat68) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + _SSSColorOcc.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat27.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat27.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat27.y;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_16.y = u_xlat16_7.y;
    u_xlat22.x = dot(u_xlat16_16.xyz, u_xlat15.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat4.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat4.xyz = u_xlat22.xxx * u_xlat4.xyz + _SSSColorBack.xyz;
    u_xlat4.xyz = u_xlat16_14.xyz * u_xlat4.xyz;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_17.xyz + (-u_xlat16_17.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati22 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_72 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_34.xyz), u_xlat27.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat27.xyz) * u_xlat16_12.xxx + (-u_xlat16_34.xyz);
    u_xlat68 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_7.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_77 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat2.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_13.xyz = u_xlat16_35.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_1.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_72 = floor(u_xlat16_1.w);
    u_xlat16_7.x = u_xlat16_72 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_1.x = u_xlat16_7.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_1.x = u_xlat16_72 * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_72 = u_xlat16_7.z * 15.0 + (-u_xlat16_72);
    u_xlat16_7.x = (-u_xlat16_22.x) + u_xlat16_0.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_7.x + u_xlat16_22.x;
    u_xlat16_72 = u_xlat16_73 * u_xlat16_72;
    u_xlat0.x = u_xlat68 * u_xlat16_72;
    u_xlat16_72 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_72 = u_xlat0.x * u_xlat16_7.x + u_xlat16_72;
    u_xlat16_7.x = u_xlat16_72 + u_xlat16_72;
    u_xlat16_29 = (-u_xlat16_72) * 2.0 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_29 + u_xlat16_7.x;
    u_xlat16_72 = u_xlat0.w * u_xlat16_72;
    u_xlat16_72 = min(u_xlat16_2.z, u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_28;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	float _ChangColorAmount;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _SSSColorBase;
uniform 	mediump vec4 _SSSColorBack;
uniform 	mediump vec4 _SSSColorOcc;
uniform 	mediump float _SSSIntensity;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _NormalChangMap;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec3 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec2 u_xlat22;
mediump vec3 u_xlat16_22;
int u_xlati22;
bool u_xlatb22;
float u_xlat23;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat44;
mediump float u_xlat16_56;
float u_xlat68;
float u_xlat71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
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
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat5.xxx;
    u_xlat16_5.xyz = texture(_NormalChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat5.xyz = vec3(_ChangColorAmount) * u_xlat5.xyz + u_xlat16_7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat16_6.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat8.x = dot(u_xlat5.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat5.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat5.xyz, u_xlat10.xyz);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat5.xxx * u_xlat8.xyz;
    u_xlat26.x = dot(u_xlat27.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat27.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
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
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat22.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat22.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_22.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_22.z * _ShadowStrength;
    u_xlat22.xy = u_xlat16_22.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat22.xy = min(max(u_xlat22.xy, 0.0), 1.0);
#else
    u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_7.xyz = (-u_xlat8.xyz) * u_xlat5.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_7.xyz = vec3(_OcclusionScale) * u_xlat16_7.xyz + u_xlat27.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_7.xyz;
    u_xlat16_72 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_72 * 0.5 + 0.5;
    u_xlat16_73 = (-u_xlat16_72) + u_xlat16_73;
    u_xlat16_11.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _OcclusionScale * u_xlat16_11.x + 1.0;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_73 + u_xlat16_72;
    u_xlat16_72 = u_xlat16_1.w * u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 + -1.0;
    u_xlat16_73 = _OcclusionScale * u_xlat16_73 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_11.x = sqrt(u_xlat16_72);
    u_xlat0.xw = min(u_xlat0.xw, vec2(u_xlat16_72));
    u_xlat16_33.xyz = u_xlat16_6.xyz * u_xlat16_11.xxx;
    u_xlat16_12.xy = u_xlat22.xy * u_xlat16_11.xx;
    u_xlat16_13.xyz = _SSSColorOcc.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.x = texture(_SkinMap, vs_TEXCOORD3.xy).x;
    u_xlat16_72 = _SSSIntensity * _SSSIntensity;
    u_xlat16_72 = u_xlat16_2.x * u_xlat16_72;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.x = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_56 = sqrt(u_xlat16_72);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_33.xyz = u_xlat16_33.xyz * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat68 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = _SSSColorBase.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = _SSSColorBack.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_56) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz + (-u_xlat16_16.xyz);
    u_xlat16_17.xyz = vec3(u_xlat68) * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_33.xyz = u_xlat16_17.xyz * u_xlat16_33.xyz + (-vec3(u_xlat68));
    u_xlat16_33.xyz = vec3(u_xlat16_56) * u_xlat16_33.xyz + vec3(u_xlat68);
    u_xlat16_3.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_3 = texture(_AlbedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _AlbedoColor.xyz;
    u_xlat3.xyz = u_xlat16_17.xyz * _AlbedoChangColor.xyz + (-u_xlat16_18.xyz);
    u_xlat3.xyz = vec3(_ChangColorAmount) * u_xlat3.xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_11.xxx * u_xlat3.xyz;
    u_xlat16_18.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = u_xlat16_33.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_79 = inversesqrt(u_xlat16_78);
    u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat16_79);
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat16_20.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_21.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_21.xyz;
    u_xlat16_79 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
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
    u_xlat16_78 = max(u_xlat16_20.x, u_xlat16_78);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_78;
    u_xlat16_19.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_20.xyz = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_21.xyz = u_xlat16_12.xxx * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_12.xyw = u_xlat16_12.yyy * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_20.xyz * u_xlat16_21.xyz + (-u_xlat3.xxx);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz + u_xlat3.xxx;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz;
    u_xlat16_13.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat22.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat3.xxx * u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb22 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_13.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_13.x = max(u_xlat16_13.x, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_35.xyz = u_xlat3.xyz * u_xlat16_35.xxx;
    u_xlat16_14.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.00100000005>=abs(u_xlat16_14.x));
#else
    u_xlatb22 = 0.00100000005>=abs(u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_19.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_35.xyz = u_xlat16_35.xyz * u_xlat16_14.yyy + u_xlat16_19.xyz;
    u_xlat16_36 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_35.xyz);
    u_xlat22.x = dot(u_xlat27.xyz, u_xlat16_35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_36 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_35.x = min(max(u_xlat16_35.x, 0.0), 1.0);
#else
    u_xlat16_35.x = clamp(u_xlat16_35.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_77 = max(u_xlat16_77, u_xlat16_35.x);
    u_xlat16_35.x = u_xlat16_13.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_13.x = float(1.0) / float(u_xlat16_13.x);
    u_xlat16_35.x = (-u_xlat16_35.x) * u_xlat16_35.x + 1.0;
    u_xlat16_35.x = max(u_xlat16_35.x, 0.0);
    u_xlat16_35.x = u_xlat16_35.x * u_xlat16_35.x;
    u_xlat16_13.x = u_xlat16_35.x * u_xlat16_13.x;
    u_xlat16_13.x = max(u_xlat16_14.x, u_xlat16_13.x);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_13.x;
    u_xlat16_13.xyz = vec3(u_xlat16_77) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat22.xxx * u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_12.xyw = u_xlat16_14.xyz * u_xlat16_12.xyw + (-u_xlat22.xxx);
    u_xlat16_12.xyz = vec3(u_xlat16_56) * u_xlat16_12.xyw + u_xlat22.xxx;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_17.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat22.yyy * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat22.xxx + u_xlat16_11.xyz;
    u_xlat16_1.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_77 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat16_77 = u_xlat16_77 * u_xlat16_77;
    u_xlat16_77 = max(u_xlat16_77, 0.0078125);
    u_xlat22.x = (-u_xlat68) * u_xlat16_77 + u_xlat68;
    u_xlat22.x = u_xlat68 * u_xlat22.x + u_xlat16_77;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat68;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_34.xyz = u_xlat3.xyz * u_xlat16_12.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat2.x = dot(u_xlat27.xyz, u_xlat16_34.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat2.x) * u_xlat16_77 + u_xlat2.x;
    u_xlat44 = u_xlat2.x * u_xlat44 + u_xlat16_77;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat22.y = u_xlat44 + u_xlat2.x;
    u_xlat22.xy = u_xlat22.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat44 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat3.xyz;
    u_xlat44 = dot(u_xlat27.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_12.x) + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat25 = u_xlat16_77 + -1.0;
    u_xlat44 = u_xlat44 * u_xlat25 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_77 / u_xlat44;
    u_xlat22.y = u_xlat44 * 0.318309873;
    u_xlat22.xy = min(u_xlat22.xy, vec2(16.0, 16.0));
    u_xlat22.x = u_xlat22.x * u_xlat22.y;
    u_xlat16_12.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat16_13.x = u_xlat3.x * u_xlat16_12.x;
    u_xlat44 = (-u_xlat16_12.x) * u_xlat3.x + 1.0;
    u_xlat16_35.xyz = u_xlat16_1.yyy * u_xlat16_18.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_35.xyz;
    u_xlat44 = u_xlat16_35.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat44) * u_xlat16_13.xxx + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _DirectSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat68) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_11.xyz;
    u_xlat16_14.xyz = (-_SSSColorOcc.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_14.xyz + _SSSColorOcc.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat27.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat27.xz);
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat15.y = u_xlat27.y;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_7.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_7.xz);
    u_xlat16_16.y = u_xlat16_7.y;
    u_xlat22.x = dot(u_xlat16_16.xyz, u_xlat15.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat4.xyz = _SSSColorBase.xyz + (-_SSSColorBack.xyz);
    u_xlat4.xyz = u_xlat22.xxx * u_xlat4.xyz + _SSSColorBack.xyz;
    u_xlat4.xyz = u_xlat16_14.xyz * u_xlat4.xyz;
    u_xlat16_14.xyz = u_xlat4.xyz * u_xlat16_17.xyz + (-u_xlat16_17.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_14.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_14.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_73) * u_xlat16_18.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati0.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati22 = (u_xlati0.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_16.xyw;
    u_xlat16_18.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_72 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_12.x = dot((-u_xlat16_34.xyz), u_xlat27.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat27.xyz) * u_xlat16_12.xxx + (-u_xlat16_34.xyz);
    u_xlat68 = dot(u_xlat16_7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_7.xyz, u_xlat0.xyz);
    u_xlat16_7.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat8.xyz * u_xlat5.xxx + (-u_xlat0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_77) * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_77 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat2.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_13.xyz = u_xlat16_35.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_77);
    u_xlat16_14.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_1.yzw = u_xlat16_7.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_72 = floor(u_xlat16_1.w);
    u_xlat16_7.x = u_xlat16_72 + 1.0;
    u_xlat16_7.x = min(u_xlat16_7.x, 15.0);
    u_xlat16_1.x = u_xlat16_7.x * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_1.x = u_xlat16_72 * 16.0 + u_xlat16_1.z;
    u_xlat16_7.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_72 = u_xlat16_7.z * 15.0 + (-u_xlat16_72);
    u_xlat16_7.x = (-u_xlat16_22.x) + u_xlat16_0.x;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_7.x + u_xlat16_22.x;
    u_xlat16_72 = u_xlat16_73 * u_xlat16_72;
    u_xlat0.x = u_xlat68 * u_xlat16_72;
    u_xlat16_72 = u_xlat0.w * 0.5;
    u_xlat16_7.x = (-u_xlat0.w) * 0.5 + 1.0;
    u_xlat16_72 = u_xlat0.x * u_xlat16_7.x + u_xlat16_72;
    u_xlat16_7.x = u_xlat16_72 + u_xlat16_72;
    u_xlat16_29 = (-u_xlat16_72) * 2.0 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_29 + u_xlat16_7.x;
    u_xlat16_72 = u_xlat0.w * u_xlat16_72;
    u_xlat16_72 = min(u_xlat16_2.z, u_xlat16_72);
    u_xlat16_7.xyz = vec3(u_xlat16_72) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat3.xyz * u_xlat16_6.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_28 = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_28;
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
  GpuProgramID 76802
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Skin_ChangeColorGUI"
}