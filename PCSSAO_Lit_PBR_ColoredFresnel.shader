//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PCSSAO/Lit/PBR_ColoredFresnel" {
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
  GpuProgramID 27342
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
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
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
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
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
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
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
mediump float u_xlat16_44;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat63;
mediump float u_xlat16_64;
float u_xlat66;
float u_xlat67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
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
    u_xlat16_5.x = 0.0;
    u_xlat16_6.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.y = u_xlat16_6.y * _LaserRamp_ST.y;
    u_xlat16_22.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_25.xyz = texture(_LaserRamp, u_xlat16_22.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_25.zxy * _LaserColor.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat16_22.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_59 = u_xlat16_59 * u_xlat16_6.x;
    u_xlat16_59 = u_xlat16_59 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_7.xyz;
    u_xlat57 = u_xlat16_7.z * 50.0;
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
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
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
    u_xlat16_17.xyz = vec3(u_xlat16_39) * _AdditionalLightIntensityAndAngleScale[1].zxy;
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
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
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
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat42) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat4.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat16_57 = texture(_ScreenSpaceOcclusionTexture, u_xlat4.xy).x;
    u_xlat16_59 = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat12.xyz;
    u_xlat16_60 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz;
    u_xlat16_60 = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_64 = (-u_xlat16_60) + u_xlat16_64;
    u_xlat16_27.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_27.x + 1.0;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_64 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_60;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat57 = min(u_xlat16_60, 1.0);
    u_xlat4.x = min(u_xlat57, u_xlat16_59);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_18.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati23 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
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
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_27.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_44) + u_xlat16_25.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_44;
    u_xlat16_3.x = u_xlat16_64 * u_xlat16_3.x;
    u_xlat6.x = u_xlat6.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat57 * 0.5;
    u_xlat16_22.x = (-u_xlat57) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat6.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat57 * u_xlat16_3.x;
    u_xlat16_59 = min(u_xlat16_59, u_xlat16_3.x);
    u_xlat6.xyz = u_xlat10.xyz * vec3(u_xlat61) + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat16_20.xxx * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat3.y = u_xlat6.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb57 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb57)) ? u_xlat16_11.xyz : u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_7.yzx * u_xlat16_8.yzx + u_xlat16_1.zwx;
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
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.zxy * _emissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat57 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
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
    u_xlat16_7.xyz = u_xlat16_0.zxy * vec3(u_xlat16_39);
    u_xlat16_2.xyz = u_xlat16_7.xyz * _FresnelColor.zxy + u_xlat16_2.xyz;
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
    u_xlat57 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat2.x = u_xlat57 * 0.0625 + u_xlat2.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_19.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
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
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
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
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
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
mediump float u_xlat16_44;
float u_xlat57;
mediump float u_xlat16_57;
bool u_xlatb57;
mediump float u_xlat16_58;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat63;
mediump float u_xlat16_64;
float u_xlat66;
float u_xlat67;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
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
    u_xlat16_5.x = 0.0;
    u_xlat16_6.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.y = u_xlat16_6.y * _LaserRamp_ST.y;
    u_xlat16_22.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_25.xyz = texture(_LaserRamp, u_xlat16_22.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_25.zxy * _LaserColor.zxy;
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat16_22.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_59 = u_xlat16_59 * u_xlat16_6.x;
    u_xlat16_59 = u_xlat16_59 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_22.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_22.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_22.xyz = vec3(u_xlat16_59) * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat57) * u_xlat16_7.xyz;
    u_xlat57 = u_xlat16_7.z * 50.0;
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
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat63) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
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
    u_xlat16_17.xyz = vec3(u_xlat16_39) * _AdditionalLightIntensityAndAngleScale[1].zxy;
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
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
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
    u_xlat16_16.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_16.xyz * vec3(u_xlat63) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat42) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat4.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat4.xy = u_xlat4.xy * hlslcc_FragCoord.xy;
    u_xlat16_57 = texture(_ScreenSpaceOcclusionTexture, u_xlat4.xy).x;
    u_xlat16_59 = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat61) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_occlusionScale) * u_xlat16_16.xyz + u_xlat12.xyz;
    u_xlat16_60 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz;
    u_xlat16_60 = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_64 = (-u_xlat16_60) + u_xlat16_64;
    u_xlat16_27.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_27.x + 1.0;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_64 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_60;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat57 = min(u_xlat16_60, 1.0);
    u_xlat4.x = min(u_xlat57, u_xlat16_59);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat4.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat4.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati4.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_64) * u_xlat16_18.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati4.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati23 = (u_xlati4.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
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
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_27.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_22.x = (-u_xlat16_44) + u_xlat16_25.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_22.x + u_xlat16_44;
    u_xlat16_3.x = u_xlat16_64 * u_xlat16_3.x;
    u_xlat6.x = u_xlat6.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat57 * 0.5;
    u_xlat16_22.x = (-u_xlat57) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat6.x * u_xlat16_22.x + u_xlat16_3.x;
    u_xlat16_22.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_41 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_41 + u_xlat16_22.x;
    u_xlat16_3.x = u_xlat57 * u_xlat16_3.x;
    u_xlat16_59 = min(u_xlat16_59, u_xlat16_3.x);
    u_xlat6.xyz = u_xlat10.xyz * vec3(u_xlat61) + (-u_xlat4.xyz);
    u_xlat6.xyz = u_xlat16_20.xxx * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat3.y = u_xlat6.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_20.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_20.x);
    u_xlat16_8.xyz = u_xlat16_4.www * u_xlat16_4.zxy;
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb57 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb57)) ? u_xlat16_11.xyz : u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_7.yzx * u_xlat16_8.yzx + u_xlat16_1.zwx;
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
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.zxy * _emissiveColor.zxy;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat57 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat6.xyz = vec3(u_xlat57) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
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
    u_xlat16_7.xyz = u_xlat16_0.zxy * vec3(u_xlat16_39);
    u_xlat16_2.xyz = u_xlat16_7.xyz * _FresnelColor.zxy + u_xlat16_2.xyz;
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
    u_xlat57 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat2.x = u_xlat57 * 0.0625 + u_xlat2.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat6.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat6.xy, 0.0).xyz;
    u_xlat6.xyz = (-u_xlat16_19.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
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
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
ivec3 u_xlati6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec2 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_26;
int u_xlati26;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat66;
bool u_xlatb66;
mediump float u_xlat16_67;
float u_xlat69;
float u_xlat70;
mediump float u_xlat16_70;
float u_xlat72;
mediump float u_xlat16_72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
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
    u_xlat16_23.xyz = u_xlat16_26.xyz * _LaserColor.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_23.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = u_xlat16_62 * u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_23.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_7.xyz;
    u_xlat60 = u_xlat16_7.y * 50.0;
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
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat6.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4;
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
    u_xlat66 = dot(u_xlat12.xyz, u_xlat14.xyz);
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
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat72 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_62 = u_xlat70 * u_xlat16_41;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat72);
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_62) + u_xlat14.xyz;
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
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat70) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_67 = float(1.0) / float(u_xlat16_62);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_16.xyz = vec3(u_xlat16_62) * u_xlat9.xyz;
    u_xlat16_62 = u_xlat16_3.x * u_xlat16_67;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_67);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat16_17.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelVector.zw;
    u_xlat66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat66) * u_xlat9.xyz;
    u_xlat16_62 = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
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
    u_xlat29.x = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat29.x * u_xlat29.x;
    u_xlat16_62 = u_xlat29.x * u_xlat16_62;
    u_xlat16_62 = u_xlat29.x * u_xlat16_62;
    u_xlat16_3.x = u_xlat29.x * u_xlat16_62;
    u_xlat29.x = (-u_xlat16_62) * u_xlat29.x + 1.0;
    u_xlat14.xyz = u_xlat16_7.xyz * u_xlat29.xxx;
    u_xlat14.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat14.xyz;
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
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.xyz;
    u_xlat29.xyz = u_xlat9.xxx * u_xlat29.xyz;
    u_xlat29.xyz = u_xlat16_17.xyz * u_xlat29.xyz;
    u_xlat16_15.xyz = u_xlat29.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.xxx * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat9.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat6.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat6.xy * hlslcc_FragCoord.xy;
    u_xlat16_60 = texture(_ScreenSpaceOcclusionTexture, u_xlat6.xy).x;
    u_xlat16_62 = u_xlat16_60 * u_xlat16_6.z;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_67 = (-u_xlat16_63) + u_xlat16_67;
    u_xlat16_28.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_28.x + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_67 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_67 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 + -1.0;
    u_xlat16_67 = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat6.x = min(u_xlat60, u_xlat16_62);
    u_xlat16_16.xyz = u_xlat6.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat6.xxx * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat6.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati26 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat6.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat6.xyz);
    u_xlat66 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_9.w);
    u_xlat16_23.x = u_xlat16_3.x + 1.0;
    u_xlat16_23.x = min(u_xlat16_23.x, 15.0);
    u_xlat16_9.x = u_xlat16_23.x * 16.0 + u_xlat16_9.z;
    u_xlat16_28.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_9.x = u_xlat16_3.x * 16.0 + u_xlat16_9.z;
    u_xlat16_28.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_72 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_23.x = u_xlat16_70 + (-u_xlat16_72);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_23.x + u_xlat16_72;
    u_xlat16_3.x = u_xlat16_67 * u_xlat16_3.x;
    u_xlat66 = u_xlat66 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat60 * 0.5;
    u_xlat16_23.x = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat66 * u_xlat16_23.x + u_xlat16_3.x;
    u_xlat16_23.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_43 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat60 * u_xlat16_3.x;
    u_xlat16_62 = min(u_xlat16_62, u_xlat16_3.x);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat16_21.xxx * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat3.y = u_xlat6.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_67 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_67);
    u_xlat16_8.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb60 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb60)) ? u_xlat16_11.xyz : u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_62) * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_15.xyz;
    u_xlat16_62 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_62;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_27.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_27.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_27.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_27.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_20.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_27.x = u_xlat0.x * u_xlat16_20.x + u_xlat16_20.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_0.xyz * u_xlat16_27.xxx;
    u_xlat16_2.xyz = u_xlat16_27.xyz * _FresnelColor.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_6.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_62 : u_xlat16_7.x;
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
UNITY_LOCATION(10) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
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
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
ivec3 u_xlati6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec2 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump float u_xlat16_22;
mediump vec3 u_xlat16_23;
float u_xlat24;
mediump vec3 u_xlat16_26;
int u_xlati26;
mediump vec3 u_xlat16_27;
mediump vec2 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_41;
mediump float u_xlat16_43;
float u_xlat44;
float u_xlat60;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
float u_xlat66;
bool u_xlatb66;
mediump float u_xlat16_67;
float u_xlat69;
float u_xlat70;
mediump float u_xlat16_70;
float u_xlat72;
mediump float u_xlat16_72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
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
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
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
    u_xlat16_23.xyz = u_xlat16_26.xyz * _LaserColor.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.xyz = min(max(u_xlat16_23.xyz, 0.0), 1.0);
