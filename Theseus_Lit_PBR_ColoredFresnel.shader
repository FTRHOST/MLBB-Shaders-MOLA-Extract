//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_ColoredFresnel" {
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

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Tex] _ColoredFresnelMap ("彩色菲涅尔贴图: RGB: 颜色;", 2D) = "white" { }

[Tex] _FresnelMask ("R: 擦除遮罩; G: 绘制遮罩;", 2D) = "white" { }

_FresnelColor ("菲涅尔颜色", Color) = (0,0,0,0)

_FresnelVector ("菲涅尔数据", Vector) = (1,0,0,0)

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_LaserRamp ("镭射Ramp", 2D) = "black" { }

_LaserMask ("R:镭射遮罩 G:Ramp索引", 2D) = "white" { }

_LaserColor ("镭射颜色", Color) = (1,1,1,1)

_LaserRampIntensity ("镭射强度", Float) = 1.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_shadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 34756
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserMask;
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
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_26;
int u_xlati26;
mediump vec2 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
float u_xlat44;
mediump float u_xlat16_49;
float u_xlat60;
bool u_xlatb60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat66;
bool u_xlatb66;
mediump float u_xlat16_67;
float u_xlat69;
float u_xlat70;
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
    u_xlat16_21.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21.x = (-u_xlat16_21.x) * u_xlat16_21.x + 1.0;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_41 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21.x * u_xlat16_41;
    u_xlat16_21.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_21.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_21.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_21.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * u_xlat16_21.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
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
    u_xlat16_22 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_22, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_21.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat60 * u_xlat60;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_3.x = u_xlat60 * u_xlat16_62;
    u_xlat60 = (-u_xlat16_62) * u_xlat60 + 1.0;
    u_xlat16_5.x = 0.0;
    u_xlat16_6.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.y = u_xlat16_6.y * _LaserRamp_ST.y;
    u_xlat16_23.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_26.xyz = texture(_LaserRamp, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_26.zxy * _LaserColor.zxy;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_23.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = u_xlat16_62 * u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_23.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_7.xyz;
    u_xlat60 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat13.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_11.xyz, u_xlat10.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat12.y = u_xlat13.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_11.xyz, u_xlat12.xyz);
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_11.xyz, u_xlat13.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat66 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat66 = u_xlat6.x * u_xlat66 + u_xlat16_21.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat6.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat13.x) * u_xlat16_21.x + u_xlat13.x;
    u_xlat69 = u_xlat13.x * u_xlat69 + u_xlat16_21.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat13.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat69;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat6.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat14.xyz = vec3(u_xlat44) * u_xlat14.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat44 * u_xlat44;
    u_xlat66 = u_xlat66 * u_xlat24 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_21.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat72 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat72);
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat14.xyz;
    u_xlat70 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat70) * u_xlat16_21.x + u_xlat70;
    u_xlat72 = u_xlat70 * u_xlat72 + u_xlat16_21.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat70 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat69 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat70) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_62 = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_16.xyz = vec3(u_xlat16_41) * u_xlat9.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_17.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_17.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelVector.zw;
    u_xlat66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat66) * u_xlat9.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat24 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_21.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat9.x = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat29.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat29.x * u_xlat29.x;
    u_xlat16_1.x = u_xlat29.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat29.x * u_xlat16_1.x;
    u_xlat16_41 = u_xlat29.x * u_xlat16_1.x;
    u_xlat29.x = (-u_xlat16_1.x) * u_xlat29.x + 1.0;
    u_xlat14.xyz = u_xlat16_7.xyz * u_xlat29.xxx;
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat14.xyz;
    u_xlat60 = (-u_xlat9.x) * u_xlat16_21.x + u_xlat9.x;
    u_xlat60 = u_xlat9.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat9.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat69;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat66;
    u_xlat29.xyz = u_xlat14.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.zxy;
    u_xlat29.xyz = u_xlat9.xxx * u_xlat29.xyz;
    u_xlat29.xyz = u_xlat16_17.xyz * u_xlat29.xyz;
    u_xlat16_1.xzw = u_xlat29.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat9.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_62 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz;
    u_xlat16_62 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_62) + u_xlat16_63;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_63 + u_xlat16_62;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat60 = min(u_xlat16_62, 1.0);
    u_xlat6.x = min(u_xlat60, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat6.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat6.xxx * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat6.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_63) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati26 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_62 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat6.xyw = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat6.xyw);
    u_xlat9.x = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_11.w);
    u_xlat16_23.x = u_xlat16_3.x + 1.0;
    u_xlat16_23.x = min(u_xlat16_23.x, 15.0);
    u_xlat16_11.x = u_xlat16_23.x * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_11.x = u_xlat16_3.x * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_49 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_23.x = (-u_xlat16_49) + u_xlat16_29;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_23.x + u_xlat16_49;
    u_xlat16_3.x = u_xlat16_63 * u_xlat16_3.x;
    u_xlat9.x = u_xlat9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat60 * 0.5;
    u_xlat16_23.x = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat9.x * u_xlat16_23.x + u_xlat16_3.x;
    u_xlat16_23.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_43 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat60 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_6.z);
    u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat6.xyw);
    u_xlat6.xyz = u_xlat16_21.xxx * u_xlat9.xyz + u_xlat6.xyw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat11.y = u_xlat6.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_23.xyz = u_xlat16_7.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_21.x);
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_62) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb60 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb60)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.yzx * u_xlat16_7.yzx + u_xlat16_1.zwx;
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
    u_xlat16_21.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.zxy * _emissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_41 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_41;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_20.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_41 = u_xlat0.x * u_xlat16_20.x + u_xlat16_20.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(u_xlat16_41);
    u_xlat16_2.xyz = u_xlat16_3.xyz * _FresnelColor.zxy + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_6.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat16_6.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
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
    u_xlat60 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat2.x = u_xlat60 * 0.0625 + u_xlat2.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_20.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_21.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserMask;
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
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_26;
int u_xlati26;
mediump vec2 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_29;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
float u_xlat44;
mediump float u_xlat16_49;
float u_xlat60;
bool u_xlatb60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat66;
bool u_xlatb66;
mediump float u_xlat16_67;
float u_xlat69;
float u_xlat70;
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
    u_xlat16_21.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21.x = (-u_xlat16_21.x) * u_xlat16_21.x + 1.0;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_41 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_21.x * u_xlat16_41;
    u_xlat16_21.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_21.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_21.x);
#endif
    u_xlat16_21.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_21.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_21.xyz = u_xlat16_2.xyz * u_xlat16_21.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_21.xyz);
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
    u_xlat16_22 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_22, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_21.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_62 = dot(u_xlat16_21.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat60 * u_xlat60;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_62 = u_xlat60 * u_xlat16_62;
    u_xlat16_3.x = u_xlat60 * u_xlat16_62;
    u_xlat60 = (-u_xlat16_62) * u_xlat60 + 1.0;
    u_xlat16_5.x = 0.0;
    u_xlat16_6.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.y = u_xlat16_6.y * _LaserRamp_ST.y;
    u_xlat16_23.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_26.xyz = texture(_LaserRamp, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_26.zxy * _LaserColor.zxy;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_23.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = u_xlat16_62 * u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_23.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_7.xyz;
    u_xlat60 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat13.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_11.xyz, u_xlat10.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat12.y = u_xlat13.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_11.xyz, u_xlat12.xyz);
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_11.xyz, u_xlat13.xyz);
    u_xlat64 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat10.xyz;
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = max(u_xlat16_21.x, 0.0078125);
    u_xlat66 = (-u_xlat6.x) * u_xlat16_21.x + u_xlat6.x;
    u_xlat66 = u_xlat6.x * u_xlat66 + u_xlat16_21.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat6.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat13.x) * u_xlat16_21.x + u_xlat13.x;
    u_xlat69 = u_xlat13.x * u_xlat69 + u_xlat16_21.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat13.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat66 = u_xlat66 * u_xlat69;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_21.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_21.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat66 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat6.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat14.xyz = vec3(u_xlat44) * u_xlat14.xyz;
    u_xlat16_41 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat44 * u_xlat44;
    u_xlat66 = u_xlat66 * u_xlat24 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_21.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat72 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat72);
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat14.xyz;
    u_xlat70 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat70) * u_xlat16_21.x + u_xlat70;
    u_xlat72 = u_xlat70 * u_xlat72 + u_xlat16_21.x;
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat70 + u_xlat72;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat72 = u_xlat69 * u_xlat72;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat66 = u_xlat66 * u_xlat72;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat66);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat70) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_41 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_41 = max(u_xlat16_41, 6.10351563e-05);
    u_xlat16_61 = u_xlat16_41 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_61 = (-u_xlat16_61) * u_xlat16_61 + 1.0;
    u_xlat16_61 = max(u_xlat16_61, 0.0);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_62 = float(1.0) / float(u_xlat16_41);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_16.xyz = vec3(u_xlat16_41) * u_xlat9.xyz;
    u_xlat16_41 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_61 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_61));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_61);
