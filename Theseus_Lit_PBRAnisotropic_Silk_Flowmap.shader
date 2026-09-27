//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_Silk_Flowmap" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_DirectionTex ("DirectionTex 分辨率512以下，RG：Flowmap B：丝绸区域Mask A：丝绸高光强度", 2D) = "black" { }

_SilkAnisotropyTex ("R:丝绸各向异性程度", 2D) = "White" { }

_SilkRoughness ("丝绸粗糙度", Range(0, 1)) = 0.44999998807907104

_Angle ("丝绸高光角度", Range(-180, 180)) = 0.0

_directSpecularColor ("丝绸高光颜色", Color) = (1,1,1,1)

_directSepcularColorNonSilk ("非丝绸高光颜色", Color) = (1,1,1,1)

_sunShiftOffset ("丝绸高光偏移", Float) = 1.0

_anisotropicMultiplier ("丝绸高光各向异性程度", Range(-1, 1)) = 0.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

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
  GpuProgramID 44267
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SilkAnisotropyTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
bvec2 u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
int u_xlati29;
vec3 u_xlat33;
float u_xlat35;
mediump vec3 u_xlat16_38;
vec3 u_xlat40;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_50;
float u_xlat56;
vec2 u_xlat57;
mediump vec2 u_xlat16_57;
float u_xlat66;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_72;
bool u_xlatb73;
mediump float u_xlat16_74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
mediump float u_xlat16_81;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_1.x = dot(vs_TEXCOORD2.yzx, u_xlat16_3.xyz);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat22.x = max(u_xlat22.x, 1.17549435e-38);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat22.yzx * u_xlat16_3.zxy;
    u_xlat5.xyz = u_xlat16_3.yzx * u_xlat22.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = _Angle * 0.0174532942;
    u_xlat16_4.x = sin((-u_xlat16_1.x));
    u_xlat16_6.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_7 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_7.yx + u_xlat16_7.yx;
    u_xlat16_8.zw = u_xlat16_8.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_8.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_4.y = u_xlat16_6.x;
    u_xlat16_4.z = u_xlat16_1.x;
    u_xlat71 = dot(u_xlat16_4.yz, u_xlat16_8.zw);
    u_xlat7.x = dot(u_xlat16_4.xy, u_xlat16_28.xy);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat22.xyz = vec3(u_xlat71) * u_xlat22.xyz + u_xlat5.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = u_xlat16_4.xyz * vec3(u_xlat71);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat10.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat5.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat7.x = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat22.xyz = (-u_xlat9.yzx) * u_xlat7.xxx + u_xlat22.xyz;
    u_xlat7.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat7.xxx;
    u_xlat10.xyz = u_xlat22.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat22.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat16_1.x = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_0.x = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_0.x * _anisotropicMultiplier;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_7.zzzz).xy;
    u_xlat16_4.xyz = u_xlat16_7.www * _directSpecularColor.zxy;
    u_xlat16_4.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : _directSepcularColorNonSilk.zxy;
    u_xlat16_1.x = (u_xlatb7.y) ? u_xlat16_1.x : 0.0;
    u_xlat29.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat10.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat29.xyz = u_xlat0.xxx * u_xlat29.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat16_23.xyz);
    u_xlat16_1.x = (u_xlatb7.x) ? u_xlat16_68 : 0.0;
    u_xlat75 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_68 = (u_xlatb7.x) ? _SilkRoughness : u_xlat16_6.x;
    u_xlat16_70 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat7.x = u_xlat75 * u_xlat16_70;
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat11.z = u_xlat0.x * u_xlat7.x;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_23.xyz);
    u_xlat0.x = u_xlat16_1.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat11.y = u_xlat16_6.x * u_xlat0.x;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat11.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat33.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_6.x = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_8.xyz = u_xlat16_6.xxx * u_xlat33.xyz;
    u_xlat76 = dot(u_xlat29.xyz, u_xlat16_8.xyz);
    u_xlat12.z = u_xlat7.x * u_xlat76;
    u_xlat76 = dot(u_xlat22.zxy, u_xlat16_8.xyz);
    u_xlat12.y = u_xlat0.x * u_xlat76;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat12.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat13.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_23.xyz;
    u_xlat56 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat56 = dot(u_xlat29.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat56;
    u_xlat16_50 = dot(u_xlat22.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat16_50 * u_xlat7.x;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(u_xlat16_23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_23.x) + 1.0;
    u_xlat13.x = u_xlat7.x * u_xlat0.x;
    u_xlat14.z = u_xlat56 * u_xlat13.x;
    u_xlat56 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat13.x / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat35 = u_xlat13.x * 0.318309873;
    u_xlat56 = u_xlat56 * u_xlat35;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat75 = u_xlat75 * u_xlat56;
    u_xlat16_23.x = u_xlat78 * u_xlat78;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_45 = u_xlat78 * u_xlat16_23.x;
    u_xlat56 = (-u_xlat16_23.x) * u_xlat78 + 1.0;
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_28.xyz = u_xlat16_6.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat16_28.xyz * vec3(u_xlat56);
    u_xlat56 = u_xlat16_28.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat56) * vec3(u_xlat16_45) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat16_4.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat11.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_57.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat57.xy = u_xlat16_57.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xy = min(max(u_xlat57.xy, 0.0), 1.0);
#else
    u_xlat57.xy = clamp(u_xlat57.xy, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat57.xxx * u_xlat14.xyz;
    u_xlat18.xyz = u_xlat33.xyz * u_xlat16_6.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat75) * u_xlat18.xyz;
    u_xlat75 = dot(u_xlat29.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat0.x * u_xlat75;
    u_xlat16_23.x = dot(u_xlat22.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_23.x * u_xlat7.x;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_23.x) + 1.0;
    u_xlat19.z = u_xlat75 * u_xlat13.x;
    u_xlat75 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat13.x / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat35 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat18.x = dot(u_xlat29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat7.x * u_xlat18.x;
    u_xlat16_23.x = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat0.x * u_xlat16_23.x;
    u_xlat18.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat40.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat40.x = sqrt(u_xlat40.x);
    u_xlat40.x = u_xlat40.x + u_xlat18.x;
    u_xlat40.x = u_xlat40.x + 6.10351563e-05;
    u_xlat40.x = u_xlat76 * u_xlat40.x + 6.10351563e-05;
    u_xlat40.x = float(1.0) / u_xlat40.x;
    u_xlat75 = u_xlat75 * u_xlat40.x;
    u_xlat16_23.x = u_xlat78 * u_xlat78;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_45 = u_xlat78 * u_xlat16_23.x;
    u_xlat78 = (-u_xlat16_23.x) * u_xlat78 + 1.0;
    u_xlat40.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat40.xyz = vec3(u_xlat56) * vec3(u_xlat16_45) + u_xlat40.xyz;
    u_xlat40.xyz = vec3(u_xlat75) * u_xlat40.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat40.xyz = min(max(u_xlat40.xyz, 0.0), 1.0);
#else
    u_xlat40.xyz = clamp(u_xlat40.xyz, 0.0, 1.0);
#endif
    u_xlat40.xyz = u_xlat16_4.xyz * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat18.xxx * u_xlat40.xyz;
    u_xlat16_23.xyz = u_xlat40.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_74);
    u_xlat16_16.xyz = u_xlat14.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_17.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_20.xyz;
    u_xlat33.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_16.xyz;
    u_xlat75 = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat33.xyz = vec3(u_xlat75) * u_xlat33.xyz;
    u_xlat75 = dot(u_xlat29.xyz, u_xlat33.xyz);
    u_xlat29.x = dot(u_xlat29.xyz, u_xlat16_16.xyz);
    u_xlat14.z = u_xlat29.x * u_xlat7.x;
    u_xlat19.y = u_xlat0.x * u_xlat75;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat33.xyz);
    u_xlat19.x = u_xlat16_6.x * u_xlat7.x;
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_16.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat29.x = (-u_xlat16_6.x) + 1.0;
    u_xlat19.z = u_xlat7.x * u_xlat13.x;
    u_xlat7.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat13.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat35 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_16.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat16_6.x;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_6.x = u_xlat16_6.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat76 * u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_81 = u_xlat29.x * u_xlat29.x;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_16.x = u_xlat29.x * u_xlat16_81;
    u_xlat7.x = (-u_xlat16_81) * u_xlat29.x + 1.0;
    u_xlat7.xyz = u_xlat16_28.xyz * u_xlat7.xxx;
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_16.xxx + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat16_4.x = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26 = float(1.0) / float(u_xlat16_74);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_26;
    u_xlat16_4.x = max(u_xlat16_17.x, u_xlat16_4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_6.x);
    u_xlat16_4.x = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat16_23.xyz = u_xlat7.xyz * u_xlat57.yyy + u_xlat16_23.xyz;
    u_xlat16_6.x = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat57.yyy * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat57.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_4.xyz = vec3(_occlusionScale) * u_xlat16_4.xyz + u_xlat9.xyz;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_6.x) + u_xlat16_74;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_74 + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_6.x;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_74;
    u_xlat0.x = min(u_xlat16_6.x, 1.0);
    u_xlat7.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat7.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat7.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_4.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_4.xz);
    u_xlat16_20.y = u_xlat16_4.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_74) * u_xlat16_21.xyz;
    u_xlati29 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati29].xyz;
    u_xlati7.x = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati29 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati7.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati29].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(u_xlat16_1.x>=0.0);
#else
    u_xlatb73 = u_xlat16_1.x>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb73)) ? u_xlat7.xyz : u_xlat22.xyz;
    u_xlat7.xyz = u_xlat16_8.xyz * u_xlat22.xyz;
    u_xlat7.xyz = u_xlat22.zxy * u_xlat16_8.yzx + (-u_xlat7.xyz);
    u_xlat10.xyz = u_xlat22.xyz * u_xlat7.xyz;
    u_xlat22.xyz = u_xlat7.zxy * u_xlat22.yzx + (-u_xlat10.xyz);
    u_xlat22.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + u_xlat22.xyz;
    u_xlat16_15.x = u_xlat16_70 * 8.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat16_15.x = min(u_xlat16_15.x, 1.0);
    u_xlat16_15.x = abs(u_xlat16_1.x) * u_xlat16_15.x;
    u_xlat22.xyz = u_xlat16_15.xxx * u_xlat22.xyz + u_xlat9.xyz;
    u_xlat7.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat29.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat29.xxx;
    u_xlat16_15.x = dot((-u_xlat16_8.xyz), u_xlat22.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_15.xxx + (-u_xlat16_8.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat71) + (-u_xlat22.xyz);
    u_xlat5.xyz = vec3(u_xlat16_70) * u_xlat5.xyz + u_xlat22.xyz;
    u_xlat29.xyz = u_xlat22.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(u_xlat16_1.xxx) * u_xlat29.xyz + u_xlat5.xyz;
    u_xlat16_1.x = -abs(u_xlat16_1.x) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat22.xyz);
    u_xlat16_38.y = u_xlat22.x * 0.5;
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_4.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat22.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb22)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat12.y = u_xlat16_68;
    u_xlat16_38.x = u_xlat12.y * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_28.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_6.xyz;
    u_xlat16_4.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_4.w);
    u_xlat16_68 = u_xlat16_1.x + 1.0;
    u_xlat16_68 = min(u_xlat16_68, 15.0);
    u_xlat16_4.x = u_xlat16_68 * 16.0 + u_xlat16_4.z;
    u_xlat16_8.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_4.x = u_xlat16_1.x * 16.0 + u_xlat16_4.z;
    u_xlat16_8.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_1.x = u_xlat16_15.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_68 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_68 + u_xlat16_44;
    u_xlat16_1.x = u_xlat16_74 * u_xlat16_1.x;
    u_xlat22.x = u_xlat7.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_68 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_68 + u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_72 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_72 + u_xlat16_68;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_3.z);
    u_xlat16_6.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + u_xlat16_23.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_14.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_23.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_23.xyz) + _FogCol.zxy;
    u_xlat16_23.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_23.xyz;
    u_xlat0.xyz = u_xlat16_23.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat66 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat2.x = u_xlat66 * 0.0625 + u_xlat2.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_22.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_14.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SilkAnisotropyTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