#else
    u_xlat16_23.xyz = clamp(u_xlat16_23.xyz, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_23.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = u_xlat16_62 * u_xlat16_6.x;
    u_xlat16_62 = u_xlat16_62 * _LaserColor.w;
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_8.xyz = u_xlat16_6.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_23.xyz = (-u_xlat16_7.xyz) * u_xlat16_8.xyz + u_xlat16_23.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_23.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_23.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_8.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_8.yyy * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_7.xyz;
    u_xlat60 = u_xlat16_7.y * 50.0;
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
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat6.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4;
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
    u_xlat66 = dot(u_xlat12.xyz, u_xlat14.xyz);
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
    u_xlat70 = (-u_xlat16_41) + 1.0;
    u_xlat16_41 = u_xlat70 * u_xlat70;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat16_41 = u_xlat70 * u_xlat16_41;
    u_xlat72 = (-u_xlat16_41) * u_xlat70 + 1.0;
    u_xlat16_62 = u_xlat70 * u_xlat16_41;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat72);
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_62) + u_xlat14.xyz;
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
    u_xlat14.xyz = u_xlat14.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = vec3(u_xlat70) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_3.x = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_67 = float(1.0) / float(u_xlat16_62);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_16.xyz = vec3(u_xlat16_62) * u_xlat9.xyz;
    u_xlat16_62 = u_xlat16_3.x * u_xlat16_67;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb66 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb66)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb66 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb66) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_3.x, u_xlat16_67);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat16_17.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_16.xyz;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xx + _FresnelVector.zw;
    u_xlat66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat66) * u_xlat9.xyz;
    u_xlat16_62 = dot(u_xlat16_16.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
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
    u_xlat29.x = (-u_xlat16_62) + 1.0;
    u_xlat16_62 = u_xlat29.x * u_xlat29.x;
    u_xlat16_62 = u_xlat29.x * u_xlat16_62;
    u_xlat16_62 = u_xlat29.x * u_xlat16_62;
    u_xlat16_3.x = u_xlat29.x * u_xlat16_62;
    u_xlat29.x = (-u_xlat16_62) * u_xlat29.x + 1.0;
    u_xlat14.xyz = u_xlat16_7.xyz * u_xlat29.xxx;
    u_xlat14.xyz = vec3(u_xlat60) * u_xlat16_3.xxx + u_xlat14.xyz;
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
    u_xlat29.xyz = u_xlat29.xyz * _directSpecularColor.xyz;
    u_xlat29.xyz = u_xlat9.xxx * u_xlat29.xyz;
    u_xlat29.xyz = u_xlat16_17.xyz * u_xlat29.xyz;
    u_xlat16_15.xyz = u_xlat29.xyz * u_xlat4.xxx + u_xlat16_15.xyz;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.xxx * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_17.xyz * vec3(u_xlat70) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_16.xyz * u_xlat9.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat6.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat6.xy * hlslcc_FragCoord.xy;
    u_xlat16_60 = texture(_ScreenSpaceOcclusionTexture, u_xlat6.xy).x;
    u_xlat16_62 = u_xlat16_60 * u_xlat16_6.z;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(_occlusionScale) * u_xlat16_17.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_17.xyz = vec3(u_xlat16_63) * u_xlat16_17.xyz;
    u_xlat16_63 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_67 = (-u_xlat16_63) + u_xlat16_67;
    u_xlat16_28.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_28.x + 1.0;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_67 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_8.w * u_xlat16_63;
    u_xlat16_67 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 + -1.0;
    u_xlat16_67 = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat60 = min(u_xlat16_63, 1.0);
    u_xlat6.x = min(u_xlat60, u_xlat16_62);
    u_xlat16_16.xyz = u_xlat6.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat6.xxx * u_xlat16_16.xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat6.xxx * u_xlat16_18.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat6.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_18.xyz * u_xlat6.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati6.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_67) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati6.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati6.x = int(uint(uint(u_xlati6.x) & 1u));
    u_xlati26 = (u_xlati6.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati6.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_19.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat6.xyz = (-u_xlat12.xyz) * u_xlat16_3.xxx + (-u_xlat16_11.xyz);
    u_xlat0.z = u_xlat16_11.z;
    u_xlat16_8.z = dot(u_xlat16_17.xyz, u_xlat6.xyz);
    u_xlat66 = dot(u_xlat16_17.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_9.w);
    u_xlat16_23.x = u_xlat16_3.x + 1.0;
    u_xlat16_23.x = min(u_xlat16_23.x, 15.0);
    u_xlat16_9.x = u_xlat16_23.x * 16.0 + u_xlat16_9.z;
    u_xlat16_28.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_70 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_9.x = u_xlat16_3.x * 16.0 + u_xlat16_9.z;
    u_xlat16_28.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_28.xy = u_xlat16_28.xy * vec2(0.00390625, 0.0625);
    u_xlat16_72 = texture(_SpecularOcclusionLut3D, u_xlat16_28.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_23.x = u_xlat16_70 + (-u_xlat16_72);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_23.x + u_xlat16_72;
    u_xlat16_3.x = u_xlat16_67 * u_xlat16_3.x;
    u_xlat66 = u_xlat66 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat60 * 0.5;
    u_xlat16_23.x = (-u_xlat60) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat66 * u_xlat16_23.x + u_xlat16_3.x;
    u_xlat16_23.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_43 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_43 + u_xlat16_23.x;
    u_xlat16_3.x = u_xlat60 * u_xlat16_3.x;
    u_xlat16_62 = min(u_xlat16_62, u_xlat16_3.x);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat16_21.xxx * u_xlat10.xyz + u_xlat6.xyz;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat3.y = u_xlat6.y;
    u_xlat16_3.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat3.xz = u_xlat16_3.xz;
    u_xlat16_67 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat13.y = u_xlat16_8.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat3.xyz, u_xlat16_67);
    u_xlat16_8.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_8.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_11.xyz = vec3(u_xlat16_63) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb60 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb60)) ? u_xlat16_11.xyz : u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_62) * u_xlat16_7.xyz;
    u_xlat16_8.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_15.xyz;
    u_xlat16_62 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_5.w * _AlbedoColor.w + u_xlat16_62;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_6.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_6.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_27.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_27.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat6.xyz = vec3(u_xlat60) * u_xlat12.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_27.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat0.x = u_xlat0.x * u_xlat16_27.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelVector.y;
    u_xlat16_20.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_27.x = u_xlat0.x * u_xlat16_20.x + u_xlat16_20.y;
    u_xlat16_0.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_0.xyz * u_xlat16_27.xxx;
    u_xlat16_2.xyz = u_xlat16_27.xyz * _FresnelColor.xyz + u_xlat16_2.xyz;
    u_xlat0.x = (-_UseFlowLight2U) + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
    u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
    u_xlat16_6.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
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
    SV_Target0.w = (u_xlatb0) ? u_xlat16_62 : u_xlat16_7.x;
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
vec4 ImmCB_0[16];
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
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(16) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(17) uniform mediump sampler2D _LaserMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec4 u_xlat16_11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
ivec3 u_xlati13;
vec4 u_xlat14;
bvec2 u_xlatb14;
vec4 u_xlat15;
bvec4 u_xlatb15;
float u_xlat16;
mediump float u_xlat16_16;
bvec4 u_xlatb17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
float u_xlat25;
mediump float u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_31;
vec2 u_xlat35;
vec2 u_xlat36;
bvec2 u_xlatb36;
vec3 u_xlat37;
mediump float u_xlat16_39;
float u_xlat46;
mediump float u_xlat16_46;
bool u_xlatb46;
vec2 u_xlat48;
mediump vec2 u_xlat16_49;
vec2 u_xlat53;
float u_xlat58;
ivec2 u_xlati58;
float u_xlat59;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_70;
mediump float u_xlat16_72;
mediump float u_xlat16_74;
float u_xlat75;
mediump float u_xlat16_75;
int u_xlati75;
bool u_xlatb75;
float u_xlat76;
mediump float u_xlat10_76;
int u_xlati76;
bool u_xlatb76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat81;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_70 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.x = 0.0;
    u_xlat16_5.y = u_xlat16_0.y * _LaserRamp_ST.y;
    u_xlat16_5.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_6.xyz = texture(_LaserRamp, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _LaserColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_72 = u_xlat16_0.x * u_xlat16_72;
    u_xlat16_72 = u_xlat16_72 * _LaserColor.w;
    u_xlat16_1.xyz = (-u_xlat16_1.xyz) * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_72) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat6.x = u_xlat0.z;
    u_xlat6.y = u_xlat2.x;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat6.x = dot(u_xlat16_27.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat0.x;
    u_xlat7.y = u_xlat2.w;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_27.xyz, u_xlat7.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_27.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_7.xyz * _emissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_27.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_74 = u_xlat16_23 * _shadowStrength;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_8 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_8 = inversesqrt(u_xlat16_8);
    u_xlat16_31.xyz = u_xlat7.xyz * vec3(u_xlat16_8);
    u_xlat16_9.xyz = (-u_xlat6.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(_occlusionScale) * u_xlat16_9.xyz + u_xlat2.xzw;
    u_xlat16_78 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_9.xyz = vec3(u_xlat16_78) * u_xlat16_9.xyz;
    u_xlat16_78 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_78 + 1.0;
    u_xlat16_78 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 + -1.0;
    u_xlat16_78 = _occlusionScale * u_xlat16_78 + 1.0;
    u_xlat16_10.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_3.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_26 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_26 = max(u_xlat16_26, 0.0078125);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = max(u_xlat16_26, 0.0078125);
    u_xlat16_79 = dot(u_xlat16_9.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_79) + u_xlat16_11.x;
    u_xlat16_79 = u_xlat16_3.w * u_xlat16_11.x + u_xlat16_79;
    u_xlat16_79 = u_xlat16_3.w * u_xlat16_79;
    u_xlat16_79 = u_xlat16_78 * u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb46 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat25 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat12.xyz = vec3(u_xlat25) * u_xlat12.xyz;
    u_xlat25 = dot(u_xlat2.xzw, u_xlat12.xyz);
    u_xlat25 = (-u_xlat25) * u_xlat25 + 1.0;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat25 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat2.xzw) * vec3(u_xlat25) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb46)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat11;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat15;
    u_xlat13 = u_xlat12.yyyy * u_xlat13;
    u_xlat11 = u_xlat11 * u_xlat12.xxxx + u_xlat13;
    u_xlat11 = u_xlat14 * u_xlat12.zzzz + u_xlat11;
    u_xlat11 = u_xlat15 + u_xlat11;
    u_xlat46 = _ShadowBias.x / u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat46) + u_xlat11.z;
    u_xlat25 = max((-u_xlat11.w), u_xlat46);
    u_xlat25 = (-u_xlat46) + u_xlat25;
    u_xlat11.z = _ShadowBias.y * u_xlat25 + u_xlat46;
    u_xlat12.xyz = u_xlat11.xyz / u_xlat11.www;
    u_xlat11.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat11.w = max(u_xlat11.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb46 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb46){
        u_xlat16_16 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(u_xlat11.w<1.0);
#else
        u_xlatb46 = u_xlat11.w<1.0;
#endif
        if(u_xlatb46){
            u_xlat12.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat46 = max(u_xlat12.x, 2.0);
            u_xlat46 = min(u_xlat46, 30.0);
            u_xlat46 = u_xlat46 * _ShadowMapTexture_TexelSize.x;
            u_xlat12.xz = u_xlat11.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat25 = dot(u_xlat12.xz, vec2(0.0671105608, 0.00583714992));
            u_xlat25 = fract(u_xlat25);
            u_xlat25 = u_xlat25 * 52.9829178;
            u_xlat25 = fract(u_xlat25);
            u_xlat25 = u_xlat25 * 6.28318548;
            u_xlat12.x = sin(u_xlat25);
            u_xlat13.x = cos(u_xlat25);
            u_xlat14 = u_xlat12.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.399062157, -0.768907249) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat36.y = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat25 = u_xlat11.w * 0.00200000009;
                u_xlat25 = max(u_xlat25, 0.000500000024);
                u_xlat25 = (-u_xlat25) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb25 = !!(u_xlat36.y<u_xlat25);
#else
                u_xlatb25 = u_xlat36.y<u_xlat25;
#endif
                u_xlat36.x = 1.0;
                u_xlat36.xy = bool(u_xlatb25) ? u_xlat36.xy : vec2(0.0, 0.0);
            } else {
                u_xlat36.x = float(0.0);
                u_xlat36.y = float(0.0);
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.929388702, 0.293877602) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.457714319, -0.879124641) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.276768446, 0.756483793) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat15.xy = u_xlat13.xx * vec2(0.443233252, 0.53742981) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.975115538, -0.4737342) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.418930233, 0.190901875) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.997065067, 0.914375901) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat15.xy = u_xlat13.xx * vec2(0.199841261, 0.143831611) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.78641367, -0.1410079) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat46 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat25 = u_xlat11.w * 0.00200000009;
                u_xlat25 = max(u_xlat25, 0.000500000024);
                u_xlat25 = (-u_xlat25) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb25 = !!(u_xlat46<u_xlat25);