#endif
    u_xlat16_17.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_41 = max(u_xlat16_41, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_61 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_61 = u_xlat16_61 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_62 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_62);
    u_xlat16_41 = u_xlat16_61 * u_xlat16_41;
    u_xlat16_17.xyz = vec3(u_xlat16_41) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelVector.zw;
    u_xlat66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat66) * u_xlat9.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat66 = dot(u_xlat12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat66 * u_xlat24 + 1.0;
    u_xlat66 = u_xlat66 * u_xlat66;
    u_xlat66 = u_xlat16_21.x / u_xlat66;
    u_xlat66 = u_xlat66 * 0.318309873;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat9.x = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat29.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat29.x * u_xlat29.x;
    u_xlat16_1.x = u_xlat29.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat29.x * u_xlat16_1.x;
    u_xlat16_41 = u_xlat29.x * u_xlat16_1.x;
    u_xlat29.x = (-u_xlat16_1.x) * u_xlat29.x + 1.0;
    u_xlat14.xyz = u_xlat16_7.xyz * u_xlat29.xxx;
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_41) + u_xlat14.xyz;
    u_xlat60 = (-u_xlat9.x) * u_xlat16_21.x + u_xlat9.x;
    u_xlat60 = u_xlat9.x * u_xlat60 + u_xlat16_21.x;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 + u_xlat9.x;
    u_xlat60 = u_xlat60 + 6.10351563e-05;
    u_xlat60 = u_xlat60 * u_xlat69;
    u_xlat60 = float(1.0) / u_xlat60;
    u_xlat60 = min(u_xlat60, 16.0);
    u_xlat60 = u_xlat60 * u_xlat66;
    u_xlat29.xyz = u_xlat14.xyz * vec3(u_xlat60);
#ifdef UNITY_ADRENO_ES3
    u_xlat29.xyz = min(max(u_xlat29.xyz, 0.0), 1.0);
#else
    u_xlat29.xyz = clamp(u_xlat29.xyz, 0.0, 1.0);
#endif
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.zxy;
    u_xlat29.xyz = u_xlat9.xxx * u_xlat29.xyz;
    u_xlat29.xyz = u_xlat16_17.xyz * u_xlat29.xyz;
    u_xlat16_1.xzw = u_xlat29.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * u_xlat9.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_62 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz;
    u_xlat16_62 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_62 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_62) + u_xlat16_63;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_63 + u_xlat16_62;
    u_xlat16_62 = u_xlat16_8.w * u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat60 = min(u_xlat16_62, 1.0);
    u_xlat6.x = min(u_xlat60, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat6.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat6.xxx * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat6.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati6.xyw = ivec3(uvec3(lessThan(u_xlat16_18.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_63) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati26 = (u_xlati6.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_62 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat6.xyw = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat6.xyw);
    u_xlat9.x = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_11.w);
    u_xlat16_23.x = u_xlat16_3.x + 1.0;
    u_xlat16_23.x = min(u_xlat16_23.x, 15.0);
    u_xlat16_11.x = u_xlat16_23.x * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_11.x = u_xlat16_3.x * 16.0 + u_xlat16_11.z;
    u_xlat16_28.xy = u_xlat16_11.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_49 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_23.x = (-u_xlat16_49) + u_xlat16_29;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_23.x + u_xlat16_49;
    u_xlat16_3.x = u_xlat16_63 * u_xlat16_3.x;
    u_xlat9.x = u_xlat9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat60 * 0.5;
    u_xlat16_23.x = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat9.x * u_xlat16_23.x + u_xlat16_3.x;
    u_xlat16_23.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_43 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat60 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_6.z);
    u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat6.xyw);
    u_xlat6.xyz = u_xlat16_21.xxx * u_xlat9.xyz + u_xlat6.xyw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat11.y = u_xlat6.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_21.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_23.xyz = u_xlat16_7.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_21.x);
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_62) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb60 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb60)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_23.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.yzx * u_xlat16_7.yzx + u_xlat16_1.zwx;
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
    u_xlat16_21.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.zxy * _emissiveColor.zxy;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_41 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_41;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_20.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_41 = u_xlat0.x * u_xlat16_20.x + u_xlat16_20.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(u_xlat16_41);
    u_xlat16_2.xyz = u_xlat16_3.xyz * _FresnelColor.zxy + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_6.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat16_6.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
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
    u_xlat60 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat2.x = u_xlat60 * 0.0625 + u_xlat2.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_20.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_21.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(15) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(16) uniform mediump sampler2D _LaserMask;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