bvec2 u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
int u_xlati29;
vec3 u_xlat33;
float u_xlat35;
mediump vec3 u_xlat16_38;
vec3 u_xlat40;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_50;
float u_xlat56;
vec2 u_xlat57;
mediump vec2 u_xlat16_57;
float u_xlat66;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_72;
bool u_xlatb73;
mediump float u_xlat16_74;
float u_xlat75;
bool u_xlatb75;
float u_xlat76;
float u_xlat78;
mediump float u_xlat16_81;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_1.x = dot(vs_TEXCOORD2.yzx, u_xlat16_3.xyz);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat22.x = max(u_xlat22.x, 1.17549435e-38);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat22.yzx * u_xlat16_3.zxy;
    u_xlat5.xyz = u_xlat16_3.yzx * u_xlat22.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = _Angle * 0.0174532942;
    u_xlat16_4.x = sin((-u_xlat16_1.x));
    u_xlat16_6.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_7 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_7.yx + u_xlat16_7.yx;
    u_xlat16_8.zw = u_xlat16_8.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_8.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_4.y = u_xlat16_6.x;
    u_xlat16_4.z = u_xlat16_1.x;
    u_xlat71 = dot(u_xlat16_4.yz, u_xlat16_8.zw);
    u_xlat7.x = dot(u_xlat16_4.xy, u_xlat16_28.xy);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat22.xyz = vec3(u_xlat71) * u_xlat22.xyz + u_xlat5.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = u_xlat16_4.xyz * vec3(u_xlat71);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat10.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat5.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat7.x = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat22.xyz = (-u_xlat9.yzx) * u_xlat7.xxx + u_xlat22.xyz;
    u_xlat7.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat7.xxx;
    u_xlat10.xyz = u_xlat22.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat22.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat16_1.x = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_0.x = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_0.x * _anisotropicMultiplier;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_7.zzzz).xy;
    u_xlat16_4.xyz = u_xlat16_7.www * _directSpecularColor.zxy;
    u_xlat16_4.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : _directSepcularColorNonSilk.zxy;
    u_xlat16_1.x = (u_xlatb7.y) ? u_xlat16_1.x : 0.0;
    u_xlat29.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat10.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat29.xyz = u_xlat0.xxx * u_xlat29.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat16_23.xyz);
    u_xlat16_1.x = (u_xlatb7.x) ? u_xlat16_68 : 0.0;
    u_xlat75 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_68 = (u_xlatb7.x) ? _SilkRoughness : u_xlat16_6.x;
    u_xlat16_70 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat7.x = u_xlat75 * u_xlat16_70;
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat11.z = u_xlat0.x * u_xlat7.x;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_23.xyz);
    u_xlat0.x = u_xlat16_1.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat11.y = u_xlat16_6.x * u_xlat0.x;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat75 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat75 = sqrt(u_xlat75);
    u_xlat75 = u_xlat75 + u_xlat11.x;
    u_xlat75 = u_xlat75 + 6.10351563e-05;
    u_xlat33.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_6.x = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_8.xyz = u_xlat16_6.xxx * u_xlat33.xyz;
    u_xlat76 = dot(u_xlat29.xyz, u_xlat16_8.xyz);
    u_xlat12.z = u_xlat7.x * u_xlat76;
    u_xlat76 = dot(u_xlat22.zxy, u_xlat16_8.xyz);
    u_xlat12.y = u_xlat0.x * u_xlat76;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat12.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat75 = u_xlat76 * u_xlat75 + 6.10351563e-05;
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat13.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_23.xyz;
    u_xlat56 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat13.xyz = vec3(u_xlat56) * u_xlat13.xyz;
    u_xlat56 = dot(u_xlat29.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat56;
    u_xlat16_50 = dot(u_xlat22.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat16_50 * u_xlat7.x;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(u_xlat16_23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_23.x) + 1.0;
    u_xlat13.x = u_xlat7.x * u_xlat0.x;
    u_xlat14.z = u_xlat56 * u_xlat13.x;
    u_xlat56 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat56 = max(u_xlat56, 6.10351563e-05);
    u_xlat56 = u_xlat13.x / u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat35 = u_xlat13.x * 0.318309873;
    u_xlat56 = u_xlat56 * u_xlat35;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat75 = u_xlat75 * u_xlat56;
    u_xlat16_23.x = u_xlat78 * u_xlat78;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_45 = u_xlat78 * u_xlat16_23.x;
    u_xlat56 = (-u_xlat16_23.x) * u_xlat78 + 1.0;
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.zxy * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_28.xyz = u_xlat16_6.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat16_28.xyz * vec3(u_xlat56);
    u_xlat56 = u_xlat16_28.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat56) * vec3(u_xlat16_45) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat16_4.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat11.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_57.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat57.xy = u_xlat16_57.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xy = min(max(u_xlat57.xy, 0.0), 1.0);
#else
    u_xlat57.xy = clamp(u_xlat57.xy, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat57.xxx * u_xlat14.xyz;
    u_xlat18.xyz = u_xlat33.xyz * u_xlat16_6.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat18.xyz = vec3(u_xlat75) * u_xlat18.xyz;
    u_xlat75 = dot(u_xlat29.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat0.x * u_xlat75;
    u_xlat16_23.x = dot(u_xlat22.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_23.x * u_xlat7.x;
    u_xlat75 = dot(u_xlat9.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_23.x) + 1.0;
    u_xlat19.z = u_xlat75 * u_xlat13.x;
    u_xlat75 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat75 = max(u_xlat75, 6.10351563e-05);
    u_xlat75 = u_xlat13.x / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat35 * u_xlat75;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat18.x = dot(u_xlat29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.z = u_xlat7.x * u_xlat18.x;
    u_xlat16_23.x = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat18.y = u_xlat0.x * u_xlat16_23.x;
    u_xlat18.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat40.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat40.x = sqrt(u_xlat40.x);
    u_xlat40.x = u_xlat40.x + u_xlat18.x;
    u_xlat40.x = u_xlat40.x + 6.10351563e-05;
    u_xlat40.x = u_xlat76 * u_xlat40.x + 6.10351563e-05;
    u_xlat40.x = float(1.0) / u_xlat40.x;
    u_xlat75 = u_xlat75 * u_xlat40.x;
    u_xlat16_23.x = u_xlat78 * u_xlat78;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat78 * u_xlat16_23.x;
    u_xlat16_45 = u_xlat78 * u_xlat16_23.x;
    u_xlat78 = (-u_xlat16_23.x) * u_xlat78 + 1.0;
    u_xlat40.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat40.xyz = vec3(u_xlat56) * vec3(u_xlat16_45) + u_xlat40.xyz;
    u_xlat40.xyz = vec3(u_xlat75) * u_xlat40.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat40.xyz = min(max(u_xlat40.xyz, 0.0), 1.0);
#else
    u_xlat40.xyz = clamp(u_xlat40.xyz, 0.0, 1.0);
#endif
    u_xlat40.xyz = u_xlat16_4.xyz * u_xlat40.xyz;
    u_xlat40.xyz = u_xlat18.xxx * u_xlat40.xyz;
    u_xlat16_23.xyz = u_xlat40.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_74);
    u_xlat16_16.xyz = u_xlat14.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_17.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_20.xyz;
    u_xlat33.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_16.xyz;
    u_xlat75 = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat33.xyz = vec3(u_xlat75) * u_xlat33.xyz;
    u_xlat75 = dot(u_xlat29.xyz, u_xlat33.xyz);
    u_xlat29.x = dot(u_xlat29.xyz, u_xlat16_16.xyz);
    u_xlat14.z = u_xlat29.x * u_xlat7.x;
    u_xlat19.y = u_xlat0.x * u_xlat75;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat33.xyz);
    u_xlat19.x = u_xlat16_6.x * u_xlat7.x;
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_16.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat29.x = (-u_xlat16_6.x) + 1.0;
    u_xlat19.z = u_xlat7.x * u_xlat13.x;
    u_xlat7.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat13.x / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat35 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_16.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat16_6.x;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_6.x = u_xlat16_6.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat76 * u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_81 = u_xlat29.x * u_xlat29.x;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_16.x = u_xlat29.x * u_xlat16_81;
    u_xlat7.x = (-u_xlat16_81) * u_xlat29.x + 1.0;
    u_xlat7.xyz = u_xlat16_28.xyz * u_xlat7.xxx;
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_16.xxx + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat16_4.x = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26 = float(1.0) / float(u_xlat16_74);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_26;
    u_xlat16_4.x = max(u_xlat16_17.x, u_xlat16_4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_6.x);
    u_xlat16_4.x = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat16_23.xyz = u_xlat7.xyz * u_xlat57.yyy + u_xlat16_23.xyz;
    u_xlat16_6.x = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat57.yyy * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat57.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_4.xyz = vec3(_occlusionScale) * u_xlat16_4.xyz + u_xlat9.xyz;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_6.x) + u_xlat16_74;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_74 + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_6.x;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_74;
    u_xlat0.x = min(u_xlat16_6.x, 1.0);
    u_xlat7.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat7.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat7.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_4.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_4.xz);
    u_xlat16_20.y = u_xlat16_4.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_74) * u_xlat16_21.xyz;
    u_xlati29 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati29].xyz;
    u_xlati7.x = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati29 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati7.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati29].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(u_xlat16_1.x>=0.0);
#else
    u_xlatb73 = u_xlat16_1.x>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb73)) ? u_xlat7.xyz : u_xlat22.xyz;
    u_xlat7.xyz = u_xlat16_8.xyz * u_xlat22.xyz;
    u_xlat7.xyz = u_xlat22.zxy * u_xlat16_8.yzx + (-u_xlat7.xyz);
    u_xlat10.xyz = u_xlat22.xyz * u_xlat7.xyz;
    u_xlat22.xyz = u_xlat7.zxy * u_xlat22.yzx + (-u_xlat10.xyz);
    u_xlat22.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + u_xlat22.xyz;
    u_xlat16_15.x = u_xlat16_70 * 8.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat16_15.x = min(u_xlat16_15.x, 1.0);
    u_xlat16_15.x = abs(u_xlat16_1.x) * u_xlat16_15.x;
    u_xlat22.xyz = u_xlat16_15.xxx * u_xlat22.xyz + u_xlat9.xyz;
    u_xlat7.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat29.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat29.xxx;
    u_xlat16_15.x = dot((-u_xlat16_8.xyz), u_xlat22.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_15.xxx + (-u_xlat16_8.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat71) + (-u_xlat22.xyz);
    u_xlat5.xyz = vec3(u_xlat16_70) * u_xlat5.xyz + u_xlat22.xyz;
    u_xlat29.xyz = u_xlat22.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(u_xlat16_1.xxx) * u_xlat29.xyz + u_xlat5.xyz;
    u_xlat16_1.x = -abs(u_xlat16_1.x) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat22.xyz);
    u_xlat16_38.y = u_xlat22.x * 0.5;
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_4.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat22.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb22)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat12.y = u_xlat16_68;
    u_xlat16_38.x = u_xlat12.y * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_6.xyz = u_xlat16_28.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_6.xyz;
    u_xlat16_4.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_4.w);
    u_xlat16_68 = u_xlat16_1.x + 1.0;
    u_xlat16_68 = min(u_xlat16_68, 15.0);
    u_xlat16_4.x = u_xlat16_68 * 16.0 + u_xlat16_4.z;
    u_xlat16_8.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_4.x = u_xlat16_1.x * 16.0 + u_xlat16_4.z;
    u_xlat16_8.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_1.x = u_xlat16_15.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_68 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_68 + u_xlat16_44;
    u_xlat16_1.x = u_xlat16_74 * u_xlat16_1.x;
    u_xlat22.x = u_xlat7.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_68 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_68 + u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_72 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_72 + u_xlat16_68;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_3.z);
    u_xlat16_6.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + u_xlat16_23.yzx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_14.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_23.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_23.xyz) + _FogCol.zxy;
    u_xlat16_23.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_23.xyz;
    u_xlat0.xyz = u_xlat16_23.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat66 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat66);
    u_xlat2.x = u_xlat66 * 0.0625 + u_xlat2.y;
    u_xlat16_22.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_22.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_22.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_14.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SilkAnisotropyTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat27;