#else
                u_xlatb25 = u_xlat46<u_xlat25;
#endif
                u_xlat14.y = u_xlat46 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb25)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat46 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat25 = u_xlat11.w * 0.00200000009;
                u_xlat25 = max(u_xlat25, 0.000500000024);
                u_xlat25 = (-u_xlat25) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb25 = !!(u_xlat46<u_xlat25);
#else
                u_xlatb25 = u_xlat46<u_xlat25;
#endif
                u_xlat14.y = u_xlat46 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb25)) ? u_xlat14.xy : u_xlat36.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<u_xlat36.x);
#else
            u_xlatb46 = 0.0<u_xlat36.x;
#endif
            u_xlat25 = u_xlat36.y / u_xlat36.x;
            u_xlat25 = u_xlatb46 ? u_xlat25 : float(0.0);
            u_xlat25 = (-u_xlat25) + u_xlat11.w;
            u_xlat25 = u_xlat25 * _PCSSLightSize;
            u_xlat25 = max(u_xlat12.y, u_xlat25);
            u_xlat25 = max(u_xlat25, 1.0);
            u_xlat25 = min(u_xlat25, 20.0);
            u_xlat46 = (u_xlatb46) ? u_xlat25 : 1.0;
            u_xlat46 = u_xlat46 * _ShadowMapTexture_TexelSize.x;
            u_xlati25 = max(_PCSSSampleCount, 4);
            u_xlati25 = min(u_xlati25, 16);
            u_xlat16_39 = float(0.0);
            u_xlat16_62 = float(0.0);
            u_xlati75 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb76 = !!(u_xlati75>=16);
#else
                u_xlatb76 = u_xlati75>=16;
#endif
                if(u_xlatb76){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb76 = !!(u_xlati75<u_xlati25);
#else
                u_xlatb76 = u_xlati75<u_xlati25;
#endif
                if(u_xlatb76){
                    u_xlat35.xy = u_xlat12.xx * ImmCB_0[u_xlati75].yx;
                    u_xlat14.x = ImmCB_0[u_xlati75].x * u_xlat13.x + (-u_xlat35.x);
                    u_xlat14.y = ImmCB_0[u_xlati75].y * u_xlat13.x + u_xlat35.y;
                    u_xlat35.xy = u_xlat14.xy * vec2(u_xlat46) + u_xlat11.xy;
                    u_xlatb36.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat35.xyxx).xy;
                    u_xlatb14.xy = lessThan(u_xlat35.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb76 = u_xlatb36.x && u_xlatb14.x;
                    u_xlatb76 = u_xlatb36.y && u_xlatb76;
                    u_xlatb76 = u_xlatb14.y && u_xlatb76;
                    if(!u_xlatb76){
                        u_xlati76 = u_xlati75 + 1;
                        u_xlati75 = u_xlati76;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat35.xy,u_xlat11.w);
                    u_xlat10_76 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_39 = u_xlat10_76 + u_xlat16_39;
                    u_xlat16_62 = u_xlat16_62 + 1.0;
                }
                u_xlati75 = u_xlati75 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<u_xlat16_62);