float u_xlat20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
int u_xlati38;
float u_xlat41;
mediump float u_xlat16_48;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
bool u_xlatb58;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat7.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _shadowStrength;
    u_xlat19 = u_xlat16_19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_12.x = 0.0;
    u_xlat16_21.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.y = u_xlat16_21.y * _LaserRamp_ST.y;
    u_xlat16_10.xz = u_xlat16_12.xy + _LaserRamp_ST.zw;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat16_3.zxy * _LaserColor.zxy;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.zwx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_68 = u_xlat16_21.x * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat59 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat16_29.xxx + u_xlat2.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat3.x = (-u_xlat57) * u_xlat16_29.x + u_xlat57;
    u_xlat3.x = u_xlat57 * u_xlat3.x + u_xlat16_29.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat57 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_29.x + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_29.x;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat3.y = u_xlat22 + u_xlat9.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat41 = u_xlat16_29.x + -1.0;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat58 = u_xlat3.x * u_xlat58;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat58 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat3.x = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat3.x;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat4.x = (-u_xlat16_68) * u_xlat3.x + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat4.xxx;
    u_xlat14.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat3.x) * u_xlat16_29.x + u_xlat3.x;
    u_xlat4.x = u_xlat3.x * u_xlat4.x + u_xlat16_29.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat3.x + u_xlat4.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat3.y * u_xlat4.x;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58 = u_xlat58 * u_xlat4.x;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat3.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_63) + _FresnelVector.zw;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat21.x * u_xlat21.x;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_68 = u_xlat21.x * u_xlat16_63;
    u_xlat21.x = (-u_xlat16_63) * u_xlat21.x + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat21.xxx;
    u_xlat21.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat41 = (-u_xlat2.x) * u_xlat16_29.x + u_xlat2.x;
    u_xlat41 = u_xlat2.x * u_xlat41 + u_xlat16_29.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat2.x + u_xlat41;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat22 = u_xlat41 * u_xlat3.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = min(u_xlat22, 16.0);
    u_xlat58 = u_xlat58 * u_xlat22;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.zxy;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_17.xyz * u_xlat21.xyz;
    u_xlat16_15.xyz = u_xlat21.xyz * vec3(u_xlat19) + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_22) + u_xlat16_3.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_22;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat58 = u_xlat58 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat58 * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_4.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_12.yzx + u_xlat16_15.yzx;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_29.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_19.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_29.x = u_xlat0.x * u_xlat16_19.x + u_xlat16_19.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.zxy * u_xlat16_29.xxx;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _FresnelColor.zxy + u_xlat16_6.xyz;
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
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_19.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_63 : u_xlat16_10.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(15) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(16) uniform mediump sampler2D _LaserMask;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
float u_xlat20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
int u_xlati38;
float u_xlat41;
mediump float u_xlat16_48;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
bool u_xlatb58;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat7.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _shadowStrength;
    u_xlat19 = u_xlat16_19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_12.x = 0.0;
    u_xlat16_21.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.y = u_xlat16_21.y * _LaserRamp_ST.y;
    u_xlat16_10.xz = u_xlat16_12.xy + _LaserRamp_ST.zw;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat16_3.zxy * _LaserColor.zxy;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.zwx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_68 = u_xlat16_21.x * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat59 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat16_29.xxx + u_xlat2.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat3.x = (-u_xlat57) * u_xlat16_29.x + u_xlat57;
    u_xlat3.x = u_xlat57 * u_xlat3.x + u_xlat16_29.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat57 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_29.x + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_29.x;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat3.y = u_xlat22 + u_xlat9.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat41 = u_xlat16_29.x + -1.0;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat58 = u_xlat3.x * u_xlat58;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat58 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat3.x = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat3.x;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat4.x = (-u_xlat16_68) * u_xlat3.x + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat4.xxx;
    u_xlat14.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat3.x) * u_xlat16_29.x + u_xlat3.x;
    u_xlat4.x = u_xlat3.x * u_xlat4.x + u_xlat16_29.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat3.x + u_xlat4.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat3.y * u_xlat4.x;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58 = u_xlat58 * u_xlat4.x;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = u_xlat3.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_63) + _FresnelVector.zw;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat21.x * u_xlat21.x;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_68 = u_xlat21.x * u_xlat16_63;
    u_xlat21.x = (-u_xlat16_63) * u_xlat21.x + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat21.xxx;
    u_xlat21.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat41 = (-u_xlat2.x) * u_xlat16_29.x + u_xlat2.x;
    u_xlat41 = u_xlat2.x * u_xlat41 + u_xlat16_29.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat2.x + u_xlat41;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat22 = u_xlat41 * u_xlat3.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = min(u_xlat22, 16.0);
    u_xlat58 = u_xlat58 * u_xlat22;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.zxy;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_17.xyz * u_xlat21.xyz;
    u_xlat16_15.xyz = u_xlat21.xyz * vec3(u_xlat19) + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_22) + u_xlat16_3.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_22;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat58 = u_xlat58 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat58 * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_4.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_12.yzx + u_xlat16_15.yzx;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_12.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_29.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_19.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_29.x = u_xlat0.x * u_xlat16_19.x + u_xlat16_19.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.zxy * u_xlat16_29.xxx;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _FresnelColor.zxy + u_xlat16_6.xyz;
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
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
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
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_19.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_63 : u_xlat16_10.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat27;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat44;
float u_xlat45;
int u_xlati45;
float u_xlat51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_62;
int u_xlati62;
mediump float u_xlat16_63;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
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
    u_xlat16_52 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat7.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat56);
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat58) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat5 = (-u_xlat58) * u_xlat16_52 + u_xlat58;
    u_xlat5 = u_xlat58 * u_xlat5 + u_xlat16_52;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat10.x = u_xlat5 + u_xlat58;
    u_xlat10.x = u_xlat10.x + 6.10351563e-05;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat27.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat11.x) * u_xlat16_52 + u_xlat11.x;
    u_xlat45 = u_xlat11.x * u_xlat45 + u_xlat16_52;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat11.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat10.x = u_xlat10.x * u_xlat45;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat10.x = min(u_xlat10.x, 16.0);
    u_xlat12.xyz = u_xlat27.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat13.xy = u_xlat27.xy * vec2(u_xlat16_54) + _FresnelVector.zw;
    u_xlat27.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat12.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat16_54) + 1.0;
    u_xlat44 = u_xlat45 * u_xlat45;
    u_xlat61 = u_xlat16_52 + -1.0;
    u_xlat45 = u_xlat44 * u_xlat61 + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat16_52 / u_xlat45;
    u_xlat45 = u_xlat45 * 0.318309873;
    u_xlat45 = min(u_xlat45, 16.0);
    u_xlat45 = u_xlat10.x * u_xlat45;
    u_xlat16_54 = u_xlat27.x * u_xlat27.x;
    u_xlat16_54 = u_xlat27.x * u_xlat16_54;
    u_xlat16_54 = u_xlat27.x * u_xlat16_54;
    u_xlat16_55 = u_xlat27.x * u_xlat16_54;
    u_xlat62 = (-u_xlat16_54) * u_xlat27.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat16_3.xyz * vec3(u_xlat62);
    u_xlat62 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat62) * vec3(u_xlat16_55) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat45) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.zxy;
    u_xlat12.xyz = vec3(u_xlat58) * u_xlat12.xyz;
    u_xlat16_1.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xyz = (-u_xlat0.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(_occlusionScale) * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_8.xyz = u_xlat16_19.xxx * u_xlat16_8.xyz;
    u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_19.x) + u_xlat16_54;
    u_xlat16_57 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_55 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_55;
    u_xlat58 = min(u_xlat16_19.x, 1.0);
    u_xlat45 = min(u_xlat16_5.z, u_xlat58);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = vec3(u_xlat45) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat45) * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat45) * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat45) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_14.xyz * vec3(u_xlat45) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_14.y = u_xlat16_8.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_55) * u_xlat16_15.xyz;
    u_xlati45 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati45].xyz;
    u_xlati45 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati62 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati45].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati62].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat13.z = u_xlat16_6.z;
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat45 = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_6.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_6.x = u_xlat16_53 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_36 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_36 = u_xlat16_4.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = u_xlat16_62 + (-u_xlat16_63);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_63;
    u_xlat16_36 = u_xlat16_55 * u_xlat16_36;
    u_xlat45 = u_xlat45 * u_xlat16_36;
    u_xlat16_36 = u_xlat58 * 0.5;
    u_xlat16_53 = (-u_xlat58) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat45 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_4.x = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_4.x + u_xlat16_53;
    u_xlat16_36 = u_xlat16_36 * u_xlat58;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat56) + (-u_xlat16.xyz);
    u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat4.y = u_xlat0.y;
    u_xlat16_4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat4.xz = u_xlat16_4.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_52);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat12.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat13.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_19.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_17.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_17.x + u_xlat16_17.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.zxy * u_xlat16_19.xxx;
    u_xlat16_1.xyz = u_xlat16_19.xyz * _FresnelColor.zxy + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat3.x = u_xlat51 * 0.0625 + u_xlat3.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_17.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
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
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat27;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat44;
float u_xlat45;
int u_xlati45;
float u_xlat51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_62;
int u_xlati62;
mediump float u_xlat16_63;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
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
    u_xlat16_52 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat7.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat56);
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat58) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat5 = (-u_xlat58) * u_xlat16_52 + u_xlat58;
    u_xlat5 = u_xlat58 * u_xlat5 + u_xlat16_52;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat10.x = u_xlat5 + u_xlat58;
    u_xlat10.x = u_xlat10.x + 6.10351563e-05;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat27.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat45 = (-u_xlat11.x) * u_xlat16_52 + u_xlat11.x;
    u_xlat45 = u_xlat11.x * u_xlat45 + u_xlat16_52;
    u_xlat45 = sqrt(u_xlat45);
    u_xlat45 = u_xlat45 + u_xlat11.x;
    u_xlat45 = u_xlat45 + 6.10351563e-05;
    u_xlat10.x = u_xlat10.x * u_xlat45;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat10.x = min(u_xlat10.x, 16.0);
    u_xlat12.xyz = u_xlat27.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat13.xy = u_xlat27.xy * vec2(u_xlat16_54) + _FresnelVector.zw;
    u_xlat27.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat12.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat27.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat16_54) + 1.0;
    u_xlat44 = u_xlat45 * u_xlat45;
    u_xlat61 = u_xlat16_52 + -1.0;
    u_xlat45 = u_xlat44 * u_xlat61 + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat16_52 / u_xlat45;
    u_xlat45 = u_xlat45 * 0.318309873;
    u_xlat45 = min(u_xlat45, 16.0);
    u_xlat45 = u_xlat10.x * u_xlat45;
    u_xlat16_54 = u_xlat27.x * u_xlat27.x;
    u_xlat16_54 = u_xlat27.x * u_xlat16_54;
    u_xlat16_54 = u_xlat27.x * u_xlat16_54;
    u_xlat16_55 = u_xlat27.x * u_xlat16_54;
    u_xlat62 = (-u_xlat16_54) * u_xlat27.x + 1.0;
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat16_3.xyz * vec3(u_xlat62);
    u_xlat62 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat62) * vec3(u_xlat16_55) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat45) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.zxy;
    u_xlat12.xyz = vec3(u_xlat58) * u_xlat12.xyz;
    u_xlat16_1.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xyz = (-u_xlat0.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_8.xyz = vec3(_occlusionScale) * u_xlat16_8.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_8.xyz = u_xlat16_19.xxx * u_xlat16_8.xyz;
    u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_19.x) + u_xlat16_54;
    u_xlat16_57 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_55 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_55;
    u_xlat58 = min(u_xlat16_19.x, 1.0);
    u_xlat45 = min(u_xlat16_5.z, u_xlat58);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = vec3(u_xlat45) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = vec3(u_xlat45) * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat45) * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(u_xlat45) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_14.xyz * vec3(u_xlat45) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_8.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_8.xz);
    u_xlat16_14.y = u_xlat16_8.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_55) * u_xlat16_15.xyz;
    u_xlati45 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati45].xyz;
    u_xlati45 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati62 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati45].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati62].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_9.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat13.z = u_xlat16_6.z;
    u_xlat16_2.z = dot(u_xlat16_8.xyz, u_xlat16.xyz);
    u_xlat45 = dot(u_xlat16_8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_6.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_6.x = u_xlat16_53 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_36 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_36 = u_xlat16_4.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = u_xlat16_62 + (-u_xlat16_63);
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_63;
    u_xlat16_36 = u_xlat16_55 * u_xlat16_36;
    u_xlat45 = u_xlat45 * u_xlat16_36;
    u_xlat16_36 = u_xlat58 * 0.5;
    u_xlat16_53 = (-u_xlat58) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat45 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_4.x = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_4.x + u_xlat16_53;
    u_xlat16_36 = u_xlat16_36 * u_xlat58;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat56) + (-u_xlat16.xyz);
    u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat16_4.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat4.y = u_xlat0.y;
    u_xlat16_4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat4.xz = u_xlat16_4.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_52);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat12.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat13.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_19.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_17.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_17.x + u_xlat16_17.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.zxy * u_xlat16_19.xxx;
    u_xlat16_1.xyz = u_xlat16_19.xyz * _FresnelColor.zxy + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat3.x = u_xlat51 * 0.0625 + u_xlat3.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_17.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
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
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_30;
int u_xlati36;
mediump float u_xlat16_42;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat18 = u_xlat16_18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_60 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_60;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_64) + _FresnelVector.zw;
    u_xlat56 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat4.xyz;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_64) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat22.x = u_xlat16_60 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat22.x + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_60 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat16_64 = u_xlat4.x * u_xlat4.x;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_65 = u_xlat4.x * u_xlat16_64;
    u_xlat56 = (-u_xlat16_64) * u_xlat4.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
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
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_8.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_8.x = u_xlat16_30.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_8.x = u_xlat16_12.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = u_xlat16_58 + (-u_xlat16_61);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_61;
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
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_60);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat4.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
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
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_42 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_42;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_18.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_42 = u_xlat0.x * u_xlat16_18.x + u_xlat16_18.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * vec3(u_xlat16_42);
    u_xlat16_10.xyz = u_xlat16_11.xyz * _FresnelColor.zxy + u_xlat16_10.xyz;
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
in mediump vec2 in_TEXCOORD1;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
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
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec3 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_30;
int u_xlati36;
mediump float u_xlat16_42;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat18 = u_xlat16_18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_60 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_60;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_64) + _FresnelVector.zw;
    u_xlat56 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat4.xyz;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_64) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat22.x = u_xlat16_60 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat22.x + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_60 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat16_64 = u_xlat4.x * u_xlat4.x;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_65 = u_xlat4.x * u_xlat16_64;
    u_xlat56 = (-u_xlat16_64) * u_xlat4.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
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
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_8.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_8.x = u_xlat16_30.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_8.x = u_xlat16_12.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = u_xlat16_58 + (-u_xlat16_61);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_61;
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
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_60);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat4.yzx * u_xlat16_6.yzx + u_xlat16_10.yzx;
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
    u_xlat16_10.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_42 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_42;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_18.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_42 = u_xlat0.x * u_xlat16_18.x + u_xlat16_18.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * vec3(u_xlat16_42);
    u_xlat16_10.xyz = u_xlat16_11.xyz * _FresnelColor.zxy + u_xlat16_10.xyz;
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
in mediump vec2 in_TEXCOORD1;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _LaserMask;
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
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec2 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
int u_xlati23;
mediump vec3 u_xlat16_25;
mediump vec2 u_xlat16_27;
mediump float u_xlat16_39;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat63;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
float u_xlat66;
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
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21, u_xlat16_2.x);
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
    u_xlat16_5.x = 0.0;
    u_xlat16_6.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.y = u_xlat16_6.y * _LaserRamp_ST.y;
    u_xlat16_22.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_25.xyz = texture(_LaserRamp, u_xlat16_22.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_25.xyz * _LaserColor.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat16_22.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_59 = u_xlat16_59 * u_xlat16_6.x;
    u_xlat16_59 = u_xlat16_59 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_7.xyz;
    u_xlat57 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat13.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_11.xyz, u_xlat10.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat12.y = u_xlat13.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_11.xyz, u_xlat12.xyz);
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_11.xyz, u_xlat13.xyz);
    u_xlat61 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat10.xyz;
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat63 = (-u_xlat6.x) * u_xlat16_20.x + u_xlat6.x;
    u_xlat63 = u_xlat6.x * u_xlat63 + u_xlat16_20.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat6.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat13.x) * u_xlat16_20.x + u_xlat13.x;
    u_xlat66 = u_xlat13.x * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat13.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat66;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat63 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat6.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat14.xyz = vec3(u_xlat42) * u_xlat14.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat23 + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_20.x / u_xlat42;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat63 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat63;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat67 = (-u_xlat16_39) * u_xlat63 + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat14.xyz;
    u_xlat63 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat63) * u_xlat16_20.x + u_xlat63;
    u_xlat67 = u_xlat63 * u_xlat67 + u_xlat16_20.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat63 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat66 * u_xlat67;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat42 = u_xlat42 * u_xlat67;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat42);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_59 = float(1.0) / float(u_xlat16_39);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_39) * u_xlat9.xyz;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_59;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_39 = max(u_xlat16_39, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_59 = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat16_58 = max(u_xlat16_58, u_xlat16_59);
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_17.xyz = vec3(u_xlat16_39) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelVector.zw;
    u_xlat42 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat23 = u_xlat42 * u_xlat23 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_20.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat42 = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat9.x * u_xlat9.x;
    u_xlat16_1.x = u_xlat9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat9.x * u_xlat16_1.x;
    u_xlat16_39 = u_xlat9.x * u_xlat16_1.x;
    u_xlat9.x = (-u_xlat16_1.x) * u_xlat9.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat9.xxx;
    u_xlat9.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat9.xyz;
    u_xlat57 = (-u_xlat42) * u_xlat16_20.x + u_xlat42;
    u_xlat57 = u_xlat42 * u_xlat57 + u_xlat16_20.x;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat42;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat66;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat57 = u_xlat57 * u_xlat23;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat57);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_17.xyz * u_xlat9.xyz;
    u_xlat16_1.xzw = u_xlat9.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat42) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat12.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_59) + u_xlat16_60;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_64 + 1.0;
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
    u_xlat57 = min(u_xlat16_59, 1.0);
    u_xlat4.x = min(u_xlat57, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati23 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat6.x = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_9.w);
    u_xlat16_22.x = u_xlat16_3.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_9.x = u_xlat16_22.x * 16.0 + u_xlat16_9.z;
    u_xlat16_27.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_27.xy = u_xlat16_27.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_27.xy).x;
    u_xlat16_9.x = u_xlat16_3.x * 16.0 + u_xlat16_9.z;
    u_xlat16_27.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_27.xy = u_xlat16_27.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_27.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_63) + u_xlat16_25.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_63;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat6.x = u_xlat6.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat57 * 0.5;
    u_xlat16_22.x = (-u_xlat57) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat6.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat57 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_6.z);
    u_xlat6.xyz = u_xlat10.xyz * vec3(u_xlat61) + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat16_20.xxx * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat11.y = u_xlat4.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_22.xyz = u_xlat16_7.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_20.x);
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb57 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb57)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_1.xzw;
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
    u_xlat16_20.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat57 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_39 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_39;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_19.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_39 = u_xlat0.x * u_xlat16_19.x + u_xlat16_19.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(u_xlat16_39);
    u_xlat16_2.xyz = u_xlat16_3.xyz * _FresnelColor.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_20.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(13) uniform mediump sampler2D _LaserMask;
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
mediump vec4 u_xlat16_4;
ivec3 u_xlati4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec2 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
int u_xlati23;
mediump vec3 u_xlat16_25;
mediump vec2 u_xlat16_27;
mediump float u_xlat16_39;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat63;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
float u_xlat66;
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
    u_xlat16_21 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_21, u_xlat16_2.x);
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
    u_xlat16_5.x = 0.0;
    u_xlat16_6.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.y = u_xlat16_6.y * _LaserRamp_ST.y;
    u_xlat16_22.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_25.xyz = texture(_LaserRamp, u_xlat16_22.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_25.xyz * _LaserColor.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat16_22.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_59 = u_xlat16_59 * u_xlat16_6.x;
    u_xlat16_59 = u_xlat16_59 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_7.xyz;
    u_xlat57 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat61 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat13.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_11.xyz, u_xlat10.xyz);
    u_xlat13.x = u_xlat12.y;
    u_xlat12.y = u_xlat13.z;
    u_xlat12.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_11.xyz, u_xlat12.xyz);
    u_xlat13.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_11.xyz, u_xlat13.xyz);
    u_xlat61 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat61 = max(u_xlat61, 1.17549435e-38);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat10.xyz;
    u_xlat6.x = dot(u_xlat12.xyz, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_20.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat63 = (-u_xlat6.x) * u_xlat16_20.x + u_xlat6.x;
    u_xlat63 = u_xlat6.x * u_xlat63 + u_xlat16_20.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat6.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat13.x) * u_xlat16_20.x + u_xlat13.x;
    u_xlat66 = u_xlat13.x * u_xlat66 + u_xlat16_20.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat66 + u_xlat13.x;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat66;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat63 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat6.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat42 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat14.xyz = vec3(u_xlat42) * u_xlat14.xyz;
    u_xlat16_39 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat42 * u_xlat23 + 1.0;
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat42 = u_xlat16_20.x / u_xlat42;
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat42 = min(u_xlat42, 16.0);
    u_xlat63 = (-u_xlat16_39) + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat63;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat67 = (-u_xlat16_39) * u_xlat63 + 1.0;
    u_xlat16_39 = u_xlat63 * u_xlat16_39;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat14.xyz;
    u_xlat63 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat67 = (-u_xlat63) * u_xlat16_20.x + u_xlat63;
    u_xlat67 = u_xlat63 * u_xlat67 + u_xlat16_20.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat63 + u_xlat67;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat67 = u_xlat66 * u_xlat67;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat42 = u_xlat42 * u_xlat67;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat42);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_39 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_39 = max(u_xlat16_39, 6.10351563e-05);
    u_xlat16_58 = u_xlat16_39 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_58 = (-u_xlat16_58) * u_xlat16_58 + 1.0;
    u_xlat16_58 = max(u_xlat16_58, 0.0);
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
    u_xlat16_59 = float(1.0) / float(u_xlat16_39);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_16.xyz = vec3(u_xlat16_39) * u_xlat9.xyz;
    u_xlat16_39 = u_xlat16_58 * u_xlat16_59;
    u_xlat16_58 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_58));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_58);