vec3 u_xlat28;
vec3 u_xlat32;
mediump float u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_37;
mediump vec2 u_xlat16_38;
float u_xlat40;
vec3 u_xlat45;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat57;
mediump float u_xlat16_60;
float u_xlat64;
float u_xlat72;
float u_xlat74;
float u_xlat75;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
float u_xlat81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_90;
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
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat28.xyz = u_xlat28.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat16_6.xyz;
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
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat28.x = dot(u_xlat7.xyz, u_xlat28.xyz);
    u_xlat28.x = (-u_xlat28.x) * u_xlat28.x + 1.0;
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x * _ShadowBias.z;
    u_xlat28.xyz = (-u_xlat7.xyz) * u_xlat28.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat28.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat25.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat25.x = (-u_xlat1.x) + u_xlat25.x;
    u_xlat0.z = _ShadowBias.y * u_xlat25.x + u_xlat1.x;
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
    u_xlat24.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_34 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_78);
    u_xlat16_78 = u_xlat16_10.x * u_xlat16_34;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_78 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_78) * vs_TEXCOORD1.yzx;
    u_xlat16_78 = dot(vs_TEXCOORD2.yzx, u_xlat16_12.xyz);
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat25.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat25.x = max(u_xlat25.x, 1.17549435e-38);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_13.xyz;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat16_12.zxy;
    u_xlat2.xyz = u_xlat16_12.yzx * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = _Angle * 0.0174532942;
    u_xlat16_13.x = sin((-u_xlat16_78));
    u_xlat16_14.x = sin(u_xlat16_78);
    u_xlat16_15.x = cos(u_xlat16_78);
    u_xlat16_3 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_4.xy = u_xlat16_3.yx + u_xlat16_3.yx;
    u_xlat16_4.zw = u_xlat16_4.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_38.xy = u_xlat16_4.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_13.y = u_xlat16_15.x;
    u_xlat16_13.z = u_xlat16_14.x;
    u_xlat74 = dot(u_xlat16_13.yz, u_xlat16_4.zw);
    u_xlat3.x = dot(u_xlat16_13.xy, u_xlat16_38.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat25.xyz = vec3(u_xlat74) * u_xlat25.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat25.zxy, u_xlat7.xyz);
    u_xlat25.xyz = (-u_xlat7.yzx) * u_xlat2.xxx + u_xlat25.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat7.xyz;
    u_xlat2.xyz = u_xlat7.zxy * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_1.x = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = u_xlat16_1.x * u_xlat16_78;
    u_xlat16_82 = u_xlat16_1.x * _anisotropicMultiplier;
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_3.zzzz).xy;
    u_xlat16_13.xyz = u_xlat16_3.www * _directSpecularColor.zxy;
    u_xlat16_13.xyz = (u_xlatb3.y) ? u_xlat16_13.xyz : _directSepcularColorNonSilk.zxy;
    u_xlat16_78 = (u_xlatb3.y) ? u_xlat16_78 : 0.0;
    u_xlat27.xyz = vec3(u_xlat16_78) * u_xlat7.xyz + u_xlat2.zxy;
    u_xlat2.xyz = vec3(u_xlat16_78) * u_xlat16_12.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27.xyz = u_xlat1.xxx * u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat16_10.xyz);
    u_xlat16_78 = (u_xlatb3.x) ? u_xlat16_82 : 0.0;
    u_xlat74 = (-u_xlat16_78) + 1.0;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_82 = (u_xlatb3.x) ? _SilkRoughness : u_xlat16_12.x;
    u_xlat16_83 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_83;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat8.z = u_xlat1.x * u_xlat74;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_10.xyz);
    u_xlat1.x = u_xlat16_78 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_83;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat8.y = u_xlat16_12.x * u_xlat1.x;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat8.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat32.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat32.xyz * u_xlat16_12.xxx;
    u_xlat79 = dot(u_xlat27.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat74 * u_xlat79;
    u_xlat79 = dot(u_xlat25.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat1.x * u_xlat79;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat3.x = u_xlat79 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat16.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat16.xyz = vec3(u_xlat57) * u_xlat16.xyz;
    u_xlat57 = dot(u_xlat27.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat57;
    u_xlat16_60 = dot(u_xlat25.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat74 * u_xlat16_60;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat16.x = u_xlat74 * u_xlat1.x;
    u_xlat17.z = u_xlat57 * u_xlat16.x;
    u_xlat57 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat16.x / u_xlat57;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat40 = u_xlat16.x * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat40;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat57;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat57 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_15.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_15.zxy * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_36.xyz = u_xlat16_12.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = vec3(u_xlat57) * u_xlat16_36.xyz;
    u_xlat57 = u_xlat16_36.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat17.xyz;
    u_xlat17.xyz = u_xlat3.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat8.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat16_11.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat21.xyz = u_xlat32.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat21.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_10.x = dot(u_xlat25.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat74 * u_xlat16_10.x;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat22.z = u_xlat3.x * u_xlat16.x;
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat16.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat64 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat74 * u_xlat64;
    u_xlat16_10.x = dot(u_xlat25.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_10.x;
    u_xlat21.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat21.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat79 * u_xlat64 + 6.10351563e-05;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat3.x = u_xlat3.x * u_xlat64;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat81 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat45.xyz = u_xlat16_36.xyz * vec3(u_xlat81);
    u_xlat45.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat45.xyz;
    u_xlat45.xyz = u_xlat3.xxx * u_xlat45.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_13.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat21.xxx * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat45.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat17.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb3.x = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (u_xlatb3.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_23.xyz;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat32.xyz = u_xlat3.xxx * u_xlat32.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat32.xyz);
    u_xlat27.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
    u_xlat17.z = u_xlat74 * u_xlat27.x;
    u_xlat3.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat32.xyz);
    u_xlat3.x = u_xlat74 * u_xlat16_12.x;
    u_xlat74 = dot(u_xlat7.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_19.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_12.x) + 1.0;
    u_xlat3.z = u_xlat74 * u_xlat16.x;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat16.x / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat40 * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_19.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat16_12.x;
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat17.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat79 * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat74;
    u_xlat16_86 = u_xlat75 * u_xlat75;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_90 = u_xlat75 * u_xlat16_86;
    u_xlat74 = (-u_xlat16_86) * u_xlat75 + 1.0;
    u_xlat3.xyz = u_xlat16_36.xyz * vec3(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat57) * vec3(u_xlat16_90) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat17.xxx * u_xlat3.xyz;
    u_xlat16_13.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_13.x = max(u_xlat16_20.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_37.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * u_xlat24.yyy + u_xlat16_10.xyz;
    u_xlat16_12.x = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_12.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat21.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat17.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xxx;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_12.x * 0.5 + 0.5;
    u_xlat16_13.x = (-u_xlat16_12.x) + u_xlat16_13.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_13.x + u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat0.xy = min(u_xlat0.xw, u_xlat16_12.xx);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_20.y = u_xlat16_11.y;
    u_xlat16_23.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_20.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_23.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_12.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat25.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat5.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_83 * 8.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_78) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat7.xyz;
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
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
    u_xlat25.xyz = u_xlat5.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_83) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_78)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_78 = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_82 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_78);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_12.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat9.y = u_xlat16_82;
    u_xlat16_37.x = u_xlat9.y * 1.09769487;
    u_xlat16_37.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.xyz = min(max(u_xlat16_37.xyz, 0.0), 1.0);
#else
    u_xlat16_37.xyz = clamp(u_xlat16_37.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_37.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_78 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_78 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_78 = u_xlat16_37.z * 15.0 + (-u_xlat16_78);
    u_xlat16_82 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82 + u_xlat16_48;
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_78;
    u_xlat0.x = u_xlat1.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.y * 0.5;
    u_xlat16_82 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_78 = u_xlat0.x * u_xlat16_82 + u_xlat16_78;
    u_xlat16_82 = u_xlat16_78 + u_xlat16_78;
    u_xlat16_83 = (-u_xlat16_78) * 2.0 + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_83 + u_xlat16_82;
    u_xlat16_78 = u_xlat0.y * u_xlat16_78;
    u_xlat16_78 = min(u_xlat16_4.z, u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_12.yzx + u_xlat16_10.yzx;
    u_xlat16_78 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 + u_xlat16_15.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_15.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SilkAnisotropyTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat27;
vec3 u_xlat28;
vec3 u_xlat32;
mediump float u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_37;
mediump vec2 u_xlat16_38;
float u_xlat40;
vec3 u_xlat45;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat57;
mediump float u_xlat16_60;
float u_xlat64;
float u_xlat72;
float u_xlat74;
float u_xlat75;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
float u_xlat81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_90;
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
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat28.xyz = u_xlat28.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat16_6.xyz;
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
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat28.x = dot(u_xlat7.xyz, u_xlat28.xyz);
    u_xlat28.x = (-u_xlat28.x) * u_xlat28.x + 1.0;
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x * _ShadowBias.z;
    u_xlat28.xyz = (-u_xlat7.xyz) * u_xlat28.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat28.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat25.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat25.x = (-u_xlat1.x) + u_xlat25.x;
    u_xlat0.z = _ShadowBias.y * u_xlat25.x + u_xlat1.x;
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
    u_xlat24.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_34 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_78);
    u_xlat16_78 = u_xlat16_10.x * u_xlat16_34;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_78 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_78) * vs_TEXCOORD1.yzx;
    u_xlat16_78 = dot(vs_TEXCOORD2.yzx, u_xlat16_12.xyz);
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat25.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat25.x = max(u_xlat25.x, 1.17549435e-38);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_13.xyz;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat16_12.zxy;
    u_xlat2.xyz = u_xlat16_12.yzx * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = _Angle * 0.0174532942;
    u_xlat16_13.x = sin((-u_xlat16_78));
    u_xlat16_14.x = sin(u_xlat16_78);
    u_xlat16_15.x = cos(u_xlat16_78);
    u_xlat16_3 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_4.xy = u_xlat16_3.yx + u_xlat16_3.yx;
    u_xlat16_4.zw = u_xlat16_4.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_38.xy = u_xlat16_4.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_13.y = u_xlat16_15.x;
    u_xlat16_13.z = u_xlat16_14.x;
    u_xlat74 = dot(u_xlat16_13.yz, u_xlat16_4.zw);
    u_xlat3.x = dot(u_xlat16_13.xy, u_xlat16_38.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat25.xyz = vec3(u_xlat74) * u_xlat25.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat25.zxy, u_xlat7.xyz);
    u_xlat25.xyz = (-u_xlat7.yzx) * u_xlat2.xxx + u_xlat25.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat7.xyz;
    u_xlat2.xyz = u_xlat7.zxy * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_1.x = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = u_xlat16_1.x * u_xlat16_78;
    u_xlat16_82 = u_xlat16_1.x * _anisotropicMultiplier;
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_3.zzzz).xy;
    u_xlat16_13.xyz = u_xlat16_3.www * _directSpecularColor.zxy;
    u_xlat16_13.xyz = (u_xlatb3.y) ? u_xlat16_13.xyz : _directSepcularColorNonSilk.zxy;
    u_xlat16_78 = (u_xlatb3.y) ? u_xlat16_78 : 0.0;
    u_xlat27.xyz = vec3(u_xlat16_78) * u_xlat7.xyz + u_xlat2.zxy;
    u_xlat2.xyz = vec3(u_xlat16_78) * u_xlat16_12.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27.xyz = u_xlat1.xxx * u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat16_10.xyz);
    u_xlat16_78 = (u_xlatb3.x) ? u_xlat16_82 : 0.0;
    u_xlat74 = (-u_xlat16_78) + 1.0;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_82 = (u_xlatb3.x) ? _SilkRoughness : u_xlat16_12.x;
    u_xlat16_83 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_83;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat8.z = u_xlat1.x * u_xlat74;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_10.xyz);
    u_xlat1.x = u_xlat16_78 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_83;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat8.y = u_xlat16_12.x * u_xlat1.x;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat8.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat32.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat32.xyz * u_xlat16_12.xxx;
    u_xlat79 = dot(u_xlat27.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat74 * u_xlat79;
    u_xlat79 = dot(u_xlat25.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat1.x * u_xlat79;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat3.x = u_xlat79 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat16.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat16.xyz = vec3(u_xlat57) * u_xlat16.xyz;
    u_xlat57 = dot(u_xlat27.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat57;
    u_xlat16_60 = dot(u_xlat25.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat74 * u_xlat16_60;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat16.x = u_xlat74 * u_xlat1.x;
    u_xlat17.z = u_xlat57 * u_xlat16.x;
    u_xlat57 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat16.x / u_xlat57;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat40 = u_xlat16.x * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat40;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat57;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat57 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_15.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_15.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_15.zxy * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_36.xyz = u_xlat16_12.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = vec3(u_xlat57) * u_xlat16_36.xyz;
    u_xlat57 = u_xlat16_36.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat17.xyz;
    u_xlat17.xyz = u_xlat3.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat8.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat16_11.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat21.xyz = u_xlat32.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat21.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_10.x = dot(u_xlat25.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat74 * u_xlat16_10.x;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat22.z = u_xlat3.x * u_xlat16.x;
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat16.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat64 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat74 * u_xlat64;
    u_xlat16_10.x = dot(u_xlat25.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_10.x;
    u_xlat21.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat21.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat79 * u_xlat64 + 6.10351563e-05;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat3.x = u_xlat3.x * u_xlat64;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat81 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat45.xyz = u_xlat16_36.xyz * vec3(u_xlat81);
    u_xlat45.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat45.xyz;
    u_xlat45.xyz = u_xlat3.xxx * u_xlat45.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_13.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat21.xxx * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat45.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat17.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb3.x = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (u_xlatb3.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_23.xyz;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat32.xyz = u_xlat3.xxx * u_xlat32.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat32.xyz);
    u_xlat27.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
    u_xlat17.z = u_xlat74 * u_xlat27.x;
    u_xlat3.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat32.xyz);
    u_xlat3.x = u_xlat74 * u_xlat16_12.x;
    u_xlat74 = dot(u_xlat7.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_19.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_12.x) + 1.0;
    u_xlat3.z = u_xlat74 * u_xlat16.x;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat16.x / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat40 * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_19.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat16_12.x;
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat17.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat79 * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat74;
    u_xlat16_86 = u_xlat75 * u_xlat75;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_90 = u_xlat75 * u_xlat16_86;
    u_xlat74 = (-u_xlat16_86) * u_xlat75 + 1.0;
    u_xlat3.xyz = u_xlat16_36.xyz * vec3(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat57) * vec3(u_xlat16_90) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat17.xxx * u_xlat3.xyz;
    u_xlat16_13.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_13.x = max(u_xlat16_20.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_37.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * u_xlat24.yyy + u_xlat16_10.xyz;
    u_xlat16_12.x = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_12.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat21.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat17.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xxx;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_12.x * 0.5 + 0.5;
    u_xlat16_13.x = (-u_xlat16_12.x) + u_xlat16_13.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_13.x + u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat0.xy = min(u_xlat0.xw, u_xlat16_12.xx);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.zxy;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_20.y = u_xlat16_11.y;
    u_xlat16_23.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_20.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_23.xyz = u_xlat16_20.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_12.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat25.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat5.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_83 * 8.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_78) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat7.xyz;
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
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
    u_xlat25.xyz = u_xlat5.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_83) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_78)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_78 = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_82 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_78);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_12.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat9.y = u_xlat16_82;
    u_xlat16_37.x = u_xlat9.y * 1.09769487;
    u_xlat16_37.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.xyz = min(max(u_xlat16_37.xyz, 0.0), 1.0);
#else
    u_xlat16_37.xyz = clamp(u_xlat16_37.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_37.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_78 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_78 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_78 = u_xlat16_37.z * 15.0 + (-u_xlat16_78);
    u_xlat16_82 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82 + u_xlat16_48;
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_78;
    u_xlat0.x = u_xlat1.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.y * 0.5;
    u_xlat16_82 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_78 = u_xlat0.x * u_xlat16_82 + u_xlat16_78;
    u_xlat16_82 = u_xlat16_78 + u_xlat16_78;
    u_xlat16_83 = (-u_xlat16_78) * 2.0 + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_83 + u_xlat16_82;
    u_xlat16_78 = u_xlat0.y * u_xlat16_78;
    u_xlat16_78 = min(u_xlat16_4.z, u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_11.yzx * u_xlat16_12.yzx + u_xlat16_10.yzx;
    u_xlat16_78 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 + u_xlat16_15.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_15.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SilkAnisotropyTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
bvec2 u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
int u_xlati29;
vec3 u_xlat33;
float u_xlat35;
mediump vec3 u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_50;
float u_xlat56;
float u_xlat57;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
float u_xlat71;
bool u_xlatb73;
mediump float u_xlat16_74;
float u_xlat75;
float u_xlat76;
bool u_xlatb76;
float u_xlat78;
mediump float u_xlat16_81;
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_1.x = dot(vs_TEXCOORD2.yzx, u_xlat16_3.xyz);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat22.x = max(u_xlat22.x, 1.17549435e-38);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat22.yzx * u_xlat16_3.zxy;
    u_xlat5.xyz = u_xlat16_3.yzx * u_xlat22.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = _Angle * 0.0174532942;
    u_xlat16_4.x = sin((-u_xlat16_1.x));
    u_xlat16_6.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_7 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_7.yx + u_xlat16_7.yx;
    u_xlat16_8.zw = u_xlat16_8.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_8.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_4.y = u_xlat16_6.x;
    u_xlat16_4.z = u_xlat16_1.x;
    u_xlat71 = dot(u_xlat16_4.yz, u_xlat16_8.zw);
    u_xlat7.x = dot(u_xlat16_4.xy, u_xlat16_28.xy);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat22.xyz = vec3(u_xlat71) * u_xlat22.xyz + u_xlat5.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = u_xlat16_4.xyz * vec3(u_xlat71);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat10.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat5.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat7.x = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat22.xyz = (-u_xlat9.yzx) * u_xlat7.xxx + u_xlat22.xyz;
    u_xlat7.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat7.xxx;
    u_xlat10.xyz = u_xlat22.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat22.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat16_1.x = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_0.x = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_0.x * _anisotropicMultiplier;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_7.zzzz).xy;
    u_xlat16_4.xyz = u_xlat16_7.www * _directSpecularColor.xyz;
    u_xlat16_4.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : _directSepcularColorNonSilk.xyz;
    u_xlat16_1.x = (u_xlatb7.y) ? u_xlat16_1.x : 0.0;
    u_xlat29.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat10.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat29.xyz = u_xlat0.xxx * u_xlat29.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat16_23.xyz);
    u_xlat16_1.x = (u_xlatb7.x) ? u_xlat16_68 : 0.0;
    u_xlat75 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_68 = (u_xlatb7.x) ? _SilkRoughness : u_xlat16_6.x;
    u_xlat16_70 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat7.x = u_xlat75 * u_xlat16_70;
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat11.z = u_xlat0.x * u_xlat7.x;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_23.xyz);
    u_xlat0.x = u_xlat16_1.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat11.y = u_xlat16_6.x * u_xlat0.x;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat11.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat33.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_6.x = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_8.xyz = u_xlat16_6.xxx * u_xlat33.xyz;
    u_xlat12.x = dot(u_xlat29.xyz, u_xlat16_8.xyz);
    u_xlat12.z = u_xlat7.x * u_xlat12.x;
    u_xlat78 = dot(u_xlat22.zxy, u_xlat16_8.xyz);
    u_xlat12.y = u_xlat0.x * u_xlat78;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat12.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat76 = u_xlat56 * u_xlat76 + 6.10351563e-05;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat13.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_23.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat29.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat78;
    u_xlat16_50 = dot(u_xlat22.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat16_50 * u_xlat7.x;
    u_xlat78 = dot(u_xlat9.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(u_xlat16_23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat13.x = (-u_xlat16_23.x) + 1.0;
    u_xlat35 = u_xlat7.x * u_xlat0.x;
    u_xlat14.z = u_xlat78 * u_xlat35;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat35 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat57 = u_xlat35 * 0.318309873;
    u_xlat78 = u_xlat78 * u_xlat57;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat76 = u_xlat76 * u_xlat78;
    u_xlat16_23.x = u_xlat13.x * u_xlat13.x;
    u_xlat16_23.x = u_xlat13.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat13.x * u_xlat16_23.x;
    u_xlat16_45 = u_xlat13.x * u_xlat16_23.x;
    u_xlat78 = (-u_xlat16_23.x) * u_xlat13.x + 1.0;
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_28.xyz = u_xlat16_6.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat78 = u_xlat16_28.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat78) * vec3(u_xlat16_45) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat76) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat16_4.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat11.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_13.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat13.xw = u_xlat16_13.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xw = min(max(u_xlat13.xw, 0.0), 1.0);
#else
    u_xlat13.xw = clamp(u_xlat13.xw, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat13.xxx * u_xlat14.xyz;
    u_xlat18.xyz = u_xlat33.xyz * u_xlat16_6.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat76 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
    u_xlat76 = dot(u_xlat29.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat0.x * u_xlat76;
    u_xlat16_23.x = dot(u_xlat22.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_23.x * u_xlat7.x;
    u_xlat76 = dot(u_xlat9.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat16_23.x) + 1.0;
    u_xlat19.z = u_xlat76 * u_xlat35;
    u_xlat76 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat35 / u_xlat76;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = u_xlat57 * u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat40 = dot(u_xlat29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat7.x * u_xlat40;
    u_xlat16_23.x = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat0.x * u_xlat16_23.x;
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat19.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat56 * u_xlat40 + 6.10351563e-05;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat76 = u_xlat76 * u_xlat40;
    u_xlat16_23.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_23.x = u_xlat18.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat18.x * u_xlat16_23.x;
    u_xlat16_45 = u_xlat18.x * u_xlat16_23.x;
    u_xlat18.x = (-u_xlat16_23.x) * u_xlat18.x + 1.0;
    u_xlat18.xyz = u_xlat16_28.xyz * u_xlat18.xxx;
    u_xlat18.xyz = vec3(u_xlat78) * vec3(u_xlat16_45) + u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat16_4.xyz * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat19.xxx * u_xlat18.xyz;
    u_xlat16_23.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_74);
    u_xlat16_16.xyz = u_xlat14.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb76 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_17.xy = (bool(u_xlatb76)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_20.xyz;
    u_xlat33.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_16.xyz;
    u_xlat76 = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat33.xyz = vec3(u_xlat76) * u_xlat33.xyz;
    u_xlat76 = dot(u_xlat29.xyz, u_xlat33.xyz);
    u_xlat29.x = dot(u_xlat29.xyz, u_xlat16_16.xyz);
    u_xlat14.z = u_xlat29.x * u_xlat7.x;
    u_xlat18.y = u_xlat0.x * u_xlat76;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat33.xyz);
    u_xlat18.x = u_xlat16_6.x * u_xlat7.x;
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_16.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat29.x = (-u_xlat16_6.x) + 1.0;
    u_xlat18.z = u_xlat7.x * u_xlat35;
    u_xlat7.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat35 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat57 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_16.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat16_6.x;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_6.x = u_xlat16_6.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat56 * u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_81 = u_xlat29.x * u_xlat29.x;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_16.x = u_xlat29.x * u_xlat16_81;
    u_xlat7.x = (-u_xlat16_81) * u_xlat29.x + 1.0;
    u_xlat7.xyz = u_xlat16_28.xyz * u_xlat7.xxx;
    u_xlat7.xyz = vec3(u_xlat78) * u_xlat16_16.xxx + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat16_4.x = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26 = float(1.0) / float(u_xlat16_74);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_26;
    u_xlat16_4.x = max(u_xlat16_17.x, u_xlat16_4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_6.x);
    u_xlat16_4.x = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat16_23.xyz = u_xlat7.xyz * u_xlat13.www + u_xlat16_23.xyz;
    u_xlat16_6.x = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat13.www * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat13.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_4.xyz = vec3(_occlusionScale) * u_xlat16_4.xyz + u_xlat9.xyz;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_6.x) + u_xlat16_74;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_74 + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_6.x;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_81 = u_xlat16_6.x * u_xlat16_74;
    u_xlat0.x = min(u_xlat16_81, 1.0);
    u_xlat7.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat7.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat7.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_4.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_4.xz);
    u_xlat16_20.y = u_xlat16_4.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_74) * u_xlat16_21.xyz;
    u_xlati29 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati29].xyz;
    u_xlati7.x = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati29 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati7.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati29].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_81 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(u_xlat16_1.x>=0.0);