#else
            u_xlatb46 = 0.0<u_xlat16_62;
#endif
            u_xlat16_39 = u_xlat16_39 / u_xlat16_62;
            u_xlat12.xy = (-u_xlat11.xy) + vec2(1.0, 1.0);
            u_xlat12.xy = min(u_xlat11.xy, u_xlat12.xy);
            u_xlat25 = min(u_xlat12.y, u_xlat12.x);
            u_xlat25 = u_xlat25 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
            u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
            u_xlat75 = u_xlat16_39 + -1.0;
            u_xlat46 = u_xlatb46 ? u_xlat75 : float(0.0);
            u_xlat46 = u_xlat25 * u_xlat46 + 1.0;
            u_xlat16_46 = u_xlat46;
        } else {
            u_xlat16_46 = 1.0;
        }
        u_xlat16_39 = (-u_xlat16_16) + 1.0;
        u_xlat16_16 = u_xlat16_46 * u_xlat16_39 + u_xlat16_16;
        u_xlat16 = u_xlat16_16;
    } else {
        u_xlat16_18.x = (-_ShadowBias.w) + 1.0;
        u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat12.z = 0.0;
        u_xlat12.xyz = u_xlat11.xyw + u_xlat12.xyz;
        vec3 txVec1 = vec3(u_xlat12.xy,u_xlat12.z);
        u_xlat12.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat13.z = 0.0;
        u_xlat13.xyz = u_xlat11.xyw + u_xlat13.xyz;
        vec3 txVec2 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat12.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat13.z = 0.0;
        u_xlat13.xyz = u_xlat11.xyw + u_xlat13.xyz;
        vec3 txVec3 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat12.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat13.z = 0.0;
        u_xlat13.xyz = u_xlat11.xyw + u_xlat13.xyz;
        vec3 txVec4 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat12.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat25 = dot(u_xlat12, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat75 = (-u_xlat16_18.x) + 1.0;
        u_xlat16 = u_xlat25 * u_xlat75 + u_xlat16_18.x;
    }
    u_xlat25 = (-u_xlat16) + 1.0;
    u_xlat25 = (-u_xlat25) * u_xlat16_74 + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat12.xyz = u_xlat7.xyz * vec3(u_xlat16_8) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat75 = dot(u_xlat2.xzw, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat2.xzw, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat58 = u_xlat16_26 + -1.0;
    u_xlat75 = u_xlat75 * u_xlat58 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_26 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat81 = (-u_xlat12.x) * u_xlat16_26 + u_xlat12.x;
    u_xlat81 = u_xlat12.x * u_xlat81 + u_xlat16_26;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat12.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat13.x = (-u_xlat76) * u_xlat16_26 + u_xlat76;
    u_xlat13.x = u_xlat76 * u_xlat13.x + u_xlat16_26;
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat13.x = u_xlat76 + u_xlat13.x;
    u_xlat13.x = u_xlat13.x + 6.10351563e-05;
    u_xlat13.x = u_xlat81 * u_xlat13.x;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 16.0);
    u_xlat36.x = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat36.x * u_xlat36.x;
    u_xlat16_74 = u_xlat36.x * u_xlat16_74;
    u_xlat16_74 = u_xlat36.x * u_xlat16_74;
    u_xlat16_18.x = u_xlat36.x * u_xlat16_74;
    u_xlat59 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat36.x = (-u_xlat16_74) * u_xlat36.x + 1.0;
    u_xlat14.xyz = u_xlat16_1.xyz * u_xlat36.xxx;
    u_xlat14.xyz = vec3(u_xlat59) * u_xlat16_18.xxx + u_xlat14.xyz;
    u_xlat16_18.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat75 = u_xlat75 * u_xlat13.x;
    u_xlat13.xyw = u_xlat14.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyw = min(max(u_xlat13.xyw, 0.0), 1.0);
#else
    u_xlat13.xyw = clamp(u_xlat13.xyw, 0.0, 1.0);
#endif
    u_xlat13.xyw = u_xlat13.xyw * _directSpecularColor.xyz;
    u_xlat13.xyw = vec3(u_xlat76) * u_xlat13.xyw;
    u_xlat13.xyw = u_xlat13.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_74 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_87 = inversesqrt(u_xlat16_74);
    u_xlat16_20.xyz = u_xlat14.xyz * vec3(u_xlat16_87);
    u_xlat16_21.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_87 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_88;
    u_xlat16_74 = max(u_xlat16_21.x, u_xlat16_74);
    u_xlat16_74 = u_xlat16_87 * u_xlat16_74;
    u_xlat16_21.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat7.xyz * vec3(u_xlat16_8) + u_xlat16_20.xyz;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
    u_xlat75 = dot(u_xlat2.xzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(u_xlat16_20.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat14.x = dot(u_xlat2.xzw, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat58 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_26 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat37.x = (-u_xlat14.x) * u_xlat16_26 + u_xlat14.x;
    u_xlat37.x = u_xlat14.x * u_xlat37.x + u_xlat16_26;
    u_xlat37.x = sqrt(u_xlat37.x);
    u_xlat37.x = u_xlat37.x + u_xlat14.x;
    u_xlat37.x = u_xlat37.x + 6.10351563e-05;
    u_xlat37.x = u_xlat81 * u_xlat37.x;
    u_xlat37.x = float(1.0) / u_xlat37.x;
    u_xlat37.x = min(u_xlat37.x, 16.0);
    u_xlat60 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat60 * u_xlat60;
    u_xlat16_74 = u_xlat60 * u_xlat16_74;
    u_xlat16_74 = u_xlat60 * u_xlat16_74;
    u_xlat16_87 = u_xlat60 * u_xlat16_74;
    u_xlat60 = (-u_xlat16_74) * u_xlat60 + 1.0;
    u_xlat15.xyz = u_xlat16_1.xyz * vec3(u_xlat60);
    u_xlat15.xyz = vec3(u_xlat59) * vec3(u_xlat16_87) + u_xlat15.xyz;
    u_xlat16_20.xyz = u_xlat16_10.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat14.xxx * u_xlat16_20.xyz;
    u_xlat75 = u_xlat75 * u_xlat37.x;
    u_xlat37.xyz = u_xlat15.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat37.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat14.xxx * u_xlat37.xyz;
    u_xlat14.xyz = u_xlat16_21.xyz * u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat23) * u_xlat14.xyz;
    u_xlat16_18.xyz = u_xlat13.xyw * u_xlat16_18.xyz + u_xlat14.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat76) + u_xlat16_20.xyz;
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat13.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat13.xyw, u_xlat13.xyw);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_87 = inversesqrt(u_xlat16_74);
    u_xlat16_20.xyz = u_xlat13.xyw * vec3(u_xlat16_87);
    u_xlat16_21.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_87 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_88;
    u_xlat16_74 = max(u_xlat16_21.x, u_xlat16_74);
    u_xlat16_74 = u_xlat16_87 * u_xlat16_74;
    u_xlat16_21.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat13.xyw = u_xlat7.xyz * vec3(u_xlat16_8) + u_xlat16_20.xyz;
    u_xlat75 = dot(u_xlat13.xyw, u_xlat13.xyw);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat13.xyw = vec3(u_xlat75) * u_xlat13.xyw;
    u_xlat75 = dot(u_xlat2.xzw, u_xlat13.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(u_xlat16_20.xyz, u_xlat13.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat53.x = dot(u_xlat2.xzw, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat53.x = min(max(u_xlat53.x, 0.0), 1.0);
#else
    u_xlat53.x = clamp(u_xlat53.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat58 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_26 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = (-u_xlat53.x) * u_xlat16_26 + u_xlat53.x;
    u_xlat76 = u_xlat53.x * u_xlat76 + u_xlat16_26;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat53.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat76 * u_xlat81;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat58 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat58 * u_xlat58;
    u_xlat16_74 = u_xlat58 * u_xlat16_74;
    u_xlat16_74 = u_xlat58 * u_xlat16_74;
    u_xlat16_87 = u_xlat58 * u_xlat16_74;
    u_xlat58 = (-u_xlat16_74) * u_xlat58 + 1.0;
    u_xlat13.xyw = u_xlat16_1.xyz * vec3(u_xlat58);
    u_xlat13.xyz = vec3(u_xlat59) * vec3(u_xlat16_87) + u_xlat13.xyw;
    u_xlat16_20.xyz = u_xlat16_10.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat53.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_21.xyz * u_xlat13.xyz;
    u_xlat16_18.xyz = u_xlat13.xyz * vec3(u_xlat23) + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat53.xxx + u_xlat16_19.xyz;
    u_xlat25 = u_xlat25 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat25) + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_20.y = u_xlat16_9.y;
    u_xlati13.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati25 = int(uint(uint(u_xlati13.x) & 1u));
    u_xlat53.xy = min(vec2(u_xlat16_79), u_xlat53.xy);
    u_xlat75 = min(u_xlat16_4.x, u_xlat53.x);
    u_xlat16_21.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat75) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat75) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat75) + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * vec3(u_xlat75) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_78) * u_xlat16_20.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati13.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_22.xyz;
    u_xlati25 = (u_xlati13.z != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_20.xyw;
    u_xlat16_22.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_22.xyz;
    u_xlat16_74 = dot((-u_xlat16_31.xyz), u_xlat2.xzw);
    u_xlat16_74 = u_xlat16_74 + u_xlat16_74;
    u_xlat13.xyz = (-u_xlat2.xzw) * vec3(u_xlat16_74) + (-u_xlat16_31.xyz);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat0.xxx + (-u_xlat13.xyz);
    u_xlat6.xyz = vec3(u_xlat16_26) * u_xlat6.xyz + u_xlat13.xyz;
    u_xlat16_26 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat16_3.z = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat16_22.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_22.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_49.x = floor(u_xlat16_11.w);
    u_xlat16_72 = u_xlat16_49.x + 1.0;
    u_xlat16_72 = min(u_xlat16_72, 15.0);
    u_xlat16_74 = u_xlat16_22.z * 15.0 + (-u_xlat16_49.x);
    u_xlat16_11.x = u_xlat16_49.x * 16.0 + u_xlat16_11.y;
    u_xlat16_22.x = u_xlat16_72 * 16.0 + u_xlat16_11.y;
    u_xlat16_49.xy = u_xlat16_11.xz + vec2(0.5, 0.5);
    u_xlat16_49.xy = u_xlat16_49.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_49.xy).x;
    u_xlat16_22.y = u_xlat16_11.z;
    u_xlat16_49.xy = u_xlat16_22.xy + vec2(0.5, 0.5);
    u_xlat16_49.xy = u_xlat16_49.xy * vec2(0.00390625, 0.0625);
    u_xlat16_75 = texture(_SpecularOcclusionLut3D, u_xlat16_49.xy).x;
    u_xlat16_49.x = (-u_xlat16_25) + u_xlat16_75;
    u_xlat16_49.x = u_xlat16_74 * u_xlat16_49.x + u_xlat16_25;
    u_xlat16_49.x = u_xlat16_78 * u_xlat16_49.x;
    u_xlat25 = dot(u_xlat16_9.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat25 * u_xlat16_49.x;
    u_xlat16_49.x = u_xlat53.y * 0.5;
    u_xlat16_72 = (-u_xlat53.y) * 0.5 + 1.0;
    u_xlat16_49.x = u_xlat25 * u_xlat16_72 + u_xlat16_49.x;
    u_xlat16_72 = u_xlat16_49.x + u_xlat16_49.x;
    u_xlat16_74 = (-u_xlat16_49.x) * 2.0 + 1.0;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat16_74 + u_xlat16_72;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat53.y;
    u_xlat16_49.x = min(u_xlat16_49.x, u_xlat16_4.x);
    u_xlat6.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_26);
    u_xlat16_9.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb25 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_26 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = vec3(u_xlat16_26) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb25)) ? u_xlat16_20.xyz : u_xlat16_9.xyz;
    u_xlat12.y = u_xlat16_3.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_49.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb25 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_72 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb25) ? u_xlat16_72 : u_xlat16_70;
    u_xlat16_9.xyz = u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_21.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_27.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_6.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat25 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xzw;
    u_xlat7.xy = u_xlat7.xy * vec2(u_xlat16_8) + _FresnelVector.zw;
    u_xlat7.z = u_xlat16_31.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_70 = max(_FresnelVector.x, 0.00999999978);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat16_70 * u_xlat2.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FresnelVector.y;
    u_xlat16_70 = u_xlat2.x * u_xlat16_6.x + u_xlat16_6.y;
    u_xlat16_3.xyz = u_xlat16_12.xyz * vec3(u_xlat16_70);
    u_xlat16_1.xyz = u_xlat16_3.xyz * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat2.xy = u_xlat2.xx * vs_TEXCOORD3.xy;
    u_xlat2.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat2.xy;
    u_xlat48.xy = _Time.yy * _FlowLightFactory.yz + u_xlat2.xy;
    u_xlat48.xy = u_xlat48.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat48.xy);
    u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _FlowLightFactory.xxx;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = (-u_xlat2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
vec4 ImmCB_0[16];
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
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
UNITY_LOCATION(5) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ColoredFresnelMap;
UNITY_LOCATION(11) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ScreenSpaceOcclusionTexture;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(16) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(17) uniform mediump sampler2D _LaserMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec4 u_xlat16_11;
vec4 u_xlat12;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
ivec3 u_xlati13;
vec4 u_xlat14;
bvec2 u_xlatb14;
vec4 u_xlat15;
bvec4 u_xlatb15;
float u_xlat16;
mediump float u_xlat16_16;
bvec4 u_xlatb17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec4 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
float u_xlat25;
mediump float u_xlat16_25;
int u_xlati25;
bool u_xlatb25;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_31;
vec2 u_xlat35;
vec2 u_xlat36;
bvec2 u_xlatb36;
vec3 u_xlat37;
mediump float u_xlat16_39;
float u_xlat46;
mediump float u_xlat16_46;
bool u_xlatb46;
vec2 u_xlat48;
mediump vec2 u_xlat16_49;
vec2 u_xlat53;
float u_xlat58;
ivec2 u_xlati58;
float u_xlat59;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_70;
mediump float u_xlat16_72;
mediump float u_xlat16_74;
float u_xlat75;
mediump float u_xlat16_75;
int u_xlati75;
bool u_xlatb75;
float u_xlat76;
mediump float u_xlat10_76;
int u_xlati76;
bool u_xlatb76;
mediump float u_xlat16_78;
mediump float u_xlat16_79;
float u_xlat81;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_70 = u_xlat16_0.w * _AlbedoColor.w;
    u_xlat16_0.xy = texture(_LaserMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_5.x = 0.0;
    u_xlat16_5.y = u_xlat16_0.y * _LaserRamp_ST.y;
    u_xlat16_5.xy = u_xlat16_5.xy + _LaserRamp_ST.zw;
    u_xlat16_6.xyz = texture(_LaserRamp, u_xlat16_5.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _LaserColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_LaserRampIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_72 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_72 = u_xlat16_0.x * u_xlat16_72;
    u_xlat16_72 = u_xlat16_72 * _LaserColor.w;
    u_xlat16_1.xyz = (-u_xlat16_1.xyz) * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_72) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
    u_xlat16_0.x = texture(_ScreenSpaceOcclusionTexture, u_xlat0.xy).x;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_2.z;
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_5.xxx + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat2.xzw = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat2.xzw = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat2.xzw);
    u_xlat2.xzw = u_xlat2.xwz * vs_TEXCOORD2.www;
    u_xlat6.x = u_xlat0.z;
    u_xlat6.y = u_xlat2.x;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat6.x = dot(u_xlat16_27.xyz, u_xlat6.xyz);
    u_xlat7.x = u_xlat0.x;
    u_xlat7.y = u_xlat2.w;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_27.xyz, u_xlat7.xyz);
    u_xlat2.x = u_xlat0.y;
    u_xlat2.w = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_27.xyz, u_xlat2.xzw);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xzw = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_27.xyz = u_xlat16_7.xyz * _emissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_27.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_27.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_23 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_74 = u_xlat16_23 * _shadowStrength;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_8 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_8 = inversesqrt(u_xlat16_8);
    u_xlat16_31.xyz = u_xlat7.xyz * vec3(u_xlat16_8);
    u_xlat16_9.xyz = (-u_xlat6.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(_occlusionScale) * u_xlat16_9.xyz + u_xlat2.xzw;
    u_xlat16_78 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_78 = inversesqrt(u_xlat16_78);
    u_xlat16_9.xyz = vec3(u_xlat16_78) * u_xlat16_9.xyz;
    u_xlat16_78 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_3.w = _occlusionScale * u_xlat16_78 + 1.0;
    u_xlat16_78 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_78 = min(max(u_xlat16_78, 0.0), 1.0);
#else
    u_xlat16_78 = clamp(u_xlat16_78, 0.0, 1.0);
#endif
    u_xlat16_78 = u_xlat16_78 + -1.0;
    u_xlat16_78 = _occlusionScale * u_xlat16_78 + 1.0;
    u_xlat16_10.x = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_3.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_26 = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_26 = max(u_xlat16_26, 0.0078125);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = max(u_xlat16_26, 0.0078125);
    u_xlat16_79 = dot(u_xlat16_9.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_79 * 0.5 + 0.5;
    u_xlat16_11.x = (-u_xlat16_79) + u_xlat16_11.x;
    u_xlat16_79 = u_xlat16_3.w * u_xlat16_11.x + u_xlat16_79;
    u_xlat16_79 = u_xlat16_3.w * u_xlat16_79;
    u_xlat16_79 = u_xlat16_78 * u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb46 = _ShadowBias.z!=0.0;
#endif
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat25 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat12.xyz = vec3(u_xlat25) * u_xlat12.xyz;
    u_xlat25 = dot(u_xlat2.xzw, u_xlat12.xyz);
    u_xlat25 = (-u_xlat25) * u_xlat25 + 1.0;
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = u_xlat25 * _ShadowBias.z;
    u_xlat12.xyz = (-u_xlat2.xzw) * vec3(u_xlat25) + vs_TEXCOORD0.xyz;
    u_xlat12.xyz = (bool(u_xlatb46)) ? u_xlat12.xyz : vs_TEXCOORD0.xyz;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat11;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat13;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat14;
    u_xlat14 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat14;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat15;
    u_xlat13 = u_xlat12.yyyy * u_xlat13;
    u_xlat11 = u_xlat11 * u_xlat12.xxxx + u_xlat13;
    u_xlat11 = u_xlat14 * u_xlat12.zzzz + u_xlat11;
    u_xlat11 = u_xlat15 + u_xlat11;
    u_xlat46 = _ShadowBias.x / u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat46 = min(max(u_xlat46, 0.0), 1.0);
#else
    u_xlat46 = clamp(u_xlat46, 0.0, 1.0);
#endif
    u_xlat46 = (-u_xlat46) + u_xlat11.z;
    u_xlat25 = max((-u_xlat11.w), u_xlat46);
    u_xlat25 = (-u_xlat46) + u_xlat25;
    u_xlat11.z = _ShadowBias.y * u_xlat25 + u_xlat46;
    u_xlat12.xyz = u_xlat11.xyz / u_xlat11.www;
    u_xlat11.xyz = u_xlat12.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat11.w = max(u_xlat11.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb46 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb46){
        u_xlat16_16 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(u_xlat11.w<1.0);
#else
        u_xlatb46 = u_xlat11.w<1.0;
#endif
        if(u_xlatb46){
            u_xlat12.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat46 = max(u_xlat12.x, 2.0);
            u_xlat46 = min(u_xlat46, 30.0);
            u_xlat46 = u_xlat46 * _ShadowMapTexture_TexelSize.x;
            u_xlat12.xz = u_xlat11.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat25 = dot(u_xlat12.xz, vec2(0.0671105608, 0.00583714992));
            u_xlat25 = fract(u_xlat25);
            u_xlat25 = u_xlat25 * 52.9829178;
            u_xlat25 = fract(u_xlat25);
            u_xlat25 = u_xlat25 * 6.28318548;
            u_xlat12.x = sin(u_xlat25);
            u_xlat13.x = cos(u_xlat25);
            u_xlat14 = u_xlat12.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.399062157, -0.768907249) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat36.y = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat25 = u_xlat11.w * 0.00200000009;
                u_xlat25 = max(u_xlat25, 0.000500000024);
                u_xlat25 = (-u_xlat25) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb25 = !!(u_xlat36.y<u_xlat25);
#else
                u_xlatb25 = u_xlat36.y<u_xlat25;
#endif
                u_xlat36.x = 1.0;
                u_xlat36.xy = bool(u_xlatb25) ? u_xlat36.xy : vec2(0.0, 0.0);
            } else {
                u_xlat36.x = float(0.0);
                u_xlat36.y = float(0.0);
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.929388702, 0.293877602) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.457714319, -0.879124641) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.276768446, 0.756483793) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat15.xy = u_xlat13.xx * vec2(0.443233252, 0.53742981) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.975115538, -0.4737342) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(-0.418930233, 0.190901875) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat15.xy = u_xlat13.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.997065067, 0.914375901) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat25 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat75 = u_xlat11.w * 0.00200000009;
                u_xlat75 = max(u_xlat75, 0.000500000024);
                u_xlat75 = (-u_xlat75) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb75 = !!(u_xlat25<u_xlat75);