#endif
    u_xlat16_17.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_39 = max(u_xlat16_39, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_58 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_58 = u_xlat16_58 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
    u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
    u_xlat16_58 = u_xlat16_58 * u_xlat16_58;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_59 = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat16_58 = max(u_xlat16_58, u_xlat16_59);
    u_xlat16_39 = u_xlat16_58 * u_xlat16_39;
    u_xlat16_17.xyz = vec3(u_xlat16_39) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelVector.zw;
    u_xlat42 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat16_1.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat12.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = u_xlat42 * u_xlat42;
    u_xlat23 = u_xlat42 * u_xlat23 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat16_20.x / u_xlat23;
    u_xlat23 = u_xlat23 * 0.318309873;
    u_xlat23 = min(u_xlat23, 16.0);
    u_xlat42 = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat9.x * u_xlat9.x;
    u_xlat16_1.x = u_xlat9.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat9.x * u_xlat16_1.x;
    u_xlat16_39 = u_xlat9.x * u_xlat16_1.x;
    u_xlat9.x = (-u_xlat16_1.x) * u_xlat9.x + 1.0;
    u_xlat9.xyz = u_xlat16_7.xyz * u_xlat9.xxx;
    u_xlat9.xyz = vec3(u_xlat57) * vec3(u_xlat16_39) + u_xlat9.xyz;
    u_xlat57 = (-u_xlat42) * u_xlat16_20.x + u_xlat42;
    u_xlat57 = u_xlat42 * u_xlat57 + u_xlat16_20.x;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat42;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat57 * u_xlat66;
    u_xlat57 = float(1.0) / u_xlat57;
    u_xlat57 = min(u_xlat57, 16.0);
    u_xlat57 = u_xlat57 * u_xlat23;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat57);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_17.xyz * u_xlat9.xyz;
    u_xlat16_1.xzw = u_xlat9.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat42) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat12.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_59 * 0.5 + 0.5;
    u_xlat16_60 = (-u_xlat16_59) + u_xlat16_60;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_64 + 1.0;
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
    u_xlat57 = min(u_xlat16_59, 1.0);
    u_xlat4.x = min(u_xlat57, u_xlat16_6.z);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_60) * u_xlat16_18.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati23 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_59 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat4.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat16_8.z = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat6.x = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_9.w);
    u_xlat16_22.x = u_xlat16_3.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_9.x = u_xlat16_22.x * 16.0 + u_xlat16_9.z;
    u_xlat16_27.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_27.xy = u_xlat16_27.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25.x = texture(_SpecularOcclusionLut3D, u_xlat16_27.xy).x;
    u_xlat16_9.x = u_xlat16_3.x * 16.0 + u_xlat16_9.z;
    u_xlat16_27.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_27.xy = u_xlat16_27.xy * vec2(0.00390625, 0.0625);
    u_xlat16_63 = texture(_SpecularOcclusionLut3D, u_xlat16_27.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_63) + u_xlat16_25.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_63;
    u_xlat16_3.x = u_xlat16_60 * u_xlat16_3.x;
    u_xlat6.x = u_xlat6.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat57 * 0.5;
    u_xlat16_22.x = (-u_xlat57) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat6.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat57 * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_6.z);
    u_xlat6.xyz = u_xlat10.xyz * vec3(u_xlat61) + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat16_20.xxx * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat11.y = u_xlat4.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_22.xyz = u_xlat16_7.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_20.x);
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb57 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb57)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_1.xzw;
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
    u_xlat16_20.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat57 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat4.xyz = vec3(u_xlat57) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_39 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_39;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_19.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_39 = u_xlat0.x * u_xlat16_19.x + u_xlat16_19.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(u_xlat16_39);
    u_xlat16_2.xyz = u_xlat16_3.xyz * _FresnelColor.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_20.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(15) uniform mediump sampler2D _LaserMask;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec2 u_xlat16_19;