#else
    u_xlatb73 = u_xlat16_1.x>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb73)) ? u_xlat7.xyz : u_xlat22.xyz;
    u_xlat7.xyz = u_xlat16_8.xyz * u_xlat22.xyz;
    u_xlat7.xyz = u_xlat22.zxy * u_xlat16_8.yzx + (-u_xlat7.xyz);
    u_xlat10.xyz = u_xlat22.xyz * u_xlat7.xyz;
    u_xlat22.xyz = u_xlat7.zxy * u_xlat22.yzx + (-u_xlat10.xyz);
    u_xlat22.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + u_xlat22.xyz;
    u_xlat16_15.x = u_xlat16_70 * 8.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat16_15.x = min(u_xlat16_15.x, 1.0);
    u_xlat16_15.x = abs(u_xlat16_1.x) * u_xlat16_15.x;
    u_xlat22.xyz = u_xlat16_15.xxx * u_xlat22.xyz + u_xlat9.xyz;
    u_xlat7.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat29.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat29.xxx;
    u_xlat16_15.x = dot((-u_xlat16_8.xyz), u_xlat22.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_15.xxx + (-u_xlat16_8.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat71) + (-u_xlat22.xyz);
    u_xlat5.xyz = vec3(u_xlat16_70) * u_xlat5.xyz + u_xlat22.xyz;
    u_xlat29.xyz = u_xlat22.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(u_xlat16_1.xxx) * u_xlat29.xyz + u_xlat5.xyz;
    u_xlat16_1.x = -abs(u_xlat16_1.x) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat22.xyz);
    u_xlat16_38.y = u_xlat22.x * 0.5;
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_4.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat22.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_81) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb22)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat12.y = u_xlat16_68;
    u_xlat16_38.x = u_xlat12.y * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_16.xyz = u_xlat16_28.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_4.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_4.w);
    u_xlat16_68 = u_xlat16_1.x + 1.0;
    u_xlat16_68 = min(u_xlat16_68, 15.0);
    u_xlat16_4.x = u_xlat16_68 * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_4.x = u_xlat16_1.x * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_1.x = u_xlat16_15.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_68 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_68 + u_xlat16_44;
    u_xlat16_1.x = u_xlat16_74 * u_xlat16_1.x;
    u_xlat22.x = u_xlat7.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_68 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_68 + u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_74 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_74 + u_xlat16_68;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_3.z);
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_15.xyz + u_xlat16_23.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_14.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_23.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_23.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_14.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
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
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SilkAnisotropyTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
ivec3 u_xlati7;
bvec2 u_xlatb7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec2 u_xlat16_22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
int u_xlati29;
vec3 u_xlat33;
float u_xlat35;
mediump vec3 u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
mediump float u_xlat16_50;
float u_xlat56;
float u_xlat57;
mediump float u_xlat16_68;
mediump float u_xlat16_70;
float u_xlat71;
bool u_xlatb73;
mediump float u_xlat16_74;
float u_xlat75;
float u_xlat76;
bool u_xlatb76;
float u_xlat78;
mediump float u_xlat16_81;
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_1.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_1.x = dot(vs_TEXCOORD2.yzx, u_xlat16_3.xyz);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat22.x = max(u_xlat22.x, 1.17549435e-38);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xyz = u_xlat22.xxx * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat22.yzx * u_xlat16_3.zxy;
    u_xlat5.xyz = u_xlat16_3.yzx * u_xlat22.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = _Angle * 0.0174532942;
    u_xlat16_4.x = sin((-u_xlat16_1.x));
    u_xlat16_6.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_7 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_8.xy = u_xlat16_7.yx + u_xlat16_7.yx;
    u_xlat16_8.zw = u_xlat16_8.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_28.xy = u_xlat16_8.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_4.y = u_xlat16_6.x;
    u_xlat16_4.z = u_xlat16_1.x;
    u_xlat71 = dot(u_xlat16_4.yz, u_xlat16_8.zw);
    u_xlat7.x = dot(u_xlat16_4.xy, u_xlat16_28.xy);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat22.xyz = vec3(u_xlat71) * u_xlat22.xyz + u_xlat5.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat71 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = u_xlat16_4.xyz * vec3(u_xlat71);
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat10.x;
    u_xlat5.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat5.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat71 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat71 = max(u_xlat71, 1.17549435e-38);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat9.xyz = vec3(u_xlat71) * u_xlat5.xyz;
    u_xlat7.x = dot(u_xlat22.zxy, u_xlat9.xyz);
    u_xlat22.xyz = (-u_xlat9.yzx) * u_xlat7.xxx + u_xlat22.xyz;
    u_xlat7.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat7.xxx;
    u_xlat10.xyz = u_xlat22.yzx * u_xlat9.xyz;
    u_xlat10.xyz = u_xlat9.zxy * u_xlat22.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
    u_xlat16_1.x = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_0.x = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_0.x * _anisotropicMultiplier;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_7.zzzz).xy;
    u_xlat16_4.xyz = u_xlat16_7.www * _directSpecularColor.xyz;
    u_xlat16_4.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : _directSepcularColorNonSilk.xyz;
    u_xlat16_1.x = (u_xlatb7.y) ? u_xlat16_1.x : 0.0;
    u_xlat29.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat10.zxy;
    u_xlat10.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat10.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat29.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat29.xyz = u_xlat0.xxx * u_xlat29.xyz;
    u_xlat0.x = dot(u_xlat29.xyz, u_xlat16_23.xyz);
    u_xlat16_1.x = (u_xlatb7.x) ? u_xlat16_68 : 0.0;
    u_xlat75 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_68 = (u_xlatb7.x) ? _SilkRoughness : u_xlat16_6.x;
    u_xlat16_70 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat7.x = u_xlat75 * u_xlat16_70;
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat11.z = u_xlat0.x * u_xlat7.x;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_23.xyz);
    u_xlat0.x = u_xlat16_1.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_70;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat11.y = u_xlat16_6.x * u_xlat0.x;
    u_xlat11.x = dot(u_xlat9.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat11.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat33.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_6.x = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_8.xyz = u_xlat16_6.xxx * u_xlat33.xyz;
    u_xlat12.x = dot(u_xlat29.xyz, u_xlat16_8.xyz);
    u_xlat12.z = u_xlat7.x * u_xlat12.x;
    u_xlat78 = dot(u_xlat22.zxy, u_xlat16_8.xyz);
    u_xlat12.y = u_xlat0.x * u_xlat78;
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat12.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat76 = u_xlat56 * u_xlat76 + 6.10351563e-05;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat13.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_23.xyz;
    u_xlat78 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat13.xyz = vec3(u_xlat78) * u_xlat13.xyz;
    u_xlat78 = dot(u_xlat29.xyz, u_xlat13.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat78;
    u_xlat16_50 = dot(u_xlat22.zxy, u_xlat13.xyz);
    u_xlat14.x = u_xlat16_50 * u_xlat7.x;
    u_xlat78 = dot(u_xlat9.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(u_xlat16_23.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat13.x = (-u_xlat16_23.x) + 1.0;
    u_xlat35 = u_xlat7.x * u_xlat0.x;
    u_xlat14.z = u_xlat78 * u_xlat35;
    u_xlat78 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat78 = max(u_xlat78, 6.10351563e-05);
    u_xlat78 = u_xlat35 / u_xlat78;
    u_xlat78 = u_xlat78 * u_xlat78;
    u_xlat57 = u_xlat35 * 0.318309873;
    u_xlat78 = u_xlat78 * u_xlat57;
    u_xlat78 = min(u_xlat78, 16.0);
    u_xlat76 = u_xlat76 * u_xlat78;
    u_xlat16_23.x = u_xlat13.x * u_xlat13.x;
    u_xlat16_23.x = u_xlat13.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat13.x * u_xlat16_23.x;
    u_xlat16_45 = u_xlat13.x * u_xlat16_23.x;
    u_xlat78 = (-u_xlat16_23.x) * u_xlat13.x + 1.0;
    u_xlat16_14 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_16.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_16.xyz = u_xlat16_3.www * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.xyz;
    u_xlat16_28.xyz = u_xlat16_6.yyy * u_xlat16_17.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat14.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat78 = u_xlat16_28.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat14.xyz = vec3(u_xlat78) * vec3(u_xlat16_45) + u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat76) * u_xlat14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat16_4.xyz * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat11.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat16_2.xyz * u_xlat14.xyz;
    u_xlat16_13.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat13.xw = u_xlat16_13.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xw = min(max(u_xlat13.xw, 0.0), 1.0);
#else
    u_xlat13.xw = clamp(u_xlat13.xw, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat13.xxx * u_xlat14.xyz;
    u_xlat18.xyz = u_xlat33.xyz * u_xlat16_6.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat76 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
    u_xlat76 = dot(u_xlat29.xyz, u_xlat18.xyz);
    u_xlat19.y = u_xlat0.x * u_xlat76;
    u_xlat16_23.x = dot(u_xlat22.zxy, u_xlat18.xyz);
    u_xlat19.x = u_xlat16_23.x * u_xlat7.x;
    u_xlat76 = dot(u_xlat9.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat16_23.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat16_23.x) + 1.0;
    u_xlat19.z = u_xlat76 * u_xlat35;
    u_xlat76 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat76 = max(u_xlat76, 6.10351563e-05);
    u_xlat76 = u_xlat35 / u_xlat76;
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = u_xlat57 * u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat40 = dot(u_xlat29.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.z = u_xlat7.x * u_xlat40;
    u_xlat16_23.x = dot(u_xlat22.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat19.y = u_xlat0.x * u_xlat16_23.x;
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat19.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat56 * u_xlat40 + 6.10351563e-05;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat76 = u_xlat76 * u_xlat40;
    u_xlat16_23.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_23.x = u_xlat18.x * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat18.x * u_xlat16_23.x;
    u_xlat16_45 = u_xlat18.x * u_xlat16_23.x;
    u_xlat18.x = (-u_xlat16_23.x) * u_xlat18.x + 1.0;
    u_xlat18.xyz = u_xlat16_28.xyz * u_xlat18.xxx;
    u_xlat18.xyz = vec3(u_xlat78) * vec3(u_xlat16_45) + u_xlat18.xyz;
    u_xlat18.xyz = vec3(u_xlat76) * u_xlat18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat16_4.xyz * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat19.xxx * u_xlat18.xyz;
    u_xlat16_23.xyz = u_xlat18.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_81 = inversesqrt(u_xlat16_74);
    u_xlat16_16.xyz = u_xlat14.xyz * vec3(u_xlat16_81);
    u_xlat16_81 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(0.00100000005>=abs(u_xlat16_81));
#else
    u_xlatb76 = 0.00100000005>=abs(u_xlat16_81);
#endif
    u_xlat16_17.xy = (bool(u_xlatb76)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_20.xyz;
    u_xlat33.xyz = u_xlat33.xyz * u_xlat16_6.xxx + u_xlat16_16.xyz;
    u_xlat76 = dot(u_xlat33.xyz, u_xlat33.xyz);
    u_xlat76 = inversesqrt(u_xlat76);
    u_xlat33.xyz = vec3(u_xlat76) * u_xlat33.xyz;
    u_xlat76 = dot(u_xlat29.xyz, u_xlat33.xyz);
    u_xlat29.x = dot(u_xlat29.xyz, u_xlat16_16.xyz);
    u_xlat14.z = u_xlat29.x * u_xlat7.x;
    u_xlat18.y = u_xlat0.x * u_xlat76;
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat33.xyz);
    u_xlat18.x = u_xlat16_6.x * u_xlat7.x;
    u_xlat7.x = dot(u_xlat9.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_16.xyz, u_xlat33.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat29.x = (-u_xlat16_6.x) + 1.0;
    u_xlat18.z = u_xlat7.x * u_xlat35;
    u_xlat7.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat35 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat57 * u_xlat7.x;
    u_xlat7.x = min(u_xlat7.x, 16.0);
    u_xlat16_6.x = dot(u_xlat22.zxy, u_xlat16_16.xyz);
    u_xlat14.y = u_xlat0.x * u_xlat16_6.x;
    u_xlat14.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_6.x = u_xlat16_6.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat0.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = u_xlat56 * u_xlat0.x + 6.10351563e-05;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_81 = u_xlat29.x * u_xlat29.x;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_81 = u_xlat29.x * u_xlat16_81;
    u_xlat16_16.x = u_xlat29.x * u_xlat16_81;
    u_xlat7.x = (-u_xlat16_81) * u_xlat29.x + 1.0;
    u_xlat7.xyz = u_xlat16_28.xyz * u_xlat7.xxx;
    u_xlat7.xyz = vec3(u_xlat78) * u_xlat16_16.xxx + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat16_4.x = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_26 = float(1.0) / float(u_xlat16_74);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_26;
    u_xlat16_4.x = max(u_xlat16_17.x, u_xlat16_4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_6.x);
    u_xlat16_4.x = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat7.xyz = u_xlat16_4.xyz * u_xlat7.xyz;
    u_xlat16_23.xyz = u_xlat7.xyz * u_xlat13.www + u_xlat16_23.xyz;
    u_xlat16_6.x = (-u_xlat16_3.y) * _MetallicMultiplier + 1.0;
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_4.xyz = u_xlat13.www * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat13.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat19.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat14.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_4.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + vs_TEXCOORD4.xyz;
    u_xlat16_4.xyz = vec3(_occlusionScale) * u_xlat16_4.xyz + u_xlat9.xyz;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
    u_xlat16_6.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_74 = (-u_xlat16_6.x) + u_xlat16_74;
    u_xlat16_81 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_38.z = _occlusionScale * u_xlat16_81 + 1.0;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_74 + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_38.z * u_xlat16_6.x;
    u_xlat16_74 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_74 = u_xlat16_74 + -1.0;
    u_xlat16_74 = _occlusionScale * u_xlat16_74 + 1.0;
    u_xlat16_81 = u_xlat16_6.x * u_xlat16_74;
    u_xlat0.x = min(u_xlat16_81, 1.0);
    u_xlat7.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat7.xxx * u_xlat16_17.xyz;
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat7.xxx * u_xlat16_20.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat7.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_15.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_20.xyz * u_xlat7.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_4.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_4.xz);
    u_xlat16_20.y = u_xlat16_4.y;
    u_xlat16_21.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati7.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = vec3(u_xlat16_74) * u_xlat16_21.xyz;
    u_xlati29 = int(int_bitfieldInsert(2,u_xlati7.y,0,1) );
    u_xlat16_21.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati29].xyz;
    u_xlati7.x = int(uint(uint(u_xlati7.x) & 1u));
    u_xlati29 = (u_xlati7.z != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati7.x].xyz + u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati29].xyz + u_xlat16_20.xyw;
    u_xlat16_21.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_81 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_21.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat16_17.xyz + u_xlat16_2.xyz;
    u_xlat7.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb73 = !!(u_xlat16_1.x>=0.0);
#else
    u_xlatb73 = u_xlat16_1.x>=0.0;
#endif
    u_xlat22.xyz = (bool(u_xlatb73)) ? u_xlat7.xyz : u_xlat22.xyz;
    u_xlat7.xyz = u_xlat16_8.xyz * u_xlat22.xyz;
    u_xlat7.xyz = u_xlat22.zxy * u_xlat16_8.yzx + (-u_xlat7.xyz);
    u_xlat10.xyz = u_xlat22.xyz * u_xlat7.xyz;
    u_xlat22.xyz = u_xlat7.zxy * u_xlat22.yzx + (-u_xlat10.xyz);
    u_xlat22.xyz = (-u_xlat5.xyz) * vec3(u_xlat71) + u_xlat22.xyz;
    u_xlat16_15.x = u_xlat16_70 * 8.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_70 = max(u_xlat16_70, 0.0078125);
    u_xlat16_15.x = min(u_xlat16_15.x, 1.0);
    u_xlat16_15.x = abs(u_xlat16_1.x) * u_xlat16_15.x;
    u_xlat22.xyz = u_xlat16_15.xxx * u_xlat22.xyz + u_xlat9.xyz;
    u_xlat7.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat29.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat29.xxx;
    u_xlat16_15.x = dot((-u_xlat16_8.xyz), u_xlat22.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat22.xyz = (-u_xlat22.xyz) * u_xlat16_15.xxx + (-u_xlat16_8.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat71) + (-u_xlat22.xyz);
    u_xlat5.xyz = vec3(u_xlat16_70) * u_xlat5.xyz + u_xlat22.xyz;
    u_xlat29.xyz = u_xlat22.xyz + (-u_xlat5.xyz);
    u_xlat5.xyz = abs(u_xlat16_1.xxx) * u_xlat29.xyz + u_xlat5.xyz;
    u_xlat16_1.x = -abs(u_xlat16_1.x) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat22.x = dot(u_xlat16_4.xyz, u_xlat22.xyz);
    u_xlat16_38.y = u_xlat22.x * 0.5;
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat5.xz);
    u_xlat5.z = dot(_IndirectCubemapRotationParams.zw, u_xlat5.xz);
    u_xlat5.x = u_xlat16_4.x;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat5.xyz, u_xlat16_1.x);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat22.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat22.xyz * u_xlat22.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_81) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb22)) ? u_xlat16_15.xyz : u_xlat16_8.xyz;
    u_xlat12.y = u_xlat16_68;
    u_xlat16_38.x = u_xlat12.y * 1.09769487;
    u_xlat16_15.xyz = u_xlat16_38.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_22.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_16.xyz = u_xlat16_28.xyz * u_xlat16_22.xxx + u_xlat16_22.yyy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_16.xyz;
    u_xlat16_4.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_4.w);
    u_xlat16_68 = u_xlat16_1.x + 1.0;
    u_xlat16_68 = min(u_xlat16_68, 15.0);
    u_xlat16_4.x = u_xlat16_68 * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22.x = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_4.x = u_xlat16_1.x * 16.0 + u_xlat16_4.z;
    u_xlat16_15.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_1.x = u_xlat16_15.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_68 = (-u_xlat16_44) + u_xlat16_22.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_68 + u_xlat16_44;
    u_xlat16_1.x = u_xlat16_74 * u_xlat16_1.x;
    u_xlat22.x = u_xlat7.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat0.x * 0.5;
    u_xlat16_68 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_68 + u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_74 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_74 + u_xlat16_68;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_3.z);
    u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_15.xyz + u_xlat16_23.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_14.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_23.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_23.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_14.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SilkAnisotropyTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat27;