#else
                u_xlatb75 = u_xlat25<u_xlat75;
#endif
                u_xlat14.y = u_xlat25 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb75)) ? u_xlat14.xy : u_xlat36.xy;
            }
            u_xlat14 = u_xlat12.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat15.xy = u_xlat13.xx * vec2(0.199841261, 0.143831611) + (-u_xlat14.xz);
            u_xlat15.zw = u_xlat13.xx * vec2(0.78641367, -0.1410079) + u_xlat14.yw;
            u_xlat14 = u_xlat15.xzyw * vec4(u_xlat46) + u_xlat11.xyxy;
            u_xlatb15 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat14);
            u_xlatb17 = lessThan(u_xlat14, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati58.xy = ivec2(uvec2((uint(u_xlatb15.x) * 0xffffffffu) & (uint(u_xlatb17.x) * 0xffffffffu), (uint(u_xlatb15.z) * 0xffffffffu) & (uint(u_xlatb17.z) * 0xffffffffu)));
            u_xlati58.xy = ivec2((uvec2(u_xlatb15.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            u_xlati58.xy = ivec2((uvec2(u_xlatb17.yw) * 0xFFFFFFFFu) & uvec2(u_xlati58.xy));
            if(u_xlati58.x != 0) {
                u_xlat46 = texture(_ShadowMapDepth, u_xlat14.xy).x;
                u_xlat25 = u_xlat11.w * 0.00200000009;
                u_xlat25 = max(u_xlat25, 0.000500000024);
                u_xlat25 = (-u_xlat25) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb25 = !!(u_xlat46<u_xlat25);
#else
                u_xlatb25 = u_xlat46<u_xlat25;
#endif
                u_xlat14.y = u_xlat46 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb25)) ? u_xlat14.xy : u_xlat36.xy;
            }
            if(u_xlati58.y != 0) {
                u_xlat46 = texture(_ShadowMapDepth, u_xlat14.zw).x;
                u_xlat25 = u_xlat11.w * 0.00200000009;
                u_xlat25 = max(u_xlat25, 0.000500000024);
                u_xlat25 = (-u_xlat25) + u_xlat11.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb25 = !!(u_xlat46<u_xlat25);
#else
                u_xlatb25 = u_xlat46<u_xlat25;
#endif
                u_xlat14.y = u_xlat46 + u_xlat36.y;
                u_xlat14.x = u_xlat36.x + 1.0;
                u_xlat36.xy = (bool(u_xlatb25)) ? u_xlat14.xy : u_xlat36.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<u_xlat36.x);
#else
            u_xlatb46 = 0.0<u_xlat36.x;
#endif
            u_xlat25 = u_xlat36.y / u_xlat36.x;
            u_xlat25 = u_xlatb46 ? u_xlat25 : float(0.0);
            u_xlat25 = (-u_xlat25) + u_xlat11.w;
            u_xlat25 = u_xlat25 * _PCSSLightSize;
            u_xlat25 = max(u_xlat12.y, u_xlat25);
            u_xlat25 = max(u_xlat25, 1.0);
            u_xlat25 = min(u_xlat25, 20.0);
            u_xlat46 = (u_xlatb46) ? u_xlat25 : 1.0;
            u_xlat46 = u_xlat46 * _ShadowMapTexture_TexelSize.x;
            u_xlati25 = max(_PCSSSampleCount, 4);
            u_xlati25 = min(u_xlati25, 16);
            u_xlat16_39 = float(0.0);
            u_xlat16_62 = float(0.0);
            u_xlati75 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb76 = !!(u_xlati75>=16);
#else
                u_xlatb76 = u_xlati75>=16;
#endif
                if(u_xlatb76){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb76 = !!(u_xlati75<u_xlati25);
#else
                u_xlatb76 = u_xlati75<u_xlati25;
#endif
                if(u_xlatb76){
                    u_xlat35.xy = u_xlat12.xx * ImmCB_0[u_xlati75].yx;
                    u_xlat14.x = ImmCB_0[u_xlati75].x * u_xlat13.x + (-u_xlat35.x);
                    u_xlat14.y = ImmCB_0[u_xlati75].y * u_xlat13.x + u_xlat35.y;
                    u_xlat35.xy = u_xlat14.xy * vec2(u_xlat46) + u_xlat11.xy;
                    u_xlatb36.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat35.xyxx).xy;
                    u_xlatb14.xy = lessThan(u_xlat35.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb76 = u_xlatb36.x && u_xlatb14.x;
                    u_xlatb76 = u_xlatb36.y && u_xlatb76;
                    u_xlatb76 = u_xlatb14.y && u_xlatb76;
                    if(!u_xlatb76){
                        u_xlati76 = u_xlati75 + 1;
                        u_xlati75 = u_xlati76;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat35.xy,u_xlat11.w);
                    u_xlat10_76 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_39 = u_xlat10_76 + u_xlat16_39;
                    u_xlat16_62 = u_xlat16_62 + 1.0;
                }
                u_xlati75 = u_xlati75 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<u_xlat16_62);
#else
            u_xlatb46 = 0.0<u_xlat16_62;
#endif
            u_xlat16_39 = u_xlat16_39 / u_xlat16_62;
            u_xlat12.xy = (-u_xlat11.xy) + vec2(1.0, 1.0);
            u_xlat12.xy = min(u_xlat11.xy, u_xlat12.xy);
            u_xlat25 = min(u_xlat12.y, u_xlat12.x);
            u_xlat25 = u_xlat25 * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
            u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
            u_xlat75 = u_xlat16_39 + -1.0;
            u_xlat46 = u_xlatb46 ? u_xlat75 : float(0.0);
            u_xlat46 = u_xlat25 * u_xlat46 + 1.0;
            u_xlat16_46 = u_xlat46;
        } else {
            u_xlat16_46 = 1.0;
        }
        u_xlat16_39 = (-u_xlat16_16) + 1.0;
        u_xlat16_16 = u_xlat16_46 * u_xlat16_39 + u_xlat16_16;
        u_xlat16 = u_xlat16_16;
    } else {
        u_xlat16_18.x = (-_ShadowBias.w) + 1.0;
        u_xlat12.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat12.z = 0.0;
        u_xlat12.xyz = u_xlat11.xyw + u_xlat12.xyz;
        vec3 txVec1 = vec3(u_xlat12.xy,u_xlat12.z);
        u_xlat12.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat13.z = 0.0;
        u_xlat13.xyz = u_xlat11.xyw + u_xlat13.xyz;
        vec3 txVec2 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat12.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat13.z = 0.0;
        u_xlat13.xyz = u_xlat11.xyw + u_xlat13.xyz;
        vec3 txVec3 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat12.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat13.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat13.z = 0.0;
        u_xlat13.xyz = u_xlat11.xyw + u_xlat13.xyz;
        vec3 txVec4 = vec3(u_xlat13.xy,u_xlat13.z);
        u_xlat12.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat25 = dot(u_xlat12, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat75 = (-u_xlat16_18.x) + 1.0;
        u_xlat16 = u_xlat25 * u_xlat75 + u_xlat16_18.x;
    }
    u_xlat25 = (-u_xlat16) + 1.0;
    u_xlat25 = (-u_xlat25) * u_xlat16_74 + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat12.xyz = u_xlat7.xyz * vec3(u_xlat16_8) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat75 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat12.xyz = vec3(u_xlat75) * u_xlat12.xyz;
    u_xlat75 = dot(u_xlat2.xzw, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat2.xzw, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat76 = min(max(u_xlat76, 0.0), 1.0);
#else
    u_xlat76 = clamp(u_xlat76, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat2.xzw, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat58 = u_xlat16_26 + -1.0;
    u_xlat75 = u_xlat75 * u_xlat58 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_26 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat81 = (-u_xlat12.x) * u_xlat16_26 + u_xlat12.x;
    u_xlat81 = u_xlat12.x * u_xlat81 + u_xlat16_26;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 + u_xlat12.x;
    u_xlat81 = u_xlat81 + 6.10351563e-05;
    u_xlat13.x = (-u_xlat76) * u_xlat16_26 + u_xlat76;
    u_xlat13.x = u_xlat76 * u_xlat13.x + u_xlat16_26;
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat13.x = u_xlat76 + u_xlat13.x;
    u_xlat13.x = u_xlat13.x + 6.10351563e-05;
    u_xlat13.x = u_xlat81 * u_xlat13.x;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.x = min(u_xlat13.x, 16.0);
    u_xlat36.x = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat36.x * u_xlat36.x;
    u_xlat16_74 = u_xlat36.x * u_xlat16_74;
    u_xlat16_74 = u_xlat36.x * u_xlat16_74;
    u_xlat16_18.x = u_xlat36.x * u_xlat16_74;
    u_xlat59 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat36.x = (-u_xlat16_74) * u_xlat36.x + 1.0;
    u_xlat14.xyz = u_xlat16_1.xyz * u_xlat36.xxx;
    u_xlat14.xyz = vec3(u_xlat59) * u_xlat16_18.xxx + u_xlat14.xyz;
    u_xlat16_18.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_18.xyz = vec3(u_xlat25) * u_xlat16_18.xyz + _shadowColor.xyz;
    u_xlat16_19.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat75 = u_xlat75 * u_xlat13.x;
    u_xlat13.xyw = u_xlat14.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyw = min(max(u_xlat13.xyw, 0.0), 1.0);
#else
    u_xlat13.xyw = clamp(u_xlat13.xyw, 0.0, 1.0);
#endif
    u_xlat13.xyw = u_xlat13.xyw * _directSpecularColor.xyz;
    u_xlat13.xyw = vec3(u_xlat76) * u_xlat13.xyw;
    u_xlat13.xyw = u_xlat13.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_74 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_87 = inversesqrt(u_xlat16_74);
    u_xlat16_20.xyz = u_xlat14.xyz * vec3(u_xlat16_87);
    u_xlat16_21.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_87 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_20.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_88;
    u_xlat16_74 = max(u_xlat16_21.x, u_xlat16_74);
    u_xlat16_74 = u_xlat16_87 * u_xlat16_74;
    u_xlat16_21.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat7.xyz * vec3(u_xlat16_8) + u_xlat16_20.xyz;
    u_xlat75 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat14.xyz = vec3(u_xlat75) * u_xlat14.xyz;
    u_xlat75 = dot(u_xlat2.xzw, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(u_xlat16_20.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat14.x = dot(u_xlat2.xzw, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat58 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_26 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat37.x = (-u_xlat14.x) * u_xlat16_26 + u_xlat14.x;
    u_xlat37.x = u_xlat14.x * u_xlat37.x + u_xlat16_26;
    u_xlat37.x = sqrt(u_xlat37.x);
    u_xlat37.x = u_xlat37.x + u_xlat14.x;
    u_xlat37.x = u_xlat37.x + 6.10351563e-05;
    u_xlat37.x = u_xlat81 * u_xlat37.x;
    u_xlat37.x = float(1.0) / u_xlat37.x;
    u_xlat37.x = min(u_xlat37.x, 16.0);
    u_xlat60 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat60 * u_xlat60;
    u_xlat16_74 = u_xlat60 * u_xlat16_74;
    u_xlat16_74 = u_xlat60 * u_xlat16_74;
    u_xlat16_87 = u_xlat60 * u_xlat16_74;
    u_xlat60 = (-u_xlat16_74) * u_xlat60 + 1.0;
    u_xlat15.xyz = u_xlat16_1.xyz * vec3(u_xlat60);
    u_xlat15.xyz = vec3(u_xlat59) * vec3(u_xlat16_87) + u_xlat15.xyz;
    u_xlat16_20.xyz = u_xlat16_10.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat16_20.xyz = u_xlat14.xxx * u_xlat16_20.xyz;
    u_xlat75 = u_xlat75 * u_xlat37.x;
    u_xlat37.xyz = u_xlat15.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat37.xyz = min(max(u_xlat37.xyz, 0.0), 1.0);
#else
    u_xlat37.xyz = clamp(u_xlat37.xyz, 0.0, 1.0);
#endif
    u_xlat37.xyz = u_xlat37.xyz * _directSpecularColor.xyz;
    u_xlat14.xyz = u_xlat14.xxx * u_xlat37.xyz;
    u_xlat14.xyz = u_xlat16_21.xyz * u_xlat14.xyz;
    u_xlat14.xyz = vec3(u_xlat23) * u_xlat14.xyz;
    u_xlat16_18.xyz = u_xlat13.xyw * u_xlat16_18.xyz + u_xlat14.xyz;
    u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat76) + u_xlat16_20.xyz;
    u_xlat16_74 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.00100000005>=abs(u_xlat16_74));
#else
    u_xlatb75 = 0.00100000005>=abs(u_xlat16_74);
#endif
    u_xlat13.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_74 = dot(u_xlat13.xyw, u_xlat13.xyw);
    u_xlat16_74 = max(u_xlat16_74, 6.10351563e-05);
    u_xlat16_87 = inversesqrt(u_xlat16_74);
    u_xlat16_20.xyz = u_xlat13.xyw * vec3(u_xlat16_87);
    u_xlat16_21.xy = (bool(u_xlatb75)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_22.xyz = u_xlat16_21.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_21.yyy + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb75 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_87 = (u_xlatb75) ? 1.0 : 0.0;
    u_xlat16_88 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_20.xyz);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_87 = max(u_xlat16_87, u_xlat16_88);
    u_xlat16_88 = float(1.0) / float(u_xlat16_74);
    u_xlat16_74 = u_xlat16_74 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_74 = (-u_xlat16_74) * u_xlat16_74 + 1.0;
    u_xlat16_74 = max(u_xlat16_74, 0.0);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_88;
    u_xlat16_74 = max(u_xlat16_21.x, u_xlat16_74);
    u_xlat16_74 = u_xlat16_87 * u_xlat16_74;
    u_xlat16_21.xyz = vec3(u_xlat16_74) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat13.xyw = u_xlat7.xyz * vec3(u_xlat16_8) + u_xlat16_20.xyz;
    u_xlat75 = dot(u_xlat13.xyw, u_xlat13.xyw);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat13.xyw = vec3(u_xlat75) * u_xlat13.xyw;
    u_xlat75 = dot(u_xlat2.xzw, u_xlat13.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat16_74 = dot(u_xlat16_20.xyz, u_xlat13.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat53.x = dot(u_xlat2.xzw, u_xlat16_20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat53.x = min(max(u_xlat53.x, 0.0), 1.0);
#else
    u_xlat53.x = clamp(u_xlat53.x, 0.0, 1.0);
#endif
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat58 + 1.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat16_26 / u_xlat75;
    u_xlat75 = u_xlat75 * 0.318309873;
    u_xlat75 = min(u_xlat75, 16.0);
    u_xlat76 = (-u_xlat53.x) * u_xlat16_26 + u_xlat53.x;
    u_xlat76 = u_xlat53.x * u_xlat76 + u_xlat16_26;
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat53.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat76 = u_xlat76 * u_xlat81;
    u_xlat76 = float(1.0) / u_xlat76;
    u_xlat76 = min(u_xlat76, 16.0);
    u_xlat58 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat58 * u_xlat58;
    u_xlat16_74 = u_xlat58 * u_xlat16_74;
    u_xlat16_74 = u_xlat58 * u_xlat16_74;
    u_xlat16_87 = u_xlat58 * u_xlat16_74;
    u_xlat58 = (-u_xlat16_74) * u_xlat58 + 1.0;
    u_xlat13.xyw = u_xlat16_1.xyz * vec3(u_xlat58);
    u_xlat13.xyz = vec3(u_xlat59) * vec3(u_xlat16_87) + u_xlat13.xyw;
    u_xlat16_20.xyz = u_xlat16_10.xyz * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_20.xyz = vec3(u_xlat23) * u_xlat16_20.xyz;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat75);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = u_xlat53.xxx * u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_21.xyz * u_xlat13.xyz;
    u_xlat16_18.xyz = u_xlat13.xyz * vec3(u_xlat23) + u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_20.xyz * u_xlat53.xxx + u_xlat16_19.xyz;
    u_xlat25 = u_xlat25 + -1.0;
    u_xlat53.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat25) + vec2(1.0, 1.0);
    u_xlat16_20.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_20.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_20.y = u_xlat16_9.y;
    u_xlati13.xyz = ivec3(uvec3(lessThan(u_xlat16_20.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati25 = int(uint(uint(u_xlati13.x) & 1u));
    u_xlat53.xy = min(vec2(u_xlat16_79), u_xlat53.xy);
    u_xlat75 = min(u_xlat16_4.x, u_xlat53.x);
    u_xlat16_21.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat75) * u_xlat16_21.xyz;
    u_xlat16_21.xyz = vec3(u_xlat75) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_22.xyz = vec3(u_xlat75) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat75) + (-u_xlat16_22.xyz);
    u_xlat16_22.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = u_xlat16_22.xyz * vec3(u_xlat75) + u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _localDiffuseGI.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_20.xyz;
    u_xlat16_20.xyz = vec3(u_xlat16_78) * u_xlat16_20.xyz;
    u_xlati75 = int(int_bitfieldInsert(2,u_xlati13.y,0,1) );
    u_xlat16_22.xyz = u_xlat16_20.yyy * _IrradianceACCoeffs[u_xlati75].xyz;
    u_xlat16_20.xyw = u_xlat16_20.xxx * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_22.xyz;
    u_xlati25 = (u_xlati13.z != 0) ? 5 : 4;
    u_xlat16_20.xyz = u_xlat16_20.zzz * _IrradianceACCoeffs[u_xlati25].xyz + u_xlat16_20.xyw;
    u_xlat16_22.xyz = u_xlat16_20.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_22.xyz;
    u_xlat16_74 = dot((-u_xlat16_31.xyz), u_xlat2.xzw);
    u_xlat16_74 = u_xlat16_74 + u_xlat16_74;
    u_xlat13.xyz = (-u_xlat2.xzw) * vec3(u_xlat16_74) + (-u_xlat16_31.xyz);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat0.xxx + (-u_xlat13.xyz);
    u_xlat6.xyz = vec3(u_xlat16_26) * u_xlat6.xyz + u_xlat13.xyz;
    u_xlat16_26 = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat16_3.z = dot(u_xlat16_9.xyz, u_xlat13.xyz);
    u_xlat16_22.xyz = u_xlat16_3.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
    u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.yzw = u_xlat16_22.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_49.x = floor(u_xlat16_11.w);
    u_xlat16_72 = u_xlat16_49.x + 1.0;
    u_xlat16_72 = min(u_xlat16_72, 15.0);
    u_xlat16_74 = u_xlat16_22.z * 15.0 + (-u_xlat16_49.x);
    u_xlat16_11.x = u_xlat16_49.x * 16.0 + u_xlat16_11.y;
    u_xlat16_22.x = u_xlat16_72 * 16.0 + u_xlat16_11.y;
    u_xlat16_49.xy = u_xlat16_11.xz + vec2(0.5, 0.5);
    u_xlat16_49.xy = u_xlat16_49.xy * vec2(0.00390625, 0.0625);
    u_xlat16_25 = texture(_SpecularOcclusionLut3D, u_xlat16_49.xy).x;
    u_xlat16_22.y = u_xlat16_11.z;
    u_xlat16_49.xy = u_xlat16_22.xy + vec2(0.5, 0.5);
    u_xlat16_49.xy = u_xlat16_49.xy * vec2(0.00390625, 0.0625);
    u_xlat16_75 = texture(_SpecularOcclusionLut3D, u_xlat16_49.xy).x;
    u_xlat16_49.x = (-u_xlat16_25) + u_xlat16_75;
    u_xlat16_49.x = u_xlat16_74 * u_xlat16_49.x + u_xlat16_25;
    u_xlat16_49.x = u_xlat16_78 * u_xlat16_49.x;
    u_xlat25 = dot(u_xlat16_9.xyz, u_xlat2.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat25 * u_xlat16_49.x;
    u_xlat16_49.x = u_xlat53.y * 0.5;
    u_xlat16_72 = (-u_xlat53.y) * 0.5 + 1.0;
    u_xlat16_49.x = u_xlat25 * u_xlat16_72 + u_xlat16_49.x;
    u_xlat16_72 = u_xlat16_49.x + u_xlat16_49.x;
    u_xlat16_74 = (-u_xlat16_49.x) * 2.0 + 1.0;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat16_74 + u_xlat16_72;
    u_xlat16_49.x = u_xlat16_49.x * u_xlat53.y;
    u_xlat16_49.x = min(u_xlat16_49.x, u_xlat16_4.x);
    u_xlat6.x = dot(_IndirectCubemapRotationParams.xy, u_xlat6.xz);
    u_xlat6.z = dot(_IndirectCubemapRotationParams.zw, u_xlat6.xz);
    u_xlat16_6 = textureLod(_IndirectSpecularMap, u_xlat6.xyz, u_xlat16_26);
    u_xlat16_9.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_9.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb25 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_26 = dot(u_xlat16_20.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_20.xyz = vec3(u_xlat16_26) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb25)) ? u_xlat16_20.xyz : u_xlat16_9.xyz;
    u_xlat12.y = u_xlat16_3.x;
    u_xlat16_6.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xxx + u_xlat16_6.yyy;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_49.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_72 = dot(u_xlat16_9.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb25 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_72 = u_xlat16_0.w * _AlbedoColor.w + u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb25) ? u_xlat16_72 : u_xlat16_70;
    u_xlat16_9.xyz = u_xlat16_18.xyz + u_xlat16_19.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_21.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_27.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_6.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = texture(_ColoredFresnelMap, vs_TEXCOORD3.xy).xyz;
    u_xlat25 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xzw;
    u_xlat7.xy = u_xlat7.xy * vec2(u_xlat16_8) + _FresnelVector.zw;
    u_xlat7.z = u_xlat16_31.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_70 = max(_FresnelVector.x, 0.00999999978);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat16_70 * u_xlat2.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FresnelVector.y;
    u_xlat16_70 = u_xlat2.x * u_xlat16_6.x + u_xlat16_6.y;
    u_xlat16_3.xyz = u_xlat16_12.xyz * vec3(u_xlat16_70);
    u_xlat16_1.xyz = u_xlat16_3.xyz * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlat2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat2.xy = u_xlat2.xx * vs_TEXCOORD3.xy;
    u_xlat2.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat2.xy;
    u_xlat48.xy = _Time.yy * _FlowLightFactory.yz + u_xlat2.xy;
    u_xlat48.xy = u_xlat48.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_0 = texture(_FlowLightTex, u_xlat48.xy);
    u_xlat16_2.xyz = texture(_FlowLightMask, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _FlowLightFactory.xxx;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = (-u_xlat2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
  GpuProgramID 110180
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