float u_xlat20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
int u_xlati38;
float u_xlat41;
mediump float u_xlat16_48;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
bool u_xlatb58;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat7.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _shadowStrength;
    u_xlat19 = u_xlat16_19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_12.x = 0.0;
    u_xlat16_21.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.y = u_xlat16_21.y * _LaserRamp_ST.y;
    u_xlat16_10.xz = u_xlat16_12.xy + _LaserRamp_ST.zw;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat16_3.xyz * _LaserColor.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_68 = u_xlat16_21.x * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat59 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat16_29.xxx + u_xlat2.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat3.x = (-u_xlat57) * u_xlat16_29.x + u_xlat57;
    u_xlat3.x = u_xlat57 * u_xlat3.x + u_xlat16_29.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat57 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_29.x + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_29.x;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat3.y = u_xlat22 + u_xlat9.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat41 = u_xlat16_29.x + -1.0;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat58 = u_xlat3.x * u_xlat58;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat58 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat3.x = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat3.x;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat4.x = (-u_xlat16_68) * u_xlat3.x + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat4.xxx;
    u_xlat14.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat3.x) * u_xlat16_29.x + u_xlat3.x;
    u_xlat4.x = u_xlat3.x * u_xlat4.x + u_xlat16_29.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat3.x + u_xlat4.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat3.y * u_xlat4.x;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58 = u_xlat58 * u_xlat4.x;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat3.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_63) + _FresnelVector.zw;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat21.x * u_xlat21.x;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_68 = u_xlat21.x * u_xlat16_63;
    u_xlat21.x = (-u_xlat16_63) * u_xlat21.x + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat21.xxx;
    u_xlat21.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat41 = (-u_xlat2.x) * u_xlat16_29.x + u_xlat2.x;
    u_xlat41 = u_xlat2.x * u_xlat41 + u_xlat16_29.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat2.x + u_xlat41;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat22 = u_xlat41 * u_xlat3.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = min(u_xlat22, 16.0);
    u_xlat58 = u_xlat58 * u_xlat22;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_17.xyz * u_xlat21.xyz;
    u_xlat16_15.xyz = u_xlat21.xyz * vec3(u_xlat19) + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_22) + u_xlat16_3.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_22;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat58 = u_xlat58 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat58 * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_4.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_29.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_19.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_29.x = u_xlat0.x * u_xlat16_19.x + u_xlat16_19.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.xyz * u_xlat16_29.xxx;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _FresnelColor.xyz + u_xlat16_6.xyz;
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
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_63 : u_xlat16_10.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _LaserRamp_ST;
uniform 	mediump vec4 _LaserColor;
uniform 	mediump float _LaserRampIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(15) uniform mediump sampler2D _LaserMask;
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
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec2 u_xlat16_19;
float u_xlat20;
vec3 u_xlat21;
mediump vec2 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
vec3 u_xlat23;
mediump vec3 u_xlat16_29;
int u_xlati38;
float u_xlat41;
mediump float u_xlat16_48;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
bool u_xlatb58;
float u_xlat59;
float u_xlat62;
mediump float u_xlat16_63;
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
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat7.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat19 = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19 + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_19.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19.x * _shadowStrength;
    u_xlat19 = u_xlat16_19.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_29.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_10.x * u_xlat16_29.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb57 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb57)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb57 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb57 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb57) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_11.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_10.xyz;
    u_xlat57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat16_67 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat57 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat2.x = (-u_xlat16_67) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_29.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat16_12.x = 0.0;
    u_xlat16_21.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.y = u_xlat16_21.y * _LaserRamp_ST.y;
    u_xlat16_10.xz = u_xlat16_12.xy + _LaserRamp_ST.zw;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat16_10.xz).xyz;
    u_xlat16_10.xzw = u_xlat16_3.xyz * _LaserColor.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_10.xzw, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_68 = u_xlat16_21.x * u_xlat16_68;
    u_xlat16_68 = u_xlat16_68 * _LaserColor.w;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xzw = (-u_xlat16_12.xyz) * u_xlat16_13.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xzw = vec3(u_xlat16_68) * u_xlat16_10.xzw + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_10.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat59 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat59) * u_xlat16_29.xxx + u_xlat2.xyz;
    u_xlat16_29.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_29.x;
    u_xlat16_29.x = max(u_xlat16_29.x, 0.0078125);
    u_xlat3.x = (-u_xlat57) * u_xlat16_29.x + u_xlat57;
    u_xlat3.x = u_xlat57 * u_xlat3.x + u_xlat16_29.x;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat57 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_63);
    u_xlat9.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat9.x) * u_xlat16_29.x + u_xlat9.x;
    u_xlat22 = u_xlat9.x * u_xlat22 + u_xlat16_29.x;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat3.y = u_xlat22 + u_xlat9.x;
    u_xlat3.xy = u_xlat3.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat41 = u_xlat16_29.x + -1.0;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat58 = u_xlat3.x * u_xlat58;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat57) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat14.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat58 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat3.x = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat3.x;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat4.x = (-u_xlat16_68) * u_xlat3.x + 1.0;
    u_xlat16_68 = u_xlat3.x * u_xlat16_68;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat4.xxx;
    u_xlat14.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat3.x) * u_xlat16_29.x + u_xlat3.x;
    u_xlat4.x = u_xlat3.x * u_xlat4.x + u_xlat16_29.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat3.x + u_xlat4.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat4.x = u_xlat3.y * u_xlat4.x;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat58 = u_xlat58 * u_xlat4.x;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat3.xxx * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = float(1.0) / float(u_xlat16_68);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_16.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_17.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_68 = max(u_xlat16_68, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_70 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_69 = max(u_xlat16_69, u_xlat16_70);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_17.xyz = vec3(u_xlat16_68) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_63) + u_xlat16_16.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_63) + _FresnelVector.zw;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat41 + 1.0;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat16_29.x / u_xlat58;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.x = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat21.x * u_xlat21.x;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_63 = u_xlat21.x * u_xlat16_63;
    u_xlat16_68 = u_xlat21.x * u_xlat16_63;
    u_xlat21.x = (-u_xlat16_63) * u_xlat21.x + 1.0;
    u_xlat14.xyz = u_xlat16_12.xyz * u_xlat21.xxx;
    u_xlat21.xyz = vec3(u_xlat59) * vec3(u_xlat16_68) + u_xlat14.xyz;
    u_xlat41 = (-u_xlat2.x) * u_xlat16_29.x + u_xlat2.x;
    u_xlat41 = u_xlat2.x * u_xlat41 + u_xlat16_29.x;
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = u_xlat2.x + u_xlat41;
    u_xlat41 = u_xlat41 + 6.10351563e-05;
    u_xlat22 = u_xlat41 * u_xlat3.y;
    u_xlat22 = float(1.0) / u_xlat22;
    u_xlat22 = min(u_xlat22, 16.0);
    u_xlat58 = u_xlat58 * u_xlat22;
    u_xlat21.xyz = u_xlat21.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat16_17.xyz * u_xlat21.xyz;
    u_xlat16_15.xyz = u_xlat21.xyz * vec3(u_xlat19) + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_63) * u_xlat16_10.xzw;
    u_xlat16_16.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat57) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat3.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_17.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = vec3(u_xlat19) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_occlusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
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
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_68 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_68;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_63));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_17.y = u_xlat16_11.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_17.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlati38 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati38].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati38 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati38].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat58 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_2.w);
    u_xlat16_48 = u_xlat16_10.x + 1.0;
    u_xlat16_48 = min(u_xlat16_48, 15.0);
    u_xlat16_2.x = u_xlat16_48 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_3.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_10.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_48 = (-u_xlat16_22) + u_xlat16_3.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_48 + u_xlat16_22;
    u_xlat16_10.x = u_xlat16_68 * u_xlat16_10.x;
    u_xlat58 = u_xlat58 * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_48 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat58 * u_xlat16_48 + u_xlat16_10.x;
    u_xlat16_48 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_67 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_67 + u_xlat16_48;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_4.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_29.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_29.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat9.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_63) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_29.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_15.xyz;
    u_xlat16_63 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_3.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_3.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_12.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_29.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_29.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_29.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_19.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_29.x = u_xlat0.x * u_xlat16_19.x + u_xlat16_19.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_29.xyz = u_xlat16_0.xyz * u_xlat16_29.xxx;
    u_xlat16_6.xyz = u_xlat16_29.xyz * _FresnelColor.xyz + u_xlat16_6.xyz;
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
    u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_63 : u_xlat16_10.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