vec3 u_xlat28;
vec3 u_xlat32;
mediump float u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_37;
mediump vec2 u_xlat16_38;
float u_xlat40;
vec3 u_xlat45;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat57;
mediump float u_xlat16_60;
float u_xlat64;
float u_xlat74;
float u_xlat75;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
float u_xlat81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_90;
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
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat28.xyz = u_xlat28.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat16_6.xyz;
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
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat28.x = dot(u_xlat7.xyz, u_xlat28.xyz);
    u_xlat28.x = (-u_xlat28.x) * u_xlat28.x + 1.0;
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x * _ShadowBias.z;
    u_xlat28.xyz = (-u_xlat7.xyz) * u_xlat28.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat28.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat25.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat25.x = (-u_xlat1.x) + u_xlat25.x;
    u_xlat0.z = _ShadowBias.y * u_xlat25.x + u_xlat1.x;
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
    u_xlat24.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_34 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_78);
    u_xlat16_78 = u_xlat16_10.x * u_xlat16_34;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_78 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_78) * vs_TEXCOORD1.yzx;
    u_xlat16_78 = dot(vs_TEXCOORD2.yzx, u_xlat16_12.xyz);
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat25.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat25.x = max(u_xlat25.x, 1.17549435e-38);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_13.xyz;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat16_12.zxy;
    u_xlat2.xyz = u_xlat16_12.yzx * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = _Angle * 0.0174532942;
    u_xlat16_13.x = sin((-u_xlat16_78));
    u_xlat16_14.x = sin(u_xlat16_78);
    u_xlat16_15.x = cos(u_xlat16_78);
    u_xlat16_3 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_4.xy = u_xlat16_3.yx + u_xlat16_3.yx;
    u_xlat16_4.zw = u_xlat16_4.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_38.xy = u_xlat16_4.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_13.y = u_xlat16_15.x;
    u_xlat16_13.z = u_xlat16_14.x;
    u_xlat74 = dot(u_xlat16_13.yz, u_xlat16_4.zw);
    u_xlat3.x = dot(u_xlat16_13.xy, u_xlat16_38.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat25.xyz = vec3(u_xlat74) * u_xlat25.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat25.zxy, u_xlat7.xyz);
    u_xlat25.xyz = (-u_xlat7.yzx) * u_xlat2.xxx + u_xlat25.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat7.xyz;
    u_xlat2.xyz = u_xlat7.zxy * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_1 = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = u_xlat16_1 * u_xlat16_78;
    u_xlat16_82 = u_xlat16_1 * _anisotropicMultiplier;
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_3.zzzz).xy;
    u_xlat16_13.xyz = u_xlat16_3.www * _directSpecularColor.xyz;
    u_xlat16_13.xyz = (u_xlatb3.y) ? u_xlat16_13.xyz : _directSepcularColorNonSilk.xyz;
    u_xlat16_78 = (u_xlatb3.y) ? u_xlat16_78 : 0.0;
    u_xlat27.xyz = vec3(u_xlat16_78) * u_xlat7.xyz + u_xlat2.zxy;
    u_xlat2.xyz = vec3(u_xlat16_78) * u_xlat16_12.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27.xyz = u_xlat1.xxx * u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat16_10.xyz);
    u_xlat16_78 = (u_xlatb3.x) ? u_xlat16_82 : 0.0;
    u_xlat74 = (-u_xlat16_78) + 1.0;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_82 = (u_xlatb3.x) ? _SilkRoughness : u_xlat16_12.x;
    u_xlat16_83 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_83;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat8.z = u_xlat1.x * u_xlat74;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_10.xyz);
    u_xlat1.x = u_xlat16_78 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_83;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat8.y = u_xlat16_12.x * u_xlat1.x;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat8.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat32.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat32.xyz * u_xlat16_12.xxx;
    u_xlat79 = dot(u_xlat27.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat74 * u_xlat79;
    u_xlat79 = dot(u_xlat25.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat1.x * u_xlat79;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat3.x = u_xlat79 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat16.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat16.xyz = vec3(u_xlat57) * u_xlat16.xyz;
    u_xlat57 = dot(u_xlat27.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat57;
    u_xlat16_60 = dot(u_xlat25.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat74 * u_xlat16_60;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat16.x = u_xlat74 * u_xlat1.x;
    u_xlat17.z = u_xlat57 * u_xlat16.x;
    u_xlat57 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat16.x / u_xlat57;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat40 = u_xlat16.x * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat40;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat57;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat57 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_36.xyz = u_xlat16_12.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = vec3(u_xlat57) * u_xlat16_36.xyz;
    u_xlat57 = u_xlat16_36.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat17.xyz;
    u_xlat17.xyz = u_xlat3.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat8.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat16_11.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat21.xyz = u_xlat32.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat21.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_10.x = dot(u_xlat25.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat74 * u_xlat16_10.x;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat22.z = u_xlat3.x * u_xlat16.x;
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat16.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat64 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat74 * u_xlat64;
    u_xlat16_10.x = dot(u_xlat25.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_10.x;
    u_xlat21.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat21.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat79 * u_xlat64 + 6.10351563e-05;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat3.x = u_xlat3.x * u_xlat64;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat81 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat45.xyz = u_xlat16_36.xyz * vec3(u_xlat81);
    u_xlat45.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat45.xyz;
    u_xlat45.xyz = u_xlat3.xxx * u_xlat45.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_13.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat21.xxx * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat45.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat17.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb3.x = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (u_xlatb3.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_23.xyz;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat32.xyz = u_xlat3.xxx * u_xlat32.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat32.xyz);
    u_xlat27.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
    u_xlat17.z = u_xlat74 * u_xlat27.x;
    u_xlat3.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat32.xyz);
    u_xlat3.x = u_xlat74 * u_xlat16_12.x;
    u_xlat74 = dot(u_xlat7.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_19.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_12.x) + 1.0;
    u_xlat3.z = u_xlat74 * u_xlat16.x;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat16.x / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat40 * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_19.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat16_12.x;
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat17.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat79 * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat74;
    u_xlat16_86 = u_xlat75 * u_xlat75;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_90 = u_xlat75 * u_xlat16_86;
    u_xlat74 = (-u_xlat16_86) * u_xlat75 + 1.0;
    u_xlat3.xyz = u_xlat16_36.xyz * vec3(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat57) * vec3(u_xlat16_90) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat17.xxx * u_xlat3.xyz;
    u_xlat16_13.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_13.x = max(u_xlat16_20.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_37.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * u_xlat24.yyy + u_xlat16_10.xyz;
    u_xlat16_12.x = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_12.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat21.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat17.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xxx;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_12.x * 0.5 + 0.5;
    u_xlat16_13.x = (-u_xlat16_12.x) + u_xlat16_13.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_13.x + u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat0.xy = min(u_xlat0.xw, u_xlat16_12.xx);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_20.y = u_xlat16_11.y;
    u_xlat16_23.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_20.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_23.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_12.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat25.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat5.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_83 * 8.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_78) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat7.xyz;
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
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
    u_xlat25.xyz = u_xlat5.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_83) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_78)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_78 = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_82 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_78);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_12.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat9.y = u_xlat16_82;
    u_xlat16_37.x = u_xlat9.y * 1.09769487;
    u_xlat16_37.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.xyz = min(max(u_xlat16_37.xyz, 0.0), 1.0);
#else
    u_xlat16_37.xyz = clamp(u_xlat16_37.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_37.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_78 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_78 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_78 = u_xlat16_37.z * 15.0 + (-u_xlat16_78);
    u_xlat16_82 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82 + u_xlat16_48;
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_78;
    u_xlat0.x = u_xlat1.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.y * 0.5;
    u_xlat16_82 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_78 = u_xlat0.x * u_xlat16_82 + u_xlat16_78;
    u_xlat16_82 = u_xlat16_78 + u_xlat16_78;
    u_xlat16_83 = (-u_xlat16_78) * 2.0 + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_83 + u_xlat16_82;
    u_xlat16_78 = u_xlat0.y * u_xlat16_78;
    u_xlat16_78 = min(u_xlat16_4.z, u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_78 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 + u_xlat16_15.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_15.w;
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
out mediump float vs_TEXCOORD5;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _Angle;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _SilkRoughness;
uniform 	mediump vec4 _directSepcularColorNonSilk;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
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
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _DirectionTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SilkAnisotropyTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
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
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
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
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat27;
vec3 u_xlat28;
vec3 u_xlat32;
mediump float u_xlat16_34;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_37;
mediump vec2 u_xlat16_38;
float u_xlat40;
vec3 u_xlat45;
mediump float u_xlat16_48;
int u_xlati48;
float u_xlat57;
mediump float u_xlat16_60;
float u_xlat64;
float u_xlat74;
float u_xlat75;
float u_xlat77;
mediump float u_xlat16_78;
float u_xlat79;
float u_xlat81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_90;
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
    u_xlat28.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat28.xyz = u_xlat28.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat77 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat16_6.xyz;
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
    u_xlat77 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat77 = max(u_xlat77, 1.17549435e-38);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat7.xyz = vec3(u_xlat77) * u_xlat5.xyz;
    u_xlat28.x = dot(u_xlat7.xyz, u_xlat28.xyz);
    u_xlat28.x = (-u_xlat28.x) * u_xlat28.x + 1.0;
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x * _ShadowBias.z;
    u_xlat28.xyz = (-u_xlat7.xyz) * u_xlat28.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat28.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat25.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat25.x = (-u_xlat1.x) + u_xlat25.x;
    u_xlat0.z = _ShadowBias.y * u_xlat25.x + u_xlat1.x;
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
    u_xlat24.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat24.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_78 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_78 = max(u_xlat16_78, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_78 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_34 = float(1.0) / float(u_xlat16_78);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_78);
    u_xlat16_78 = u_xlat16_10.x * u_xlat16_34;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_78 = max(u_xlat16_78, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_82 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
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
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82;
    u_xlat16_11.xyz = vec3(u_xlat16_78) * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb1 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD2.w;
    u_xlat16_78 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_12.xyz = vec3(u_xlat16_78) * vs_TEXCOORD1.yzx;
    u_xlat16_78 = dot(vs_TEXCOORD2.yzx, u_xlat16_12.xyz);
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) * vec3(u_xlat16_78) + vs_TEXCOORD2.yzx;
    u_xlat25.x = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat25.x = max(u_xlat25.x, 1.17549435e-38);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat16_13.xyz;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat16_12.zxy;
    u_xlat2.xyz = u_xlat16_12.yzx * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = _Angle * 0.0174532942;
    u_xlat16_13.x = sin((-u_xlat16_78));
    u_xlat16_14.x = sin(u_xlat16_78);
    u_xlat16_15.x = cos(u_xlat16_78);
    u_xlat16_3 = texture(_DirectionTex, vs_TEXCOORD3.xy);
    u_xlat16_4.xy = u_xlat16_3.yx + u_xlat16_3.yx;
    u_xlat16_4.zw = u_xlat16_4.xy * vec2(-1.0, 1.0) + vec2(1.0, -1.0);
    u_xlat16_38.xy = u_xlat16_4.xw * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_13.y = u_xlat16_15.x;
    u_xlat16_13.z = u_xlat16_14.x;
    u_xlat74 = dot(u_xlat16_13.yz, u_xlat16_4.zw);
    u_xlat3.x = dot(u_xlat16_13.xy, u_xlat16_38.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxx;
    u_xlat25.xyz = vec3(u_xlat74) * u_xlat25.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat25.zxy, u_xlat7.xyz);
    u_xlat25.xyz = (-u_xlat7.yzx) * u_xlat2.xxx + u_xlat25.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat2.xxx;
    u_xlat2.xyz = u_xlat25.yzx * u_xlat7.xyz;
    u_xlat2.xyz = u_xlat7.zxy * u_xlat25.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_78 = vs_TEXCOORD5 + _sunShiftOffset;
    u_xlat16_1 = texture(_SilkAnisotropyTex, vs_TEXCOORD3.xy).x;
    u_xlat16_78 = u_xlat16_1 * u_xlat16_78;
    u_xlat16_82 = u_xlat16_1 * _anisotropicMultiplier;
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), u_xlat16_3.zzzz).xy;
    u_xlat16_13.xyz = u_xlat16_3.www * _directSpecularColor.xyz;
    u_xlat16_13.xyz = (u_xlatb3.y) ? u_xlat16_13.xyz : _directSepcularColorNonSilk.xyz;
    u_xlat16_78 = (u_xlatb3.y) ? u_xlat16_78 : 0.0;
    u_xlat27.xyz = vec3(u_xlat16_78) * u_xlat7.xyz + u_xlat2.zxy;
    u_xlat2.xyz = vec3(u_xlat16_78) * u_xlat16_12.xyz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27.xyz = u_xlat1.xxx * u_xlat27.xyz;
    u_xlat1.x = dot(u_xlat27.xyz, u_xlat16_10.xyz);
    u_xlat16_78 = (u_xlatb3.x) ? u_xlat16_82 : 0.0;
    u_xlat74 = (-u_xlat16_78) + 1.0;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xy = u_xlat16_4.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_82 = (u_xlatb3.x) ? _SilkRoughness : u_xlat16_12.x;
    u_xlat16_83 = u_xlat16_82 * u_xlat16_82;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat74 = u_xlat74 * u_xlat16_83;
    u_xlat74 = max(u_xlat74, 0.00100000005);
    u_xlat8.z = u_xlat1.x * u_xlat74;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_10.xyz);
    u_xlat1.x = u_xlat16_78 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat16_83;
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat8.y = u_xlat16_12.x * u_xlat1.x;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat8.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat32.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_14.xyz = u_xlat32.xyz * u_xlat16_12.xxx;
    u_xlat79 = dot(u_xlat27.xyz, u_xlat16_14.xyz);
    u_xlat9.z = u_xlat74 * u_xlat79;
    u_xlat79 = dot(u_xlat25.zxy, u_xlat16_14.xyz);
    u_xlat9.y = u_xlat1.x * u_xlat79;
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat9.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat3.x = u_xlat79 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat16.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat16.xyz = vec3(u_xlat57) * u_xlat16.xyz;
    u_xlat57 = dot(u_xlat27.xyz, u_xlat16.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat57;
    u_xlat16_60 = dot(u_xlat25.zxy, u_xlat16.xyz);
    u_xlat17.x = u_xlat74 * u_xlat16_60;
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat16.x = u_xlat74 * u_xlat1.x;
    u_xlat17.z = u_xlat57 * u_xlat16.x;
    u_xlat57 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat57 = max(u_xlat57, 6.10351563e-05);
    u_xlat57 = u_xlat16.x / u_xlat57;
    u_xlat57 = u_xlat57 * u_xlat57;
    u_xlat40 = u_xlat16.x * 0.318309873;
    u_xlat57 = u_xlat57 * u_xlat40;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat3.x = u_xlat3.x * u_xlat57;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat57 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat16_15 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_18.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_15.xyz * u_xlat16_18.xyz;
    u_xlat16_19.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_19.xyz = u_xlat16_4.www * u_xlat16_19.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_20.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_36.xyz = u_xlat16_12.yyy * u_xlat16_20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat17.xyz = vec3(u_xlat57) * u_xlat16_36.xyz;
    u_xlat57 = u_xlat16_36.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat17.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat17.xyz;
    u_xlat17.xyz = u_xlat3.xxx * u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat17.xyz = min(max(u_xlat17.xyz, 0.0), 1.0);
#else
    u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
#endif
    u_xlat17.xyz = u_xlat16_13.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat8.xxx * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat16_11.xyz * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat24.xxx * u_xlat17.xyz;
    u_xlat21.xyz = u_xlat32.xyz * u_xlat16_12.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat21.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat21.xyz);
    u_xlat22.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_10.x = dot(u_xlat25.zxy, u_xlat21.xyz);
    u_xlat22.x = u_xlat74 * u_xlat16_10.x;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat16_10.x) + 1.0;
    u_xlat22.z = u_xlat3.x * u_xlat16.x;
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat3.x = max(u_xlat3.x, 6.10351563e-05);
    u_xlat3.x = u_xlat16.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat64 = dot(u_xlat27.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.z = u_xlat74 * u_xlat64;
    u_xlat16_10.x = dot(u_xlat25.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.y = u_xlat1.x * u_xlat16_10.x;
    u_xlat21.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat64 + u_xlat21.x;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat79 * u_xlat64 + 6.10351563e-05;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat3.x = u_xlat3.x * u_xlat64;
    u_xlat16_10.x = u_xlat81 * u_xlat81;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat81 * u_xlat16_10.x;
    u_xlat16_34 = u_xlat81 * u_xlat16_10.x;
    u_xlat81 = (-u_xlat16_10.x) * u_xlat81 + 1.0;
    u_xlat45.xyz = u_xlat16_36.xyz * vec3(u_xlat81);
    u_xlat45.xyz = vec3(u_xlat57) * vec3(u_xlat16_34) + u_xlat45.xyz;
    u_xlat45.xyz = u_xlat3.xxx * u_xlat45.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_13.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat21.xxx * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat45.xyz * u_xlat16_6.xyz + u_xlat17.xyz;
    u_xlat17.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_19.xyz = vec3(u_xlat16_86) * u_xlat17.xyz;
    u_xlat16_86 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.00100000005>=abs(u_xlat16_86));
#else
    u_xlatb3.x = 0.00100000005>=abs(u_xlat16_86);
#endif
    u_xlat16_20.xy = (u_xlatb3.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_20.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_20.yyy + u_xlat16_23.xyz;
    u_xlat32.xyz = u_xlat32.xyz * u_xlat16_12.xxx + u_xlat16_19.xyz;
    u_xlat3.x = dot(u_xlat32.xyz, u_xlat32.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat32.xyz = u_xlat3.xxx * u_xlat32.xyz;
    u_xlat3.x = dot(u_xlat27.xyz, u_xlat32.xyz);
    u_xlat27.x = dot(u_xlat27.xyz, u_xlat16_19.xyz);
    u_xlat17.z = u_xlat74 * u_xlat27.x;
    u_xlat3.y = u_xlat1.x * u_xlat3.x;
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat32.xyz);
    u_xlat3.x = u_xlat74 * u_xlat16_12.x;
    u_xlat74 = dot(u_xlat7.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat74 = min(max(u_xlat74, 0.0), 1.0);
#else
    u_xlat74 = clamp(u_xlat74, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(u_xlat16_19.xyz, u_xlat32.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_12.x) + 1.0;
    u_xlat3.z = u_xlat74 * u_xlat16.x;
    u_xlat74 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat74 = max(u_xlat74, 6.10351563e-05);
    u_xlat74 = u_xlat16.x / u_xlat74;
    u_xlat74 = u_xlat74 * u_xlat74;
    u_xlat74 = u_xlat40 * u_xlat74;
    u_xlat74 = min(u_xlat74, 16.0);
    u_xlat16_12.x = dot(u_xlat25.zxy, u_xlat16_19.xyz);
    u_xlat17.y = u_xlat1.x * u_xlat16_12.x;
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_19.xyz);
    u_xlat16_12.x = u_xlat16_12.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat1.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + u_xlat17.x;
    u_xlat1.x = u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = u_xlat79 * u_xlat1.x + 6.10351563e-05;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat74;
    u_xlat16_86 = u_xlat75 * u_xlat75;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_86 = u_xlat75 * u_xlat16_86;
    u_xlat16_90 = u_xlat75 * u_xlat16_86;
    u_xlat74 = (-u_xlat16_86) * u_xlat75 + 1.0;
    u_xlat3.xyz = u_xlat16_36.xyz * vec3(u_xlat74);
    u_xlat3.xyz = vec3(u_xlat57) * vec3(u_xlat16_90) + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat17.xxx * u_xlat3.xyz;
    u_xlat16_13.x = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_85);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_37.x;
    u_xlat16_13.x = max(u_xlat16_20.x, u_xlat16_13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_37.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12.x = max(u_xlat16_12.x, u_xlat16_37.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat16_12.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * u_xlat24.yyy + u_xlat16_10.xyz;
    u_xlat16_12.x = (-u_xlat16_4.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_12.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat21.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat24.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat17.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat77) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xxx;
    u_xlat16_12.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_12.x * 0.5 + 0.5;
    u_xlat16_13.x = (-u_xlat16_12.x) + u_xlat16_13.x;
    u_xlat16_37.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_37.z = _occlusionScale * u_xlat16_37.x + 1.0;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_13.x + u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_37.z * u_xlat16_12.x;
    u_xlat16_13.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = u_xlat16_13.x + -1.0;
    u_xlat16_13.x = _occlusionScale * u_xlat16_13.x + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_13.x;
    u_xlat0.xy = min(u_xlat0.xw, u_xlat16_12.xx);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat0.xxx * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat0.xxx * u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat0.xxx + (-u_xlat16_20.xyz);
    u_xlat16_20.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat0.xxx + u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_20.y = u_xlat16_11.y;
    u_xlat16_23.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_20.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_20.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_23.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati48 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_23.xyz;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_20.xyw;
    u_xlat16_23.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_12.x = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_23.xyz;
    u_xlat16_6.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_78>=0.0);
#else
    u_xlatb1 = u_xlat16_78>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb1)) ? u_xlat0.xzw : u_xlat25.xyz;
    u_xlat1.xyz = u_xlat16_14.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_14.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat2.xyz);
    u_xlat0.xzw = (-u_xlat5.xyz) * vec3(u_xlat77) + u_xlat0.xzw;
    u_xlat16_86 = u_xlat16_83 * 8.0;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = max(u_xlat16_83, 0.0078125);
    u_xlat16_86 = min(u_xlat16_86, 1.0);
    u_xlat16_86 = abs(u_xlat16_78) * u_xlat16_86;
    u_xlat0.xzw = vec3(u_xlat16_86) * u_xlat0.xzw + u_xlat7.xyz;
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
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
    u_xlat25.xyz = u_xlat5.xyz * vec3(u_xlat77) + (-u_xlat0.xzw);
    u_xlat25.xyz = vec3(u_xlat16_83) * u_xlat25.xyz + u_xlat0.xzw;
    u_xlat2.xyz = u_xlat0.xzw + (-u_xlat25.xyz);
    u_xlat25.xyz = abs(vec3(u_xlat16_78)) * u_xlat2.xyz + u_xlat25.xyz;
    u_xlat16_78 = -abs(u_xlat16_78) * 0.800000012 + 1.0;
    u_xlat16_78 = u_xlat16_82 * u_xlat16_78;
    u_xlat16_78 = u_xlat16_78 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_78);
    u_xlat0.x = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_37.y = u_xlat0.x * 0.5;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat25.xz);
    u_xlat25.z = dot(_IndirectCubemapRotationParams.zw, u_xlat25.xz);
    u_xlat25.x = u_xlat16_11.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat25.xyz, u_xlat16_78);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = u_xlat16_12.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_11.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_11.xyz;
    u_xlat9.y = u_xlat16_82;
    u_xlat16_37.x = u_xlat9.y * 1.09769487;
    u_xlat16_37.xyz = u_xlat16_37.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.xyz = min(max(u_xlat16_37.xyz, 0.0), 1.0);