mediump vec2 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat22;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat45;
mediump float u_xlat16_45;
int u_xlati45;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
float u_xlat61;
int u_xlati61;
float u_xlat62;
mediump float u_xlat16_62;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
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
    u_xlat16_52 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat7.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat56);
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat58) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat5 = (-u_xlat58) * u_xlat16_52 + u_xlat58;
    u_xlat5 = u_xlat58 * u_xlat5 + u_xlat16_52;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat5 = u_xlat5 + u_xlat58;
    u_xlat5 = u_xlat5 + 6.10351563e-05;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat10.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat11.x) * u_xlat16_52 + u_xlat11.x;
    u_xlat22 = u_xlat11.x * u_xlat22 + u_xlat16_52;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat61 = u_xlat22 + u_xlat11.x;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat5 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat12.xyz = u_xlat10.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat10.xy = u_xlat10.xy * vec2(u_xlat16_54) + _FresnelVector.zw;
    u_xlat45 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat12.xyz = vec3(u_xlat45) * u_xlat12.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat16_54) + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat12.x = u_xlat16_52 + -1.0;
    u_xlat45 = u_xlat45 * u_xlat12.x + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat16_52 / u_xlat45;
    u_xlat45 = u_xlat45 * 0.318309873;
    u_xlat45 = min(u_xlat45, 16.0);
    u_xlat61 = u_xlat61 * u_xlat45;
    u_xlat16_55 = u_xlat62 * u_xlat62;
    u_xlat16_55 = u_xlat62 * u_xlat16_55;
    u_xlat16_55 = u_xlat62 * u_xlat16_55;
    u_xlat16_57 = u_xlat62 * u_xlat16_55;
    u_xlat45 = (-u_xlat16_55) * u_xlat62 + 1.0;
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat16_8.xyz * vec3(u_xlat45);
    u_xlat45 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat45) * vec3(u_xlat16_57) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat58) * u_xlat12.xyz;
    u_xlat16_1.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(_occlusionScale) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_9.xyz = u_xlat16_19.xxx * u_xlat16_9.xyz;
    u_xlat16_19.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_19.x) + u_xlat16_55;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_57 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_57;
    u_xlat58 = min(u_xlat16_19.x, 1.0);
    u_xlat61 = min(u_xlat16_5.z, u_xlat58);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat61) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat61) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat61) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat61) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_14.y = u_xlat16_9.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz;
    u_xlati61 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati61].xyz;
    u_xlati61 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati45 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati61].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati45].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_59 = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
    u_xlat16.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_59) + (-u_xlat16_6.xyz);
    u_xlat10.z = u_xlat16_6.z;
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat61 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_3.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_3.x = u_xlat16_53 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_45 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_3.x = u_xlat16_36 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_36 = u_xlat16_6.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = (-u_xlat16_62) + u_xlat16_45;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_62;
    u_xlat16_36 = u_xlat16_57 * u_xlat16_36;
    u_xlat61 = u_xlat61 * u_xlat16_36;
    u_xlat16_36 = u_xlat58 * 0.5;
    u_xlat16_53 = (-u_xlat58) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat61 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_6.x = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_6.x + u_xlat16_53;
    u_xlat16_36 = u_xlat16_36 * u_xlat58;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat56) + (-u_xlat16.xyz);
    u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat16_6.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat6.y = u_xlat0.y;
    u_xlat16_6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat6.xz = u_xlat16_6.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_52);
    u_xlat16_9.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_9.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_8.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_19.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_17.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_17.x + u_xlat16_17.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_19.xxx;
    u_xlat16_1.xyz = u_xlat16_19.xyz * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
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
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
ivec3 u_xlati16;
mediump vec2 u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat22;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_36;
float u_xlat45;
mediump float u_xlat16_45;
int u_xlati45;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_57;
float u_xlat58;
mediump float u_xlat16_59;
float u_xlat61;
int u_xlati61;
float u_xlat62;
mediump float u_xlat16_62;
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
    u_xlat16_18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_18 = max(u_xlat16_18, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_18);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_35.xxx;
    u_xlat16_35.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_35.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_35.x);
#endif
    u_xlat16_35.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_35.yyy + u_xlat16_3.xyz;
    u_xlat16_52 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_52 = u_xlat16_52 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_52);
    u_xlat16_52 = u_xlat16_18 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_18 = float(1.0) / float(u_xlat16_18);
    u_xlat16_52 = (-u_xlat16_52) * u_xlat16_52 + 1.0;
    u_xlat16_52 = max(u_xlat16_52, 0.0);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_18 = u_xlat16_52 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_35.x, u_xlat16_18);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_18;
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
    u_xlat16_52 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat0.x = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat7.xyz;
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_52 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_52) + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat56 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat56);
    u_xlat58 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat58 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat58) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_52 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_52;
    u_xlat16_52 = max(u_xlat16_52, 0.0078125);
    u_xlat5 = (-u_xlat58) * u_xlat16_52 + u_xlat58;
    u_xlat5 = u_xlat58 * u_xlat5 + u_xlat16_52;
    u_xlat5 = sqrt(u_xlat5);
    u_xlat5 = u_xlat5 + u_xlat58;
    u_xlat5 = u_xlat5 + 6.10351563e-05;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_6.xyz = vec3(u_xlat16_54) * u_xlat10.xyz;
    u_xlat11.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat11.x) * u_xlat16_52 + u_xlat11.x;
    u_xlat22 = u_xlat11.x * u_xlat22 + u_xlat16_52;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat61 = u_xlat22 + u_xlat11.x;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat61 = u_xlat5 * u_xlat61;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat12.xyz = u_xlat10.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat10.xy = u_xlat10.xy * vec2(u_xlat16_54) + _FresnelVector.zw;
    u_xlat45 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat12.xyz = vec3(u_xlat45) * u_xlat12.xyz;
    u_xlat45 = dot(u_xlat7.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat62 = (-u_xlat16_54) + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat12.x = u_xlat16_52 + -1.0;
    u_xlat45 = u_xlat45 * u_xlat12.x + 1.0;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat16_52 / u_xlat45;
    u_xlat45 = u_xlat45 * 0.318309873;
    u_xlat45 = min(u_xlat45, 16.0);
    u_xlat61 = u_xlat61 * u_xlat45;
    u_xlat16_55 = u_xlat62 * u_xlat62;
    u_xlat16_55 = u_xlat62 * u_xlat16_55;
    u_xlat16_55 = u_xlat62 * u_xlat16_55;
    u_xlat16_57 = u_xlat62 * u_xlat16_55;
    u_xlat45 = (-u_xlat16_55) * u_xlat62 + 1.0;
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = u_xlat16_8.xyz * vec3(u_xlat45);
    u_xlat45 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat45) * vec3(u_xlat16_57) + u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat61) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.xyz = min(max(u_xlat12.xyz, 0.0), 1.0);
#else
    u_xlat12.xyz = clamp(u_xlat12.xyz, 0.0, 1.0);