#else
    u_xlat16_37.xyz = clamp(u_xlat16_37.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_36.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_2.yzw = u_xlat16_37.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_78 = floor(u_xlat16_2.w);
    u_xlat16_82 = u_xlat16_78 + 1.0;
    u_xlat16_82 = min(u_xlat16_82, 15.0);
    u_xlat16_2.x = u_xlat16_82 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_78 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_48 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_78 = u_xlat16_37.z * 15.0 + (-u_xlat16_78);
    u_xlat16_82 = (-u_xlat16_48) + u_xlat16_0.x;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_82 + u_xlat16_48;
    u_xlat16_78 = u_xlat16_13.x * u_xlat16_78;
    u_xlat0.x = u_xlat1.x * u_xlat16_78;
    u_xlat16_78 = u_xlat0.y * 0.5;
    u_xlat16_82 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_78 = u_xlat0.x * u_xlat16_82 + u_xlat16_78;
    u_xlat16_82 = u_xlat16_78 + u_xlat16_78;
    u_xlat16_83 = (-u_xlat16_78) * 2.0 + 1.0;
    u_xlat16_78 = u_xlat16_78 * u_xlat16_83 + u_xlat16_82;
    u_xlat16_78 = u_xlat0.y * u_xlat16_78;
    u_xlat16_78 = min(u_xlat16_4.z, u_xlat16_78);
    u_xlat16_11.xyz = vec3(u_xlat16_78) * u_xlat16_11.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    u_xlat16_78 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 + u_xlat16_15.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_78 : u_xlat16_15.w;
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
  GpuProgramID 123801
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_Silk_FlowmapGUI"
}