#endif
    u_xlat12.xyz = u_xlat12.xyz * _directSpecularColor.xyz;
    u_xlat12.xyz = vec3(u_xlat58) * u_xlat12.xyz;
    u_xlat16_1.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(_occlusionScale) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_9.xyz = u_xlat16_19.xxx * u_xlat16_9.xyz;
    u_xlat16_19.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_19.x * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_19.x) + u_xlat16_55;
    u_xlat16_59 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_59 + 1.0;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_57 + u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_2.w * u_xlat16_19.x;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_57;
    u_xlat58 = min(u_xlat16_19.x, 1.0);
    u_xlat61 = min(u_xlat16_5.z, u_xlat58);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat61) * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = vec3(u_xlat61) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat61) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat61) + (-u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat61) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_14.y = u_xlat16_9.y;
    u_xlat16_15.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati16.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_57) * u_xlat16_15.xyz;
    u_xlati61 = int(int_bitfieldInsert(2,u_xlati16.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati61].xyz;
    u_xlati61 = int(uint(uint(u_xlati16.x) & 1u));
    u_xlati45 = (u_xlati16.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati61].xyz + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati45].xyz + u_xlat16_14.xyw;
    u_xlat16_15.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_19.x = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = u_xlat16_4.xyz * u_xlat16_15.xyz;
    u_xlat16_1.xyz = u_xlat16_14.xyz * u_xlat16_13.xyz + u_xlat16_1.xyz;
    u_xlat16_59 = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
    u_xlat16.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_59) + (-u_xlat16_6.xyz);
    u_xlat10.z = u_xlat16_6.z;
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat16.xyz);
    u_xlat61 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36 = floor(u_xlat16_3.w);
    u_xlat16_53 = u_xlat16_36 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 15.0);
    u_xlat16_3.x = u_xlat16_53 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_45 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_3.x = u_xlat16_36 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_36 = u_xlat16_6.z * 15.0 + (-u_xlat16_36);
    u_xlat16_53 = (-u_xlat16_62) + u_xlat16_45;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_53 + u_xlat16_62;
    u_xlat16_36 = u_xlat16_57 * u_xlat16_36;
    u_xlat61 = u_xlat61 * u_xlat16_36;
    u_xlat16_36 = u_xlat58 * 0.5;
    u_xlat16_53 = (-u_xlat58) * 0.5 + 1.0;
    u_xlat16_36 = u_xlat61 * u_xlat16_53 + u_xlat16_36;
    u_xlat16_53 = u_xlat16_36 + u_xlat16_36;
    u_xlat16_6.x = (-u_xlat16_36) * 2.0 + 1.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_6.x + u_xlat16_53;
    u_xlat16_36 = u_xlat16_36 * u_xlat58;
    u_xlat16_36 = min(u_xlat16_36, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat56) + (-u_xlat16.xyz);
    u_xlat0.xyz = vec3(u_xlat16_52) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat16_6.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat6.y = u_xlat0.y;
    u_xlat16_6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat6.xz = u_xlat16_6.xz;
    u_xlat16_52 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat11.y = u_xlat16_2.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_52);
    u_xlat16_9.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_2.xyw = u_xlat16_19.xxx * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_2.xyw : u_xlat16_9.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_8.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_36) * u_xlat16_2.xyw;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_52 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_52;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_19.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_19.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_19.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_17.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_19.x = u_xlat0.x * u_xlat16_17.x + u_xlat16_17.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_19.xxx;
    u_xlat16_1.xyz = u_xlat16_19.xyz * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat16_19.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_19.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_52 : u_xlat16_2.x;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
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
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec2 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_30;
int u_xlati36;
mediump float u_xlat16_42;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat18 = u_xlat16_18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_60 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_60;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_64) + _FresnelVector.zw;
    u_xlat56 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat4.xyz;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_64) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat22.x = u_xlat16_60 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat22.x + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_60 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat16_64 = u_xlat4.x * u_xlat4.x;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_65 = u_xlat4.x * u_xlat16_64;
    u_xlat56 = (-u_xlat16_64) * u_xlat4.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
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
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_8.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_8.x = u_xlat16_30.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_8.x = u_xlat16_12.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = u_xlat16_58 + (-u_xlat16_61);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_61;
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
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_60);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat4.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_42 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_42;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_18.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_42 = u_xlat0.x * u_xlat16_18.x + u_xlat16_18.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(u_xlat16_42);
    u_xlat16_10.xyz = u_xlat16_11.xyz * _FresnelColor.xyz + u_xlat16_10.xyz;
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
in mediump vec2 in_TEXCOORD1;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
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
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump vec2 u_xlat16_18;
float u_xlat19;
vec3 u_xlat22;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_30;
int u_xlati36;
mediump float u_xlat16_42;
float u_xlat54;
bool u_xlatb54;
float u_xlat56;
mediump float u_xlat16_58;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat18 = u_xlat16_18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_60 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_60 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat54) * u_xlat16_13.xyz;
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat54) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb1 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_60 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = max(u_xlat16_64, 6.10351563e-05);
    u_xlat16_65 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_65);
    u_xlat16_65 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005>=abs(u_xlat16_65));
#else
    u_xlatb1 = 0.00100000005>=abs(u_xlat16_65);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_65 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
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
    u_xlat16_13.xyz = vec3(u_xlat18) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_12.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_60 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat18 = (-u_xlat54) * u_xlat16_60 + u_xlat54;
    u_xlat18 = u_xlat54 * u_xlat18 + u_xlat16_60;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 + u_xlat54;
    u_xlat18 = u_xlat18 + 6.10351563e-05;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_64);
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat56 = (-u_xlat2.x) * u_xlat16_60 + u_xlat2.x;
    u_xlat56 = u_xlat2.x * u_xlat56 + u_xlat16_60;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat2.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = min(u_xlat18, 16.0);
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat16_64) + _FresnelVector.zw;
    u_xlat56 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat4.xyz;
    u_xlat56 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat16_64) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat22.x = u_xlat16_60 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat22.x + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_60 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat18 = u_xlat18 * u_xlat56;
    u_xlat16_64 = u_xlat4.x * u_xlat4.x;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_64 = u_xlat4.x * u_xlat16_64;
    u_xlat16_65 = u_xlat4.x * u_xlat16_64;
    u_xlat56 = (-u_xlat16_64) * u_xlat4.x + 1.0;
    u_xlat16_10.xyz = u_xlat16_3.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat4.xyz = vec3(u_xlat56) * u_xlat16_10.xyz;
    u_xlat56 = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat4.xyz = vec3(u_xlat56) * vec3(u_xlat16_65) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _directSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_64) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_65 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_3.w * u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_64));
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
    u_xlat16_64 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat1.z = u_xlat16_13.z;
    u_xlat16_3.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat56 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_8.w);
    u_xlat16_30.x = u_xlat16_12.x + 1.0;
    u_xlat16_30.x = min(u_xlat16_30.x, 15.0);
    u_xlat16_8.x = u_xlat16_30.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_58 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_8.x = u_xlat16_12.x * 16.0 + u_xlat16_8.z;
    u_xlat16_30.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_30.xz = u_xlat16_30.xz * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_30.xz).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_30.x = u_xlat16_58 + (-u_xlat16_61);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_30.x + u_xlat16_61;
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
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat5.xyz + u_xlat0.xzw;
    u_xlat16_12.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat12.y = u_xlat0.y;
    u_xlat16_12.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat12.xz = u_xlat16_12.xz;
    u_xlat16_60 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat2.y = u_xlat16_3.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat2.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat12.xyz, u_xlat16_60);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_65) * u_xlat16_10.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat4.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
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
    u_xlat16_10.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + u_xlat16_11.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_42 = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_42;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_18.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_42 = u_xlat0.x * u_xlat16_18.x + u_xlat16_18.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.xyz * vec3(u_xlat16_42);
    u_xlat16_10.xyz = u_xlat16_11.xyz * _FresnelColor.xyz + u_xlat16_10.xyz;
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
  GpuProgramID 107992
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_ColoredFresnelGUI"
}